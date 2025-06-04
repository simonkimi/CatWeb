// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageTemplateAutoComplete _$PageTemplateAutoCompleteFromJson(
        Map<String, dynamic> json) =>
    PageTemplateAutoComplete(
      splitChar: json['splitChar'] as String? ?? '',
      timeout: (json['timeout'] as num?)?.toInt() ?? 0,
      script: json['script'] == null
          ? const ScriptField.output()
          : ScriptField.fromJson(json['script'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$PageTemplateAutoCompleteToJson(
        PageTemplateAutoComplete instance) =>
    <String, dynamic>{
      'splitChar': instance.splitChar,
      'timeout': instance.timeout,
      'script': instance.script,
      'runtimeType': instance.$type,
    };

PageTemplateGallery _$PageTemplateGalleryFromJson(Map<String, dynamic> json) =>
    PageTemplateGallery(
      targetReader: json['targetReader'] as String? ?? '',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$PageTemplateGalleryToJson(
        PageTemplateGallery instance) =>
    <String, dynamic>{
      'targetReader': instance.targetReader,
      'runtimeType': instance.$type,
    };

PageTemplateList _$PageTemplateListFromJson(Map<String, dynamic> json) =>
    PageTemplateList(
      name: json['name'] as String? ?? '',
      subPages: (json['subPages'] as List<dynamic>?)
              ?.map((e) =>
                  TemplateListSubPage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      filter: json['filter'] == null
          ? const TemplateListFilter()
          : TemplateListFilter.fromJson(json['filter'] as Map<String, dynamic>),
      targetItem: json['targetItem'] as String? ?? '',
      targetAutoComplete: json['targetAutoComplete'] as String? ?? '',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$PageTemplateListToJson(PageTemplateList instance) =>
    <String, dynamic>{
      'name': instance.name,
      'subPages': instance.subPages,
      'filter': instance.filter,
      'targetItem': instance.targetItem,
      'targetAutoComplete': instance.targetAutoComplete,
      'runtimeType': instance.$type,
    };

PageTemplateImageViewer _$PageTemplateImageViewerFromJson(
        Map<String, dynamic> json) =>
    PageTemplateImageViewer(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$PageTemplateImageViewerToJson(
        PageTemplateImageViewer instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };
