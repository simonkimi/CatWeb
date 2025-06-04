// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selector.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SelectorQuerySelf _$SelectorQuerySelfFromJson(Map<String, dynamic> json) =>
    SelectorQuerySelf(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$SelectorQuerySelfToJson(SelectorQuerySelf instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

SelectorQueryCss _$SelectorQueryCssFromJson(Map<String, dynamic> json) =>
    SelectorQueryCss(
      css: json['css'] as String? ?? '',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$SelectorQueryCssToJson(SelectorQueryCss instance) =>
    <String, dynamic>{
      'css': instance.css,
      'runtimeType': instance.$type,
    };

SelectorQueryXpath _$SelectorQueryXpathFromJson(Map<String, dynamic> json) =>
    SelectorQueryXpath(
      xpath: json['xpath'] as String? ?? '',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$SelectorQueryXpathToJson(SelectorQueryXpath instance) =>
    <String, dynamic>{
      'xpath': instance.xpath,
      'runtimeType': instance.$type,
    };

SelectorQueryJsonPath _$SelectorQueryJsonPathFromJson(
        Map<String, dynamic> json) =>
    SelectorQueryJsonPath(
      jsonPath: json['jsonPath'] as String? ?? '',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$SelectorQueryJsonPathToJson(
        SelectorQueryJsonPath instance) =>
    <String, dynamic>{
      'jsonPath': instance.jsonPath,
      'runtimeType': instance.$type,
    };

SelectorFunctionText _$SelectorFunctionTextFromJson(
        Map<String, dynamic> json) =>
    SelectorFunctionText(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$SelectorFunctionTextToJson(
        SelectorFunctionText instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

SelectorFunctionAttr _$SelectorFunctionAttrFromJson(
        Map<String, dynamic> json) =>
    SelectorFunctionAttr(
      attr: json['attr'] as String? ?? '',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$SelectorFunctionAttrToJson(
        SelectorFunctionAttr instance) =>
    <String, dynamic>{
      'attr': instance.attr,
      'runtimeType': instance.$type,
    };

SelectorFunctionRaw _$SelectorFunctionRawFromJson(Map<String, dynamic> json) =>
    SelectorFunctionRaw(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$SelectorFunctionRawToJson(
        SelectorFunctionRaw instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_SelectorModel _$SelectorModelFromJson(Map<String, dynamic> json) =>
    _SelectorModel(
      selector: json['selector'] as String? ?? '',
      type: json['type'] == null
          ? const SelectorQuery.css()
          : SelectorQuery.fromJson(json['type'] as Map<String, dynamic>),
      function: json['function'] == null
          ? const SelectorFunction.text()
          : SelectorFunction.fromJson(json['function'] as Map<String, dynamic>),
      param: json['param'] as String? ?? '',
      regex: json['regex'] as String? ?? '',
      replace: json['replace'] as String? ?? '',
      script: json['script'] == null
          ? const ScriptField.output()
          : ScriptField.fromJson(json['script'] as Map<String, dynamic>),
      defaultValue: json['defaultValue'] as String? ?? '',
    );

Map<String, dynamic> _$SelectorModelToJson(_SelectorModel instance) =>
    <String, dynamic>{
      'selector': instance.selector,
      'type': instance.type,
      'function': instance.function,
      'param': instance.param,
      'regex': instance.regex,
      'replace': instance.replace,
      'script': instance.script,
      'defaultValue': instance.defaultValue,
    };

_ImageSelectorModel _$ImageSelectorModelFromJson(Map<String, dynamic> json) =>
    _ImageSelectorModel(
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

Map<String, dynamic> _$ImageSelectorModelToJson(_ImageSelectorModel instance) =>
    <String, dynamic>{
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
      'x': instance.x,
      'y': instance.y,
      'cacheKey': instance.cacheKey,
    };

_CommentSelectorModel _$CommentSelectorModelFromJson(
        Map<String, dynamic> json) =>
    _CommentSelectorModel(
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

Map<String, dynamic> _$CommentSelectorModelToJson(
        _CommentSelectorModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'time': instance.time,
      'content': instance.content,
      'avatar': instance.avatar,
    };

_ExtraSelectorModel _$ExtraSelectorModelFromJson(Map<String, dynamic> json) =>
    _ExtraSelectorModel(
      selector: json['selector'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(json['selector'] as Map<String, dynamic>),
      id: json['id'] as String? ?? '',
      persistence: json['persistence'] as bool? ?? false,
    );

Map<String, dynamic> _$ExtraSelectorModelToJson(_ExtraSelectorModel instance) =>
    <String, dynamic>{
      'selector': instance.selector,
      'id': instance.id,
      'persistence': instance.persistence,
    };

_TagSelectorModel _$TagSelectorModelFromJson(Map<String, dynamic> json) =>
    _TagSelectorModel(
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

Map<String, dynamic> _$TagSelectorModelToJson(_TagSelectorModel instance) =>
    <String, dynamic>{
      'text': instance.text,
      'color': instance.color,
      'category': instance.category,
    };
