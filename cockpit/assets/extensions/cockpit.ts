import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";
import * as net from "net";
import * as path from "path";

export default function (pi: ExtensionAPI) {
  const paneId = process.env.COCKPIT_PANE_ID;
  const sockPath = process.env.COCKPIT_STATUS_SOCK;
  const port = process.env.COCKPIT_STATUS_PORT ? parseInt(process.env.COCKPIT_STATUS_PORT, 10) : undefined;
  const token = process.env.COCKPIT_STATUS_TOKEN;

  if (!paneId || (!sockPath && !port)) return;

  // Subagents running inside this session must not move Cockpit's tab status, chime, or overwrite session ID!
  if (
    process.env.PI_SUBAGENT_CHILD === "1" ||
    process.env.PI_SUBAGENT_PARENT_SESSION ||
    process.env.SUBAGENT_CHILD_AGENT
  ) {
    return;
  }

  let currentName: string | null = null;
  let subClient: net.Socket | null = null;

  function getWorkspaceName(): string {
    return process.env.COCKPIT_WORKSPACE_NAME || path.basename(process.cwd()) || "workspace";
  }

  function toCanonical(name: string): string {
    if (!name) return name;
    if (name.includes(":")) return name;
    return `${getWorkspaceName()}:${name}`;
  }

  function createConnection(): net.Socket {
    if (sockPath) {
      return net.createConnection(sockPath);
    }
    return net.createConnection({ host: "127.0.0.1", port: port! });
  }

  function sendOneShot(payloadObj: Record<string, unknown>) {
    try {
      if (token && !payloadObj.tok) {
        payloadObj.tok = token;
      }
      const line = JSON.stringify(payloadObj) + "\n";
      const client = createConnection();
      client.on("connect", () => {
        client.write(line, () => {
          client.end();
        });
      });
      client.on("error", () => {
        // silent
      });
    } catch (_) {}
  }

  function sendStatus(event: string, status: string, sessionId?: string) {
    sendOneShot({
      paneId,
      st: status,
      ev: event,
      sid: sessionId || "",
      hn: "pi",
    });
  }

  function connectSubscriber() {
    if (subClient) {
      try {
        subClient.destroy();
      } catch (_) {}
      subClient = null;
    }

    try {
      const client = createConnection();
      subClient = client;

      client.on("connect", () => {
        const req = {
          type: "cmd",
          cmd: "subscribe",
          tabId: paneId,
          ...(token ? { tok: token } : {}),
        };
        client.write(JSON.stringify(req) + "\n");
      });

      let buffer = "";
      client.on("data", (chunk) => {
        buffer += chunk.toString("utf8");
        let newlineIdx: number;
        while ((newlineIdx = buffer.indexOf("\n")) >= 0) {
          const line = buffer.slice(0, newlineIdx).trim();
          buffer = buffer.slice(newlineIdx + 1);
          if (!line) continue;
          try {
            const parsed = JSON.parse(line);
            // Cockpit tab renamed -> update Pi session name!
            if (parsed && parsed.event === "tab_renamed" && typeof parsed.name === "string") {
              const newName = parsed.name.trim();
              if (newName && newName !== currentName) {
                currentName = newName;
                pi.setSessionName(newName);
              }
            }
          } catch (_) {}
        }
      });

      client.on("error", () => {});
      client.on("close", () => {
        if (subClient === client) {
          subClient = null;
          setTimeout(connectSubscriber, 3000);
        }
      });
    } catch (_) {}
  }

  // ---- Pi Lifecycle Events ----

  pi.on("session_start", async (_event, ctx) => {
    connectSubscriber();
    const sid = ctx.sessionManager.getSessionFile() || "";
    sendStatus("SessionStart", "idle", sid);
  });

  pi.on("session_info_changed", async (event, _ctx) => {
    const raw = event.name?.trim();
    if (!raw) return;

    const canonical = toCanonical(raw);
    if (raw !== canonical) {
      // Ensure Pi itself holds the canonical workspace:tab-name
      currentName = canonical;
      pi.setSessionName(canonical);
      return;
    }

    if (canonical === currentName) return; // echo suppression
    currentName = canonical;

    // Notify Cockpit over IPC
    sendOneShot({
      type: "cmd",
      cmd: "rename-tab",
      tabId: paneId,
      args: { name: canonical },
    });
  });

  pi.on("turn_start", async (_event, ctx) => {
    const sid = ctx.sessionManager.getSessionFile() || "";
    sendStatus("UserPromptSubmit", "working", sid);
  });

  pi.on("tool_call", async (event, ctx) => {
    const sid = ctx.sessionManager.getSessionFile() || "";
    const isBlocking = event.toolName === "ask_user_question";
    sendStatus("PreToolUse", isBlocking ? "waiting" : "working", sid);
  });

  pi.on("tool_result", async (_event, ctx) => {
    const sid = ctx.sessionManager.getSessionFile() || "";
    sendStatus("PostToolUse", "working", sid);
  });

  pi.on("turn_end", async (_event, ctx) => {
    const sid = ctx.sessionManager.getSessionFile() || "";
    sendStatus("Stop", "idle", sid);
  });

  pi.on("session_shutdown", async (_event, ctx) => {
    if (subClient) {
      try {
        subClient.destroy();
      } catch (_) {}
      subClient = null;
    }
    const sid = ctx.sessionManager.getSessionFile() || "";
    sendStatus("SessionEnd", "idle", sid);
  });
}
