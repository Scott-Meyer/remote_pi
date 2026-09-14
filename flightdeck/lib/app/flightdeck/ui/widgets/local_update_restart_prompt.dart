import 'package:flightdeck/app/flightdeck/data/update/local_dev_self_updater.dart'
    show kUpdateChannel;
import 'package:flightdeck/app/flightdeck/ui/viewmodels/update_viewmodel.dart';
import 'package:flightdeck/app/flightdeck/ui/widgets/confirm_dialog.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

/// `true` when this compiled build is on the local dev-update channel — the
/// only channel that ever wants [showLocalUpdateRestartDialog] instead of
/// [UpdateViewModel.primaryAction]'s existing silent-restart behavior
/// (Sparkle/WinSparkle keep that decided-and-shipped UX unchanged).
bool get isLocalUpdateChannel => kUpdateChannel == 'local';

/// Explicit Restart Now / Later confirmation for the local dev-update
/// channel. Never silently restarts: unlike Sparkle's card tap (which
/// applies immediately, an already-decided production UX this deliberately
/// does not touch), this is a `hundreds of times a day` local dev loop —
/// the developer must always get an explicit choice before their running
/// app quits out from under them.
Future<void> showLocalUpdateRestartDialog(
  BuildContext context,
  UpdateViewModel vm,
) async {
  final version = vm.updateVersion;
  final confirmed = await showConfirmDialog(
    context,
    title: 'FlightDeck update ready',
    message: version == null
        ? 'A new local build is ready to install.'
        : 'Local build $version is ready to install.',
    confirmLabel: 'Restart Now',
    cancelLabel: 'Later',
  );
  if (confirmed) {
    await vm.primaryAction();
  }
}

/// Mounted once near the top of the page tree (see [projects_rail.dart]):
/// watches [UpdateViewModel] and automatically prompts
/// [showLocalUpdateRestartDialog] the moment a NEW local build becomes
/// ready — builds happen often enough that waiting for the developer to
/// notice the small rail card isn't good enough. Tracks "Later" dismissals
/// per build id (not a blanket session flag) in its own small State, kept
/// entirely separate from [UpdateViewModel]/`SelfUpdateState` so Sparkle's
/// shared production update path is never polluted with local-only dismiss
/// semantics. A NEW build (different id) always re-prompts even if the
/// previous one was dismissed with "Later".
class LocalUpdateAutoPrompt extends StatefulWidget {
  const LocalUpdateAutoPrompt({super.key, required this.child});

  final Widget child;

  @override
  State<LocalUpdateAutoPrompt> createState() => _LocalUpdateAutoPromptState();
}

class _LocalUpdateAutoPromptState extends State<LocalUpdateAutoPrompt> {
  String? _dismissedBuildId;
  bool _dialogShowing = false;

  @override
  Widget build(BuildContext context) {
    if (isLocalUpdateChannel) {
      final vm = context.watch<UpdateViewModel>();
      final buildId = vm.updateVersion;
      final shouldPrompt =
          vm.isReadyToInstall &&
          buildId != null &&
          buildId != _dismissedBuildId &&
          !_dialogShowing;
      if (shouldPrompt) {
        _dialogShowing = true;
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          if (!mounted) return;
          final confirmed = await showConfirmDialog(
            context,
            title: 'FlightDeck update ready',
            message: 'Local build $buildId is ready to install.',
            confirmLabel: 'Restart Now',
            cancelLabel: 'Later',
          );
          if (!mounted) return;
          _dialogShowing = false;
          if (confirmed) {
            await vm.primaryAction();
          } else {
            setState(() => _dismissedBuildId = buildId);
          }
        });
      }
    }
    return widget.child;
  }
}
