// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_definition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SiteDefinition _$SiteDefinitionFromJson(Map<String, dynamic> json) =>
    _SiteDefinition(
      schemaVersion: (json['schemaVersion'] as num?)?.toInt() ?? 0,
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      baseUrl: json['baseUrl'] as String? ?? '',
      options: json['options'] == null
          ? const SiteOptions()
          : SiteOptions.fromJson(json['options'] as Map<String, dynamic>),
      parsers:
          (json['parsers'] as List<dynamic>?)
              ?.map((e) => ParserRule.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ParserRule>[],
      endpoints:
          (json['endpoints'] as List<dynamic>?)
              ?.map((e) => EndpointRule.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <EndpointRule>[],
    );

Map<String, dynamic> _$SiteDefinitionToJson(_SiteDefinition instance) =>
    <String, dynamic>{
      'schemaVersion': instance.schemaVersion,
      'id': instance.id,
      'name': instance.name,
      'baseUrl': instance.baseUrl,
      'options': instance.options.toJson(),
      'parsers': instance.parsers.map((e) => e.toJson()).toList(),
      'endpoints': instance.endpoints.map((e) => e.toJson()).toList(),
    };

_RegexValueRule _$RegexValueRuleFromJson(Map<String, dynamic> json) =>
    _RegexValueRule(
      pattern: json['pattern'] as String? ?? '',
      value: json['value'] as String? ?? '',
    );

Map<String, dynamic> _$RegexValueRuleToJson(_RegexValueRule instance) =>
    <String, dynamic>{'pattern': instance.pattern, 'value': instance.value};

_SiteOptions _$SiteOptionsFromJson(Map<String, dynamic> json) => _SiteOptions(
  flags: json['flags'] as String? ?? '',
  loginUrl: json['loginUrl'] as String? ?? '',
  loginCookiePattern: json['loginCookiePattern'] as String? ?? '',
  loginCookieDescription: json['loginCookieDescription'] as String? ?? '',
  headers:
      (json['headers'] as List<dynamic>?)
          ?.map((e) => RegexValueRule.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <RegexValueRule>[],
  cookies:
      (json['cookies'] as List<dynamic>?)
          ?.map((e) => RegexValueRule.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <RegexValueRule>[],
);

Map<String, dynamic> _$SiteOptionsToJson(_SiteOptions instance) =>
    <String, dynamic>{
      'flags': instance.flags,
      'loginUrl': instance.loginUrl,
      'loginCookiePattern': instance.loginCookiePattern,
      'loginCookieDescription': instance.loginCookieDescription,
      'headers': instance.headers.map((e) => e.toJson()).toList(),
      'cookies': instance.cookies.map((e) => e.toJson()).toList(),
    };

_ParserRule _$ParserRuleFromJson(Map<String, dynamic> json) => _ParserRule(
  id: json['id'] as String,
  name: json['name'] as String? ?? '',
  kind: const ParserEndpointKindJsonConverter().fromJson(
    json['kind'] as String,
  ),
  config: json['config'] == null
      ? const ParserConfig()
      : ParserConfig.fromJson(json['config'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ParserRuleToJson(_ParserRule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'kind': const ParserEndpointKindJsonConverter().toJson(instance.kind),
      'config': instance.config.toJson(),
    };

OutputSelectorScript _$OutputSelectorScriptFromJson(
  Map<String, dynamic> json,
) => OutputSelectorScript($type: json['type'] as String?);

Map<String, dynamic> _$OutputSelectorScriptToJson(
  OutputSelectorScript instance,
) => <String, dynamic>{'type': instance.$type};

ReplaceSelectorScript _$ReplaceSelectorScriptFromJson(
  Map<String, dynamic> json,
) => ReplaceSelectorScript(
  values:
      (json['values'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ) ??
      const <String, String>{},
  $type: json['type'] as String?,
);

Map<String, dynamic> _$ReplaceSelectorScriptToJson(
  ReplaceSelectorScript instance,
) => <String, dynamic>{'values': instance.values, 'type': instance.$type};

JavaScriptSelectorScript _$JavaScriptSelectorScriptFromJson(
  Map<String, dynamic> json,
) => JavaScriptSelectorScript(
  source: json['source'] as String? ?? '',
  $type: json['type'] as String?,
);

Map<String, dynamic> _$JavaScriptSelectorScriptToJson(
  JavaScriptSelectorScript instance,
) => <String, dynamic>{'source': instance.source, 'type': instance.$type};

_SelectorRule _$SelectorRuleFromJson(Map<String, dynamic> json) =>
    _SelectorRule(
      selector: json['selector'] as String? ?? '',
      queryType:
          $enumDecodeNullable(_$SelectorQueryTypeEnumMap, json['queryType']) ??
          SelectorQueryType.css,
      function:
          $enumDecodeNullable(
            _$SelectorFunctionTypeEnumMap,
            json['function'],
          ) ??
          SelectorFunctionType.text,
      parameter: json['parameter'] as String? ?? '',
      regex: json['regex'] as String? ?? '',
      replace: json['replace'] as String? ?? '',
      script: json['script'] == null
          ? const SelectorScript.output()
          : SelectorScript.fromJson(json['script'] as Map<String, dynamic>),
      defaultValue: json['defaultValue'] as String? ?? '',
    );

Map<String, dynamic> _$SelectorRuleToJson(_SelectorRule instance) =>
    <String, dynamic>{
      'selector': instance.selector,
      'queryType': _$SelectorQueryTypeEnumMap[instance.queryType]!,
      'function': _$SelectorFunctionTypeEnumMap[instance.function]!,
      'parameter': instance.parameter,
      'regex': instance.regex,
      'replace': instance.replace,
      'script': instance.script.toJson(),
      'defaultValue': instance.defaultValue,
    };

const _$SelectorQueryTypeEnumMap = {
  SelectorQueryType.self: 'self',
  SelectorQueryType.css: 'css',
  SelectorQueryType.xpath: 'xpath',
  SelectorQueryType.jsonPath: 'jsonPath',
};

const _$SelectorFunctionTypeEnumMap = {
  SelectorFunctionType.text: 'text',
  SelectorFunctionType.attribute: 'attribute',
  SelectorFunctionType.raw: 'raw',
};

_ExtraSelectorRule _$ExtraSelectorRuleFromJson(Map<String, dynamic> json) =>
    _ExtraSelectorRule(
      id: json['id'] as String,
      persistent: json['persistent'] as bool? ?? false,
      selector: json['selector'] == null
          ? const SelectorRule()
          : SelectorRule.fromJson(json['selector'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExtraSelectorRuleToJson(_ExtraSelectorRule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'persistent': instance.persistent,
      'selector': instance.selector.toJson(),
    };

_ParserConfig _$ParserConfigFromJson(Map<String, dynamic> json) =>
    _ParserConfig(
      selectors:
          (json['selectors'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry(k, SelectorRule.fromJson(e as Map<String, dynamic>)),
          ) ??
          const <String, SelectorRule>{},
      extras:
          (json['extras'] as List<dynamic>?)
              ?.map(
                (e) => ExtraSelectorRule.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <ExtraSelectorRule>[],
    );

Map<String, dynamic> _$ParserConfigToJson(_ParserConfig instance) =>
    <String, dynamic>{
      'selectors': instance.selectors.map((k, e) => MapEntry(k, e.toJson())),
      'extras': instance.extras.map((e) => e.toJson()).toList(),
    };

_EndpointRule _$EndpointRuleFromJson(Map<String, dynamic> json) =>
    _EndpointRule(
      id: json['id'] as String,
      kind: const EndpointEndpointKindJsonConverter().fromJson(
        json['kind'] as String,
      ),
      name: json['name'] as String,
      icon: json['icon'] as String? ?? '',
      visible: json['visible'] as bool? ?? true,
      request: RequestRule.fromJson(json['request'] as Map<String, dynamic>),
      parserId: json['parserId'] as String,
      pagination: PaginationRule.fromJson(
        json['pagination'] as Map<String, dynamic>,
      ),
      cachePolicy:
          $enumDecodeNullable(
            _$EndpointCachePolicyEnumMap,
            json['cachePolicy'],
          ) ??
          EndpointCachePolicy.networkFirst,
      links: json['links'] == null
          ? const EndpointLinks()
          : EndpointLinks.fromJson(json['links'] as Map<String, dynamic>),
      presentation: json['presentation'] == null
          ? const EndpointPresentation()
          : EndpointPresentation.fromJson(
              json['presentation'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$EndpointRuleToJson(_EndpointRule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kind': const EndpointEndpointKindJsonConverter().toJson(instance.kind),
      'name': instance.name,
      'icon': instance.icon,
      'visible': instance.visible,
      'request': instance.request.toJson(),
      'parserId': instance.parserId,
      'pagination': instance.pagination.toJson(),
      'cachePolicy': _$EndpointCachePolicyEnumMap[instance.cachePolicy]!,
      'links': instance.links.toJson(),
      'presentation': instance.presentation.toJson(),
    };

const _$EndpointCachePolicyEnumMap = {
  EndpointCachePolicy.networkFirst: 'networkFirst',
  EndpointCachePolicy.cacheFirst: 'cacheFirst',
  EndpointCachePolicy.noCache: 'noCache',
};

_EndpointSubpage _$EndpointSubpageFromJson(Map<String, dynamic> json) =>
    _EndpointSubpage(
      name: json['name'] as String? ?? '',
      key: json['key'] as String? ?? '',
      value: json['value'] as String? ?? '',
    );

Map<String, dynamic> _$EndpointSubpageToJson(_EndpointSubpage instance) =>
    <String, dynamic>{
      'name': instance.name,
      'key': instance.key,
      'value': instance.value,
    };

_EndpointFilter _$EndpointFilterFromJson(Map<String, dynamic> json) =>
    _EndpointFilter(
      name: json['name'] as String? ?? '',
      key: json['key'] as String? ?? '',
      type:
          $enumDecodeNullable(_$EndpointFilterTypeEnumMap, json['type']) ??
          EndpointFilterType.text,
      defaultValue: json['defaultValue'] as String? ?? '',
    );

Map<String, dynamic> _$EndpointFilterToJson(_EndpointFilter instance) =>
    <String, dynamic>{
      'name': instance.name,
      'key': instance.key,
      'type': _$EndpointFilterTypeEnumMap[instance.type]!,
      'defaultValue': instance.defaultValue,
    };

const _$EndpointFilterTypeEnumMap = {
  EndpointFilterType.boolean: 'boolean',
  EndpointFilterType.integer: 'integer',
  EndpointFilterType.decimal: 'decimal',
  EndpointFilterType.text: 'text',
};

_EndpointPresentation _$EndpointPresentationFromJson(
  Map<String, dynamic> json,
) => _EndpointPresentation(
  subpages:
      (json['subpages'] as List<dynamic>?)
          ?.map((e) => EndpointSubpage.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <EndpointSubpage>[],
  filters:
      (json['filters'] as List<dynamic>?)
          ?.map((e) => EndpointFilter.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <EndpointFilter>[],
  filterScript: json['filterScript'] == null
      ? const SelectorScript.output()
      : SelectorScript.fromJson(json['filterScript'] as Map<String, dynamic>),
  autocompleteSplitChar: json['autocompleteSplitChar'] as String? ?? ' ',
  autocompleteTimeout: (json['autocompleteTimeout'] as num?)?.toInt() ?? 2000,
);

Map<String, dynamic> _$EndpointPresentationToJson(
  _EndpointPresentation instance,
) => <String, dynamic>{
  'subpages': instance.subpages.map((e) => e.toJson()).toList(),
  'filters': instance.filters.map((e) => e.toJson()).toList(),
  'filterScript': instance.filterScript.toJson(),
  'autocompleteSplitChar': instance.autocompleteSplitChar,
  'autocompleteTimeout': instance.autocompleteTimeout,
};

_EndpointLinks _$EndpointLinksFromJson(Map<String, dynamic> json) =>
    _EndpointLinks(
      item: json['item'] as String?,
      autocomplete: json['autocomplete'] as String?,
      reader: json['reader'] as String?,
    );

Map<String, dynamic> _$EndpointLinksToJson(_EndpointLinks instance) =>
    <String, dynamic>{
      'item': ?instance.item,
      'autocomplete': ?instance.autocomplete,
      'reader': ?instance.reader,
    };

_RequestRule _$RequestRuleFromJson(Map<String, dynamic> json) => _RequestRule(
  method: $enumDecode(_$RequestMethodEnumMap, json['method']),
  url: json['url'] as String,
  query: json['query'] == null
      ? const <String, Object?>{}
      : const FrozenJsonMapConverter().fromJson(json['query']),
  headers: json['headers'] == null
      ? const <String, Object?>{}
      : const FrozenJsonMapConverter().fromJson(json['headers']),
  body: json['body'] == null
      ? const RequestBodyRule.none()
      : RequestBodyRule.fromJson(json['body'] as Map<String, dynamic>),
  idempotent: json['idempotent'] as bool? ?? false,
);

Map<String, dynamic> _$RequestRuleToJson(_RequestRule instance) =>
    <String, dynamic>{
      'method': _$RequestMethodEnumMap[instance.method]!,
      'url': instance.url,
      'query': const FrozenJsonMapConverter().toJson(instance.query),
      'headers': const FrozenJsonMapConverter().toJson(instance.headers),
      'body': instance.body.toJson(),
      'idempotent': instance.idempotent,
    };

const _$RequestMethodEnumMap = {
  RequestMethod.get: 'get',
  RequestMethod.post: 'post',
  RequestMethod.put: 'put',
  RequestMethod.delete: 'delete',
};

NoRequestBodyRule _$NoRequestBodyRuleFromJson(Map<String, dynamic> json) =>
    NoRequestBodyRule($type: json['type'] as String?);

Map<String, dynamic> _$NoRequestBodyRuleToJson(NoRequestBodyRule instance) =>
    <String, dynamic>{'type': instance.$type};

JsonRequestBodyRule _$JsonRequestBodyRuleFromJson(Map<String, dynamic> json) =>
    JsonRequestBodyRule(
      const FrozenJsonValueConverter().fromJson(json['value']),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$JsonRequestBodyRuleToJson(
  JsonRequestBodyRule instance,
) => <String, dynamic>{
  'value': const FrozenJsonValueConverter().toJson(instance.value),
  'type': instance.$type,
};

FormRequestBodyRule _$FormRequestBodyRuleFromJson(Map<String, dynamic> json) =>
    FormRequestBodyRule(
      const FrozenJsonMapConverter().fromJson(json['fields']),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$FormRequestBodyRuleToJson(
  FormRequestBodyRule instance,
) => <String, dynamic>{
  'fields': const FrozenJsonMapConverter().toJson(instance.fields),
  'type': instance.$type,
};

TextRequestBodyRule _$TextRequestBodyRuleFromJson(Map<String, dynamic> json) =>
    TextRequestBodyRule(
      json['value'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$TextRequestBodyRuleToJson(
  TextRequestBodyRule instance,
) => <String, dynamic>{'value': instance.value, 'type': instance.$type};

NoPaginationRule _$NoPaginationRuleFromJson(Map<String, dynamic> json) =>
    NoPaginationRule($type: json['type'] as String?);

Map<String, dynamic> _$NoPaginationRuleToJson(NoPaginationRule instance) =>
    <String, dynamic>{'type': instance.$type};

PageNumberPaginationRule _$PageNumberPaginationRuleFromJson(
  Map<String, dynamic> json,
) => PageNumberPaginationRule(
  variable: json['variable'] as String,
  initial: (json['initial'] as num).toInt(),
  step: (json['step'] as num).toInt(),
  pageSize: (json['pageSize'] as num).toInt(),
  endCondition: $enumDecode(_$PageEndConditionEnumMap, json['endCondition']),
  $type: json['type'] as String?,
);

Map<String, dynamic> _$PageNumberPaginationRuleToJson(
  PageNumberPaginationRule instance,
) => <String, dynamic>{
  'variable': instance.variable,
  'initial': instance.initial,
  'step': instance.step,
  'pageSize': instance.pageSize,
  'endCondition': _$PageEndConditionEnumMap[instance.endCondition]!,
  'type': instance.$type,
};

const _$PageEndConditionEnumMap = {
  PageEndCondition.emptyItems: 'emptyItems',
  PageEndCondition.shortPage: 'shortPage',
  PageEndCondition.missingContinuation: 'missingContinuation',
};

ContinuationPaginationRule _$ContinuationPaginationRuleFromJson(
  Map<String, dynamic> json,
) => ContinuationPaginationRule(
  target: $enumDecode(_$ContinuationTargetEnumMap, json['target']),
  variable: json['variable'] as String?,
  responseField: json['responseField'] as String? ?? 'continuation',
  $type: json['type'] as String?,
);

Map<String, dynamic> _$ContinuationPaginationRuleToJson(
  ContinuationPaginationRule instance,
) => <String, dynamic>{
  'target': _$ContinuationTargetEnumMap[instance.target]!,
  'variable': ?instance.variable,
  'responseField': instance.responseField,
  'type': instance.$type,
};

const _$ContinuationTargetEnumMap = {
  ContinuationTarget.url: 'url',
  ContinuationTarget.variable: 'variable',
};
