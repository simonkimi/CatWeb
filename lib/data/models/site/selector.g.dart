// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selector.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SelectorModelImpl _$$SelectorModelImplFromJson(Map<String, dynamic> json) =>
    _$SelectorModelImpl(
      selector: json['selector'] as String? ?? '',
      type: $enumDecodeNullable(_$SelectorTypeEnumMap, json['type']) ??
          SelectorType.css,
      function: $enumDecodeNullable(
              _$SelectorFunctionTypeEnumMap, json['function']) ??
          SelectorFunctionType.text,
      param: json['param'] as String? ?? '',
      regex: json['regex'] as String? ?? '',
      replace: json['replace'] as String? ?? '',
      script: json['script'] == null
          ? const ScriptField()
          : ScriptField.fromJson(json['script'] as Map<String, dynamic>),
      defaultValue: json['defaultValue'] as String? ?? '',
    );

Map<String, dynamic> _$$SelectorModelImplToJson(_$SelectorModelImpl instance) =>
    <String, dynamic>{
      'selector': instance.selector,
      'type': _$SelectorTypeEnumMap[instance.type]!,
      'function': _$SelectorFunctionTypeEnumMap[instance.function]!,
      'param': instance.param,
      'regex': instance.regex,
      'replace': instance.replace,
      'script': instance.script,
      'defaultValue': instance.defaultValue,
    };

const _$SelectorTypeEnumMap = {
  SelectorType.self: 'self',
  SelectorType.css: 'css',
  SelectorType.xpath: 'xpath',
  SelectorType.jsonPath: 'jsonPath',
};

const _$SelectorFunctionTypeEnumMap = {
  SelectorFunctionType.text: 'text',
  SelectorFunctionType.attr: 'attr',
  SelectorFunctionType.raw: 'raw',
};

_$ImageSelectorModelImpl _$$ImageSelectorModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ImageSelectorModelImpl(
      url: json['url'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(json['url'] as Map<String, dynamic>),
      width: json['width'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(json['width'] as Map<String, dynamic>),
      height: json['height'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(json['height'] as Map<String, dynamic>),
      x: json['x'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(json['x'] as Map<String, dynamic>),
      y: json['y'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(json['y'] as Map<String, dynamic>),
      cacheKey: json['cacheKey'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(json['cacheKey'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ImageSelectorModelImplToJson(
        _$ImageSelectorModelImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
      'x': instance.x,
      'y': instance.y,
      'cacheKey': instance.cacheKey,
    };

_$CommentSelectorModelImpl _$$CommentSelectorModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CommentSelectorModelImpl(
      username: json['username'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(json['username'] as Map<String, dynamic>),
      time: json['time'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(json['time'] as Map<String, dynamic>),
      content: json['content'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(json['content'] as Map<String, dynamic>),
      avatar: json['avatar'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(json['avatar'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CommentSelectorModelImplToJson(
        _$CommentSelectorModelImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'time': instance.time,
      'content': instance.content,
      'avatar': instance.avatar,
    };

_$ExtraSelectorModelImpl _$$ExtraSelectorModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ExtraSelectorModelImpl(
      selector: json['selector'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(json['selector'] as Map<String, dynamic>),
      id: json['id'] as String? ?? '',
      persistence: json['persistence'] as bool? ?? false,
    );

Map<String, dynamic> _$$ExtraSelectorModelImplToJson(
        _$ExtraSelectorModelImpl instance) =>
    <String, dynamic>{
      'selector': instance.selector,
      'id': instance.id,
      'persistence': instance.persistence,
    };

_$TagSelectorModelImpl _$$TagSelectorModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TagSelectorModelImpl(
      text: json['text'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(json['text'] as Map<String, dynamic>),
      color: json['color'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(json['color'] as Map<String, dynamic>),
      category: json['category'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TagSelectorModelImplToJson(
        _$TagSelectorModelImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'color': instance.color,
      'category': instance.category,
    };
