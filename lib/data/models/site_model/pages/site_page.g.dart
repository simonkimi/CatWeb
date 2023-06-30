// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SitePage _$$_SitePageFromJson(Map<String, dynamic> json) => _$_SitePage(
      name: json['name'] as String,
      uuid: json['uuid'] as String,
      url: json['url'] as String? ?? '',
      action: $enumDecodeNullable(_$SiteActionTypeEnumMap, json['action']) ??
          SiteActionType.get,
      formData: json['formData'] as String? ?? '',
      icon: json['icon'] as String? ?? '',
      displayType:
          $enumDecodeNullable(_$SiteDisplayTypeEnumMap, json['displayType']) ??
              SiteDisplayType.show,
      flag: json['flag'] as String? ?? '',
      parserId: json['parserId'] as String? ?? '',
      template: ITemplate.fromJson(json['template'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SitePageToJson(_$_SitePage instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uuid': instance.uuid,
      'url': instance.url,
      'action': _$SiteActionTypeEnumMap[instance.action]!,
      'formData': instance.formData,
      'icon': instance.icon,
      'displayType': _$SiteDisplayTypeEnumMap[instance.displayType]!,
      'flag': instance.flag,
      'parserId': instance.parserId,
      'template': SitePage._parserToJson(instance.template),
    };

const _$SiteActionTypeEnumMap = {
  SiteActionType.get: 'get',
  SiteActionType.post: 'post',
  SiteActionType.put: 'put',
  SiteActionType.delete: 'delete',
};

const _$SiteDisplayTypeEnumMap = {
  SiteDisplayType.show: 'show',
  SiteDisplayType.hide: 'hide',
  SiteDisplayType.shrink: 'shrink',
};
