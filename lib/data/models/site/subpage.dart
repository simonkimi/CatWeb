import 'package:catweb/utils/enum_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'subpage.freezed.dart';

part 'subpage.g.dart';

@freezed
class TemplateListSubPage with _$TemplateListSubPage {
  const factory TemplateListSubPage({
    @Default('') String name,
    @Default('') String key,
    @Default('') String value,
  }) = _TemplateListSubPage;

  factory TemplateListSubPage.fromJson(Map<String, dynamic> json) =>
      _$TemplateListSubPageFromJson(json);
}

@freezed
class TemplateListFilterItem with _$TemplateListFilterItem {
  const TemplateListFilterItem._();

  const factory TemplateListFilterItem.string({
    @Default('') String name,
    @Default('') String key,
    @Default('') String value,
    @Default('') String defaultValue,
    @Default(false) bool disabledUnchanged,
  }) = TemplateListFilterItemString;

  const factory TemplateListFilterItem.int({
    @Default('') String name,
    @Default('') String key,
    @Default(0) int value,
    @Default(0) int defaultValue,
    @Default(false) bool disabledUnchanged,
  }) = TemplateListFilterItemNumber;

  const factory TemplateListFilterItem.float({
    @Default('') String name,
    @Default('') String key,
    @Default(0.0) double value,
    @Default(0.0) double defaultValue,
    @Default(false) bool disabledUnchanged,
  }) = TemplateListFilterItemFloat;

  const factory TemplateListFilterItem.bool({
    @Default('') String name,
    @Default('') String key,
    @Default(false) bool value,
    @Default(false) bool defaultValue,
    @Default(false) bool disabledUnchanged,
  }) = TemplateListFilterItemBool;

  factory TemplateListFilterItem.fromJson(Map<String, dynamic> json) =>
      _$TemplateListFilterItemFromJson(json);

  bool get isChanged => value != defaultValue;
}

enum FilterType implements IEnumDescription {
  @JsonValue('number')
  number,
  @JsonValue('string')
  string,
  @JsonValue('bool')
  bool;

  @override
  String getDescription(BuildContext context) {
    return switch (this) {
      FilterType.number => '数字',
      FilterType.string => '字符串',
      FilterType.bool => '单选',
    };
  }
}
