import 'package:catweb/data/models/site/field.dart';
import 'package:catweb/utils/enum_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'selector.freezed.dart';

part 'selector.g.dart';

@freezed
class SelectorQuery with _$SelectorQuery {
  const SelectorQuery._();

  const factory SelectorQuery.self() = SelectorQuerySelf;

  const factory SelectorQuery.css({
    @Default('') String cssSelector,
  }) = SelectorQueryCss;

  const factory SelectorQuery.xpath({
    @Default('') String xpath,
  }) = SelectorQueryXpath;

  const factory SelectorQuery.jsonPath({
    @Default('') String jsonPath,
  }) = SelectorQueryJsonPath;

  factory SelectorQuery.fromJson(Map<String, dynamic> json) =>
      _$SelectorQueryFromJson(json);

  static SelectorQuery fromType(SelectorQueryType type) {
    return switch (type) {
      SelectorQueryType.self => const SelectorQuery.self(),
      SelectorQueryType.css => const SelectorQuery.css(),
      SelectorQueryType.xpath => const SelectorQuery.xpath(),
      SelectorQueryType.jsonPath => const SelectorQuery.jsonPath()
    };
  }

  SelectorQueryType toType() {
    return switch (this) {
      SelectorQuery.self => SelectorQueryType.self,
      SelectorQuery.css => SelectorQueryType.css,
      SelectorQuery.xpath => SelectorQueryType.xpath,
      SelectorQuery.jsonPath => SelectorQueryType.jsonPath,
      _ => throw Exception('Unknown SelectorQuery: $this')
    };
  }
}

enum SelectorQueryType implements IEnumDescription {
  self,
  css,
  xpath,
  jsonPath;

  @override
  String getDescription(BuildContext context) {
    return switch (this) {
      SelectorQueryType.self => 'self',
      SelectorQueryType.css => 'css',
      SelectorQueryType.xpath => 'xpath',
      SelectorQueryType.jsonPath => 'jsonPath'
    };
  }
}

@freezed
class SelectorFunction with _$SelectorFunction {
  const SelectorFunction._();

  const factory SelectorFunction.text() = SelectorFunctionText;

  const factory SelectorFunction.attr({
    @Default('') String attr,
  }) = SelectorFunctionAttr;

  const factory SelectorFunction.raw() = SelectorFunctionRaw;

  factory SelectorFunction.fromJson(Map<String, dynamic> json) =>
      _$SelectorFunctionFromJson(json);

  static SelectorFunction fromType(SelectorFunctionType type) {
    return switch (type) {
      SelectorFunctionType.text => const SelectorFunction.text(),
      SelectorFunctionType.attr => const SelectorFunction.attr(),
      SelectorFunctionType.raw => const SelectorFunction.raw()
    };
  }

  SelectorFunctionType toType() {
    return switch (this) {
      SelectorFunction.text => SelectorFunctionType.text,
      SelectorFunction.attr => SelectorFunctionType.attr,
      SelectorFunction.raw => SelectorFunctionType.raw,
      _ => throw Exception('Unknown SelectorFunction: $this')
    };
  }
}

enum SelectorFunctionType implements IEnumDescription {
  text,
  attr,
  raw;

  @override
  String getDescription(BuildContext context) {
    return switch (this) {
      SelectorFunctionType.text => 'text',
      SelectorFunctionType.attr => 'attr',
      SelectorFunctionType.raw => 'raw'
    };
  }
}

@freezed
class SelectorModel with _$SelectorModel {
  const SelectorModel._();

  const factory SelectorModel({
    @Default('') String selector,
    @Default(SelectorQuery.css()) SelectorQuery type,
    @Default(SelectorFunction.text()) SelectorFunction function,
    @Default('') String param,
    @Default('') String regex,
    @Default('') String replace,
    @Default(ScriptField.output()) ScriptField script,
    @Default('') String defaultValue,
  }) = _SelectorModel;

  bool get isEmpty => selector.isEmpty && param.isEmpty && defaultValue.isEmpty;

  factory SelectorModel.fromJson(Map<String, dynamic> json) =>
      _$SelectorModelFromJson(json);
}

@freezed
class ImageSelectorModel with _$ImageSelectorModel {
  const factory ImageSelectorModel({
    @Default(SelectorModel()) SelectorModel url,
    @Default(SelectorModel()) SelectorModel width,
    @Default(SelectorModel()) SelectorModel height,
    @Default(SelectorModel()) SelectorModel x,
    @Default(SelectorModel()) SelectorModel y,
    @Default(SelectorModel()) SelectorModel cacheKey,
  }) = _ImageSelectorModel;

  factory ImageSelectorModel.fromJson(Map<String, dynamic> json) =>
      _$ImageSelectorModelFromJson(json);
}

@freezed
class CommentSelectorModel with _$CommentSelectorModel {
  const factory CommentSelectorModel({
    @Default(SelectorModel()) SelectorModel username,
    @Default(SelectorModel()) SelectorModel time,
    @Default(SelectorModel()) SelectorModel content,
    @Default(SelectorModel()) SelectorModel avatar,
  }) = _CommentSelectorModel;

  factory CommentSelectorModel.fromJson(Map<String, dynamic> json) =>
      _$CommentSelectorModelFromJson(json);
}

@freezed
class ExtraSelectorModel with _$ExtraSelectorModel {
  const factory ExtraSelectorModel({
    @Default(SelectorModel()) SelectorModel selector,
    @Default('') String id,
    @Default(false) bool persistence,
  }) = _ExtraSelectorModel;

  factory ExtraSelectorModel.fromJson(Map<String, dynamic> json) =>
      _$ExtraSelectorModelFromJson(json);
}

@freezed
class TagSelectorModel with _$TagSelectorModel {
  const factory TagSelectorModel({
    @Default(SelectorModel()) SelectorModel text,
    @Default(SelectorModel()) SelectorModel color,
    @Default(SelectorModel()) SelectorModel category,
  }) = _TagSelectorModel;

  factory TagSelectorModel.fromJson(Map<String, dynamic> json) =>
      _$TagSelectorModelFromJson(json);
}
