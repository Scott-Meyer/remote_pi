// Managed by Cockpit. Reports only the owning Pi session's turn status.
import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";
import * as net from "net";

export default function cockpitTurnStatus(pi: ExtensionAPI) {
  // pi-subagents children inherit the tab's COCKPIT_* variables. Without this
  // ownership gate, every child tool/turn completion moves the parent tab to
  // idle and triggers its badge, chime, or OS notification. Do not gate on
  // PI_SUBAGENT_PARENT_SESSION: pi-subagents sets it in the root session too.
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

  function sendStatus(event: string, status: string, sessionId?: string) {
    try {
      const payload =
        JSON.stringify({
          paneId,
          st: status,
          ev: event,
          sid: sessionId || "",
          hn: "pi",
          ...(process.env.COCKPIT_STATUS_TOKEN
            ? { tok: process.env.COCKPIT_STATUS_TOKEN }
            : {}),
        }) + "\n";

      const client = socketPath
        ? net.createConnection(socketPath)
        : net.createConnection({ host: "127.0.0.1", port });
      client.once("connect", () => client.end(payload));
      client.on("error", () => {
        // Best effort: status reporting must never interrupt the agent.
      });
    } catch (_) {
      // Best effort: status reporting must never interrupt the agent.
    }
  }

  pi.on("session_start", async (_event, ctx) => {
    sendStatus("SessionStart", "idle", ctx.sessionManager.getSessionFile() || "");
  });
  pi.on("turn_start", async (_event, ctx) => {
    sendStatus("UserPromptSubmit", "working", ctx.sessionManager.getSessionFile() || "");
  });
  pi.on("tool_call", async (event, ctx) => {
    const status = event.toolName === "ask_user_question" ? "waiting" : "working";
    sendStatus("PreToolUse", status, ctx.sessionManager.getSessionFile() || "");
  });
  pi.on("tool_result", async (_event, ctx) => {
    sendStatus("PostToolUse", "working", ctx.sessionManager.getSessionFile() || "");
  });
  pi.on("turn_end", async (_event, ctx) => {
    sendStatus("Stop", "idle", ctx.sessionManager.getSessionFile() || "");
  });
  pi.on("session_shutdown", async (_event, ctx) => {
    sendStatus("SessionEnd", "idle", ctx.sessionManager.getSessionFile() || "");
  });
}
