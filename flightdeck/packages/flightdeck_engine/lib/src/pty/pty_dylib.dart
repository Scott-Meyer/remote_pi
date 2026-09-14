import 'dart:ffi';
import 'dart:io';

/// Resolve a dylib do flightdeck_pty compilada FORA do Flutter (gate FFI da
/// Wave 0). Ordem: env `FLIGHTDECK_PTY_DYLIB` → ao lado do executável →
/// `build/wave0/` relativo ao cwd (fluxo `dart run` no repo).
DynamicLibrary openPtyDylib() {
  final name = Platform.isMacOS
      ? 'libflightdeck_pty.dylib'
      : Platform.isLinux
      ? 'libflightdeck_pty.so'
      : 'flightdeck_pty.dll';

  final candidates = <String>[
    ?Platform.environment['FLIGHTDECK_PTY_DYLIB'],
    '${File(Platform.resolvedExecutable).parent.path}/$name',
    'build/wave0/$name',
  ];

  for (final path in candidates) {
    if (File(path).existsSync()) return DynamicLibrary.open(path);
  }
  throw StateError(
    'flightdeck_pty dylib not found; tried: ${candidates.join(', ')} '
    '(build it with tool/wave0/build_pty_dylib.sh or set FLIGHTDECK_PTY_DYLIB)',
  );
}
