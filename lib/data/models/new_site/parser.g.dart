// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parser.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ParserModelImageReaderImpl _$$ParserModelImageReaderImplFromJson(
        Map<String, dynamic> json) =>
    _$ParserModelImageReaderImpl(
      name: json['name'] as String? ?? '',
      uuid: json['uuid'] as String? ?? '',
      parserType:
          $enumDecodeNullable(_$ParserTypeEnumMap, json['parserType']) ??
              ParserType.imageReader,
      extra: (json['extra'] as List<dynamic>?)
              ?.map(
                  (e) => ExtraSelectorModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      id: json['id'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(json['id'] as Map<String, dynamic>),
      image: json['image'] == null
          ? const ImageSelectorModel()
          : ImageSelectorModel.fromJson(json['image'] as Map<String, dynamic>),
      largerImage: json['largerImage'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(json['largerImage'] as Map<String, dynamic>),
      rawImage: json['rawImage'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(json['rawImage'] as Map<String, dynamic>),
      rating: json['rating'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(json['rating'] as Map<String, dynamic>),
      score: json['score'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(json['score'] as Map<String, dynamic>),
      source: json['source'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(json['source'] as Map<String, dynamic>),
      uploadTime: json['uploadTime'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(json['uploadTime'] as Map<String, dynamic>),
      successSelector: json['successSelector'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(
              json['successSelector'] as Map<String, dynamic>),
      failedSelector: json['failedSelector'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(
              json['failedSelector'] as Map<String, dynamic>),
      badgeSelector: json['badgeSelector'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(
              json['badgeSelector'] as Map<String, dynamic>),
      badgeItem: json['badgeItem'] == null
          ? const TagSelectorModel()
          : TagSelectorModel.fromJson(
              json['badgeItem'] as Map<String, dynamic>),
      tagSelector: json['tagSelector'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(json['tagSelector'] as Map<String, dynamic>),
      tagItem: json['tagItem'] == null
          ? const TagSelectorModel()
          : TagSelectorModel.fromJson(json['tagItem'] as Map<String, dynamic>),
      commentSelector: json['commentSelector'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(
              json['commentSelector'] as Map<String, dynamic>),
      commentItem: json['commentItem'] == null
          ? const CommentSelectorModel()
          : CommentSelectorModel.fromJson(
              json['commentItem'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ParserModelImageReaderImplToJson(
        _$ParserModelImageReaderImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uuid': instance.uuid,
      'parserType': _$ParserTypeEnumMap[instance.parserType]!,
      'extra': instance.extra,
      'id': instance.id,
      'image': instance.image,
      'largerImage': instance.largerImage,
      'rawImage': instance.rawImage,
      'rating': instance.rating,
      'score': instance.score,
      'source': instance.source,
      'uploadTime': instance.uploadTime,
      'successSelector': instance.successSelector,
      'failedSelector': instance.failedSelector,
      'badgeSelector': instance.badgeSelector,
      'badgeItem': instance.badgeItem,
      'tagSelector': instance.tagSelector,
      'tagItem': instance.tagItem,
      'commentSelector': instance.commentSelector,
      'commentItem': instance.commentItem,
    };

const _$ParserTypeEnumMap = {
  ParserType.imageReader: 'imageReader',
  ParserType.listView: 'listView',
  ParserType.autoComplete: 'autoComplete',
  ParserType.detail: 'detail',
};
