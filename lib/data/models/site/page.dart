import 'package:catweb/data/models/site/parser.dart';
import 'package:catweb/data/models/site/template.dart';
import 'package:catweb/utils/enum_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'page.freezed.dart';

part 'page.g.dart';

@freezed
class SitePageRule with _$SitePageRule {
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
      PageTemplate.list => ParserModelType.list,
      PageTemplate.gallery => ParserModelType.detail,
      PageTemplate.imageViewer => ParserModelType.imageReader,
      PageTemplate.autoComplete => ParserModelType.autoComplete,
      _ => throw UnimplementedError('$template not implemented'),
    };
  }

  bool containsFlag(String flag) {
    return this.flag.contains(flag);
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
