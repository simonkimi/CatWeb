import 'package:catweb/data/models/site_model/pages/site_page.dart';
import 'package:catweb/data/models/site_model/parser/field.dart';
import 'package:catweb/data/models/site_model/parser/parser.dart';
import 'package:catweb/utils/helper.dart';
import 'package:catweb/utils/obs_helper.dart';
import 'package:catweb/utils/rx_list.dart';
import 'package:flutter/cupertino.dart';

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

  final ValueNotifier<String> name;
  final ValueNotifier<String> baseUrl;
  final ValueNotifier<String> loginUrl;
  final ValueNotifier<String> loginCookieReg;
  final ValueNotifier<String> loginCookieDescription;
  final ValueNotifier<String> version;
  final ValueNotifier<String> upgradeUrl;
  final ValueNotifier<String> flag;
  final ValueNotifier<String> readme;
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
      headers: (json['headers'] as List<dynamic>? ?? [])
          .map((e) => RegField.fromJson(e))
          .toList(),
      cookies: (json['cookies'] as List<dynamic>? ?? [])
          .map((e) => RegField.fromJson(e))
          .toList(),
      parserList: (json['parserList'] as List<dynamic>? ?? [])
          .map((e) => IParserBase.fromJson(e))
          .toList(),
      pageList: (json['pageList'] as List<dynamic>? ?? [])
          .map((e) => SitePage.fromJson(e))
          .toList(),
    );
  }

  bool containsFlag(String flag) {
    for (final flag in this.flag.value.split('|')) {
      if (flag.toLowerCase() == flag.toLowerCase()) {
        return true;
      }
    }
    return false;
  }

  T getParserById<T extends IParserBase>(String parseId) {
    final parser = parserList.get((e) => e.uuid == parseId);
    if (parser == null || parser is! T) {
      throw Exception('Parser not found');
    }
    return parser;
  }
}
