// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TemplateGallery _$$_TemplateGalleryFromJson(Map<String, dynamic> json) =>
    _$_TemplateGallery(
      type: json['type'] == null
          ? TemplateType.gallery
          : TemplateType._fromValue(json['type'] as String),
      targetReader: json['targetReader'] as String,
    );

Map<String, dynamic> _$$_TemplateGalleryToJson(_$_TemplateGallery instance) =>
    <String, dynamic>{
      'type': TemplateType._toValue(instance.type),
      'targetReader': instance.targetReader,
    };

_$_TemplateListSubPage _$$_TemplateListSubPageFromJson(
        Map<String, dynamic> json) =>
    _$_TemplateListSubPage(
      key: json['key'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$$_TemplateListSubPageToJson(
        _$_TemplateListSubPage instance) =>
    <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
    };

_$_TemplateListFilterItem _$$_TemplateListFilterItemFromJson(
        Map<String, dynamic> json) =>
    _$_TemplateListFilterItem(
      key: json['key'] as String,
      type: $enumDecode(_$FilterTypeEnumMap, json['type']),
      value: json['value'] as String,
      color: ColorField.fromJson(json['color'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TemplateListFilterItemToJson(
        _$_TemplateListFilterItem instance) =>
    <String, dynamic>{
      'key': instance.key,
      'type': _$FilterTypeEnumMap[instance.type]!,
      'value': instance.value,
      'color': instance.color,
    };

const _$FilterTypeEnumMap = {
  FilterType.number: 'number',
  FilterType.string: 'string',
  FilterType.bool: 'bool',
  FilterType.boolCard: 'boolCard',
};

_$_TemplateList _$$_TemplateListFromJson(Map<String, dynamic> json) =>
    _$_TemplateList(
      type: json['type'] == null
          ? TemplateType.imageList
          : TemplateType._fromValue(json['type'] as String),
      name: json['name'] as String,
      subPages: (json['subPages'] as List<dynamic>)
          .map((e) => TemplateListSubPage.fromJson(e as Map<String, dynamic>))
          .toList(),
      filters: (json['filters'] as List<dynamic>)
          .map(
              (e) => TemplateListFilterItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      script: ScriptField.fromJson(json['script'] as Map<String, dynamic>),
      disableUnchanged: json['disableUnchanged'] as bool,
      targetItem: json['targetItem'] as String,
      targetAutoComplete: json['targetAutoComplete'] as String,
    );

Map<String, dynamic> _$$_TemplateListToJson(_$_TemplateList instance) =>
    <String, dynamic>{
      'type': TemplateType._toValue(instance.type),
      'name': instance.name,
      'subPages': instance.subPages,
      'filters': instance.filters,
      'script': instance.script,
      'disableUnchanged': instance.disableUnchanged,
      'targetItem': instance.targetItem,
      'targetAutoComplete': instance.targetAutoComplete,
    };

_$_TemplateAutoComplete _$$_TemplateAutoCompleteFromJson(
        Map<String, dynamic> json) =>
    _$_TemplateAutoComplete(
      type: json['type'] == null
          ? TemplateType.autoComplete
          : TemplateType._fromValue(json['type'] as String),
      splitChar: json['splitChar'] as String? ?? ' ',
      timeout: json['timeout'] as int? ?? 200,
      script: json['script'] == null
          ? null
          : ScriptField.fromJson(json['script'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TemplateAutoCompleteToJson(
        _$_TemplateAutoComplete instance) =>
    <String, dynamic>{
      'type': TemplateType._toValue(instance.type),
      'splitChar': instance.splitChar,
      'timeout': instance.timeout,
      'script': instance.script,
    };
