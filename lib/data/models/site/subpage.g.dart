// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subpage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TemplateListSubPageImpl _$$TemplateListSubPageImplFromJson(
        Map<String, dynamic> json) =>
    _$TemplateListSubPageImpl(
      name: json['name'] as String? ?? '',
      key: json['key'] as String? ?? '',
      value: json['value'] as String? ?? '',
    );

Map<String, dynamic> _$$TemplateListSubPageImplToJson(
        _$TemplateListSubPageImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'key': instance.key,
      'value': instance.value,
    };

_$TemplateListFilterItemImpl _$$TemplateListFilterItemImplFromJson(
        Map<String, dynamic> json) =>
    _$TemplateListFilterItemImpl(
      name: json['name'] as String? ?? '',
      key: json['key'] as String? ?? '',
      value: json['value'] as String? ?? '',
      type: $enumDecodeNullable(_$FilterTypeEnumMap, json['type']) ??
          FilterType.string,
    );

Map<String, dynamic> _$$TemplateListFilterItemImplToJson(
        _$TemplateListFilterItemImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'key': instance.key,
      'value': instance.value,
      'type': _$FilterTypeEnumMap[instance.type]!,
    };

const _$FilterTypeEnumMap = {
  FilterType.number: 'number',
  FilterType.string: 'string',
  FilterType.bool: 'bool',
};
