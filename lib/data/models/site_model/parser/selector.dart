import 'package:catweb/data/models/site_model/fields/field.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'selector.g.dart';

part 'selector.freezed.dart';

@JsonEnum(valueField: 'value')
enum SelectorType {
  css('css'),
  xpath('xpath'),
  jsonPath('json path');

  const SelectorType(this.value);

  final String value;

  factory SelectorType.fromValue(String value) {
    return SelectorType.values.firstWhere((e) => e.value == value);
  }
}

@JsonEnum(valueField: 'value')
enum SelectorFunctionType {
  text('text'),
  attr('attr'),
  raw('raw');

  const SelectorFunctionType(this.value);

  final String value;

  factory SelectorFunctionType.fromValue(String value) {
    return SelectorFunctionType.values.firstWhere((e) => e.value == value);
  }
}

@JsonEnum(valueField: 'value')
enum ExtraSelectorType {
  none(0),
  listItem(1),
  galleryThumbnail(2),
  galleryComment(3),
  galleryBadge(4),
  galleryChapter(5);

  const ExtraSelectorType(this.value);

  final int value;
}

@freezed
class Selector with _$Selector {
  const Selector._();

  const factory Selector({
    @Default('')
    String selector,
    @Default(SelectorType.css)
    SelectorType type,
    @Default(SelectorFunctionType.text)
    SelectorFunctionType function,
    @Default('')
    String param,
    @Default('')
    String regex,
    @Default('')
    String replace,
    @Default(ScriptField())
    ScriptField script,
    @Default('')
    String defaultValue,
  }) = _Selector;

  factory Selector.fromJson(Map<String, dynamic> json) =>
      _$SelectorFromJson(json);

  bool isEmpty() {
    return selector.isEmpty && param.isEmpty;
  }
}

@freezed
class ImageSelector with _$ImageSelector {
  const factory ImageSelector({
    @Default(Selector())
    Selector imgUrl,
    @Default(Selector())
    Selector imgWidth,
    @Default(Selector())
    Selector imgHeight,
    @Default(Selector())
    Selector imgX,
    @Default(Selector())
    Selector imgY,
  }) = _ImageSelector;

  factory ImageSelector.fromJson(Map<String, dynamic> json) =>
      _$ImageSelectorFromJson(json);
}

@freezed
class CommentSelector with _$CommentSelector {
  const factory CommentSelector({
    @Default(Selector())
    Selector? username,
    @Default(Selector())
    Selector? time,
    @Default(Selector())
    Selector? score,
    @Default(Selector())
    Selector? content,
    @Default(ImageSelector())
    ImageSelector? avatar,
  }) = _CommentSelector;

  factory CommentSelector.fromJson(Map<String, dynamic> json) =>
      _$CommentSelectorFromJson(json);
}

@freezed
class ExtraSelector with _$ExtraSelector {
  const factory ExtraSelector({
    @Default(Selector())
    Selector selector,
    @Default('')
    String id,
    @Default(false)
    bool global,
    @Default(ExtraSelectorType.galleryBadge)
    ExtraSelectorType type,
  }) = _ExtraSelector;

  factory ExtraSelector.fromJson(Map<String, dynamic> json) =>
      _$ExtraSelectorFromJson(json);
}
