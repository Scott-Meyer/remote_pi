import 'dart:async';

import 'package:flightdeck/app/flightdeck/data/remote/remote_host_password_store.dart';
import 'package:flightdeck/app/flightdeck/domain/contracts/remote_hosts_store.dart';
import 'package:flightdeck/app/flightdeck/domain/entities/remote_host.dart';
import 'package:flightdeck/app/flightdeck/domain/entities/remote_workspace_pin.dart';
import 'package:flightdeck/app/flightdeck/ui/remote/remote_hosts_controller.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';

/// Guardar senha é ACESSÓRIO — a fonte da verdade dos hosts é o JSON. Quando o
/// Keychain vinha antes do save e não respondia, editar e remover host
/// simplesmente não aconteciam, sem erro na tela (o future do onPressed é
/// descartado). Adicionar funcionava porque, na auth por chave, ele nem toca no
/// Keychain — foi essa assimetria que denunciou o bug.
void main() {
  late _FakeStore store;
  late RemoteHostsController controller;

  setUp(() {
    store = _FakeStore();
    controller = RemoteHostsController(store)
      ..passwordStoreForTest = RemoteHostPasswordStore(
        storage: const _HangingStorage(),
      );
  });

  test('editar a chave salva mesmo com o Keychain pendurado', () async {
    await store.save(
      const RemoteHost(
        id: '1',
        name: 'Rog',
        sshTarget: 'jacob@host',
        identityFile: '/Users/jacob/.ssh/id_ed25519.pub',
      ),
    );

    await controller
        .editHost('1', identityFile: '/Users/jacob/.ssh/id_ed25519')
        .timeout(const Duration(seconds: 2));

    expect(store.hosts().single.identityFile, '/Users/jacob/.ssh/id_ed25519');
  });

  test('remover host acontece mesmo com o Keychain pendurado', () async {
    await store.save(
      const RemoteHost(id: '1', name: 'Rog', sshTarget: 'jacob@host'),
    );

    await controller.removeHost('1').timeout(const Duration(seconds: 2));

    expect(store.hosts(), isEmpty);
  });

  test(
    'addPin com pin existente retém apresentação e não chama savePin',
    () async {
      const existing = RemoteWorkspacePin(
        id: 'legacy-id-1',
        hostId: '1',
        path: '/home/ubuntu/task-1',
        name: 'Custom Task Name',
        colorValue: 0xFF123456,
        imagePath: '/path/to/img.png',
        realmId: 'custom-realm',
        order: 42,
      );
      await store.savePin(existing);
      final initialCalls = store.savePinCalls;

      final pin = await controller.addPin(
        hostId: '1',
        path: '/home/ubuntu/task-1',
        name: 'Ignored New Name',
        realmId: 'default',
        order: 0,
      );

      expect(pin.id, 'legacy-id-1');
      expect(pin.name, 'Custom Task Name');
      expect(pin.colorValue, 0xFF123456);
      expect(pin.imagePath, '/path/to/img.png');
      expect(pin.realmId, 'custom-realm');
      expect(pin.order, 42);
      expect(store.savePinCalls, initialCalls);
    },
  );

  test(
    'addPin com pin novo usa o nome pedido e grava uma vez com realm e order',
    () async {
      final pin = await controller.addPin(
        hostId: '1',
        path: '/home/ubuntu/new-task',
        name: 'My Requested Name',
        realmId: 'active-realm',
        order: 7,
      );

      expect(pin.name, 'My Requested Name');
      expect(pin.realmId, 'active-realm');
      expect(pin.order, 7);
      expect(store.pins().single.path, '/home/ubuntu/new-task');
      expect(store.savePinCalls, 1);
    },
  );
}

/// Keychain que NUNCA responde — o pior caso, e o que não deixava rastro.
class _HangingStorage implements FlutterSecureStorage {
  const _HangingStorage();

  @override
  dynamic noSuchMethod(Invocation invocation) => Completer<void>().future;
}

class _FakeStore implements RemoteHostsStore {
  final List<RemoteHost> _hosts = [];
  final List<RemoteWorkspacePin> _pins = [];
  int savePinCalls = 0;

  @override
  List<RemoteHost> hosts() => List.unmodifiable(_hosts);

  @override
  Future<void> save(RemoteHost host) async {
    _hosts
      ..removeWhere((h) => h.id == host.id)
      ..add(host);
  }

  @override
  Future<void> remove(String id) async => _hosts.removeWhere((h) => h.id == id);

  @override
  List<RemoteWorkspacePin> pins() => List.unmodifiable(_pins);

  @override
  Future<void> savePin(RemoteWorkspacePin pin) async {
    savePinCalls++;
    _pins.removeWhere((p) => p.id == pin.id);
    _pins.add(pin);
  }

  @override
  Future<void> removePin(String id) async =>
      _pins.removeWhere((p) => p.id == id);

  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('${invocation.memberName}');
}
