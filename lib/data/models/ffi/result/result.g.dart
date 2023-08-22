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
          ?.map((e) => DetailPreviewItem.fromJson(e as Map<String, dynamic>))
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
      envs: (json['envs'] as List<dynamic>)
          .map((e) => EnvResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      errors: (json['errors'] as List<dynamic>)
          .map((e) => ParserError.fromJson(e as Map<String, dynamic>))
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
      'envs': instance.envs,
      'errors': instance.errors,
    };

_$_AutoCompleteResultItem _$$_AutoCompleteResultItemFromJson(
        Map<String, dynamic> json) =>
    _$_AutoCompleteResultItem(
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      complete: json['complete'] as String?,
    );

Map<String, dynamic> _$$_AutoCompleteResultItemToJson(
        _$_AutoCompleteResultItem instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'complete': instance.complete,
    };

_$_AutoCompleteResult _$$_AutoCompleteResultFromJson(
        Map<String, dynamic> json) =>
    _$_AutoCompleteResult(
      items: (json['items'] as List<dynamic>?)
          ?.map(
              (e) => AutoCompleteResultItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      isSuccess: json['isSuccess'] as bool?,
      failMessage: json['failMessage'] as String?,
      envs: (json['envs'] as List<dynamic>)
          .map((e) => EnvResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      errors: (json['errors'] as List<dynamic>)
          .map((e) => ParserError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AutoCompleteResultToJson(
        _$_AutoCompleteResult instance) =>
    <String, dynamic>{
      'items': instance.items,
      'isSuccess': instance.isSuccess,
      'failMessage': instance.failMessage,
      'envs': instance.envs,
      'errors': instance.errors,
    };

_$_ImageReaderResult _$$_ImageReaderResultFromJson(Map<String, dynamic> json) =>
    _$_ImageReaderResult(
      image: json['image'] == null
          ? null
          : ImageResult.fromJson(json['image'] as Map<String, dynamic>),
      largerImage: json['largerImage'] == null
          ? null
          : ImageResult.fromJson(json['largerImage'] as Map<String, dynamic>),
      rawImage: json['rawImage'] == null
          ? null
          : ImageResult.fromJson(json['rawImage'] as Map<String, dynamic>),
      uploadTime: json['uploadTime'] as String?,
      source: json['source'] as String?,
      rating: json['rating'] as String?,
      score: (json['score'] as num?)?.toDouble(),
      badges: (json['badges'] as List<dynamic>?)
          ?.map((e) => TagResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => TagResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => CommentResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      isSuccess: json['isSuccess'] as bool?,
      failMessage: json['failMessage'] as String?,
      envs: (json['envs'] as List<dynamic>)
          .map((e) => EnvResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      errors: (json['errors'] as List<dynamic>)
          .map((e) => ParserError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ImageReaderResultToJson(
        _$_ImageReaderResult instance) =>
    <String, dynamic>{
      'image': instance.image,
      'largerImage': instance.largerImage,
      'rawImage': instance.rawImage,
      'uploadTime': instance.uploadTime,
      'source': instance.source,
      'rating': instance.rating,
      'score': instance.score,
      'badges': instance.badges,
      'tags': instance.tags,
      'comments': instance.comments,
      'isSuccess': instance.isSuccess,
      'failMessage': instance.failMessage,
      'envs': instance.envs,
      'errors': instance.errors,
    };

_$_ListParserResultItem _$$_ListParserResultItemFromJson(
        Map<String, dynamic> json) =>
    _$_ListParserResultItem(
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      uploadTime: json['uploadTime'] as String?,
      star: (json['star'] as num?)?.toDouble(),
      imageCount: json['imageCount'] as int?,
      previewImage: json['previewImage'] == null
          ? null
          : ImageResult.fromJson(json['previewImage'] as Map<String, dynamic>),
      badges: (json['badges'] as List<dynamic>?)
          ?.map((e) => TagResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => TagResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      target: json['target'] as String?,
      language: json['language'] as String?,
      paper: json['paper'] as String?,
    );

Map<String, dynamic> _$$_ListParserResultItemToJson(
        _$_ListParserResultItem instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'uploadTime': instance.uploadTime,
      'star': instance.star,
      'imageCount': instance.imageCount,
      'previewImage': instance.previewImage,
      'badges': instance.badges,
      'tags': instance.tags,
      'target': instance.target,
      'language': instance.language,
      'paper': instance.paper,
    };

_$_ListParserResult _$$_ListParserResultFromJson(Map<String, dynamic> json) =>
    _$_ListParserResult(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ListParserResultItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPage: json['nextPage'] as String?,
      isSuccess: json['isSuccess'] as bool?,
      failMessage: json['failMessage'] as String?,
      envs: (json['envs'] as List<dynamic>)
          .map((e) => EnvResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      errors: (json['errors'] as List<dynamic>)
          .map((e) => ParserError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ListParserResultToJson(_$_ListParserResult instance) =>
    <String, dynamic>{
      'items': instance.items,
      'nextPage': instance.nextPage,
      'isSuccess': instance.isSuccess,
      'failMessage': instance.failMessage,
      'envs': instance.envs,
      'errors': instance.errors,
    };
