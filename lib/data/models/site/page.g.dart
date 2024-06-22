// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SitePageImpl _$$SitePageImplFromJson(Map<String, dynamic> json) =>
    _$SitePageImpl(
      name: json['name'] as String? ?? '',
      uuid: json['uuid'] as String,
      template: PageTemplate.fromJson(json['template'] as Map<String, dynamic>),
      url: json['url'] as String? ?? '',
      action: $enumDecodeNullable(_$SiteNetTypeEnumMap, json['action']) ??
          SiteNetType.get,
      formData: json['formData'] as String? ?? '',
      icon: json['icon'] as String? ?? '',
      displayType:
          $enumDecodeNullable(_$SiteDisplayTypeEnumMap, json['displayType']) ??
              SiteDisplayType.show,
      flag: json['flag'] as String? ?? '',
      parserId: json['parserId'] as String? ?? '',
    );

Map<String, dynamic> _$$SitePageImplToJson(_$SitePageImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uuid': instance.uuid,
      'template': instance.template,
      'url': instance.url,
      'action': _$SiteNetTypeEnumMap[instance.action]!,
      'formData': instance.formData,
      'icon': instance.icon,
      'displayType': _$SiteDisplayTypeEnumMap[instance.displayType]!,
      'flag': instance.flag,
      'parserId': instance.parserId,
    };

const _$SiteNetTypeEnumMap = {
  SiteNetType.get: 'get',
  SiteNetType.post: 'post',
  SiteNetType.put: 'put',
  SiteNetType.delete: 'delete',
};

const _$SiteDisplayTypeEnumMap = {
  SiteDisplayType.show: 'show',
  SiteDisplayType.hide: 'hide',
  SiteDisplayType.shrink: 'shrink',
};
