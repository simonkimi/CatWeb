import 'package:catweb/data/models/site/field.dart';
import 'package:catweb/data/models/site/subpage.dart';
import 'package:catweb/utils/enum_helper.dart';
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
    @Default(TemplateListFilter()) TemplateListFilter filter,
    @Default('') String targetItem,
    @Default('') String targetAutoComplete,
  }) = PageTemplateList;

  const factory PageTemplate.imageViewer() = PageTemplateImageViewer;

  factory PageTemplate.fromJson(Map<String, dynamic> json) =>
      _$PageTemplateFromJson(json);

  String getDescription(BuildContext context) {
    return type.getDescription(context);
  }

  PageTemplateType get type {
    return switch (this) {
      PageTemplateAutoComplete() => PageTemplateType.autoComplete,
      PageTemplateGallery() => PageTemplateType.gallery,
      PageTemplateList() => PageTemplateType.list,
      PageTemplateImageViewer() => PageTemplateType.imageViewer,
      _ => throw UnimplementedError('Unknown template type: $this'),
    };
  }

  static PageTemplate fromType(PageTemplateType type) {
    return switch (type) {
      PageTemplateType.autoComplete => const PageTemplate.autoComplete(),
      PageTemplateType.gallery => const PageTemplate.gallery(),
      PageTemplateType.list => const PageTemplate.list(),
      PageTemplateType.imageViewer => const PageTemplate.imageViewer(),
    };
  }
}

enum PageTemplateType implements IEnumDescription {
  autoComplete,
  gallery,
  list,
  imageViewer;

  @override
  String getDescription(BuildContext context) {
    return switch (this) {
      PageTemplateType.autoComplete => '自动补全',
      PageTemplateType.gallery => '图库',
      PageTemplateType.list => '列表',
      PageTemplateType.imageViewer => '图片查看器',
    };
  }
}
