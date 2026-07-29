import 'site_definition.dart';

/// 站点定义未通过启用前校验。
final class SiteCompileException implements Exception {
  SiteCompileException(Iterable<String> errors)
    : errors = List<String>.unmodifiable(errors);

  final List<String> errors;

  @override
  String toString() => 'Invalid site definition:\n${errors.join('\n')}';
}

/// 已完成引用解析和约束校验的站点定义。
///
/// endpoint 与 parser 通过 ID 索引，运行期不再扫描声明列表。
final class CompiledSite {
  CompiledSite({
    required this.definition,
    required Map<String, EndpointRule> endpoints,
    required Map<String, ParserRule> parsers,
  }) : endpoints = Map<String, EndpointRule>.unmodifiable(endpoints),
       parsers = Map<String, ParserRule>.unmodifiable(parsers),
       baseUri = Uri.parse(definition.baseUrl);

  final SiteDefinition definition;
  final Uri baseUri;
  final Map<String, EndpointRule> endpoints;
  final Map<String, ParserRule> parsers;

  /// 根据 ID 返回 endpoint；不存在时抛出 [StateError]。
  EndpointRule endpoint(String id) =>
      endpoints[id] ?? (throw StateError('Endpoint not found: $id'));

  /// 根据 ID 返回 parser；不存在时抛出 [StateError]。
  ParserRule parser(String id) =>
      parsers[id] ?? (throw StateError('Parser not found: $id'));
}

/// schema v2 站点规则编译器。
///
/// 编译在站点启用前一次性校验 schema 版本、ID、引用、模板、请求结构和分页配置。
final class SiteCompiler {
  const SiteCompiler();

  /// 从未经信任的 JSON object 解码并编译站点定义。
  CompiledSite compileJson(JsonMap json) {
    final schemaVersion = json['schemaVersion'];
    if (schemaVersion != SiteDefinition.currentSchemaVersion) {
      throw SiteCompileException([
        'Unsupported schemaVersion $schemaVersion; '
            'expected ${SiteDefinition.currentSchemaVersion}',
      ]);
    }
    try {
      return compile(SiteDefinition.fromJson(json));
    } on SiteCompileException {
      rethrow;
    } on FormatException catch (error) {
      throw SiteCompileException([error.message]);
    } on ArgumentError catch (error) {
      throw SiteCompileException([
        error.message?.toString() ?? error.toString(),
      ]);
    } catch (error) {
      throw SiteCompileException(['Invalid schema value: $error']);
    }
  }

  /// 校验并编译已经构造的 [definition]。
  CompiledSite compile(SiteDefinition definition) {
    final errors = <String>[];
    if (definition.schemaVersion != SiteDefinition.currentSchemaVersion) {
      errors.add(
        'Unsupported schemaVersion ${definition.schemaVersion}; '
        'expected ${SiteDefinition.currentSchemaVersion}',
      );
    }
    if (definition.id.trim().isEmpty) errors.add('Site id is required');
    if (definition.name.trim().isEmpty) errors.add('Site name is required');
    final baseUri = Uri.tryParse(definition.baseUrl);
    if (baseUri == null ||
        !baseUri.hasScheme ||
        (baseUri.scheme != 'http' && baseUri.scheme != 'https')) {
      errors.add('baseUrl must be an absolute HTTP(S) URL');
    }

    final parsers = <String, ParserRule>{};
    for (final parser in definition.parsers) {
      if (parser.id.trim().isEmpty) {
        errors.add('Parser id is required');
      } else if (parsers.containsKey(parser.id)) {
        errors.add('Duplicate parser id: ${parser.id}');
      } else {
        parsers[parser.id] = parser;
      }
    }

    final endpoints = <String, EndpointRule>{};
    for (final endpoint in definition.endpoints) {
      if (endpoint.id.trim().isEmpty) {
        errors.add('Endpoint id is required');
      } else if (endpoints.containsKey(endpoint.id)) {
        errors.add('Duplicate endpoint id: ${endpoint.id}');
      } else {
        endpoints[endpoint.id] = endpoint;
      }
      if (endpoint.request.url.trim().isEmpty) {
        errors.add('Endpoint ${endpoint.id} has an empty request URL');
      }
      _validateRequest(endpoint, errors);
      final parser = parsers[endpoint.parserId];
      if (parser == null) {
        errors.add(
          'Endpoint ${endpoint.id} references missing parser '
          '${endpoint.parserId}',
        );
      } else if (parser.kind != endpoint.kind) {
        errors.add(
          'Endpoint ${endpoint.id} and parser ${parser.id} have '
          'different kinds',
        );
      }
      _validatePagination(endpoint, errors);
    }

    for (final endpoint in definition.endpoints) {
      for (final target in endpoint.links.ids) {
        if (!endpoints.containsKey(target)) {
          errors.add(
            'Endpoint ${endpoint.id} links to missing endpoint $target',
          );
        }
      }
      final item = endpoint.links.item;
      if (item != null && endpoints[item]?.kind != EndpointKind.gallery) {
        errors.add('Endpoint ${endpoint.id} item link must target a gallery');
      }
      final autocomplete = endpoint.links.autocomplete;
      if (autocomplete != null &&
          endpoints[autocomplete]?.kind != EndpointKind.autocomplete) {
        errors.add(
          'Endpoint ${endpoint.id} autocomplete link must target autocomplete',
        );
      }
      final reader = endpoint.links.reader;
      if (reader != null && endpoints[reader]?.kind != EndpointKind.reader) {
        errors.add('Endpoint ${endpoint.id} reader link must target a reader');
      }
    }

    if (errors.isNotEmpty) throw SiteCompileException(errors);
    return CompiledSite(
      definition: definition,
      endpoints: endpoints,
      parsers: parsers,
    );
  }

  void _validatePagination(EndpointRule endpoint, List<String> errors) {
    switch (endpoint.pagination) {
      case NoPaginationRule():
        break;
      case PageNumberPaginationRule(
        :final variable,
        :final step,
        :final pageSize,
      ):
        if (variable.trim().isEmpty) {
          errors.add('Endpoint ${endpoint.id} page variable is required');
        }
        if (step <= 0) {
          errors.add('Endpoint ${endpoint.id} page step must be positive');
        }
        if (pageSize <= 0) {
          errors.add('Endpoint ${endpoint.id} pageSize must be positive');
        }
      case ContinuationPaginationRule(
        :final target,
        :final variable,
        :final responseField,
      ):
        if (target == ContinuationTarget.variable &&
            (variable == null || variable.trim().isEmpty)) {
          errors.add(
            'Endpoint ${endpoint.id} continuation variable is required',
          );
        }
        if (responseField.trim().isEmpty) {
          errors.add(
            'Endpoint ${endpoint.id} continuation responseField is required',
          );
        }
    }
    if (endpoint.pagination is! NoPaginationRule &&
        endpoint.kind != EndpointKind.list &&
        endpoint.kind != EndpointKind.gallery) {
      errors.add('Only list and gallery endpoints may be paginated');
    }
  }

  void _validateRequest(EndpointRule endpoint, List<String> errors) {
    final request = endpoint.request;
    if (_hasMalformedTemplate(request.url)) {
      errors.add('Endpoint ${endpoint.id} has an invalid URL template');
    }
    for (final entry in request.query.entries) {
      if (entry.key.trim().isEmpty) {
        errors.add('Endpoint ${endpoint.id} has an empty query key');
      }
      _validateTemplateValue(
        entry.value,
        'query.${entry.key}',
        endpoint.id,
        errors,
      );
      if (entry.value is Map<Object?, Object?>) {
        errors.add(
          'Endpoint ${endpoint.id} query.${entry.key} must be a scalar or list',
        );
      }
    }
    for (final entry in request.headers.entries) {
      if (entry.key.trim().isEmpty) {
        errors.add('Endpoint ${endpoint.id} has an empty header name');
      }
      _validateTemplateValue(
        entry.value,
        'headers.${entry.key}',
        endpoint.id,
        errors,
      );
      if (entry.value is List<Object?> ||
          entry.value is Map<Object?, Object?>) {
        errors.add(
          'Endpoint ${endpoint.id} headers.${entry.key} must be a scalar',
        );
      }
    }
    switch (request.body) {
      case NoRequestBodyRule():
        break;
      case JsonRequestBodyRule(:final value):
        _validateTemplateValue(value, 'body.value', endpoint.id, errors);
      case FormRequestBodyRule(:final fields):
        for (final entry in fields.entries) {
          _validateTemplateValue(
            entry.value,
            'body.fields.${entry.key}',
            endpoint.id,
            errors,
          );
          if (entry.value is List<Object?> ||
              entry.value is Map<Object?, Object?>) {
            errors.add(
              'Endpoint ${endpoint.id} form field ${entry.key} must be a scalar',
            );
          }
        }
      case TextRequestBodyRule(:final value):
        if (_hasMalformedTemplate(value)) {
          errors.add('Endpoint ${endpoint.id} has an invalid body template');
        }
    }
  }

  void _validateTemplateValue(
    Object? value,
    String path,
    String endpointId,
    List<String> errors,
  ) {
    switch (value) {
      case String value when _hasMalformedTemplate(value):
        errors.add('Endpoint $endpointId has an invalid $path template');
      case List<Object?> values:
        for (var index = 0; index < values.length; index++) {
          _validateTemplateValue(
            values[index],
            '$path[$index]',
            endpointId,
            errors,
          );
        }
      case Map<Object?, Object?> values:
        for (final entry in values.entries) {
          _validateTemplateValue(
            entry.value,
            '$path.${entry.key}',
            endpointId,
            errors,
          );
        }
    }
  }

  bool _hasMalformedTemplate(String input) {
    final withoutValidTemplates = input.replaceAll(
      RegExp(r'\{\{[a-zA-Z_][\w.-]*\}\}'),
      '',
    );
    return withoutValidTemplates.contains('{{') ||
        withoutValidTemplates.contains('}}');
  }
}
