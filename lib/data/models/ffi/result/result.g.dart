// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PreviewItemImpl _$$PreviewItemImplFromJson(Map<String, dynamic> json) =>
    _$PreviewItemImpl(
      previewImage: json['previewImage'] == null
          ? null
          : ImageResult.fromJson(json['previewImage'] as Map<String, dynamic>),
      target: json['target'] as String?,
    );

Map<String, dynamic> _$$PreviewItemImplToJson(_$PreviewItemImpl instance) =>
    <String, dynamic>{
      'previewImage': instance.previewImage,
      'target': instance.target,
    };

_$DetailParserResultImpl _$$DetailParserResultImplFromJson(
        Map<String, dynamic> json) =>
    _$DetailParserResultImpl(
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      language: json['language'] as String?,
      imageCount: (json['imageCount'] as num?)?.toInt(),
      uploadTime: json['uploadTime'] as String?,
      countPrePage: (json['countPrePage'] as num?)?.toInt(),
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

Map<String, dynamic> _$$DetailParserResultImplToJson(
        _$DetailParserResultImpl instance) =>
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

_$AutoCompleteResultItemImpl _$$AutoCompleteResultItemImplFromJson(
        Map<String, dynamic> json) =>
    _$AutoCompleteResultItemImpl(
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      complete: json['complete'] as String?,
    );

Map<String, dynamic> _$$AutoCompleteResultItemImplToJson(
        _$AutoCompleteResultItemImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'complete': instance.complete,
    };

_$AutoCompleteResultImpl _$$AutoCompleteResultImplFromJson(
        Map<String, dynamic> json) =>
    _$AutoCompleteResultImpl(
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

Map<String, dynamic> _$$AutoCompleteResultImplToJson(
        _$AutoCompleteResultImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
      'isSuccess': instance.isSuccess,
      'failMessage': instance.failMessage,
      'envs': instance.envs,
      'errors': instance.errors,
    };

_$ImageReaderResultImpl _$$ImageReaderResultImplFromJson(
        Map<String, dynamic> json) =>
    _$ImageReaderResultImpl(
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

Map<String, dynamic> _$$ImageReaderResultImplToJson(
        _$ImageReaderResultImpl instance) =>
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

_$ListParserResultItemImpl _$$ListParserResultItemImplFromJson(
        Map<String, dynamic> json) =>
    _$ListParserResultItemImpl(
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      uploadTime: json['uploadTime'] as String?,
      star: (json['star'] as num?)?.toDouble(),
      imageCount: (json['imageCount'] as num?)?.toInt(),
      previewImage: json['previewImage'] == null
          ? null
          : ImageResult.fromJson(json['previewImage'] as Map<String, dynamic>),
      badges: (json['badges'] as List<dynamic>?)
          ?.map((e) => TagResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => TagResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      idCode: json['idCode'] as String?,
      language: json['language'] as String?,
      paper: json['paper'] as String?,
    );

Map<String, dynamic> _$$ListParserResultItemImplToJson(
        _$ListParserResultItemImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'uploadTime': instance.uploadTime,
      'star': instance.star,
      'imageCount': instance.imageCount,
      'previewImage': instance.previewImage,
      'badges': instance.badges,
      'tags': instance.tags,
      'idCode': instance.idCode,
      'language': instance.language,
      'paper': instance.paper,
    };

_$ListParserResultImpl _$$ListParserResultImplFromJson(
        Map<String, dynamic> json) =>
    _$ListParserResultImpl(
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

Map<String, dynamic> _$$ListParserResultImplToJson(
        _$ListParserResultImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
      'nextPage': instance.nextPage,
      'isSuccess': instance.isSuccess,
      'failMessage': instance.failMessage,
      'envs': instance.envs,
      'errors': instance.errors,
    };
