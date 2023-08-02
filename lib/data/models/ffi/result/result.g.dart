// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PreviewItem _$$_PreviewItemFromJson(Map<String, dynamic> json) =>
    _$_PreviewItem(
      previewImage: json['previewImage'] == null
          ? null
          : ImageResult.fromJson(json['previewImage'] as Map<String, dynamic>),
      target: json['target'] as String?,
    );

Map<String, dynamic> _$$_PreviewItemToJson(_$_PreviewItem instance) =>
    <String, dynamic>{
      'previewImage': instance.previewImage,
      'target': instance.target,
    };

_$_DetailParserResult _$$_DetailParserResultFromJson(
        Map<String, dynamic> json) =>
    _$_DetailParserResult(
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      language: json['language'] as String?,
      imageCount: json['imageCount'] as int?,
      uploadTime: json['uploadTime'] as String?,
      countPrePage: json['countPrePage'] as int?,
      description: json['description'] as String?,
      star: (json['star'] as num?)?.toDouble(),
      previews: (json['previews'] as List<dynamic>?)
          ?.map((e) => PreviewItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      coverImage: json['coverImage'] == null
          ? null
          : ImageResult.fromJson(json['coverImage'] as Map<String, dynamic>),
      badges: (json['badges'] as List<dynamic>?)
          ?.map((e) => TagResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => TagResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => CommentResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPage: json['nextPage'] as String?,
      isSuccess: json['isSuccess'] as bool?,
      failMessage: json['failMessage'] as String?,
      env: (json['env'] as List<dynamic>?)
          ?.map((e) => EnvResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_DetailParserResultToJson(
        _$_DetailParserResult instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'language': instance.language,
      'imageCount': instance.imageCount,
      'uploadTime': instance.uploadTime,
      'countPrePage': instance.countPrePage,
      'description': instance.description,
      'star': instance.star,
      'previews': instance.previews,
      'coverImage': instance.coverImage,
      'badges': instance.badges,
      'tags': instance.tags,
      'comments': instance.comments,
      'nextPage': instance.nextPage,
      'isSuccess': instance.isSuccess,
      'failMessage': instance.failMessage,
      'env': instance.env,
    };
