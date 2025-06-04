// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_blueprint.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SiteBlueMap _$SiteBlueMapFromJson(Map<String, dynamic> json) => _SiteBlueMap(
      name: json['name'] as String? ?? '',
      baseUrl: json['baseUrl'] as String? ?? '',
      loginUrl: json['loginUrl'] as String? ?? '',
      loginCookieReg: json['loginCookieReg'] as String? ?? '',
      loginCookieDescription: json['loginCookieDescription'] as String? ?? '',
      version: json['version'] as String? ?? '',
      upgradeUrl: json['upgradeUrl'] as String? ?? '',
      flag: json['flag'] as String? ?? '',
      readme: json['readme'] as String? ?? '',
      headers: (json['headers'] as List<dynamic>?)
              ?.map((e) => RegField.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      cookies: (json['cookies'] as List<dynamic>?)
              ?.map((e) => RegField.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      parserList: (json['parserList'] as List<dynamic>?)
              ?.map((e) => ParserModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      pageList: (json['pageList'] as List<dynamic>?)
              ?.map((e) => SitePageRule.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SiteBlueMapToJson(_SiteBlueMap instance) =>
    <String, dynamic>{
      'name': instance.name,
      'baseUrl': instance.baseUrl,
      'loginUrl': instance.loginUrl,
      'loginCookieReg': instance.loginCookieReg,
      'loginCookieDescription': instance.loginCookieDescription,
      'version': instance.version,
      'upgradeUrl': instance.upgradeUrl,
      'flag': instance.flag,
      'readme': instance.readme,
      'headers': instance.headers,
      'cookies': instance.cookies,
      'parserList': instance.parserList,
      'pageList': instance.pageList,
    };
