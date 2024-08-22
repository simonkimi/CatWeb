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

_$TemplateListFilterImpl _$$TemplateListFilterImplFromJson(
        Map<String, dynamic> json) =>
    _$TemplateListFilterImpl(
      items: (json['items'] as List<dynamic>?)
              ?.map((e) =>
                  TemplateListFilterItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      script: json['script'] == null
          ? const ScriptField.output()
          : ScriptField.fromJson(json['script'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TemplateListFilterImplToJson(
        _$TemplateListFilterImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
      'script': instance.script,
    };

_$TemplateListFilterItemStringImpl _$$TemplateListFilterItemStringImplFromJson(
        Map<String, dynamic> json) =>
    _$TemplateListFilterItemStringImpl(
      name: json['name'] as String? ?? '',
      key: json['key'] as String? ?? '',
      value: json['value'] as String? ?? '',
      defaultValue: json['defaultValue'] as String? ?? '',
      disabledUnchanged: json['disabledUnchanged'] as bool? ?? false,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TemplateListFilterItemStringImplToJson(
        _$TemplateListFilterItemStringImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'key': instance.key,
      'value': instance.value,
      'defaultValue': instance.defaultValue,
      'disabledUnchanged': instance.disabledUnchanged,
      'runtimeType': instance.$type,
    };

_$TemplateListFilterItemNumberImpl _$$TemplateListFilterItemNumberImplFromJson(
        Map<String, dynamic> json) =>
    _$TemplateListFilterItemNumberImpl(
      name: json['name'] as String? ?? '',
      key: json['key'] as String? ?? '',
      value: (json['value'] as num?)?.toInt() ?? 0,
      defaultValue: (json['defaultValue'] as num?)?.toInt() ?? 0,
      disabledUnchanged: json['disabledUnchanged'] as bool? ?? false,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TemplateListFilterItemNumberImplToJson(
        _$TemplateListFilterItemNumberImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'key': instance.key,
      'value': instance.value,
      'defaultValue': instance.defaultValue,
      'disabledUnchanged': instance.disabledUnchanged,
      'runtimeType': instance.$type,
    };

_$TemplateListFilterItemFloatImpl _$$TemplateListFilterItemFloatImplFromJson(
        Map<String, dynamic> json) =>
    _$TemplateListFilterItemFloatImpl(
      name: json['name'] as String? ?? '',
      key: json['key'] as String? ?? '',
      value: (json['value'] as num?)?.toDouble() ?? 0.0,
      defaultValue: (json['defaultValue'] as num?)?.toDouble() ?? 0.0,
      disabledUnchanged: json['disabledUnchanged'] as bool? ?? false,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TemplateListFilterItemFloatImplToJson(
        _$TemplateListFilterItemFloatImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'key': instance.key,
      'value': instance.value,
      'defaultValue': instance.defaultValue,
      'disabledUnchanged': instance.disabledUnchanged,
      'runtimeType': instance.$type,
    };

_$TemplateListFilterItemBoolImpl _$$TemplateListFilterItemBoolImplFromJson(
        Map<String, dynamic> json) =>
    _$TemplateListFilterItemBoolImpl(
      name: json['name'] as String? ?? '',
      key: json['key'] as String? ?? '',
      value: json['value'] as bool? ?? false,
      defaultValue: json['defaultValue'] as bool? ?? false,
      disabledUnchanged: json['disabledUnchanged'] as bool? ?? false,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TemplateListFilterItemBoolImplToJson(
        _$TemplateListFilterItemBoolImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'key': instance.key,
      'value': instance.value,
      'defaultValue': instance.defaultValue,
      'disabledUnchanged': instance.disabledUnchanged,
      'runtimeType': instance.$type,
    };
