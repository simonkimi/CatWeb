import 'package:freezed_annotation/freezed_annotation.dart';

import 'json_values.dart';

part 'site_definition.freezed.dart';
part 'site_definition.g.dart';

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
@freezed
sealed class SiteDefinition with _$SiteDefinition {
  const SiteDefinition._();

  @JsonSerializable(explicitToJson: true)
  const factory SiteDefinition({
    @Default(0) int schemaVersion,
    @Default('') String id,
    @Default('') String name,
    @Default('') String baseUrl,
    @Default(SiteOptions()) SiteOptions options,
    @Default(<ParserRule>[]) List<ParserRule> parsers,
    @Default(<EndpointRule>[]) List<EndpointRule> endpoints,
  }) = _SiteDefinition;

  /// 当前加载层唯一接受的 schema 版本。
  static const currentSchemaVersion = 2;

  factory SiteDefinition.fromJson(Map<String, dynamic> json) =>
      _$SiteDefinitionFromJson(json);
}

@freezed
sealed class RegexValueRule with _$RegexValueRule {
  const factory RegexValueRule({
    @Default('') String pattern,
    @Default('') String value,
  }) = _RegexValueRule;

  factory RegexValueRule.fromJson(Map<String, dynamic> json) =>
      _$RegexValueRuleFromJson(json);
}

@freezed
sealed class SiteOptions with _$SiteOptions {
  @JsonSerializable(explicitToJson: true)
  const factory SiteOptions({
    @Default('') String flags,
    @Default('') String loginUrl,
    @Default('') String loginCookiePattern,
    @Default('') String loginCookieDescription,
    @Default(<RegexValueRule>[]) List<RegexValueRule> headers,
    @Default(<RegexValueRule>[]) List<RegexValueRule> cookies,
  }) = _SiteOptions;

  factory SiteOptions.fromJson(Map<String, dynamic> json) =>
      _$SiteOptionsFromJson(json);
}

/// 一个可注入解析引擎的 parser 声明。
@freezed
sealed class ParserRule with _$ParserRule {
  @JsonSerializable(explicitToJson: true)
  const factory ParserRule({
    required String id,
    @Default('') String name,
    @ParserEndpointKindJsonConverter() required EndpointKind kind,
    @Default(ParserConfig()) ParserConfig config,
  }) = _ParserRule;

  factory ParserRule.fromJson(Map<String, dynamic> json) =>
      _$ParserRuleFromJson(json);
}

enum SelectorQueryType { self, css, xpath, jsonPath }

enum SelectorFunctionType { text, attribute, raw }

@Freezed(unionKey: 'type')
sealed class SelectorScript with _$SelectorScript {
  const factory SelectorScript.output() = OutputSelectorScript;

  const factory SelectorScript.replace({
    @Default(<String, String>{}) Map<String, String> values,
  }) = ReplaceSelectorScript;

  const factory SelectorScript.javaScript({@Default('') String source}) =
      JavaScriptSelectorScript;

  factory SelectorScript.fromJson(Map<String, dynamic> json) =>
      _$SelectorScriptFromJson(json);
}

@freezed
sealed class SelectorRule with _$SelectorRule {
  const SelectorRule._();

  @JsonSerializable(explicitToJson: true)
  const factory SelectorRule({
    @Default('') String selector,
    @Default(SelectorQueryType.css) SelectorQueryType queryType,
    @Default(SelectorFunctionType.text) SelectorFunctionType function,
    @Default('') String parameter,
    @Default('') String regex,
    @Default('') String replace,
    @Default(SelectorScript.output()) SelectorScript script,
    @Default('') String defaultValue,
  }) = _SelectorRule;

  factory SelectorRule.fromJson(Map<String, dynamic> json) =>
      _$SelectorRuleFromJson(json);

  bool get isEmpty =>
      selector.isEmpty && parameter.isEmpty && defaultValue.isEmpty;
}

@freezed
sealed class ExtraSelectorRule with _$ExtraSelectorRule {
  @JsonSerializable(explicitToJson: true)
  const factory ExtraSelectorRule({
    required String id,
    @Default(false) bool persistent,
    @Default(SelectorRule()) SelectorRule selector,
  }) = _ExtraSelectorRule;

  factory ExtraSelectorRule.fromJson(Map<String, dynamic> json) =>
      _$ExtraSelectorRuleFromJson(json);
}

@freezed
sealed class ParserConfig with _$ParserConfig {
  @JsonSerializable(explicitToJson: true)
  const factory ParserConfig({
    @Default(<String, SelectorRule>{}) Map<String, SelectorRule> selectors,
    @Default(<ExtraSelectorRule>[]) List<ExtraSelectorRule> extras,
  }) = _ParserConfig;

  factory ParserConfig.fromJson(Map<String, dynamic> json) =>
      _$ParserConfigFromJson(json);
}

/// 一个业务操作的完整声明。
///
/// [links] 只描述业务 endpoint 之间的导航关系，不包含 UI 路由对象。
@freezed
sealed class EndpointRule with _$EndpointRule {
  @JsonSerializable(explicitToJson: true)
  const factory EndpointRule({
    required String id,
    @EndpointEndpointKindJsonConverter() required EndpointKind kind,
    required String name,
    @Default('') String icon,
    @Default(true) bool visible,
    required RequestRule request,
    required String parserId,
    required PaginationRule pagination,
    @Default(EndpointCachePolicy.networkFirst) EndpointCachePolicy cachePolicy,
    @Default(EndpointLinks()) EndpointLinks links,
    @Default(EndpointPresentation()) EndpointPresentation presentation,
  }) = _EndpointRule;

  factory EndpointRule.fromJson(Map<String, dynamic> json) =>
      _$EndpointRuleFromJson(json);
}

enum EndpointFilterType { boolean, integer, decimal, text }

@freezed
sealed class EndpointSubpage with _$EndpointSubpage {
  const factory EndpointSubpage({
    @Default('') String name,
    @Default('') String key,
    @Default('') String value,
  }) = _EndpointSubpage;

  factory EndpointSubpage.fromJson(Map<String, dynamic> json) =>
      _$EndpointSubpageFromJson(json);
}

@freezed
sealed class EndpointFilter with _$EndpointFilter {
  const factory EndpointFilter({
    @Default('') String name,
    @Default('') String key,
    @Default(EndpointFilterType.text) EndpointFilterType type,
    @Default('') String defaultValue,
  }) = _EndpointFilter;

  factory EndpointFilter.fromJson(Map<String, dynamic> json) =>
      _$EndpointFilterFromJson(json);
}

@freezed
sealed class EndpointPresentation with _$EndpointPresentation {
  @JsonSerializable(explicitToJson: true)
  const factory EndpointPresentation({
    @Default(<EndpointSubpage>[]) List<EndpointSubpage> subpages,
    @Default(<EndpointFilter>[]) List<EndpointFilter> filters,
    @Default(SelectorScript.output()) SelectorScript filterScript,
    @Default(' ') String autocompleteSplitChar,
    @Default(2000) int autocompleteTimeout,
  }) = _EndpointPresentation;

  factory EndpointPresentation.fromJson(Map<String, dynamic> json) =>
      _$EndpointPresentationFromJson(json);
}

/// endpoint 之间的业务关联。
@freezed
sealed class EndpointLinks with _$EndpointLinks {
  const EndpointLinks._();

  const factory EndpointLinks({
    @JsonKey(includeIfNull: false) String? item,
    @JsonKey(includeIfNull: false) String? autocomplete,
    @JsonKey(includeIfNull: false) String? reader,
  }) = _EndpointLinks;

  factory EndpointLinks.fromJson(Map<String, dynamic> json) =>
      _$EndpointLinksFromJson(json);

  /// 返回所有非空目标 ID，供编译器统一校验引用。
  Iterable<String> get ids => [item, autocomplete, reader].whereType<String>();
}

/// URI、query、header 和 body 分离的结构化请求规则。
///
/// query、header 和 body 中的值允许使用 `{{variable}}` 模板。
@freezed
sealed class RequestRule with _$RequestRule {
  const RequestRule._();

  @JsonSerializable(explicitToJson: true)
  const factory RequestRule({
    required RequestMethod method,
    required String url,
    @FrozenJsonMapConverter() @Default(<String, Object?>{}) JsonMap query,
    @FrozenJsonMapConverter() @Default(<String, Object?>{}) JsonMap headers,
    @Default(RequestBodyRule.none()) RequestBodyRule body,
    @Default(false) bool idempotent,
  }) = _RequestRule;

  factory RequestRule.fromJson(Map<String, dynamic> json) =>
      _$RequestRuleFromJson(json);

  /// 此请求是否允许传输层自动重试。
  bool get canRetryAutomatically =>
      method == RequestMethod.get ||
      method == RequestMethod.delete ||
      idempotent;
}

/// 请求体的声明式规则。
@Freezed(unionKey: 'type')
sealed class RequestBodyRule with _$RequestBodyRule {
  const factory RequestBodyRule.none() = NoRequestBodyRule;

  const factory RequestBodyRule.json(
    @FrozenJsonValueConverter() Object? value,
  ) = JsonRequestBodyRule;

  const factory RequestBodyRule.form(@FrozenJsonMapConverter() JsonMap fields) =
      FormRequestBodyRule;

  const factory RequestBodyRule.text(String value) = TextRequestBodyRule;

  factory RequestBodyRule.fromJson(Map<String, dynamic> json) =>
      _$RequestBodyRuleFromJson(json);
}

/// endpoint 的显式分页规则。
@Freezed(unionKey: 'type')
sealed class PaginationRule with _$PaginationRule {
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
    @JsonKey(includeIfNull: false) String? variable,
    @Default('continuation') String responseField,
  }) = ContinuationPaginationRule;

  factory PaginationRule.fromJson(Map<String, dynamic> json) =>
      _$PaginationRuleFromJson(json);
}

final class FrozenJsonMapConverter implements JsonConverter<JsonMap, Object?> {
  const FrozenJsonMapConverter();

  @override
  JsonMap fromJson(Object? json) {
    if (json is! Map) return const {};
    return freezeJsonMap(
      json.map((key, value) => MapEntry(key.toString(), value)),
      path: r'$.json',
    );
  }

  @override
  Object? toJson(JsonMap object) => object;
}

final class FrozenJsonValueConverter
    implements JsonConverter<Object?, Object?> {
  const FrozenJsonValueConverter();

  @override
  Object? fromJson(Object? json) => freezeJsonValue(json, path: r'$.json');

  @override
  Object? toJson(Object? object) => object;
}

final class ParserEndpointKindJsonConverter
    implements JsonConverter<EndpointKind, String> {
  const ParserEndpointKindJsonConverter();

  @override
  EndpointKind fromJson(String json) =>
      _requiredEnumByName(EndpointKind.values, json, 'parser.kind');

  @override
  String toJson(EndpointKind object) => object.name;
}

final class EndpointEndpointKindJsonConverter
    implements JsonConverter<EndpointKind, String> {
  const EndpointEndpointKindJsonConverter();

  @override
  EndpointKind fromJson(String json) =>
      _requiredEnumByName(EndpointKind.values, json, 'endpoint.kind');

  @override
  String toJson(EndpointKind object) => object.name;
}

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
