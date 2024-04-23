import 'package:catweb/data/models/site/field.dart';
import 'package:catweb/data/models/site/page.dart';
import 'package:catweb/data/models/site/parser.dart';
import 'package:catweb/utils/iter_helper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'site_bluemap.freezed.dart';

part 'site_bluemap.g.dart';

@freezed
class SiteBlueMap with _$SiteBlueMap {
  const SiteBlueMap._();

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
    @Default([]) List<ParserModel> parserList,
    @Default([]) List<SitePage> pageList,
  }) = _SiteBlueMap;

  factory SiteBlueMap.fromJson(Map<String, dynamic> json) =>
      _$SiteBlueMapFromJson(json);

  T getParserById<T extends ParserModel>(String parseId) {
    for (var parser in parserList) {
      if (parser.uuid == parseId && parser is T) {
        return parser;
      }
    }
    throw Exception('Parser not found');
  }

  SitePage? getPageById(String pageId) {
    for (var page in pageList) {
      if (page.uuid == pageId) {
        return page;
      }
    }
    return null;
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
