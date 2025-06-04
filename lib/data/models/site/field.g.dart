// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegField _$RegFieldFromJson(Map<String, dynamic> json) => _RegField(
      reg: json['reg'] as String? ?? '',
      value: json['value'] as String? ?? '',
    );

Map<String, dynamic> _$RegFieldToJson(_RegField instance) => <String, dynamic>{
      'reg': instance.reg,
      'value': instance.value,
    };

ScriptFieldOutput _$ScriptFieldOutputFromJson(Map<String, dynamic> json) =>
    ScriptFieldOutput(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ScriptFieldOutputToJson(ScriptFieldOutput instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

ScriptFieldReplace _$ScriptFieldReplaceFromJson(Map<String, dynamic> json) =>
    ScriptFieldReplace(
      replace: (json['replace'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ScriptFieldReplaceToJson(ScriptFieldReplace instance) =>
    <String, dynamic>{
      'replace': instance.replace,
      'runtimeType': instance.$type,
    };

ScriptFieldJs _$ScriptFieldJsFromJson(Map<String, dynamic> json) =>
    ScriptFieldJs(
      script: json['script'] as String? ?? '',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ScriptFieldJsToJson(ScriptFieldJs instance) =>
    <String, dynamic>{
      'script': instance.script,
      'runtimeType': instance.$type,
    };

_ColorField _$ColorFieldFromJson(Map<String, dynamic> json) => _ColorField(
      a: (json['a'] as num?)?.toInt() ?? 0,
      r: (json['r'] as num?)?.toInt() ?? 0,
      g: (json['g'] as num?)?.toInt() ?? 0,
      b: (json['b'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ColorFieldToJson(_ColorField instance) =>
    <String, dynamic>{
      'a': instance.a,
      'r': instance.r,
      'g': instance.g,
      'b': instance.b,
    };
