import 'package:catweb/data/models/site_model/pages/template.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'site_page.g.dart';

part 'site_page.freezed.dart';

@JsonEnum(valueField: 'value')
enum SiteActionType {
  get('get'),
  post('post');

  final String value;

  const SiteActionType(this.value);
}

@JsonEnum(valueField: 'value')
enum SiteDisplayType {
  show('show'),
  hide('hide'),
  shrink('shrink');

  final String value;

  const SiteDisplayType(this.value);
}

@freezed
class SitePage with _$SitePage {
  const SitePage._();

  factory SitePage({
    required String name,
    required String uuid,
    required String url,
    @Default(SiteActionType.get) SiteActionType action,
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

  static Map<String, dynamic> _parserToJson(ITemplate parser) {
    return parser.toJson();
  }

  bool containsFlag(String flag) {
    for (final flag in this.flag.split('|')) {
      if (flag.toLowerCase() == flag.toLowerCase()) {
        return true;
      }
    }
    return false;
  }
}
