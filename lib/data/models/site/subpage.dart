import 'package:catweb/data/models/site/field.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'subpage.freezed.dart';

part 'subpage.g.dart';

@freezed
class TemplateListSubPage with _$TemplateListSubPage {
  const factory TemplateListSubPage({
    @Default('') String? name,
    @Default('') String? key,
    @Default('') String? value,
  }) = _TemplateListSubPage;

  factory TemplateListSubPage.fromJson(Map<String, dynamic> json) =>
      _$TemplateListSubPageFromJson(json);
}

@freezed
class TemplateListFilterItem with _$TemplateListFilterItem {
  const factory TemplateListFilterItem({
    @Default('') String? name,
    @Default('') String? key,
    @Default('') String? value,
    @Default(FilterType.string) FilterType? type,
    @Default(ColorField()) ColorField? color,
  }) = _TemplateListFilterItem;

  factory TemplateListFilterItem.fromJson(Map<String, dynamic> json) =>
      _$TemplateListFilterItemFromJson(json);
}

enum FilterType {
  @JsonValue('number')
  number,
  @JsonValue('string')
  string,
  @JsonValue('bool')
  bool,
  @JsonValue('boolCard')
  boolCard,
}
