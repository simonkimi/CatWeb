// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subpage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TemplateListSubPage _$TemplateListSubPageFromJson(Map<String, dynamic> json) =>
    _TemplateListSubPage(
      name: json['name'] as String? ?? '',
      key: json['key'] as String? ?? '',
      value: json['value'] as String? ?? '',
    );

Map<String, dynamic> _$TemplateListSubPageToJson(
        _TemplateListSubPage instance) =>
    <String, dynamic>{
      'name': instance.name,
      'key': instance.key,
      'value': instance.value,
    };

_TemplateListFilter _$TemplateListFilterFromJson(Map<String, dynamic> json) =>
    _TemplateListFilter(
      items: (json['items'] as List<dynamic>?)
              ?.map((e) =>
                  TemplateListFilterItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      script: json['script'] == null
          ? const ScriptField.output()
          : ScriptField.fromJson(json['script'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TemplateListFilterToJson(_TemplateListFilter instance) =>
    <String, dynamic>{
      'items': instance.items,
      'script': instance.script,
    };

TemplateListFilterItemString _$TemplateListFilterItemStringFromJson(
        Map<String, dynamic> json) =>
    TemplateListFilterItemString(
      name: json['name'] as String? ?? '',
      key: json['key'] as String? ?? '',
      value: json['value'] as String? ?? '',
      defaultValue: json['defaultValue'] as String? ?? '',
      disabledUnchanged: json['disabledUnchanged'] as bool? ?? false,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$TemplateListFilterItemStringToJson(
        TemplateListFilterItemString instance) =>
    <String, dynamic>{
      'name': instance.name,
      'key': instance.key,
      'value': instance.value,
      'defaultValue': instance.defaultValue,
      'disabledUnchanged': instance.disabledUnchanged,
      'runtimeType': instance.$type,
    };

TemplateListFilterItemNumber _$TemplateListFilterItemNumberFromJson(
        Map<String, dynamic> json) =>
    TemplateListFilterItemNumber(
      name: json['name'] as String? ?? '',
      key: json['key'] as String? ?? '',
      value: (json['value'] as num?)?.toInt() ?? 0,
      defaultValue: (json['defaultValue'] as num?)?.toInt() ?? 0,
      disabledUnchanged: json['disabledUnchanged'] as bool? ?? false,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$TemplateListFilterItemNumberToJson(
        TemplateListFilterItemNumber instance) =>
    <String, dynamic>{
      'name': instance.name,
      'key': instance.key,
      'value': instance.value,
      'defaultValue': instance.defaultValue,
      'disabledUnchanged': instance.disabledUnchanged,
      'runtimeType': instance.$type,
    };

TemplateListFilterItemFloat _$TemplateListFilterItemFloatFromJson(
        Map<String, dynamic> json) =>
    TemplateListFilterItemFloat(
      name: json['name'] as String? ?? '',
      key: json['key'] as String? ?? '',
      value: (json['value'] as num?)?.toDouble() ?? 0.0,
      defaultValue: (json['defaultValue'] as num?)?.toDouble() ?? 0.0,
      disabledUnchanged: json['disabledUnchanged'] as bool? ?? false,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$TemplateListFilterItemFloatToJson(
        TemplateListFilterItemFloat instance) =>
    <String, dynamic>{
      'name': instance.name,
      'key': instance.key,
      'value': instance.value,
      'defaultValue': instance.defaultValue,
      'disabledUnchanged': instance.disabledUnchanged,
      'runtimeType': instance.$type,
    };

TemplateListFilterItemBool _$TemplateListFilterItemBoolFromJson(
        Map<String, dynamic> json) =>
    TemplateListFilterItemBool(
      name: json['name'] as String? ?? '',
      key: json['key'] as String? ?? '',
      value: json['value'] as bool? ?? false,
      defaultValue: json['defaultValue'] as bool? ?? false,
      disabledUnchanged: json['disabledUnchanged'] as bool? ?? false,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$TemplateListFilterItemBoolToJson(
        TemplateListFilterItemBool instance) =>
    <String, dynamic>{
      'name': instance.name,
      'key': instance.key,
      'value': instance.value,
      'defaultValue': instance.defaultValue,
      'disabledUnchanged': instance.disabledUnchanged,
      'runtimeType': instance.$type,
    };
