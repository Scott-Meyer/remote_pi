import 'dart:io';

import 'package:cockpit/app/cockpit/data/hooks/pi_hook_installer_impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Directory home;

  setUp(() async {
    home = await Directory.systemTemp.createTemp('pi-hook-test');
  });

  tearDown(() async {
    if (await home.exists()) await home.delete(recursive: true);
  });

  test('instala e atualiza a extensão global do Pi idempotentemente', () async {
    const installer = PiHookInstallerImpl();
    final target = File('${home.path}/.pi/agent/extensions/cockpit.ts');

    expect(
      await installer.writeExtension(home: home.path, source: 'version 1\n'),
      isTrue,
    );
    expect(await target.readAsString(), 'version 1\n');

    expect(
      await installer.writeExtension(home: home.path, source: 'version 1\n'),
      isFalse,
    );

    expect(
      await installer.writeExtension(home: home.path, source: 'version 2\n'),
      isTrue,
    );
    expect(await target.readAsString(), 'version 2\n');
  });
}
