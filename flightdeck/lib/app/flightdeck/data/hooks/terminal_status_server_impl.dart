import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flightdeck/app/flightdeck/domain/contracts/terminal_status_server.dart';
import 'package:flightdeck/app/core/data/setup/remote_pi_resolver.dart';
import 'package:flutter/foundation.dart';

/// [TerminalStatusServer] híbrido por plataforma:
/// - **POSIX**: socket Unix em `~/.flightdeck/status[-debug].sock` (permissão do
///   arquivo já protege contra outros usuários).
/// - **Windows**: TCP loopback `127.0.0.1:<porta-efêmera>` + **token**
///   (loopback é acessível por qualquer processo local; o token valida a
///   origem). O Dart não suporta socket Unix no Windows.
///
/// Cada conexão do `flightdeck-hook` manda **uma linha JSON** (`{paneId, st, sid,
/// tx, tok?}`) e fecha.
class TerminalStatusServerImpl implements TerminalStatusServer {
  TerminalStatusServerImpl();

  ServerSocket? _server;
  void Function(ClaudeStatusUpdate update)? _onUpdate;
  Future<FlightDeckCommandResult> Function(FlightDeckCommand command)? _onCommand;
  String? _token; // só no Windows/TCP

  String get _socketPath {
    final home = remotePiHome() ?? Directory.systemTemp.path;
    final suffix = kDebugMode ? '-debug' : '';
    return '$home/.flightdeck/status$suffix.sock';
  }

  @override
  Map<String, String> get hookEnv {
    final server = _server;
    if (server == null) return const <String, String>{};
    if (Platform.isWindows) {
      final env = <String, String>{
        'FLIGHTDECK_STATUS_PORT': '${server.port}',
      };
      final token = _token;
      if (token != null) {
        env['FLIGHTDECK_STATUS_TOKEN'] = token;
      }
      return env;
    }
    return <String, String>{
      'FLIGHTDECK_STATUS_SOCK': _socketPath,
    };
  }

  @override
  Future<void> start(
    void Function(ClaudeStatusUpdate update) onUpdate, {
    Future<FlightDeckCommandResult> Function(FlightDeckCommand command)? onCommand,
  }) async {
    // Mobile (iPad/Android): o status-server é o socket do flightdeck-hook do
    // desktop (som/chime de fim de turno via Claude Code local). No mobile não
    // há hook local — e o path do container do iOS estoura o limite de UDS.
    // No-op; o status remoto do host virá pelo protocolo (ver plano 58/59).
    if (Platform.isIOS || Platform.isAndroid) return;
    if (_server != null) return;
    _onUpdate = onUpdate;
    _onCommand = onCommand;
    try {
      if (Platform.isWindows) {
        _token = _randomToken();
        _server = await ServerSocket.bind(InternetAddress.loopbackIPv4, 0);
      } else {
        final file = File(_socketPath);
        await file.parent.create(recursive: true);
        // Remove socket órfão do ciclo anterior (bind falha se já existe).
        if (await file.exists()) await file.delete();
        final address = InternetAddress(
          _socketPath,
          type: InternetAddressType.unix,
        );
        _server = await ServerSocket.bind(address, 0);
      }
      _server!.listen(_handleConnection, onError: (_) {});
    } catch (e) {
      if (kDebugMode) debugPrint('[status-server] bind falhou: $e');
    }
  }

  String _randomToken() {
    final r = Random.secure();
    return List<int>.generate(
      16,
      (_) => r.nextInt(256),
    ).map((b) => b.toRadixString(16).padLeft(2, '0')).join();
  }

  final Map<String, Set<Socket>> _tabSubscribers = {};

  @override
  void broadcastTabEvent(String tabId, Map<String, dynamic> event) {
    final subs = _tabSubscribers[tabId];
    if (subs == null || subs.isEmpty) return;
    final line = '${jsonEncode(event)}\n';
    final bytes = utf8.encode(line);
    for (final s in subs.toList()) {
      try {
        s.add(bytes);
      } catch (_) {
        subs.remove(s);
        try {
          s.destroy();
        } catch (_) {}
      }
    }
  }

  void _handleConnection(Socket socket) {
    // Despacha na PRIMEIRA linha (`\n`), não no fim da conexão: o `flightdeck-hook`
    // (status) fecha logo após enviar, mas a CLI (`type:"cmd"`) mantém o socket
    // aberto esperando a resposta — esperar `onDone` deadlockaria o
    // request/response. Status → resposta null (só destrói); comando → escreve
    // uma linha de resposta e destrói.
    late StreamSubscription<String> sub;
    var handled = false;
    var isSubscribed = false;
    String? subscribedTabId;

    void cleanupSubscription() {
      if (subscribedTabId != null) {
        _tabSubscribers[subscribedTabId]?.remove(socket);
      }
      try {
        socket.destroy();
      } catch (_) {}
    }

    sub = socket
        .cast<List<int>>()
        .transform(utf8.decoder)
        .transform(const LineSplitter())
        .listen(
          (line) async {
            if (isSubscribed) return;
            if (handled) return;

            // Se for comando de subscribe, valida token (Windows) e mantém o
            // socket aberto para receber pushes broadcastTabEvent.
            final raw = line.trim();
            if (raw.isNotEmpty) {
              try {
                final decoded = jsonDecode(raw);
                if (decoded is Map &&
                    decoded['type'] == 'cmd' &&
                    decoded['cmd'] == 'subscribe') {
                  if (_token != null && decoded['tok'] != _token) {
                    socket.add(utf8.encode(
                      '${jsonEncode(const FlightDeckCommandResult.fail('invalid token').toJson())}\n',
                    ));
                    await socket.flush();
                    socket.destroy();
                    handled = true;
                    return;
                  }
                  final tabId = (decoded['tabId'] ?? '').toString();
                  if (tabId.isNotEmpty) {
                    handled = true;
                    isSubscribed = true;
                    subscribedTabId = tabId;
                    (_tabSubscribers[tabId] ??= {}).add(socket);
                    socket.add(utf8.encode(
                      '${jsonEncode(const FlightDeckCommandResult.ok({'subscribed': true}).toJson())}\n',
                    ));
                    await socket.flush();
                    return; // Mantém sub aberta para observar onDone/onError!
                  }
                }
              } catch (_) {}
            }

            handled = true;
            await sub.cancel();
            String? response;
            void Function()? after;
            try {
              (response, after) = await _dispatch(line);
            } catch (_) {
              response = null;
            }
            if (response != null) {
              try {
                socket.add(utf8.encode('$response\n'));
                await socket.flush();
              } catch (_) {
                /* peer sumiu: ignora */
              }
            }
            socket.destroy();
            // Efeito pós-resposta (ver `FlightDeckCommandResult.afterResponse`):
            // só aqui o `close-tab` da própria aba pode matar o PTY sem levar
            // junto o `flightdeck` que esperava o `ok`.
            after?.call();
          },
          onError: (_) => cleanupSubscription(),
          onDone: () {
            if (isSubscribed) {
              cleanupSubscription();
            } else if (!handled) {
              socket.destroy();
            }
          },
          cancelOnError: true,
        );
  }

  /// Processa uma linha JSON. Devolve a linha de resposta a escrever de volta
  /// (comandos da CLI) — `null` quando não há resposta (status do hook) — e o
  /// efeito a rodar DEPOIS de a resposta ter saído (ver
  /// `FlightDeckCommandResult.afterResponse`).
  Future<(String?, void Function()?)> _dispatch(String raw) async {
    final line = raw.trim();
    if (line.isEmpty) return (null, null);
    try {
      final decoded = jsonDecode(line);
      if (decoded is! Map) return (null, null);
      final isCmd = decoded['type'] == 'cmd';
      // No Windows/TCP, exige o token (anti-spoof do loopback).
      if (_token != null && decoded['tok'] != _token) {
        return (
          isCmd
              ? jsonEncode(
                  const FlightDeckCommandResult.fail('invalid token').toJson(),
                )
              : null,
          null,
        );
      }
      if (isCmd) return await _dispatchCommand(decoded);
      // Caminho de status (default / `type` ausente): fire-and-forget.
      final paneId = (decoded['paneId'] ?? '').toString();
      final status = (decoded['st'] ?? '').toString();
      if (paneId.isEmpty || status.isEmpty) return (null, null);
      final sid = (decoded['sid'] ?? '').toString();
      final tx = (decoded['tx'] ?? '').toString();
      final ev = (decoded['ev'] ?? '').toString();
      final hn = (decoded['hn'] ?? '').toString();

      final isSubagent =
          decoded['sub'] == true ||
          decoded['is_subagent'] == true ||
          (decoded['subagent_id'] != null &&
              decoded['subagent_id'].toString().trim().isNotEmpty) ||
          ev.startsWith('Subagent');

      _onUpdate?.call(
        ClaudeStatusUpdate(
          paneId: paneId,
          status: status,
          event: ev.isEmpty ? null : ev,
          sessionId: sid.isEmpty ? null : sid,
          transcriptPath: tx.isEmpty ? null : tx,
          harness: hn.isEmpty ? null : hn,
          isSubagent: isSubagent,
        ),
      );
      return (null, null);
    } catch (_) {
      // linha malformada: sem resposta (a CLI reporta timeout/erro de leitura).
      return (null, null);
    }
  }

  Future<(String?, void Function()?)> _dispatchCommand(
    Map<dynamic, dynamic> decoded,
  ) async {
    final handler = _onCommand;
    if (handler == null) {
      return (
        jsonEncode(
          const FlightDeckCommandResult.fail('commands unavailable').toJson(),
        ),
        null,
      );
    }
    final tabRaw = (decoded['tabId'] ?? '').toString();
    final argsRaw = decoded['args'];
    final command = FlightDeckCommand(
      cmd: (decoded['cmd'] ?? '').toString(),
      tabId: tabRaw.isEmpty ? null : tabRaw,
      args: argsRaw is Map
          ? Map<String, dynamic>.from(argsRaw)
          : const <String, dynamic>{},
    );
    final result = await handler(command);
    return (jsonEncode(result.toJson()), result.afterResponse);
  }

  @override
  Future<void> stop() async {
    for (final subs in _tabSubscribers.values) {
      for (final s in subs) {
        try {
          s.destroy();
        } catch (_) {}
      }
    }
    _tabSubscribers.clear();
    await _server?.close();
    _server = null;
    _onUpdate = null;
    _token = null;
    if (!Platform.isWindows) {
      try {
        final file = File(_socketPath);
        if (await file.exists()) await file.delete();
      } catch (_) {}
    }
  }
}
