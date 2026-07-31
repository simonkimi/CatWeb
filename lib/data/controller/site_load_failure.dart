import 'dart:convert';

import 'package:catweb/data/loading/load_failure.dart';
import 'package:catweb/data/site_runtime/site_compiler.dart';
import 'package:catweb/data/site_runtime/site_definition.dart';

final class SiteDefinitionLoadException implements Exception {
  const SiteDefinitionLoadException(this.cause);

  final Object cause;

  @override
  String toString() {
    final detail = cause is SiteCompileException
        ? (cause as SiteCompileException).errors.join('\n')
        : cause.toString();
    return '$detail\n请重新导入 schemaVersion '
        '${SiteDefinition.currentSchemaVersion} 站点规则。';
  }
}

final class SiteLoadFailureMapper implements LoadFailureMapper {
  const SiteLoadFailureMapper();

  @override
  LoadFailure map(Object error, StackTrace stackTrace) {
    final isConfigurationError =
        error is FormatException ||
        error is JsonUnsupportedObjectError ||
        error is SiteCompileException;
    return LoadFailure(
      kind: isConfigurationError
          ? LoadFailureKind.configuration
          : LoadFailureKind.unknown,
      error: SiteDefinitionLoadException(error),
      stackTrace: stackTrace,
      retryable: false,
    );
  }
}
