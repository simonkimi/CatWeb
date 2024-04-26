// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PageTemplateAutoCompleteImpl _$$PageTemplateAutoCompleteImplFromJson(
        Map<String, dynamic> json) =>
    _$PageTemplateAutoCompleteImpl(
      splitChar: json['splitChar'] as String? ?? '',
      timeout: json['timeout'] as int? ?? 0,
      script: json['script'] == null
          ? const ScriptField.output()
          : ScriptField.fromJson(json['script'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PageTemplateAutoCompleteImplToJson(
        _$PageTemplateAutoCompleteImpl instance) =>
    <String, dynamic>{
      'splitChar': instance.splitChar,
      'timeout': instance.timeout,
      'script': instance.script,
      'runtimeType': instance.$type,
    };

_$PageTemplateGalleryImpl _$$PageTemplateGalleryImplFromJson(
        Map<String, dynamic> json) =>
    _$PageTemplateGalleryImpl(
      targetReader: json['targetReader'] as String? ?? '',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PageTemplateGalleryImplToJson(
        _$PageTemplateGalleryImpl instance) =>
    <String, dynamic>{
      'targetReader': instance.targetReader,
      'runtimeType': instance.$type,
    };

_$PageTemplateListImpl _$$PageTemplateListImplFromJson(
        Map<String, dynamic> json) =>
    _$PageTemplateListImpl(
      name: json['name'] as String? ?? '',
      subPages: (json['subPages'] as List<dynamic>?)
              ?.map((e) =>
                  TemplateListSubPage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      filters: (json['filters'] as List<dynamic>?)
              ?.map((e) =>
                  TemplateListFilterItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      script: json['script'] == null
          ? const ScriptField.output()
          : ScriptField.fromJson(json['script'] as Map<String, dynamic>),
      disableUnchanged: json['disableUnchanged'] as bool? ?? false,
      targetItem: json['targetItem'] as String? ?? '',
      targetAutoComplete: json['targetAutoComplete'] as String? ?? '',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PageTemplateListImplToJson(
        _$PageTemplateListImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'subPages': instance.subPages,
      'filters': instance.filters,
      'script': instance.script,
      'disableUnchanged': instance.disableUnchanged,
      'targetItem': instance.targetItem,
      'targetAutoComplete': instance.targetAutoComplete,
      'runtimeType': instance.$type,
    };

_$PageTemplateImageViewerImpl _$$PageTemplateImageViewerImplFromJson(
        Map<String, dynamic> json) =>
    _$PageTemplateImageViewerImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PageTemplateImageViewerImplToJson(
        _$PageTemplateImageViewerImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };
