import 'package:catweb/data/models/site_model/fields/field.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'template.freezed.dart';

part 'template.g.dart';

@JsonEnum(valueField: 'value')
enum TemplateType {
  imageList('ImageList'),
  imageWaterFall('ImageWaterFall'),
  gallery('Gallery'),
  imageViewer('ImageViewer'),
  autoComplete('AutoComplete');

  final String value;

  const TemplateType(this.value);

  factory TemplateType.fromString(String value) {
    return TemplateType.values.firstWhere((e) => e.value == value);
  }

  static _toValue(TemplateType type) => type.value;

  static TemplateType _fromValue(String value) =>
      TemplateType.fromString(value);
}

abstract class ITemplate {
  final TemplateType type;

  ITemplate(this.type);

  static ITemplate fromJson(Map<String, dynamic> json) {
    final type = TemplateType.fromString(json['type']);
    return switch (type) {
      TemplateType.gallery => TemplateGallery.fromJson(json),
      TemplateType.imageList ||
      TemplateType.gallery =>
        TemplateList.fromJson(json),
      TemplateType.autoComplete => TemplateAutoComplete.fromJson(json),
      _ => throw Exception('Invalid template type')
    };
  }

  Map<String, dynamic> toJson();
}

@freezed
class TemplateGallery with _$TemplateGallery implements ITemplate {
  @Assert('type == TemplateType.gallery', 'type must be gallery')
  const factory TemplateGallery({
    @Default(TemplateType.gallery)
    @JsonKey(fromJson: TemplateType._fromValue, toJson: TemplateType._toValue)
        TemplateType type,
    required String targetReader,
  }) = _TemplateGallery;

  factory TemplateGallery.fromJson(Map<String, dynamic> json) =>
      _$TemplateGalleryFromJson(json);
}

@JsonEnum(valueField: 'value')
enum FilterType {
  number('number'),
  string('string'),
  bool('bool'),
  boolCard('boolCard');

  final String value;

  const FilterType(this.value);
}

@freezed
class TemplateListSubPage with _$TemplateListSubPage {
  const factory TemplateListSubPage({
    required String key,
    required String value,
  }) = _TemplateListSubPage;

  factory TemplateListSubPage.fromJson(Map<String, dynamic> json) =>
      _$TemplateListSubPageFromJson(json);
}

@freezed
class TemplateListFilterItem with _$TemplateListFilterItem {
  const factory TemplateListFilterItem({
    required String key,
    required FilterType type,
    required String value,
    required ColorField color,
  }) = _TemplateListFilterItem;

  factory TemplateListFilterItem.fromJson(Map<String, dynamic> json) =>
      _$TemplateListFilterItemFromJson(json);
}

@freezed
class TemplateList with _$TemplateList implements ITemplate {
  @Assert('type == TemplateType.imageList', 'type must be imageList')
  const factory TemplateList({
    @Default(TemplateType.imageList)
    @JsonKey(fromJson: TemplateType._fromValue, toJson: TemplateType._toValue)
        TemplateType type,
    required String name,
    required List<TemplateListSubPage> subPages,
    required List<TemplateListFilterItem> filters,
    required ScriptField script,
    required bool disableUnchanged,
    required String targetItem,
    required String targetAutoComplete,
  }) = _TemplateList;

  factory TemplateList.fromJson(Map<String, dynamic> json) =>
      _$TemplateListFromJson(json);
}

@freezed
class TemplateAutoComplete with _$TemplateAutoComplete implements ITemplate {
  @Assert('type == TemplateType.autoComplete', 'type must be autoComplete')
  const factory TemplateAutoComplete({
    @Default(TemplateType.autoComplete)
    @JsonKey(fromJson: TemplateType._fromValue, toJson: TemplateType._toValue)
        TemplateType type,
    @Default(' ')
        String? splitChar,
    @Default(200)
        int? timeout,
    ScriptField? script,
  }) = _TemplateAutoComplete;

  factory TemplateAutoComplete.fromJson(Map<String, dynamic> json) =>
      _$TemplateAutoCompleteFromJson(json);
}
