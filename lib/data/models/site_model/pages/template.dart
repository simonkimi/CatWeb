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

  static ITemplate create(TemplateType type) {
    return switch (type) {
      TemplateType.gallery => const TemplateGallery(),
      TemplateType.imageList ||
      TemplateType.imageWaterFall =>
        const TemplateList(),
      TemplateType.autoComplete => const TemplateAutoComplete(),
      TemplateType.imageViewer => const TemplateImageViewer(),
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
    @Default('')
        String targetReader,
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
    @Default('') String name,
    @Default('') String key,
    @Default('') String value,
  }) = _TemplateListSubPage;

  factory TemplateListSubPage.fromJson(Map<String, dynamic> json) =>
      _$TemplateListSubPageFromJson(json);
}

@freezed
class TemplateListFilterItem with _$TemplateListFilterItem {
  const factory TemplateListFilterItem({
    @Default('') String name,
    @Default('') String key,
    @Default(FilterType.string) FilterType type,
    @Default('') String value,
    @Default(ColorField()) ColorField color,
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
    @Default('')
        String name,
    @Default([])
        List<TemplateListSubPage> subPages,
    @Default([])
        List<TemplateListFilterItem> filters,
    @Default(ScriptField())
        ScriptField script,
    @Default(false)
        bool disableUnchanged,
    @Default('')
        String targetItem,
    @Default('')
        String targetAutoComplete,
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
        String splitChar,
    @Default(1000)
        int timeout,
    ScriptField? script,
  }) = _TemplateAutoComplete;

  factory TemplateAutoComplete.fromJson(Map<String, dynamic> json) =>
      _$TemplateAutoCompleteFromJson(json);
}

@freezed
class TemplateImageViewer with _$TemplateImageViewer implements ITemplate {
  @Assert('type == TemplateType.imageViewer', 'type must be imageViewer')
  const factory TemplateImageViewer({
    @Default(TemplateType.imageViewer)
    @JsonKey(fromJson: TemplateType._fromValue, toJson: TemplateType._toValue)
        TemplateType type,
  }) = _TemplateImageViewer;

  factory TemplateImageViewer.fromJson(Map<String, dynamic> json) =>
      _$TemplateImageViewerFromJson(json);
}