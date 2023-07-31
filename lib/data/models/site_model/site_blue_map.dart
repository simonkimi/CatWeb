import 'package:catweb/data/models/site_model/pages/site_page.dart';
import 'package:catweb/data/models/site_model/parser/field.dart';
import 'package:catweb/data/models/site_model/parser/parser.dart';
import 'package:get/get.dart';

class SiteBlueMap {
  SiteBlueMap({
    String name = '',
    String baseUrl = '',
    String loginUrl = '',
    String loginCookieReg = '',
    String loginCookieDescription = '',
    String version = '',
    String upgradeUrl = '',
    String flag = '',
    String readme = '',
    List<RegField> headers = const [],
    List<RegField> cookies = const [],
    List<IParserBase> parserList = const [],
    List<SitePage> pageList = const [],
  })  : name = name.obs,
        baseUrl = baseUrl.obs,
        loginUrl = loginUrl.obs,
        loginCookieReg = loginCookieReg.obs,
        loginCookieDescription = loginCookieDescription.obs,
        version = version.obs,
        upgradeUrl = upgradeUrl.obs,
        flag = flag.obs,
        readme = readme.obs,
        headers = headers.obs,
        cookies = cookies.obs,
        parserList = parserList.obs,
        pageList = pageList.obs;

  final RxString name;
  final RxString baseUrl;
  final RxString loginUrl;
  final RxString loginCookieReg;
  final RxString loginCookieDescription;
  final RxString version;
  final RxString upgradeUrl;
  final RxString flag;
  final RxString readme;
  final RxList<RegField> headers;
  final RxList<RegField> cookies;
  final RxList<IParserBase> parserList;
  final RxList<SitePage> pageList;

  Map<String, dynamic> toJson() {
    return {
      'name': name.value,
      'baseUrl': baseUrl.value,
      'loginUrl': loginUrl.value,
      'loginCookieReg': loginCookieReg.value,
      'loginCookieDescription': loginCookieDescription.value,
      'version': version.value,
      'upgradeUrl': upgradeUrl.value,
      'flag': flag.value,
      'readme': readme.value,
      'headers': headers.map((e) => e.toJson()).toList(),
      'cookies': cookies.map((e) => e.toJson()).toList(),
      'parserList': parserList.map((e) => e.toJson()).toList(),
      'pageList': pageList.map((e) => e.toJson()).toList(),
    };
  }

  factory SiteBlueMap.fromJson(Map<String, dynamic> json) {
    return SiteBlueMap(
      name: json['name'] ?? '',
      baseUrl: json['baseUrl'] ?? '',
      loginUrl: json['loginUrl'] ?? '',
      loginCookieReg: json['loginCookieReg'] ?? '',
      loginCookieDescription: json['loginCookieDescription'] ?? '',
      version: json['version'] ?? '',
      upgradeUrl: json['upgradeUrl'] ?? '',
      flag: json['flag'] ?? '',
      readme: json['readme'] ?? '',
      headers: json['headers'] ?? [],
      cookies: json['cookies'] ?? [],
      parserList: (json['parserList'] as List<dynamic>? ?? [])
          .map((e) => IParserBase.fromJson(e))
          .toList()
          .obs,
      pageList: (json['pageList'] as List<dynamic>? ?? [])
          .map((e) => SitePage.fromJson(e))
          .toList()
          .obs,
    );
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
