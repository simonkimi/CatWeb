import 'dart:io';

import 'package:catweb/src/rust/frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart'
    show ExternalLibrary;

Future<void> initializeNativeParser() async {
  // Build the actual host library so this test never silently uses a mock or
  // an outdated binary. Cargo reuses incremental artifacts on later runs.
  final build = await Process.run('cargo', [
    'build',
    '--locked',
    '--manifest-path',
    'rust/Cargo.toml',
  ]);
  if (build.exitCode != 0) {
    throw StateError('Native test build failed:\n${build.stderr}');
  }
  final target = Directory(
    Platform.environment['CARGO_TARGET_DIR'] ?? 'rust/target',
  ).absolute.path;
  final name = Platform.isWindows
      ? 'rust_lib_catweb.dll'
      : Platform.isMacOS
      ? 'librust_lib_catweb.dylib'
      : 'librust_lib_catweb.so';
  await RustLib.init(
    externalLibrary: ExternalLibrary.open('$target/debug/$name'),
  );
}
