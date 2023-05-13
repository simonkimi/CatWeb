import 'package:catweb/data/models/site_model/pages/site_page.dart';
import 'package:catweb/data/models/site_model/parser/parser.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'fields/field.dart';

part 'site_blue_map.freezed.dart';

part 'site_blue_map.g.dart';

@freezed
class SiteBlueMap with _$SiteBlueMap {
  const factory SiteBlueMap({
    required String name,
    required String baseUrl,
    required String loginUrl,
    required String loginCookieReg,
    required String loginCookieDescription,
    required String version,
    required String upgradeUrl,
    required String flag,
    required String readme,
    required List<RegField> headers,
    required List<RegField> cookies,
    @JsonKey(fromJson: SiteBlueMap._parserListFromJson, toJson: SiteBlueMap._parserListToJson)
        required List<IParserBase> parserList,
    required List<SitePage> pageList,
  }) = _SiteBlueMap;

  factory SiteBlueMap.fromJson(Map<String, dynamic> json) =>
      _$SiteBlueMapFromJson(json);

  static List<IParserBase> _parserListFromJson(List<dynamic> json) {
    return json.map((e) => IParserBase.fromJson(e)).toList();
  }

  static List<Map<String, dynamic>> _parserListToJson(
      List<IParserBase> parserList) {
    return parserList.map((e) => e.toJson()).toList();
  }
}
