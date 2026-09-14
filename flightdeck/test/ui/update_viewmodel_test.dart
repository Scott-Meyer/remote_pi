import 'dart:async';

import 'package:flightdeck/app/flightdeck/domain/contracts/dismissed_update_store.dart';
import 'package:flightdeck/app/flightdeck/domain/contracts/self_updater.dart';
import 'package:flightdeck/app/flightdeck/domain/contracts/update_checker.dart';
import 'package:flightdeck/app/flightdeck/domain/contracts/url_opener.dart';
import 'package:flightdeck/app/flightdeck/domain/entities/update_info.dart';
import 'package:flightdeck/app/flightdeck/domain/value_objects/update_target.dart';
import 'package:flightdeck/app/core/domain/contracts/settings_store.dart';
import 'package:flightdeck/app/core/domain/entities/app_settings.dart';
import 'package:flightdeck/app/core/ui/settings_controller.dart';
import 'package:flightdeck/app/flightdeck/ui/viewmodels/update_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';

class _FakeSettingsStore implements SettingsStore {
  _FakeSettingsStore({this.frequency = UpdateCheckFrequency.daily});

  final UpdateCheckFrequency frequency;

  @override
  Future<AppSettings> load() async =>
      AppSettings(updateCheckFrequency: frequency);

  @override
  Future<void> save(AppSettings settings) async {}
}

/// Motor de self-update controlável: os testes empurram fases à mão, como o
/// Sparkle/WinSparkle fariam.
class _FakeSelfUpdater implements SelfUpdater {
  _FakeSelfUpdater({this.ignoresCheckFrequency = false});

  @override
  final bool isSupported = true;

  @override
  final bool ignoresCheckFrequency;

  final _controller = StreamController<SelfUpdateState>.broadcast();
  SelfUpdateState _state = const SelfUpdateState.idle();

  int applyCount = 0;

  /// Registra o `inBackground` de cada checagem — é o que distingue a checagem
  /// de boot (silenciosa) da pedida pelo usuário (foreground).
  final checks = <bool>[];

  void emit(SelfUpdateState next) {
    _state = next;
    _controller.add(next);
  }

  @override
  SelfUpdateState get state => _state;

  @override
  Stream<SelfUpdateState> get changes => _controller.stream;

  @override
  Future<void> initialize() async {}

  @override
  Future<void> checkForUpdates({bool inBackground = true}) async =>
      checks.add(inBackground);

  @override
  Future<void> applyUpdate() async => applyCount++;

  @override
  void dispose() => _controller.close();
}

class _FakeChecker implements UpdateChecker {
  _FakeChecker(this.latest);
  final UpdateInfo? latest;
  int calls = 0;

  @override
  Future<UpdateInfo?> fetchLatest() async {
    calls++;
    return latest;
  }
}

class _FakeDismissed implements DismissedUpdateStore {
  String? _v;
  @override
  String? dismissedVersion() => _v;
  @override
  Future<void> dismiss(String version) async => _v = version;
}

class _FakeOpener implements UrlOpener {
  final opened = <String>[];
  @override
  Future<bool> open(String url) async {
    opened.add(url);
    return true;
  }
}

const _kWindowsTarget = UpdateTarget(
  version: '1.8.3',
  platform: 'windows',
  format: 'exe',
  arch: 'x64',
  selfUpdateFeedUrl: 'https://example.test/appcast-windows.xml',
);

UpdateInfo _info(String version) =>
    UpdateInfo(version: version, date: '', notes: '', artifacts: const []);

void main() {
  group('UpdateViewModel — self-update no Windows (fase available)', () {
    late _FakeSelfUpdater updater;
    late _FakeChecker checker;
    late UpdateViewModel vm;

    setUp(() {
      updater = _FakeSelfUpdater();
      checker = _FakeChecker(_info('1.8.4'));
      vm = UpdateViewModel(
        checker,
        _FakeDismissed(),
        _FakeOpener(),
        _kWindowsTarget,
        updater,
      );
      vm.attachSettings(SettingsController(_FakeSettingsStore()));
    });
    tearDown(() {
      vm.dispose();
      updater.dispose();
    });

    test('available → card aparece com "click to install"', () async {
      await vm.check();
      updater.emit(
        const SelfUpdateState(SelfUpdatePhase.available, version: '1.8.4'),
      );

      expect(vm.hasUpdate, isTrue);
      expect(vm.cardTitle, 'Update available');
      expect(vm.cardSubtitle, 'v1.8.4 — click to install');
      // Nada foi baixado: não pode prometer "restart to install".
      expect(vm.isReadyToInstall, isFalse);
    });

    test('toque aciona o updater (era no-op antes do fix)', () async {
      await vm.check();
      updater.emit(const SelfUpdateState(SelfUpdatePhase.available));

      await vm.primaryAction();

      expect(updater.applyCount, 1);
    });

    test(
      'versão desconhecida (AppcastItem null) → completa pelo latest.json',
      () async {
        await vm.check();
        // Como o plugin Windows manda o evento sem versão.
        updater.emit(const SelfUpdateState(SelfUpdatePhase.available));

        // Sem fallback o card diria "v — click to install".
        await pumpEventQueue();

        expect(vm.updateVersion, '1.8.4');
        expect(vm.cardSubtitle, 'v1.8.4 — click to install');
      },
    );

    test(
      'não busca o latest.json quando o motor já informa a versão',
      () async {
        await vm.check();
        updater.emit(
          const SelfUpdateState(SelfUpdatePhase.available, version: '1.8.4'),
        );
        await pumpEventQueue();

        expect(checker.calls, 0);
      },
    );

    test('idle → sem card', () async {
      await vm.check();
      updater.emit(const SelfUpdateState.idle());

      expect(vm.hasUpdate, isFalse);
    });

    test('check() de boot é silenciosa (inBackground: true)', () async {
      await vm.check();
      expect(updater.checks, [true]);
    });

    test(
      'checkNow() do menu é foreground → ignora "Skip this version"',
      () async {
        await vm.checkNow();
        expect(updater.checks, [false]);
      },
    );

    test('checkNow() traz de volta um card dispensado na sessão', () async {
      await vm.check();
      updater.emit(const SelfUpdateState(SelfUpdatePhase.available));
      await vm.dismiss();
      expect(vm.hasUpdate, isFalse);

      await vm.checkNow();

      expect(vm.hasUpdate, isTrue);
    });

    test('dismiss esconde o card na sessão', () async {
      await vm.check();
      updater.emit(const SelfUpdateState(SelfUpdatePhase.available));

      await vm.dismiss();

      expect(vm.hasUpdate, isFalse);
    });
  });

  group('UpdateViewModel — self-update no macOS (fases de download)', () {
    late _FakeSelfUpdater updater;
    late UpdateViewModel vm;

    setUp(() {
      updater = _FakeSelfUpdater();
      vm = UpdateViewModel(
        _FakeChecker(null),
        _FakeDismissed(),
        _FakeOpener(),
        _kWindowsTarget,
        updater,
      );
      vm.attachSettings(SettingsController(_FakeSettingsStore()));
    });
    tearDown(() {
      vm.dispose();
      updater.dispose();
    });

    test('downloading → mostra progresso, sem ação', () async {
      await vm.check();
      updater.emit(
        const SelfUpdateState(SelfUpdatePhase.downloading, version: '1.8.4'),
      );

      expect(vm.cardSubtitle, 'Downloading v1.8.4…');
      expect(vm.isReadyToInstall, isFalse);
    });

    test('downloaded → "restart to install"', () async {
      await vm.check();
      updater.emit(
        const SelfUpdateState(SelfUpdatePhase.downloaded, version: '1.8.4'),
      );

      expect(vm.cardTitle, 'Update ready');
      expect(vm.cardSubtitle, 'v1.8.4 — restart to install');
      expect(vm.isReadyToInstall, isTrue);
    });
  });

  group('UpdateViewModel — ignoresCheckFrequency (local dev-update channel)', () {
    test(
      'engine with ignoresCheckFrequency=false (Sparkle/WinSparkle/Noop) '
      'respects frequency=never and does not check',
      () async {
        final updater = _FakeSelfUpdater();
        final vm = UpdateViewModel(
          _FakeChecker(null),
          _FakeDismissed(),
          _FakeOpener(),
          _kWindowsTarget,
          updater,
        );
        final controller = SettingsController(
          _FakeSettingsStore(frequency: UpdateCheckFrequency.never),
        );
        await controller.load();
        vm.attachSettings(controller);

        await vm.check();

        expect(
          updater.checks,
          isEmpty,
          reason:
              'a real appcast engine must respect the user\'s '
              '"never" setting',
        );

        vm.dispose();
        updater.dispose();
      },
    );

    test(
      'engine with ignoresCheckFrequency=true (local dev-update channel) '
      'checks at boot even when frequency=never',
      () async {
        final updater = _FakeSelfUpdater(ignoresCheckFrequency: true);
        final vm = UpdateViewModel(
          _FakeChecker(null),
          _FakeDismissed(),
          _FakeOpener(),
          _kWindowsTarget,
          updater,
        );
        final controller = SettingsController(
          _FakeSettingsStore(frequency: UpdateCheckFrequency.never),
        );
        await controller.load();
        vm.attachSettings(controller);

        await vm.check();

        expect(
          updater.checks,
          [true],
          reason:
              'the local channel is a local file read, not a remote '
              'appcast check — the user\'s network-check-frequency setting '
              'must not gate it',
        );

        vm.dispose();
        updater.dispose();
      },
    );
  });
}
