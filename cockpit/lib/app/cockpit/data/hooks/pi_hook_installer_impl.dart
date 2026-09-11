import 'dart:io';

import 'package:cockpit/app/cockpit/domain/contracts/hook_installer.dart';
import 'package:cockpit/app/core/data/setup/remote_pi_resolver.dart';
import 'package:cockpit/app/core/domain/result.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Installs Cockpit's Pi turn-status bridge as a global Pi extension.
///
/// Pi has an in-process extension API rather than Claude/Codex command hooks,
/// so this installer materializes a TypeScript extension instead of editing a
/// hook config. The extension owns the crucial process-ownership gate: child
/// agents inherit the tab's `COCKPIT_*` variables, but must not report status
/// for the parent tab.
class PiHookInstallerImpl implements HookInstaller {
  const PiHookInstallerImpl();

  static const assetPath = 'assets/hooks/pi_cockpit.ts';

  @override
  Future<Result<void, String>> ensureInstalled() async {
    final home = remotePiHome();
    if (home == null) {
      return const Failure<void, String>('HOME não resolvido');
    }
    try {
      final source = await rootBundle.loadString(assetPath);
      await writeExtension(home: home, source: source);
      return const Success<void, String>(null);
    } catch (e) {
      return Failure<void, String>('$e');
    }
  }

  @visibleForTesting
  Future<bool> writeExtension({
    required String home,
    required String source,
  }) async {
    final target = File('$home/.pi/agent/extensions/cockpit.ts');
    if (await target.exists() && await target.readAsString() == source) {
      return false;
    }
    await target.parent.create(recursive: true);
    await target.writeAsString(source, flush: true);
    return true;
  }
}
