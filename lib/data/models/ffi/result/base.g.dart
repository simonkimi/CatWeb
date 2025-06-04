// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ImageResult _$ImageResultFromJson(Map<String, dynamic> json) => _ImageResult(
      url: json['url'] as String?,
      cacheKey: json['cacheKey'] as String?,
      width: (json['width'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      x: (json['x'] as num?)?.toDouble(),
      y: (json['y'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ImageResultToJson(_ImageResult instance) =>
    <String, dynamic>{
      'url': instance.url,
      'cacheKey': instance.cacheKey,
      'width': instance.width,
      'height': instance.height,
      'x': instance.x,
      'y': instance.y,
    };

_CommentResult _$CommentResultFromJson(Map<String, dynamic> json) =>
    _CommentResult(
      username: json['username'] as String?,
      content: json['content'] as String?,
      time: json['time'] as String?,
      score: json['score'] as String?,
      avatar: json['avatar'] == null
          ? null
          : ImageResult.fromJson(json['avatar'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommentResultToJson(_CommentResult instance) =>
    <String, dynamic>{
      'username': instance.username,
      'content': instance.content,
      'time': instance.time,
      'score': instance.score,
      'avatar': instance.avatar,
    };

_TagResult _$TagResultFromJson(Map<String, dynamic> json) => _TagResult(
      text: json['text'] as String?,
      color: json['color'] as String?,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$TagResultToJson(_TagResult instance) =>
    <String, dynamic>{
      'text': instance.text,
      'color': instance.color,
      'category': instance.category,
    };

_EnvResult _$EnvResultFromJson(Map<String, dynamic> json) => _EnvResult(
      id: json['id'] as String?,
      global: json['global'] as bool?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$EnvResultToJson(_EnvResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'global': instance.global,
      'value': instance.value,
    };

_ParserError _$ParserErrorFromJson(Map<String, dynamic> json) => _ParserError(
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$ParserErrorToJson(_ParserError instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
