import 'package:catweb/data/models/new_site/field.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'site_bluemap.freezed.dart';

part 'site_bluemap.g.dart';

@freezed
class SiteBlueMap with _$SiteBlueMap {
  const factory SiteBlueMap({
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
    // @Default([]) List<IParserBase> parserList,
    // @Default([]) List<SitePage> pageList,
  }) = _SiteBlueMap;

  factory SiteBlueMap.fromJson(Map<String, dynamic> json) =>
      _$SiteBlueMapFromJson(json);
}
