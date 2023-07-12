// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selector.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Selector _$$_SelectorFromJson(Map<String, dynamic> json) => _$_Selector(
      selector: json['selector'] as String? ?? '',
      type: $enumDecodeNullable(_$SelectorTypeEnumMap, json['type']) ??
          SelectorType.css,
      function: $enumDecodeNullable(
              _$SelectorFunctionTypeEnumMap, json['function']) ??
          SelectorFunctionType.none,
      param: json['param'] as String? ?? '',
      regex: json['regex'] as String? ?? '',
      replace: json['replace'] as String? ?? '',
      script: json['script'] == null
          ? const ScriptField()
          : ScriptField.fromJson(json['script'] as Map<String, dynamic>),
      defaultValue: json['defaultValue'] as String? ?? '',
    );

Map<String, dynamic> _$$_SelectorToJson(_$_Selector instance) =>
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
  SelectorType.css: 'css',
  SelectorType.xpath: 'xpath',
  SelectorType.jsonPath: 'json path',
};

const _$SelectorFunctionTypeEnumMap = {
  SelectorFunctionType.none: 'auto',
  SelectorFunctionType.text: 'text',
  SelectorFunctionType.attr: 'attr',
  SelectorFunctionType.raw: 'raw',
};

_$_ImageSelector _$$_ImageSelectorFromJson(Map<String, dynamic> json) =>
    _$_ImageSelector(
      imgUrl: json['imgUrl'] == null
          ? const Selector()
          : Selector.fromJson(json['imgUrl'] as Map<String, dynamic>),
      imgWidth: json['imgWidth'] == null
          ? const Selector()
          : Selector.fromJson(json['imgWidth'] as Map<String, dynamic>),
      imgHeight: json['imgHeight'] == null
          ? const Selector()
          : Selector.fromJson(json['imgHeight'] as Map<String, dynamic>),
      imgX: json['imgX'] == null
          ? const Selector()
          : Selector.fromJson(json['imgX'] as Map<String, dynamic>),
      imgY: json['imgY'] == null
          ? const Selector()
          : Selector.fromJson(json['imgY'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ImageSelectorToJson(_$_ImageSelector instance) =>
    <String, dynamic>{
      'imgUrl': instance.imgUrl,
      'imgWidth': instance.imgWidth,
      'imgHeight': instance.imgHeight,
      'imgX': instance.imgX,
      'imgY': instance.imgY,
    };

_$_CommentSelector _$$_CommentSelectorFromJson(Map<String, dynamic> json) =>
    _$_CommentSelector(
      username: json['username'] == null
          ? const Selector()
          : Selector.fromJson(json['username'] as Map<String, dynamic>),
      time: json['time'] == null
          ? const Selector()
          : Selector.fromJson(json['time'] as Map<String, dynamic>),
      score: json['score'] == null
          ? const Selector()
          : Selector.fromJson(json['score'] as Map<String, dynamic>),
      content: json['content'] == null
          ? const Selector()
          : Selector.fromJson(json['content'] as Map<String, dynamic>),
      avatar: json['avatar'] == null
          ? const ImageSelector()
          : ImageSelector.fromJson(json['avatar'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CommentSelectorToJson(_$_CommentSelector instance) =>
    <String, dynamic>{
      'username': instance.username,
      'time': instance.time,
      'score': instance.score,
      'content': instance.content,
      'avatar': instance.avatar,
    };

_$_ExtraSelector _$$_ExtraSelectorFromJson(Map<String, dynamic> json) =>
    _$_ExtraSelector(
      selector: json['selector'] == null
          ? const Selector()
          : Selector.fromJson(json['selector'] as Map<String, dynamic>),
      id: json['id'] as String? ?? '',
      global: json['global'] as bool? ?? false,
    );

Map<String, dynamic> _$$_ExtraSelectorToJson(_$_ExtraSelector instance) =>
    <String, dynamic>{
      'selector': instance.selector,
      'id': instance.id,
      'global': instance.global,
    };
