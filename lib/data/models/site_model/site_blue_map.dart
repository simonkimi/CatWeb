import 'dart:convert';

import 'package:catweb/data/models/site_model/pages/site_page.dart';
import 'package:catweb/data/models/site_model/parser/parser.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'fields/field.dart';

part 'site_blue_map.freezed.dart';

part 'site_blue_map.g.dart';

@unfreezed
class SiteBlueMap with _$SiteBlueMap {
  factory SiteBlueMap({
    @Default('') String name,
    @Default('') String baseUrl,
    @Default('') String loginUrl,
    @Default('') String loginCookieReg,
    @Default('') String loginCookieDescription,
    @Default('') String version,
    @Default('') String upgradeUrl,
    @Default('') String flag,
    @Default('') String readme,
    @Default([]) List<RegField> headers,
    @Default([]) List<RegField> cookies,
    @Default([])
    @JsonKey(
        fromJson: SiteBlueMap._parserListFromJson,
        toJson: SiteBlueMap._parserListToJson)
    List<IParserBase> parserList,
    @Default([]) List<SitePage> pageList,
  }) = _SiteBlueMap;

  factory SiteBlueMap.fromJson(Map<String, dynamic> json) =>
      _$SiteBlueMapFromJson(json);

  factory SiteBlueMap.fromJsonString(String json) =>
      _$SiteBlueMapFromJson(jsonDecode(json));

  static List<IParserBase> _parserListFromJson(List<dynamic> json) {
    return json.map((e) => IParserBase.fromJson(e)).toList();
  }

  static List<Map<String, dynamic>> _parserListToJson(
      List<IParserBase> parserList) {
    return parserList.map((e) => e.toJson()).toList();
  }
}
