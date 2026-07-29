import 'json_values.dart';

/// JSON object 的统一类型别名。
typedef JsonMap = Map<String, Object?>;

/// 首版运行时支持的业务 endpoint 类型。
enum EndpointKind { list, gallery, reader, autocomplete }

/// endpoint 支持的 HTTP 方法。
enum RequestMethod { get, post, put, delete }

/// endpoint 的默认文档缓存策略。
enum EndpointCachePolicy { networkFirst, cacheFirst, noCache }

/// 页码分页判断结束的方式。
enum PageEndCondition { emptyItems, shortPage, missingContinuation }

/// continuation 值在下一次请求中的注入位置。
enum ContinuationTarget { url, variable }

/// schema v2 站点的声明式定义。
///
/// 定义本身不执行网络或解析操作，必须先通过 `SiteCompiler` 校验。
final class SiteDefinition {
  SiteDefinition({
    required this.schemaVersion,
    required this.id,
    required this.name,
    required this.baseUrl,
    required List<ParserRule> parsers,
    required List<EndpointRule> endpoints,
  }) : parsers = List<ParserRule>.unmodifiable(parsers),
       endpoints = List<EndpointRule>.unmodifiable(endpoints);

  /// 当前加载层唯一接受的 schema 版本。
  static const currentSchemaVersion = 2;

  final int schemaVersion;
  final String id;
  final String name;
  final String baseUrl;
  final List<ParserRule> parsers;
  final List<EndpointRule> endpoints;

  /// 从 JSON object 解码；跨字段约束由 `SiteCompiler` 校验。
  factory SiteDefinition.fromJson(JsonMap json) => SiteDefinition(
    schemaVersion: json['schemaVersion'] as int? ?? 0,
    id: json['id'] as String? ?? '',
    name: json['name'] as String? ?? '',
    baseUrl: json['baseUrl'] as String? ?? '',
    parsers: _jsonList(
      json['parsers'],
    ).map(ParserRule.fromJson).toList(growable: false),
    endpoints: _jsonList(
      json['endpoints'],
    ).map(EndpointRule.fromJson).toList(growable: false),
  );

  /// 编码为可持久化的 JSON object。
  JsonMap toJson() => {
    'schemaVersion': schemaVersion,
    'id': id,
    'name': name,
    'baseUrl': baseUrl,
    'parsers': parsers.map((parser) => parser.toJson()).toList(),
    'endpoints': endpoints.map((endpoint) => endpoint.toJson()).toList(),
  };
}

/// 一个可注入解析引擎的 parser 声明。
final class ParserRule {
  ParserRule({required this.id, required this.kind, required JsonMap config})
    : config = freezeJsonMap(config, path: r'$.parser.config');

  final String id;
  final EndpointKind kind;
  final JsonMap config;

  factory ParserRule.fromJson(JsonMap json) => ParserRule(
    id: json['id'] as String? ?? '',
    kind: _requiredEnumByName(EndpointKind.values, json['kind'], 'parser.kind'),
    config: _jsonMap(json['config']),
  );

  JsonMap toJson() => {'id': id, 'kind': kind.name, 'config': config};
}

/// 一个业务操作的完整声明。
///
/// [links] 只描述业务 endpoint 之间的导航关系，不包含 UI 路由对象。
final class EndpointRule {
  EndpointRule({
    required this.id,
    required this.kind,
    required this.name,
    required this.request,
    required this.parserId,
    required this.pagination,
    this.cachePolicy = EndpointCachePolicy.networkFirst,
    this.icon = '',
    this.visible = true,
    this.links = const EndpointLinks(),
  });

  final String id;
  final EndpointKind kind;
  final String name;
  final String icon;
  final bool visible;
  final RequestRule request;
  final String parserId;
  final PaginationRule pagination;
  final EndpointCachePolicy cachePolicy;
  final EndpointLinks links;

  factory EndpointRule.fromJson(JsonMap json) => EndpointRule(
    id: json['id'] as String? ?? '',
    kind: _requiredEnumByName(
      EndpointKind.values,
      json['kind'],
      'endpoint.kind',
    ),
    name: json['name'] as String? ?? '',
    icon: json['icon'] as String? ?? '',
    visible: json['visible'] as bool? ?? true,
    request: RequestRule.fromJson(_jsonMap(json['request'])),
    parserId: json['parserId'] as String? ?? '',
    pagination: PaginationRule.fromJson(_jsonMap(json['pagination'])),
    cachePolicy: json['cachePolicy'] == null
        ? EndpointCachePolicy.networkFirst
        : _requiredEnumByName(
            EndpointCachePolicy.values,
            json['cachePolicy'],
            'endpoint.cachePolicy',
          ),
    links: EndpointLinks.fromJson(_jsonMap(json['links'])),
  );

  JsonMap toJson() => {
    'id': id,
    'kind': kind.name,
    'name': name,
    'icon': icon,
    'visible': visible,
    'request': request.toJson(),
    'parserId': parserId,
    'pagination': pagination.toJson(),
    'cachePolicy': cachePolicy.name,
    'links': links.toJson(),
  };
}

/// endpoint 之间的业务关联。
final class EndpointLinks {
  const EndpointLinks({this.item, this.autocomplete, this.reader});

  final String? item;
  final String? autocomplete;
  final String? reader;

  factory EndpointLinks.fromJson(JsonMap json) => EndpointLinks(
    item: json['item'] as String?,
    autocomplete: json['autocomplete'] as String?,
    reader: json['reader'] as String?,
  );

  /// 返回所有非空目标 ID，供编译器统一校验引用。
  Iterable<String> get ids => [item, autocomplete, reader].whereType<String>();

  JsonMap toJson() {
    final json = <String, Object?>{};
    if (item != null) json['item'] = item;
    if (autocomplete != null) json['autocomplete'] = autocomplete;
    if (reader != null) json['reader'] = reader;
    return json;
  }
}

/// URI、query、header 和 body 分离的结构化请求规则。
///
/// query、header 和 body 中的值允许使用 `{{variable}}` 模板。
final class RequestRule {
  RequestRule({
    required this.method,
    required this.url,
    Map<String, Object?> query = const {},
    Map<String, Object?> headers = const {},
    this.body = const RequestBodyRule.none(),
    this.idempotent = false,
  }) : query = freezeJsonMap(query, path: r'$.request.query'),
       headers = freezeJsonMap(headers, path: r'$.request.headers');

  final RequestMethod method;
  final String url;
  final Map<String, Object?> query;
  final Map<String, Object?> headers;
  final RequestBodyRule body;
  final bool idempotent;

  /// 此请求是否允许传输层自动重试。
  bool get canRetryAutomatically =>
      method == RequestMethod.get ||
      method == RequestMethod.delete ||
      idempotent;

  factory RequestRule.fromJson(JsonMap json) => RequestRule(
    method: _requiredEnumByName(
      RequestMethod.values,
      json['method'],
      'request.method',
    ),
    url: json['url'] as String? ?? '',
    query: _jsonMap(json['query']),
    headers: _jsonMap(json['headers']),
    body: RequestBodyRule.fromJson(_jsonMap(json['body'])),
    idempotent: json['idempotent'] as bool? ?? false,
  );

  JsonMap toJson() => {
    'method': method.name,
    'url': url,
    'query': query,
    'headers': headers,
    'body': body.toJson(),
    'idempotent': idempotent,
  };
}

/// endpoint 请求体的声明式规则。
sealed class RequestBodyRule {
  const RequestBodyRule();

  const factory RequestBodyRule.none() = NoRequestBodyRule;
  factory RequestBodyRule.json(Object? value) = JsonRequestBodyRule;
  factory RequestBodyRule.form(Map<String, Object?> fields) =
      FormRequestBodyRule;
  const factory RequestBodyRule.text(String value) = TextRequestBodyRule;

  factory RequestBodyRule.fromJson(JsonMap json) {
    return switch (json['type']) {
      'json' => RequestBodyRule.json(json['value']),
      'form' => RequestBodyRule.form(_jsonMap(json['fields'])),
      'text' => RequestBodyRule.text(json['value'] as String? ?? ''),
      'none' => const RequestBodyRule.none(),
      _ => throw FormatException('Unknown request body type: ${json['type']}'),
    };
  }

  JsonMap toJson();
}

/// 不发送请求体。
final class NoRequestBodyRule extends RequestBodyRule {
  const NoRequestBodyRule();

  @override
  JsonMap toJson() => const {'type': 'none'};
}

/// 保留 JSON 类型的请求体。
final class JsonRequestBodyRule extends RequestBodyRule {
  JsonRequestBodyRule(Object? value)
    : value = freezeJsonValue(value, path: r'$.request.body.value');
  final Object? value;

  @override
  JsonMap toJson() => {'type': 'json', 'value': value};
}

/// application/x-www-form-urlencoded 表单请求体。
final class FormRequestBodyRule extends RequestBodyRule {
  FormRequestBodyRule(Map<String, Object?> fields)
    : fields = freezeJsonMap(fields, path: r'$.request.body.fields');

  final Map<String, Object?> fields;

  @override
  JsonMap toJson() => {'type': 'form', 'fields': fields};
}

/// 纯文本请求体。
final class TextRequestBodyRule extends RequestBodyRule {
  const TextRequestBodyRule(this.value);
  final String value;

  @override
  JsonMap toJson() => {'type': 'text', 'value': value};
}

/// endpoint 的显式分页规则。
sealed class PaginationRule {
  const PaginationRule();

  const factory PaginationRule.none() = NoPaginationRule;
  const factory PaginationRule.pageNumber({
    required String variable,
    required int initial,
    required int step,
    required int pageSize,
    required PageEndCondition endCondition,
  }) = PageNumberPaginationRule;
  const factory PaginationRule.continuation({
    required ContinuationTarget target,
    String? variable,
    required String responseField,
  }) = ContinuationPaginationRule;

  factory PaginationRule.fromJson(JsonMap json) {
    return switch (json['type']) {
      'pageNumber' => PaginationRule.pageNumber(
        variable: json['variable'] as String? ?? 'page',
        initial: json['initial'] as int? ?? 0,
        step: json['step'] as int? ?? 1,
        pageSize: json['pageSize'] as int? ?? 1,
        endCondition: _requiredEnumByName(
          PageEndCondition.values,
          json['endCondition'],
          'pagination.endCondition',
        ),
      ),
      'continuation' => PaginationRule.continuation(
        target: _requiredEnumByName(
          ContinuationTarget.values,
          json['target'],
          'pagination.target',
        ),
        variable: json['variable'] as String?,
        responseField: json['responseField'] as String? ?? '',
      ),
      'none' => const PaginationRule.none(),
      _ => throw FormatException('Unknown pagination type: ${json['type']}'),
    };
  }

  JsonMap toJson();
}

/// 不支持分页的 endpoint。
final class NoPaginationRule extends PaginationRule {
  const NoPaginationRule();

  @override
  JsonMap toJson() => const {'type': 'none'};
}

/// 使用固定起点、步长和页大小的页码分页。
final class PageNumberPaginationRule extends PaginationRule {
  const PageNumberPaginationRule({
    required this.variable,
    required this.initial,
    required this.step,
    required this.pageSize,
    required this.endCondition,
  });

  final String variable;
  final int initial;
  final int step;
  final int pageSize;
  final PageEndCondition endCondition;

  @override
  JsonMap toJson() => {
    'type': 'pageNumber',
    'variable': variable,
    'initial': initial,
    'step': step,
    'pageSize': pageSize,
    'endCondition': endCondition.name,
  };
}

/// 使用响应返回的 continuation 值进行顺序分页。
///
/// [responseField] 告知解析器从响应的哪个业务字段读取 continuation。
final class ContinuationPaginationRule extends PaginationRule {
  const ContinuationPaginationRule({
    required this.target,
    this.variable,
    this.responseField = 'continuation',
  });

  final ContinuationTarget target;
  final String? variable;
  final String responseField;

  @override
  JsonMap toJson() {
    final json = <String, Object?>{
      'type': 'continuation',
      'target': target.name,
      'responseField': responseField,
    };
    if (variable != null) json['variable'] = variable;
    return json;
  }
}

List<JsonMap> _jsonList(Object? value) => switch (value) {
  List<Object?> values => values.map(_jsonMap).toList(growable: false),
  _ => const [],
};

JsonMap _jsonMap(Object? value) => switch (value) {
  Map<Object?, Object?> map => map.map(
    (key, value) => MapEntry(key.toString(), value),
  ),
  _ => <String, Object?>{},
};

T _requiredEnumByName<T extends Enum>(
  List<T> values,
  Object? name,
  String path,
) {
  for (final value in values) {
    if (value.name == name) return value;
  }
  throw FormatException('Unknown $path: $name');
}
