import 'package:catweb/data/controller/site_load_failure.dart';
import 'package:catweb/data/loading/load_failure.dart';
import 'package:catweb/data/site_runtime/site_compiler.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('maps compile errors to a non-retryable configuration failure', () {
    final cause = SiteCompileException(['missing parser', 'invalid endpoint']);
    final failure = const SiteLoadFailureMapper().map(
      cause,
      StackTrace.empty,
    );

    expect(failure.kind, LoadFailureKind.configuration);
    expect(failure.retryable, isFalse);
    expect(failure.toString(), contains('missing parser'));
    expect(failure.toString(), contains('schemaVersion 2'));
    expect((failure.error as SiteDefinitionLoadException).cause, same(cause));
  });

  test('maps malformed JSON to a configuration failure', () {
    final failure = const SiteLoadFailureMapper().map(
      const FormatException('bad json'),
      StackTrace.empty,
    );

    expect(failure.kind, LoadFailureKind.configuration);
  });
}
