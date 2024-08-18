// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImageResultImpl _$$ImageResultImplFromJson(Map<String, dynamic> json) =>
    _$ImageResultImpl(
      url: json['url'] as String?,
      cacheKey: json['cacheKey'] as String?,
      width: (json['width'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      x: (json['x'] as num?)?.toDouble(),
      y: (json['y'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$ImageResultImplToJson(_$ImageResultImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'cacheKey': instance.cacheKey,
      'width': instance.width,
      'height': instance.height,
      'x': instance.x,
      'y': instance.y,
    };

_$CommentResultImpl _$$CommentResultImplFromJson(Map<String, dynamic> json) =>
    _$CommentResultImpl(
      username: json['username'] as String?,
      content: json['content'] as String?,
      time: json['time'] as String?,
      score: json['score'] as String?,
      avatar: json['avatar'] == null
          ? null
          : ImageResult.fromJson(json['avatar'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CommentResultImplToJson(_$CommentResultImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'content': instance.content,
      'time': instance.time,
      'score': instance.score,
      'avatar': instance.avatar,
    };

_$TagResultImpl _$$TagResultImplFromJson(Map<String, dynamic> json) =>
    _$TagResultImpl(
      text: json['text'] as String?,
      color: json['color'] as String?,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$$TagResultImplToJson(_$TagResultImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'color': instance.color,
      'category': instance.category,
    };

_$EnvResultImpl _$$EnvResultImplFromJson(Map<String, dynamic> json) =>
    _$EnvResultImpl(
      id: json['id'] as String?,
      global: json['global'] as bool?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$$EnvResultImplToJson(_$EnvResultImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'global': instance.global,
      'value': instance.value,
    };

_$ParserErrorImpl _$$ParserErrorImplFromJson(Map<String, dynamic> json) =>
    _$ParserErrorImpl(
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$$ParserErrorImplToJson(_$ParserErrorImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
