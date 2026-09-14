import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flightdeck/app/flightdeck/domain/contracts/self_updater.dart';
import 'package:window_manager/window_manager.dart';

/// Local update channel: this build was compiled by
/// `scripts/build-flightdeck.sh --publish-local-update` (or the plain fast
/// dev-loop path), never a real distributed release.
const String kUpdateChannel = String.fromEnvironment('FLIGHTDECK_UPDATE_CHANNEL');

/// Unique per-build id baked in at compile time by the same flag. Comparing
/// THIS instead of the marketing version/build number is what lets two
/// builds that share the same `pubspec.yaml` version get told apart.
const String kLocalBuildId = String.fromEnvironment('FLIGHTDECK_LOCAL_BUILD_ID');

/// Local dev-loop self-update: source of truth is
/// `~/.flightdeck/updates/latest.json`, published by
/// `scripts/flightdeck-publish-local-update.sh` (which builds via the
/// canonical, already-reviewed `scripts/build-flightdeck.sh` — same lock,
/// isolated PUB_CACHE, Rust CLI build+test, media_kit patch, bundle
/// validation — with a couple of extra `--dart-define`s passed through)
/// after each successful build. Never a remote appcast. Fills the slot that
/// used to always be [NoopSelfUpdater] when this compiled build isn't on
/// the official Sparkle channel (see `_buildSelfUpdater`).
///
/// v1, deliberately simple: one fixed staging slot, one manifest, one
/// bundled swap helper. Not defending against adversarial input — this is
/// a single developer's own machine talking to itself. The one thing it
/// does insist on: never calling `exit()` directly. [applyUpdate] asks the
/// window manager to close, which runs the app's existing
/// `onWindowClose`/flush-then-quit path (bootstrapper.dart) — the helper
/// waits for the process to actually be gone before touching anything.
class LocalDevSelfUpdater implements SelfUpdater {
  LocalDevSelfUpdater({String? updatesDir})
    : _updatesDir = updatesDir ?? _defaultUpdatesDir();

  final String _updatesDir;

  final StreamController<SelfUpdateState> _controller =
      StreamController<SelfUpdateState>.broadcast();
  SelfUpdateState _state = const SelfUpdateState.idle();
  String? _pendingBuildId;
  String? _pendingHash;

  static String _defaultUpdatesDir() {
    final home = Platform.environment['HOME'];
    if (home == null || home.isEmpty) return '';
    return '$home/.flightdeck/updates';
  }

  String get _stagedAppPath => '$_updatesDir/staged/FlightDeck.app';

  @override
  bool get isSupported =>
      Platform.isMacOS && _updatesDir.isNotEmpty && kUpdateChannel == 'local';

  @override
  bool get ignoresCheckFrequency => true;

  @override
  SelfUpdateState get state => _state;

  @override
  Stream<SelfUpdateState> get changes => _controller.stream;

  @override
  Future<void> initialize() async {
    await checkForUpdates(inBackground: true);
  }

  @override
  Future<void> checkForUpdates({bool inBackground = true}) async {
    // No `if (!isSupported) return;` guard here, matching the other
    // SelfUpdater implementations (AutoUpdaterSelfUpdater doesn't self-guard
    // either): `isSupported` is a capability flag the CALLER (UpdateViewModel)
    // checks before ever reaching this engine at all, not something every
    // method re-checks. Self-guarding here would also make manifest-parsing
    // behavior untestable off-macOS/without the dart-define.
    try {
      final manifestFile = File('$_updatesDir/latest.json');
      if (!await manifestFile.exists()) {
        _clearPending();
        return;
      }
      final manifest = jsonDecode(await manifestFile.readAsString());
      if (manifest is! Map) {
        _clearPending();
        return;
      }
      final channel = (manifest['channel'] ?? '').toString();
      final buildId = (manifest['buildId'] ?? '').toString();
      final hash = (manifest['appFrameworkSha256'] ?? '').toString();
      if (channel != 'local' || buildId.isEmpty || buildId == kLocalBuildId) {
        _clearPending();
        return;
      }
      if (!await Directory(_stagedAppPath).exists()) {
        _clearPending();
        return;
      }
      _pendingBuildId = buildId;
      _pendingHash = hash;
      _setState(SelfUpdateState(SelfUpdatePhase.downloaded, version: buildId));
    } catch (e) {
      _clearPending();
      _setState(SelfUpdateState(SelfUpdatePhase.error, message: '$e'));
    }
  }

  void _clearPending() {
    _pendingBuildId = null;
    _pendingHash = null;
    _setState(const SelfUpdateState.idle());
  }

  @override
  Future<void> applyUpdate() async {
    final buildId = _pendingBuildId;
    final hash = _pendingHash;
    if (buildId == null || _state.phase != SelfUpdatePhase.downloaded) return;
    try {
      final helper = _helperPath();
      if (helper == null || !await File(helper).exists()) {
        _setState(
          const SelfUpdateState(
            SelfUpdatePhase.error,
            message: 'swap helper not found in this bundle',
          ),
        );
        return;
      }
      await Process.start(
        '/bin/bash',
        [helper, pid.toString(), buildId, hash ?? ''],
        mode: ProcessStartMode.detached,
      );
      // The helper is already polling for our PID to disappear. Ask the
      // window to close through the app's own graceful-shutdown path
      // (flushes settings/layout, then destroys the window) instead of
      // exiting the process directly.
      await windowManager.close();
    } catch (e) {
      _setState(SelfUpdateState(SelfUpdatePhase.error, message: '$e'));
    }
  }

  /// The helper is a signed asset of THIS running app (bundled Flutter
  /// asset, see pubspec.yaml `assets/dev-update/`), not something fetched
  /// from the candidate being swapped in — the currently-trusted app is
  /// what decides a swap is safe and does it with its own tool.
  String? _helperPath() {
    final exe = Platform.resolvedExecutable;
    const marker = '/Contents/MacOS/';
    final idx = exe.indexOf(marker);
    if (idx == -1) return null;
    final contentsDir = exe.substring(0, idx + '/Contents'.length);
    return '$contentsDir/Frameworks/App.framework/Resources/flutter_assets/assets/dev-update/flightdeck-dev-swap-helper.sh';
  }

  void _setState(SelfUpdateState state) {
    _state = state;
    if (!_controller.isClosed) _controller.add(state);
  }

  @override
  void dispose() {
    _controller.close();
  }
}
