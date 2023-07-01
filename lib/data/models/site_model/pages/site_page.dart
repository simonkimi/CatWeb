import 'package:catweb/data/models/site_model/pages/template.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:catweb/data/models/site_model/parser/parser.dart';

part 'site_page.g.dart';

part 'site_page.freezed.dart';

@JsonEnum(valueField: 'value')
enum SiteNetType {
  get('get'),
  post('post'),
  put('put'),
  delete('delete');

  final String value;

  const SiteNetType(this.value);
}

@JsonEnum(valueField: 'value')
enum SiteDisplayType {
  show('show'),
  hide('hide'),
  shrink('shrink');

  final String value;

  const SiteDisplayType(this.value);
}

@unfreezed
class SitePage with _$SitePage {
  const SitePage._();

  factory SitePage({
    required String name,
    required String uuid,
    @Default('') String url,
    @Default(SiteNetType.get) SiteNetType action,
    @Default('') String formData,
    @Default('') String icon,
    @Default(SiteDisplayType.show) SiteDisplayType displayType,
    @Default('') String flag,
    @Default('') String parserId,
    @JsonKey(fromJson: ITemplate.fromJson, toJson: SitePage._parserToJson)
    required ITemplate template,
  }) = _SitePage;

  factory SitePage.fromJson(Map<String, dynamic> json) =>
      _$SitePageFromJson(json);

  static Map<String, dynamic> _parserToJson(ITemplate? parser) {
    return parser?.toJson() ?? {};
  }

  bool containsFlag(String flag) {
    for (final flag in this.flag.split('|')) {
      if (flag.toLowerCase() == flag.toLowerCase()) {
        return true;
      }
    }
    return false;
  }

  List<String> getDependPage() {
    switch (template.type) {
      case TemplateType.imageList:
      case TemplateType.imageWaterFall:
        final model = template as TemplateList;
        return [model.targetItem, model.targetAutoComplete];
      default:
        return [];
    }
  }

  ParserType acceptParserType() {
    return switch(template.type) {
      TemplateType.imageList || TemplateType.imageWaterFall => ParserType.listView,
      TemplateType.autoComplete => ParserType.autoComplete,
      TemplateType.gallery => ParserType.gallery,
      TemplateType.imageViewer => ParserType.imageReader,
    };
  }
}
