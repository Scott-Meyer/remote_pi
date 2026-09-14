/// Atualização de status de um agente rodando numa aba de terminal, enviada
/// pelo helper `flightdeck hook` (instalado nos hooks do Claude Code e do Codex
/// CLI) via socket.
class ClaudeStatusUpdate {
  const ClaudeStatusUpdate({
    required this.paneId,
    required this.status,
    this.event,
    this.sessionId,
    this.transcriptPath,
    this.harness,
    this.isSubagent = false,
  });

  /// Id da aba (vem do env `FLIGHTDECK_PANE_ID` injetado na PTV — roteamento).
  final String paneId;

  /// `working` | `waiting` | `idle` (wire string).
  final String status;

  /// Nome cru do evento de hook do Claude Code (`UserPromptSubmit`, `PreToolUse`,
  /// `Stop`, ...), quando enviado pelo helper. Usado pra distinguir início de
  /// turno de atividade mid-turn e descartar `working` reordenado. `null` em
  /// helpers antigos (pré-`ev`).
  final String? event;

  /// session_id do agente (persistido pra retomar a sessão no restore da aba).
  final String? sessionId;

  /// Caminho do transcript `.jsonl` do agente.
  final String? transcriptPath;

  /// Quem emitiu o evento: `claude` | `codex` | `pi`. Vem do `--harness` que
  /// o instalador grava no comando do hook; `null` em helpers antigos (que só
  /// existiam para o Claude — ver [AgentHarness.fromWire]).
  final String? harness;

  /// Defesa no consumidor para bridges que encaminham explicitamente a origem.
  /// O helper atual já descarta hooks de subagente antes do socket, mas clientes
  /// legados/terceiros podem enviar `sub:true` diretamente.
  final bool isSubagent;
}

/// Harness que roda numa aba de terminal. O FlightDeck precisa distinguir para
/// **retomar a sessão** no restore: o `session_id` sozinho não diz de quem é, e
/// o comando de resume difere.
enum AgentHarness {
  claude('claude'),
  codex('codex'),
  pi('pi');

  const AgentHarness(this.wire);

  /// Nome no wire (payload do hook) e no layout persistido.
  final String wire;

  /// Comando que reata a sessão [sessionId] num shell novo.
  String resumeCommand(String sessionId) => switch (this) {
    AgentHarness.claude =>
      sessionId == 'latest' || sessionId.isEmpty
          ? 'claude -c'
          : 'claude --resume $sessionId',
    AgentHarness.codex =>
      sessionId == 'latest' || sessionId.isEmpty
          ? 'codex resume --last'
          : 'codex resume $sessionId',
    AgentHarness.pi =>
      sessionId == 'latest' || sessionId.isEmpty
          ? 'pi -c'
          : 'pi --session $sessionId',
  };

  /// Converte o nome do wire. Ausente ou vazio cai em [claude] (layouts legados
  /// ou helpers antigos sem `--harness`). Desconhecido não-vazio devolve `null`
  /// em vez de adivinhar [claude] (evita tentar `claude --resume` em harnesses
  /// incompatíveis).
  static AgentHarness? fromWire(String? wire) {
    if (wire == null || wire.isEmpty) return AgentHarness.claude;
    for (final h in AgentHarness.values) {
      if (h.wire == wire) return h;
    }
    return null;
  }
}

/// Comando enviado pela **CLI interna** `flightdeck` (binário em `~/.flightdeck/bin`)
/// pelo mesmo socket do status. Discriminado no wire por `type:"cmd"`.
class FlightDeckCommand {
  const FlightDeckCommand({required this.cmd, this.tabId, this.args = const {}});

  /// Verbo no wire: `write` (send/send-key) | `list-panes` | `list-workspaces` |
  /// `new-workspace` | `close-workspace` | `rename-workspace`.
  final String cmd;

  /// Pane alvo (default = `$FLIGHTDECK_PANE_ID` resolvido pela CLI). `null` só nos
  /// comandos que não miram pane (list-*).
  final String? tabId;

  /// Argumentos do comando (ex.: `{data: <base64 utf8>}` no `write`).
  final Map<String, dynamic> args;
}

/// Resultado de um [FlightDeckCommand], serializado de volta pra CLI como uma linha
/// JSON `{ok, data?|error?}`.
class FlightDeckCommandResult {
  const FlightDeckCommandResult.ok([this.data, this.afterResponse, this.warning])
    : ok = true,
      error = null;
  const FlightDeckCommandResult.fail(this.error)
    : ok = false,
      data = null,
      afterResponse = null,
      warning = null;

  final bool ok;
  final Object? data;
  final String? error;

  /// Efeito a executar **depois** da resposta ter sido escrita e o socket
  /// fechado. Existe para o comando que destrói o próprio canal por onde a
  /// resposta volta: `close-tab` sem alvo fecha a aba emissora, e fechá-la
  /// mata o PTY, o shell e o processo `flightdeck` que está esperando o `ok` —
  /// executado antes do flush, o sucesso viraria erro de transporte na tela.
  ///
  /// Não é adiar por tempo: o servidor chama isto no ponto exato em que a
  /// resposta já saiu. Quem usa valida tudo que pode falhar ANTES de agendar,
  /// porque daqui não há mais como reportar erro.
  final void Function()? afterResponse;

  /// Aviso que a CLI imprime no **stderr**, sem sujar o stdout que os agentes
  /// parseiam. Existe para o comando que fez algo correto mas provavelmente
  /// não o que se queria — hoje só `--workspace` mirando um workspace de OUTRA
  /// máquina, que executa lá e devolve resposta com cara de local.
  final String? warning;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'ok': ok,
    if (data != null) 'data': data,
    if (error != null) 'error': error,
    if (warning != null) 'warning': warning,
  };
}

/// Servidor local (socket Unix) que recebe os updates de status do `flightdeck-hook`.
///
/// O Claude roda os hooks **sem terminal controlador**, então não dá pra emitir
/// OSC na PTY (write em `/dev/tty` falha com ENXIO). O helper, em vez disso,
/// conecta neste socket e manda o status; o roteamento pra aba certa vem do
/// `paneId` (env injetado no spawn da PTY).
///
/// O **mesmo socket** também serve a CLI interna `flightdeck` (comandos `type:"cmd"`,
/// request/response): status é fire-and-forget (não responde); comando retém a
/// conexão e escreve uma linha de resposta.
abstract class TerminalStatusServer {
  /// Variáveis de ambiente que o helper `flightdeck-hook` precisa pra reportar
  /// status, injetadas no PTY de cada aba. Disponível **após** [start].
  /// POSIX: `{FLIGHTDECK_STATUS_SOCK}`. Windows: `{FLIGHTDECK_STATUS_PORT,
  /// FLIGHTDECK_STATUS_TOKEN}` (TCP loopback + token anti-spoof).
  Map<String, String> get hookEnv;

  /// Sobe o servidor; [onUpdate] é chamado a cada status recebido. [onCommand]
  /// (opcional) atende os comandos da CLI interna e devolve o resultado a
  /// escrever de volta no socket.
  Future<void> start(
    void Function(ClaudeStatusUpdate update) onUpdate, {
    Future<FlightDeckCommandResult> Function(FlightDeckCommand command)? onCommand,
  });

  /// Envia um evento em broadcast para todos os clientes inscritos na aba [tabId].
  void broadcastTabEvent(String tabId, Map<String, dynamic> event) {}

  /// Derruba o servidor (e remove o socket no POSIX).
  Future<void> stop();
}

/// Fonte alternativa de turn-status, para as PTYs que **não** nascem dentro do
/// app e portanto não reportam ao [TerminalStatusServer] daqui.
///
/// É o caso do sidecar: o servidor que hospeda o PTY injeta o socket de status
/// DELE no ambiente do shell (sobrescrevendo o `hookEnv` do cliente), então o
/// hook do agente reporta lá e o status volta pelo protocolo. A `ui/` assina
/// esta fonte e a trata igual ao status local — mesmo spinner, mesmo chime.
abstract class TurnStatusSource {
  Stream<ClaudeStatusUpdate> get turnStatus;
}
