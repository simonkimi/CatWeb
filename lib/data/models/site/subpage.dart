import 'dart:ui';

import 'package:catweb/data/models/site/field.dart';
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

  const factory TemplateListFilterItem({
    @Default('') String name,
    @Default('') String key,
    @Default('') String value,
    @Default(FilterType.string) FilterType type,
  }) = _TemplateListFilterItem;

  factory TemplateListFilterItem.fromJson(Map<String, dynamic> json) =>
      _$TemplateListFilterItemFromJson(json);
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
