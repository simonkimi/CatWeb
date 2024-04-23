// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegFieldImpl _$$RegFieldImplFromJson(Map<String, dynamic> json) =>
    _$RegFieldImpl(
      reg: json['reg'] as String? ?? '',
      value: json['value'] as String? ?? '',
    );

Map<String, dynamic> _$$RegFieldImplToJson(_$RegFieldImpl instance) =>
    <String, dynamic>{
      'reg': instance.reg,
      'value': instance.value,
    };

_$ScriptFieldImpl _$$ScriptFieldImplFromJson(Map<String, dynamic> json) =>
    _$ScriptFieldImpl(
      script: json['script'] as String? ?? '',
      type: $enumDecodeNullable(_$ScriptFieldTypeEnumMap, json['type']) ??
          ScriptFieldType.output,
    );

Map<String, dynamic> _$$ScriptFieldImplToJson(_$ScriptFieldImpl instance) =>
    <String, dynamic>{
      'script': instance.script,
      'type': _$ScriptFieldTypeEnumMap[instance.type]!,
    };

const _$ScriptFieldTypeEnumMap = {
  ScriptFieldType.output: 'output',
  ScriptFieldType.js: 'js',
};

_$ColorFieldImpl _$$ColorFieldImplFromJson(Map<String, dynamic> json) =>
    _$ColorFieldImpl(
      a: json['a'] as int? ?? 0,
      r: json['r'] as int? ?? 0,
      g: json['g'] as int? ?? 0,
      b: json['b'] as int? ?? 0,
    );

Map<String, dynamic> _$$ColorFieldImplToJson(_$ColorFieldImpl instance) =>
    <String, dynamic>{
      'a': instance.a,
      'r': instance.r,
      'g': instance.g,
      'b': instance.b,
    };
