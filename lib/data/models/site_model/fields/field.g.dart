// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RegField _$$_RegFieldFromJson(Map<String, dynamic> json) => _$_RegField(
      reg: json['reg'] as String? ?? '',
      value: json['value'] as String? ?? '',
    );

Map<String, dynamic> _$$_RegFieldToJson(_$_RegField instance) =>
    <String, dynamic>{
      'reg': instance.reg,
      'value': instance.value,
    };

_$_ColorField _$$_ColorFieldFromJson(Map<String, dynamic> json) =>
    _$_ColorField(
      a: json['a'] as int,
      r: json['r'] as int,
      g: json['g'] as int,
      b: json['b'] as int,
    );

Map<String, dynamic> _$$_ColorFieldToJson(_$_ColorField instance) =>
    <String, dynamic>{
      'a': instance.a,
      'r': instance.r,
      'g': instance.g,
      'b': instance.b,
    };

_$_ScriptField _$$_ScriptFieldFromJson(Map<String, dynamic> json) =>
    _$_ScriptField(
      script: json['script'] as String? ?? '',
      type: $enumDecodeNullable(_$ScriptFieldTypeEnumMap, json['type']) ??
          ScriptFieldType.computed,
    );

Map<String, dynamic> _$$_ScriptFieldToJson(_$_ScriptField instance) =>
    <String, dynamic>{
      'script': instance.script,
      'type': _$ScriptFieldTypeEnumMap[instance.type]!,
    };

const _$ScriptFieldTypeEnumMap = {
  ScriptFieldType.js: 'js',
  ScriptFieldType.lua: 'lua',
  ScriptFieldType.computed: 'computed',
  ScriptFieldType.replace: 'replace',
};
