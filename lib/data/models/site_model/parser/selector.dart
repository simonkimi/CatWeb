import 'package:catweb/data/models/site_model/fields/field.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

part 'selector.g.dart';

part 'selector.freezed.dart';

abstract class StringValue {
  final String value;

  StringValue(this.value);
}

@JsonEnum(valueField: 'value')
enum SelectorType {
  css('css'),
  xpath('xpath'),
  jsonPath('json path');

  const SelectorType(this.value);

  final String value;

  factory SelectorType.fromJson(String value) {
    return SelectorType.values.firstWhere((e) => e.value == value);
  }
}

@JsonEnum(valueField: 'value')
enum SelectorFunctionType implements StringValue {
  text('text'),
  attr('attr'),
  raw('raw');

  const SelectorFunctionType(this.value);

  @override
  final String value;

  factory SelectorFunctionType.fromValue(String value) {
    return SelectorFunctionType.values.firstWhere((e) => e.value == value);
  }
}

class SelectorFunctionTypeConverter
    implements JsonConverter<Rx<SelectorFunctionType>, String> {
  const SelectorFunctionTypeConverter();

  @override
  Rx<SelectorFunctionType> fromJson(String json) =>
      SelectorFunctionType.fromValue(json).obs;

  @override
  String toJson(Rx<SelectorFunctionType> object) => object.value.value;
}

@freezed
class Selector with _$Selector {
  const Selector._();

  const factory Selector({
    @Default('') String selector,
    @Default(SelectorType.css) SelectorType type,
    @Default(SelectorFunctionType.text) SelectorFunctionType function,
    @Default('') String param,
    @Default('') String regex,
    @Default('') String replace,
    @Default(ScriptField()) ScriptField script,
    @Default('') String defaultValue,
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
    @Default(Selector()) Selector imgUrl,
    @Default(Selector()) Selector imgWidth,
    @Default(Selector()) Selector imgHeight,
    @Default(Selector()) Selector imgX,
    @Default(Selector()) Selector imgY,
  }) = _ImageSelector;

  factory ImageSelector.fromJson(Map<String, dynamic> json) =>
      _$ImageSelectorFromJson(json);
}

@freezed
class CommentSelector with _$CommentSelector {
  const factory CommentSelector({
    @Default(Selector()) Selector username,
    @Default(Selector()) Selector time,
    @Default(Selector()) Selector score,
    @Default(Selector()) Selector content,
    @Default(ImageSelector()) ImageSelector avatar,
  }) = _CommentSelector;

  factory CommentSelector.fromJson(Map<String, dynamic> json) =>
      _$CommentSelectorFromJson(json);
}

@freezed
class ExtraSelector with _$ExtraSelector {
  const factory ExtraSelector({
    @Default(Selector()) Selector selector,
    @Default('') String id,
    @Default(false) bool global,
  }) = _ExtraSelector;

  factory ExtraSelector.fromJson(Map<String, dynamic> json) =>
      _$ExtraSelectorFromJson(json);
}
