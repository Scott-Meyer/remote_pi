import 'dart:io';

import 'package:flightdeck/app/flightdeck/data/process/linux_process_tree_provider.dart';
import 'package:flightdeck/app/flightdeck/data/process/macos_process_tree_provider.dart';
import 'package:flightdeck/app/flightdeck/data/process/windows_process_tree_provider.dart';
import 'package:flightdeck/app/flightdeck/data/process/wsl_process_tree_provider.dart';
import 'package:flightdeck/app/flightdeck/domain/contracts/process_tree_provider.dart';
import 'package:flightdeck/app/flightdeck/domain/services/terminal_harness_monitor.dart';

/// Host-native process inspector for the current platform.
ProcessTreeProvider createHostProcessTreeProvider() {
  if (Platform.isMacOS) return MacosProcessTreeProvider();
  if (Platform.isWindows) return WindowsProcessTreeProvider();
  return LinuxProcessTreeProvider();
}

/// Builds a WSL distro inspector. Used when a terminal profile carries
/// `wslDistro` on Windows.
ProcessTreeProvider createWslProcessTreeProvider(String distro) {
  return WslProcessTreeProvider(distro: distro);
}

/// App-facing monitor with host provider + lazy WSL adapters.
class FlightDeckTerminalHarnessMonitor extends TerminalHarnessMonitor {
  FlightDeckTerminalHarnessMonitor(ProcessTreeProvider provider)
    : super(
        provider: provider,
        wslProviderForDistro: createWslProcessTreeProvider,
      );
}
