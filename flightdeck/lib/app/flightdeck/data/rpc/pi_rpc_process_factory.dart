import 'package:flightdeck/app/core/env.dart';
import 'package:flightdeck/app/flightdeck/data/rpc/pi_rpc_process.dart';
import 'package:flightdeck/app/flightdeck/domain/contracts/rpc_gateway_factory.dart';
import 'package:flightdeck/app/flightdeck/domain/contracts/rpc_process_gateway.dart';

/// Cria um [PiRpcProcess] novo por agente (multiplexação da Wave 2).
class PiRpcProcessFactory implements RpcGatewayFactory {
  const PiRpcProcessFactory(this._config);

  final PiSpawnConfig _config;

  @override
  RpcProcessGateway create() => PiRpcProcess(_config);
}
