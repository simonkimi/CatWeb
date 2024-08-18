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

_$ScriptFieldOutputImpl _$$ScriptFieldOutputImplFromJson(
        Map<String, dynamic> json) =>
    _$ScriptFieldOutputImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ScriptFieldOutputImplToJson(
        _$ScriptFieldOutputImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$ScriptFieldReplaceImpl _$$ScriptFieldReplaceImplFromJson(
        Map<String, dynamic> json) =>
    _$ScriptFieldReplaceImpl(
      replace: (json['replace'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ScriptFieldReplaceImplToJson(
        _$ScriptFieldReplaceImpl instance) =>
    <String, dynamic>{
      'replace': instance.replace,
      'runtimeType': instance.$type,
    };

_$ScriptFieldJsImpl _$$ScriptFieldJsImplFromJson(Map<String, dynamic> json) =>
    _$ScriptFieldJsImpl(
      script: json['script'] as String? ?? '',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ScriptFieldJsImplToJson(_$ScriptFieldJsImpl instance) =>
    <String, dynamic>{
      'script': instance.script,
      'runtimeType': instance.$type,
    };

_$ColorFieldImpl _$$ColorFieldImplFromJson(Map<String, dynamic> json) =>
    _$ColorFieldImpl(
      a: (json['a'] as num?)?.toInt() ?? 0,
      r: (json['r'] as num?)?.toInt() ?? 0,
      g: (json['g'] as num?)?.toInt() ?? 0,
      b: (json['b'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ColorFieldImplToJson(_$ColorFieldImpl instance) =>
    <String, dynamic>{
      'a': instance.a,
      'r': instance.r,
      'g': instance.g,
      'b': instance.b,
    };
