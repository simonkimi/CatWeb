import 'package:catweb/data/models/new_site/field.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'selector.freezed.dart';

part 'selector.g.dart';

enum SelectorType {
  @JsonValue('self')
  self,
  @JsonValue('css')
  css,
  @JsonValue('xpath')
  xpath,
  @JsonValue('jsonPath')
  jsonPath,
}

enum SelectorFunctionType {
  @JsonValue('text')
  text,
  @JsonValue('attr')
  attr,
  @JsonValue('raw')
  raw,
}

@freezed
class SelectorModel with _$SelectorModel {
  const factory SelectorModel({
    @Default('') String selector,
    @Default(SelectorType.css) SelectorType type,
    @Default(SelectorFunctionType.text) SelectorFunctionType function,
    @Default('') String param,
    @Default('') String regex,
    @Default('') String replace,
    @Default(ScriptField()) ScriptField script,
    @Default('') String defaultValue,
  }) = _SelectorModel;

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
