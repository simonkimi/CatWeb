import 'package:catweb/data/models/site/field.dart';
import 'package:catweb/data/models/site/subpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'template.freezed.dart';

part 'template.g.dart';

@freezed
class PageTemplate with _$PageTemplate {
  const PageTemplate._();

  const factory PageTemplate.autoComplete({
    @Default('') String splitChar,
    @Default(0) int timeout,
    @Default(ScriptField.output()) ScriptField script,
  }) = PageTemplateAutoComplete;

  const factory PageTemplate.gallery({
    @Default('') String targetReader,
  }) = PageTemplateGallery;

  const factory PageTemplate.list({
    @Default('') String name,
    @Default([]) List<TemplateListSubPage> subPages,
    @Default([]) List<TemplateListFilterItem> filters,
    @Default(ScriptField.output()) ScriptField script,
    @Default(false) bool disableUnchanged,
    @Default('') String targetItem,
    @Default('') String targetAutoComplete,
  }) = PageTemplateList;

  const factory PageTemplate.imageViewer() = PageTemplateImageViewer;

  factory PageTemplate.fromJson(Map<String, dynamic> json) =>
      _$PageTemplateFromJson(json);

  String getDescription(BuildContext context) {
    return switch (this) {
      PageTemplate.autoComplete => '自动补全',
      PageTemplate.gallery => '图库',
      PageTemplate.list => '列表',
      PageTemplate.imageViewer => '图片查看器',
      _ => throw UnimplementedError('Unknown template type: $this'),
    };
  }
}
