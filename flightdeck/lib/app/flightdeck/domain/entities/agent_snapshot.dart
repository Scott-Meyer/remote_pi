import 'package:flightdeck/app/flightdeck/domain/entities/pi_model.dart';
import 'package:flightdeck/app/flightdeck/domain/entities/thinking_level.dart';

/// Recorte do estado do agente vivo — de `get_state`. O FlightDeck usa para
/// preencher a seleção atual dos seletores (modelo + effort) ao bootar.
class AgentSnapshot {
  const AgentSnapshot({
    required this.model,
    required this.thinkingLevel,
    required this.isStreaming,
  });

  final PiModel? model;
  final ThinkingLevel thinkingLevel;
  final bool isStreaming;
}
