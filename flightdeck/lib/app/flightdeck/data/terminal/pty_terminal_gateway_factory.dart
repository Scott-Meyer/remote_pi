import 'package:flightdeck/app/flightdeck/data/terminal/pty_terminal_gateway.dart';
import 'package:flightdeck/app/flightdeck/domain/contracts/terminal_gateway.dart';
import 'package:flightdeck/app/flightdeck/domain/contracts/terminal_gateway_factory.dart';

/// Cria um [PtyTerminalGateway] novo por terminal.
class PtyTerminalGatewayFactory implements TerminalGatewayFactory {
  const PtyTerminalGatewayFactory();

  @override
  TerminalGateway create() => PtyTerminalGateway();
}
