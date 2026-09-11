// Managed by Cockpit. Reports turn status and synchronizes reactive session naming.
import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";
import * as net from "net";
import * as path from "path";

export default function cockpitTurnStatus(pi: ExtensionAPI) {
  // pi-subagents children inherit the tab's COCKPIT_* variables. Without this
  // ownership gate, every child tool/turn completion moves the parent tab to
  // idle and triggers its badge, chime, or OS notification.
  if (
    process.env.PI_SUBAGENT_CHILD === "1" ||
    Boolean(process.env.PI_SUBAGENT_CHILD_AGENT?.trim())
  ) {
    return;
  }

  const paneId = process.env.COCKPIT_PANE_ID;
  const socketPath = process.env.COCKPIT_STATUS_SOCK;
  const port = Number.parseInt(process.env.COCKPIT_STATUS_PORT ?? "", 10);
  const hasPort = Number.isInteger(port) && port > 0 && port <= 65_535;
  if (!paneId || (!socketPath && !hasPort)) return;

  let lastSentToCockpit: string | null = null;
  let subClient: net.Socket | null = null;
  let namePollTimer: NodeJS.Timeout | null = null;

  function getWorkspaceName(): string {
    return (
      process.env.COCKPIT_WORKSPACE_NAME ||
      path.basename(process.cwd()) ||
      "workspace"
    );
  }

  function toCanonical(name: string): string {
    if (!name) return name;
    if (name.includes(":")) return name;
    return `${getWorkspaceName()}:${name}`;
  }

  function createConnection(): net.Socket {
    if (socketPath) {
      return net.createConnection(socketPath);
    }
    return net.createConnection({ host: "127.0.0.1", port });
  }

  function sendOneShot(payloadObj: Record<string, unknown>) {
    try {
      if (process.env.COCKPIT_STATUS_TOKEN && !payloadObj.tok) {
        payloadObj.tok = process.env.COCKPIT_STATUS_TOKEN;
      }
      const line = JSON.stringify(payloadObj) + "\n";
      const client = createConnection();
      client.once("connect", () => client.end(line));
      client.on("error", () => {
        // Best effort: reporting must never interrupt the agent.
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

  function syncName(rawName: string | undefined | null) {
    const raw = rawName?.trim();
    if (!raw) return;

    const canonical = toCanonical(raw);

    // 1. Ensure Pi's internal session name is canonical
    if (pi.getSessionName() !== canonical) {
      pi.setSessionName(canonical);
    }

    // 2. If not yet sent to Cockpit, notify Cockpit over IPC
    if (canonical !== lastSentToCockpit) {
      lastSentToCockpit = canonical;
      sendOneShot({
        type: "cmd",
        cmd: "rename-tab",
        tabId: paneId,
        args: { name: canonical },
      });
    }
  }

  function startNamePoll() {
    if (namePollTimer) clearInterval(namePollTimer);
    namePollTimer = setInterval(() => {
      const name = pi.getSessionName()?.trim();
      if (name) syncName(name);
    }, 500);
    namePollTimer.unref?.();
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

      client.once("connect", () => {
        const req = {
          type: "cmd",
          cmd: "subscribe",
          tabId: paneId,
          ...(process.env.COCKPIT_STATUS_TOKEN
            ? { tok: process.env.COCKPIT_STATUS_TOKEN }
            : {}),
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
            // Cockpit tab renamed -> route through syncName to ensure canonical convergence
            if (
              parsed &&
              parsed.event === "tab_renamed" &&
              typeof parsed.name === "string"
            ) {
              syncName(parsed.name);
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
    startNamePoll();
    const sid = ctx.sessionManager.getSessionFile() || "";
    sendStatus("SessionStart", "idle", sid);
    syncName(pi.getSessionName());
  });

  pi.on("turn_start", async (_event, ctx) => {
    const sid = ctx.sessionManager.getSessionFile() || "";
    sendStatus("UserPromptSubmit", "working", sid);
    syncName(pi.getSessionName());
  });

  pi.on("tool_call", async (event, ctx) => {
    const status =
      event.toolName === "ask_user_question" ? "waiting" : "working";
    sendStatus("PreToolUse", status, ctx.sessionManager.getSessionFile() || "");
  });

  pi.on("tool_result", async (_event, ctx) => {
    sendStatus("PostToolUse", "working", ctx.sessionManager.getSessionFile() || "");
  });

  pi.on("turn_end", async (_event, ctx) => {
    const sid = ctx.sessionManager.getSessionFile() || "";
    sendStatus("Stop", "idle", sid);
    syncName(pi.getSessionName());
  });

  pi.on("session_shutdown", async (_event, ctx) => {
    if (namePollTimer) {
      clearInterval(namePollTimer);
      namePollTimer = null;
    }
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
