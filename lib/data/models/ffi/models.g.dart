// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ImageRspModel _$$_ImageRspModelFromJson(Map<String, dynamic> json) =>
    _$_ImageRspModel(
      url: json['url'] as String,
      cacheKey: json['cacheKey'] as String,
      width: (json['width'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      imgX: (json['imgX'] as num).toDouble(),
      imgY: (json['imgY'] as num).toDouble(),
    );

Map<String, dynamic> _$$_ImageRspModelToJson(_$_ImageRspModel instance) =>
    <String, dynamic>{
      'url': instance.url,
      'cacheKey': instance.cacheKey,
      'width': instance.width,
      'height': instance.height,
      'imgX': instance.imgX,
      'imgY': instance.imgY,
    };

_$_ColorRspModel _$$_ColorRspModelFromJson(Map<String, dynamic> json) =>
    _$_ColorRspModel(
      a: json['a'] as int?,
      r: json['r'] as int,
      g: json['g'] as int,
      b: json['b'] as int,
    );

Map<String, dynamic> _$$_ColorRspModelToJson(_$_ColorRspModel instance) =>
    <String, dynamic>{
      'a': instance.a,
      'r': instance.r,
      'g': instance.g,
      'b': instance.b,
    };

_$_TagRspModel _$$_TagRspModelFromJson(Map<String, dynamic> json) =>
    _$_TagRspModel(
      text: json['text'] as String,
      color: ColorRspModel.fromJson(json['color'] as Map<String, dynamic>),
      category: json['category'] as String,
    );

Map<String, dynamic> _$$_TagRspModelToJson(_$_TagRspModel instance) =>
    <String, dynamic>{
      'text': instance.text,
      'color': instance.color,
      'category': instance.category,
    };
