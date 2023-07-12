// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parser_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListParserItem _$$_ListParserItemFromJson(Map<String, dynamic> json) =>
    _$_ListParserItem(
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      uploadTime: json['uploadTime'] as String?,
      star: (json['star'] as num?)?.toDouble(),
      imgCount: json['imgCount'] as int?,
      previewImg:
          ImageRspModel.fromJson(json['previewImg'] as Map<String, dynamic>),
      language: json['language'] as String?,
      tag: json['tag'] == null
          ? null
          : TagRspModel.fromJson(json['tag'] as Map<String, dynamic>),
      badges: (json['badges'] as List<dynamic>)
          .map((e) => TagRspModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      paper: json['paper'] as String?,
      target: json['target'] as String?,
      nextPage: json['nextPage'] as String?,
      env: Map<String, String>.from(json['env'] as Map),
    );

Map<String, dynamic> _$$_ListParserItemToJson(_$_ListParserItem instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'uploadTime': instance.uploadTime,
      'star': instance.star,
      'imgCount': instance.imgCount,
      'previewImg': instance.previewImg,
      'language': instance.language,
      'tag': instance.tag,
      'badges': instance.badges,
      'paper': instance.paper,
      'target': instance.target,
      'nextPage': instance.nextPage,
      'env': instance.env,
    };

_$_ListParserResult _$$_ListParserResultFromJson(Map<String, dynamic> json) =>
    _$_ListParserResult(
      items: (json['items'] as List<dynamic>)
          .map((e) => ListParserResultItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPage: json['nextPage'] as String,
      enableSuccess: json['enableSuccess'] as bool,
      enableFail: json['enableFail'] as bool,
      isSuccess: json['isSuccess'] as bool,
      failedMessage: json['failedMessage'] as String,
      localEnv: Map<String, String>.from(json['localEnv'] as Map),
      globalEnv: Map<String, String>.from(json['globalEnv'] as Map),
    );

Map<String, dynamic> _$$_ListParserResultToJson(_$_ListParserResult instance) =>
    <String, dynamic>{
      'items': instance.items,
      'nextPage': instance.nextPage,
      'enableSuccess': instance.enableSuccess,
      'enableFail': instance.enableFail,
      'isSuccess': instance.isSuccess,
      'failedMessage': instance.failedMessage,
      'localEnv': instance.localEnv,
      'globalEnv': instance.globalEnv,
    };

_$_GalleryParserResult _$$_GalleryParserResultFromJson(
        Map<String, dynamic> json) =>
    _$_GalleryParserResult(
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      language: json['language'] as String?,
      imageCount: json['imageCount'] as int?,
      uploadTime: json['uploadTime'] as String?,
      countPrePage: json['countPrePage'] as int?,
      description: json['description'] as String?,
      star: (json['star'] as num?)?.toDouble(),
      items: (json['items'] as List<dynamic>)
          .map((e) =>
              GalleryParserResultItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      coverImg: json['coverImg'] == null
          ? null
          : ImageRspModel.fromJson(json['coverImg'] as Map<String, dynamic>),
      tag: json['tag'] == null
          ? null
          : TagRspModel.fromJson(json['tag'] as Map<String, dynamic>),
      badges: (json['badges'] as List<dynamic>)
          .map((e) => TagRspModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      comments: (json['comments'] as List<dynamic>)
          .map((e) =>
              GalleryParserResultComment.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPage: json['nextPage'] as String?,
      enableSuccess: json['enableSuccess'] as bool?,
      enableFail: json['enableFail'] as bool?,
      isSuccess: json['isSuccess'] as bool?,
      failedMessage: json['failedMessage'] as String?,
      localEnv: Map<String, String>.from(json['localEnv'] as Map),
      globalEnv: Map<String, String>.from(json['globalEnv'] as Map),
    );

Map<String, dynamic> _$$_GalleryParserResultToJson(
        _$_GalleryParserResult instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'language': instance.language,
      'imageCount': instance.imageCount,
      'uploadTime': instance.uploadTime,
      'countPrePage': instance.countPrePage,
      'description': instance.description,
      'star': instance.star,
      'items': instance.items,
      'coverImg': instance.coverImg,
      'tag': instance.tag,
      'badges': instance.badges,
      'comments': instance.comments,
      'nextPage': instance.nextPage,
      'enableSuccess': instance.enableSuccess,
      'enableFail': instance.enableFail,
      'isSuccess': instance.isSuccess,
      'failedMessage': instance.failedMessage,
      'localEnv': instance.localEnv,
      'globalEnv': instance.globalEnv,
    };

_$_GalleryParserResultComment _$$_GalleryParserResultCommentFromJson(
        Map<String, dynamic> json) =>
    _$_GalleryParserResultComment(
      username: json['username'] as String?,
      content: json['content'] as String,
      time: json['time'] as String?,
      score: json['score'] as String?,
      avatar: ImageRspModel.fromJson(json['avatar'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_GalleryParserResultCommentToJson(
        _$_GalleryParserResultComment instance) =>
    <String, dynamic>{
      'username': instance.username,
      'content': instance.content,
      'time': instance.time,
      'score': instance.score,
      'avatar': instance.avatar,
    };

_$_GalleryParserResultItem _$$_GalleryParserResultItemFromJson(
        Map<String, dynamic> json) =>
    _$_GalleryParserResultItem(
      previewImg:
          ImageRspModel.fromJson(json['previewImg'] as Map<String, dynamic>),
      target: json['target'] as String?,
    );

Map<String, dynamic> _$$_GalleryParserResultItemToJson(
        _$_GalleryParserResultItem instance) =>
    <String, dynamic>{
      'previewImg': instance.previewImg,
      'target': instance.target,
    };

_$_ImageReaderParserResult _$$_ImageReaderParserResultFromJson(
        Map<String, dynamic> json) =>
    _$_ImageReaderParserResult(
      image: ImageRspModel.fromJson(json['image'] as Map<String, dynamic>),
      largerImageUrl: json['largerImageUrl'] as String?,
      rawImageUrl: json['rawImageUrl'] as String?,
      uploadTime: json['uploadTime'] as String?,
      source: json['source'] as String?,
      rating: json['rating'] as String?,
      score: json['score'] as String?,
      badges: (json['badges'] as List<dynamic>)
          .map((e) => TagRspModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      localEnv: Map<String, String>.from(json['localEnv'] as Map),
      globalEnv: Map<String, String>.from(json['globalEnv'] as Map),
      enableSuccess: json['enableSuccess'] as bool?,
      enableFail: json['enableFail'] as bool?,
      isSuccess: json['isSuccess'] as bool?,
      failedMessage: json['failedMessage'] as String?,
    );

Map<String, dynamic> _$$_ImageReaderParserResultToJson(
        _$_ImageReaderParserResult instance) =>
    <String, dynamic>{
      'image': instance.image,
      'largerImageUrl': instance.largerImageUrl,
      'rawImageUrl': instance.rawImageUrl,
      'uploadTime': instance.uploadTime,
      'source': instance.source,
      'rating': instance.rating,
      'score': instance.score,
      'badges': instance.badges,
      'localEnv': instance.localEnv,
      'globalEnv': instance.globalEnv,
      'enableSuccess': instance.enableSuccess,
      'enableFail': instance.enableFail,
      'isSuccess': instance.isSuccess,
      'failedMessage': instance.failedMessage,
    };

_$_AutoCompleteParserResultItem _$$_AutoCompleteParserResultItemFromJson(
        Map<String, dynamic> json) =>
    _$_AutoCompleteParserResultItem(
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      complete: json['complete'] as String?,
    );

Map<String, dynamic> _$$_AutoCompleteParserResultItemToJson(
        _$_AutoCompleteParserResultItem instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'complete': instance.complete,
    };

_$_AutoCompleteParserResult _$$_AutoCompleteParserResultFromJson(
        Map<String, dynamic> json) =>
    _$_AutoCompleteParserResult(
      items: (json['items'] as List<dynamic>)
          .map((e) =>
              AutoCompleteParserResultItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      localEnv: Map<String, String>.from(json['localEnv'] as Map),
      globalEnv: Map<String, String>.from(json['globalEnv'] as Map),
      enableSuccess: json['enableSuccess'] as bool?,
      enableFail: json['enableFail'] as bool?,
      isSuccess: json['isSuccess'] as bool?,
      failedMessage: json['failedMessage'] as String?,
    );

Map<String, dynamic> _$$_AutoCompleteParserResultToJson(
        _$_AutoCompleteParserResult instance) =>
    <String, dynamic>{
      'items': instance.items,
      'localEnv': instance.localEnv,
      'globalEnv': instance.globalEnv,
      'enableSuccess': instance.enableSuccess,
      'enableFail': instance.enableFail,
      'isSuccess': instance.isSuccess,
      'failedMessage': instance.failedMessage,
    };
