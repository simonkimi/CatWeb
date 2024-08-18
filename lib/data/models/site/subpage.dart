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

  TemplateListFilterItem reset() {
    return switch (this) {
      TemplateListFilterItemString item =>
        item.copyWith(value: item.defaultValue),
      TemplateListFilterItemNumber item =>
        item.copyWith(value: item.defaultValue),
      TemplateListFilterItemFloat item =>
        item.copyWith(value: item.defaultValue),
      TemplateListFilterItemBool item =>
        item.copyWith(value: item.defaultValue),
      _ => throw UnimplementedError()
    };
  }

  FilterType get type => switch (this) {
        TemplateListFilterItemString _ => FilterType.string,
        TemplateListFilterItemNumber _ => FilterType.int,
        TemplateListFilterItemFloat _ => FilterType.float,
        TemplateListFilterItemBool _ => FilterType.bool,
        _ => throw UnimplementedError()
      };
}

enum FilterType implements IEnumDescription {
  @JsonValue('int')
  int,
  @JsonValue('float')
  float,
  @JsonValue('string')
  string,
  @JsonValue('bool')
  bool;

  @override
  String getDescription(BuildContext context) {
    return switch (this) {
      FilterType.int => '整数',
      FilterType.float => '小数',
      FilterType.string => '字符串',
      FilterType.bool => '单选',
    };
  }
}
