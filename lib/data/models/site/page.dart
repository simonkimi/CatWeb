import 'package:catweb/data/models/site/parser.dart';
import 'package:catweb/data/models/site/template.dart';
import 'package:catweb/utils/enum_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'page.freezed.dart';

part 'page.g.dart';

@freezed
sealed class SitePageRule with _$SitePageRule {
  const SitePageRule._();

  const factory SitePageRule({
    @Default('') String name,
    required String uuid,
    required PageTemplate template,
    @Default('') String url,
    @Default(SiteNetType.get) SiteNetType action,
    @Default('') String formData,
    @Default('') String icon,
    @Default(SiteDisplayType.show) SiteDisplayType displayType,
    @Default('') String flag,
    @Default('') String parserId,
  }) = _SitePage;

  factory SitePageRule.fromJson(Map<String, dynamic> json) =>
      _$SitePageRuleFromJson(json);

  List<String> getDependPage() {
    switch (template) {
      case PageTemplateList(:final targetItem, :final targetAutoComplete):
        return [targetItem, targetAutoComplete];
      default:
        return [];
    }
  }

  ParserModelType acceptParserType() {
    return switch (template) {
      PageTemplateList() => ParserModelType.list,
      PageTemplateGallery() => ParserModelType.detail,
      PageTemplateImageViewer() => ParserModelType.imageReader,
      PageTemplateAutoComplete() => ParserModelType.autoComplete,
      _ => throw UnimplementedError('$template not implemented'),
    };
  }

  bool containsFlag(String flag) {
    return this.flag.contains(flag);
  }

  PageTemplateList get templateList {
    if (template is PageTemplateList) {
      return template as PageTemplateList;
    }
    throw UnimplementedError('template is not PageTemplateList');
  }

  PageTemplateGallery get templateGallery {
    if (template is PageTemplateGallery) {
      return template as PageTemplateGallery;
    }
    throw UnimplementedError('template is not PageTemplateGallery');
  }

  PageTemplateImageViewer get templateImageViewer {
    if (template is PageTemplateImageViewer) {
      return template as PageTemplateImageViewer;
    }
    throw UnimplementedError('template is not PageTemplateImageViewer');
  }

  PageTemplateAutoComplete get templateAutoComplete {
    if (template is PageTemplateAutoComplete) {
      return template as PageTemplateAutoComplete;
    }
    throw UnimplementedError('template is not PageTemplateAutoComplete');
  }
}

enum SiteNetType implements IEnumDescription {
  @JsonValue('get')
  get,
  @JsonValue('post')
  post,
  @JsonValue('put')
  put,
  @JsonValue('delete')
  delete;

  @override
  String getDescription(BuildContext context) {
    return switch (this) {
      SiteNetType.get => 'GET',
      SiteNetType.post => 'POST',
      SiteNetType.put => 'PUT',
      SiteNetType.delete => 'DELETE'
    };
  }
}

enum SiteDisplayType implements IEnumDescription {
  @JsonValue('show')
  show,
  @JsonValue('hide')
  hide,
  @JsonValue('shrink')
  shrink;

  @override
  String getDescription(BuildContext context) {
    return switch (this) {
      SiteDisplayType.show => '显示',
      SiteDisplayType.hide => '隐藏',
      SiteDisplayType.shrink => '折叠',
    };
  }
}
