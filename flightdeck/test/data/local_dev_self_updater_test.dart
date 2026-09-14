import 'dart:convert';
import 'dart:io';

import 'package:flightdeck/app/flightdeck/data/update/local_dev_self_updater.dart';
import 'package:flightdeck/app/flightdeck/domain/contracts/self_updater.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as p;

/// [LocalDevSelfUpdater] reads `<updatesDir>/latest.json` and stages from
/// `<updatesDir>/staged/FlightDeck.app`. These tests point it at a real temp
/// directory (via the constructor's [updatesDir] override) instead of
/// `~/.flightdeck/updates`, so behavior is exercised without touching
/// anything on the real machine.
void main() {
  late Directory tmp;
  late String updatesDir;

  setUp(() {
    tmp = Directory.systemTemp.createTempSync('local_dev_self_updater_test_');
    updatesDir = tmp.path;
  });

  tearDown(() {
    tmp.deleteSync(recursive: true);
  });

  void writeManifest(Map<String, dynamic> manifest) {
    File(p.join(updatesDir, 'latest.json')).writeAsStringSync(
      jsonEncode(manifest),
    );
  }

  void createStagedApp() {
    Directory(
      p.join(updatesDir, 'staged', 'FlightDeck.app'),
    ).createSync(recursive: true);
  }

  test('ignoresCheckFrequency is true', () {
    final updater = LocalDevSelfUpdater(updatesDir: updatesDir);
    expect(updater.ignoresCheckFrequency, isTrue);
  });

  test('no manifest file -> stays idle', () async {
    final updater = LocalDevSelfUpdater(updatesDir: updatesDir);
    await updater.checkForUpdates();
    expect(updater.state.phase, SelfUpdatePhase.idle);
    expect(updater.state.hasPendingUpdate, isFalse);
  });

  test('manifest present but no staged app dir -> stays idle', () async {
    // A published manifest with nothing actually staged (e.g. publish
    // failed partway) must never announce an update with nothing to apply.
    writeManifest({
      'channel': 'local',
      'buildId': 'build-aaa',
      'appFrameworkSha256': 'deadbeef',
    });
    final updater = LocalDevSelfUpdater(updatesDir: updatesDir);
    await updater.checkForUpdates();
    expect(updater.state.phase, SelfUpdatePhase.idle);
  });

  test('manifest channel != local -> stays idle even with staged app', () async {
    createStagedApp();
    writeManifest({
      'channel': 'not-local',
      'buildId': 'build-aaa',
      'appFrameworkSha256': 'deadbeef',
    });
    final updater = LocalDevSelfUpdater(updatesDir: updatesDir);
    await updater.checkForUpdates();
    expect(updater.state.phase, SelfUpdatePhase.idle);
  });

  test(
    'manifest buildId matches the running build (kLocalBuildId) -> stays '
    'idle (already on this build, nothing to offer)',
    () async {
      createStagedApp();
      // kLocalBuildId is '' in a plain `flutter test` run (no --dart-define
      // baked in) — a manifest buildId of '' is what "already on this
      // build" looks like under that same condition.
      writeManifest({
        'channel': 'local',
        'buildId': kLocalBuildId,
        'appFrameworkSha256': 'deadbeef',
      });
      final updater = LocalDevSelfUpdater(updatesDir: updatesDir);
      await updater.checkForUpdates();
      expect(updater.state.phase, SelfUpdatePhase.idle);
    },
  );

  test(
    'manifest has a different buildId + staged app exists -> downloaded, '
    'version is the buildId',
    () async {
      createStagedApp();
      writeManifest({
        'channel': 'local',
        'buildId': 'build-bbb',
        'appFrameworkSha256': 'deadbeef',
      });
      final updater = LocalDevSelfUpdater(updatesDir: updatesDir);
      await updater.checkForUpdates();
      expect(updater.state.phase, SelfUpdatePhase.downloaded);
      expect(updater.state.version, 'build-bbb');
      expect(updater.state.isReadyToInstall, isTrue);
    },
  );

  test('malformed manifest JSON -> error state, does not throw', () async {
    File(p.join(updatesDir, 'latest.json')).writeAsStringSync('{not json');
    final updater = LocalDevSelfUpdater(updatesDir: updatesDir);
    await updater.checkForUpdates();
    expect(updater.state.phase, SelfUpdatePhase.error);
  });

  test(
    'a later checkForUpdates() with the manifest removed clears the '
    'pending update back to idle',
    () async {
      createStagedApp();
      writeManifest({
        'channel': 'local',
        'buildId': 'build-ccc',
        'appFrameworkSha256': 'deadbeef',
      });
      final updater = LocalDevSelfUpdater(updatesDir: updatesDir);
      await updater.checkForUpdates();
      expect(updater.state.phase, SelfUpdatePhase.downloaded);

      File(p.join(updatesDir, 'latest.json')).deleteSync();
      await updater.checkForUpdates();
      expect(updater.state.phase, SelfUpdatePhase.idle);
    },
  );
}
