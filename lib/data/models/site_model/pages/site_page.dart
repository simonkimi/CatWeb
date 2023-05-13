import 'package:catweb/data/models/site_model/pages/template.dart';
import 'package:catweb/data/models/site_model/parser/parser.dart';
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
  const factory SitePage({
    required String name,
    required String uuid,
    required String url,
    SiteActionType? action,
    String? formData,
    String? icon,
    SiteDisplayType? displayType,
    String? flag,
    String? parserId,
    @JsonKey(fromJson: ITemplate.fromJson, toJson: SitePage._parserToJson)
        required ITemplate template,
  }) = _SitePage;

  factory SitePage.fromJson(Map<String, dynamic> json) =>
      _$SitePageFromJson(json);

  static Map<String, dynamic> _parserToJson(ITemplate parser) {
    return parser.toJson();
  }
}
