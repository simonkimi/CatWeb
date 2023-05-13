// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parser.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ImageReaderParser _$$_ImageReaderParserFromJson(Map<String, dynamic> json) =>
    _$_ImageReaderParser(
      parserType: json['parserType'] == null
          ? ParserType.imageReader
          : ParserType._fromType(json['parserType'] as String),
      name: json['name'] as String,
      uuid: json['uuid'] as String,
      extra: (json['extra'] as List<dynamic>?)
              ?.map((e) => ExtraSelector.fromJson(e as Map<String, dynamic>)) ??
          const [],
      image: json['image'] == null
          ? const ImageSelector()
          : ImageSelector.fromJson(json['image'] as Map<String, dynamic>),
      largerImage: json['largerImage'] == null
          ? const Selector()
          : Selector.fromJson(json['largerImage'] as Map<String, dynamic>),
      rawImage: json['rawImage'] == null
          ? const Selector()
          : Selector.fromJson(json['rawImage'] as Map<String, dynamic>),
      rating: json['rating'] == null
          ? const Selector()
          : Selector.fromJson(json['rating'] as Map<String, dynamic>),
      score: json['score'] == null
          ? const Selector()
          : Selector.fromJson(json['score'] as Map<String, dynamic>),
      source: json['source'] == null
          ? const Selector()
          : Selector.fromJson(json['source'] as Map<String, dynamic>),
      uploadTime: json['uploadTime'] == null
          ? const Selector()
          : Selector.fromJson(json['uploadTime'] as Map<String, dynamic>),
      successSelector: json['successSelector'] == null
          ? const Selector()
          : Selector.fromJson(json['successSelector'] as Map<String, dynamic>),
      failedSelector: json['failedSelector'] == null
          ? const Selector()
          : Selector.fromJson(json['failedSelector'] as Map<String, dynamic>),
      badgeSelector: json['badgeSelector'] == null
          ? const Selector()
          : Selector.fromJson(json['badgeSelector'] as Map<String, dynamic>),
      badgeText: json['badgeText'] == null
          ? const Selector()
          : Selector.fromJson(json['badgeText'] as Map<String, dynamic>),
      badgeCategory: json['badgeCategory'] == null
          ? const Selector()
          : Selector.fromJson(json['badgeCategory'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ImageReaderParserToJson(
        _$_ImageReaderParser instance) =>
    <String, dynamic>{
      'parserType': ParserType._toType(instance.parserType),
      'name': instance.name,
      'uuid': instance.uuid,
      'extra': instance.extra?.toList(),
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
      'badgeText': instance.badgeText,
      'badgeCategory': instance.badgeCategory,
    };

_$_GalleryParser _$$_GalleryParserFromJson(Map<String, dynamic> json) =>
    _$_GalleryParser(
      parserType: json['parserType'] == null
          ? ParserType.gallery
          : ParserType._fromType(json['parserType'] as String),
      name: json['name'] as String,
      uuid: json['uuid'] as String,
      extra: (json['extra'] as List<dynamic>?)
              ?.map((e) => ExtraSelector.fromJson(e as Map<String, dynamic>)) ??
          const [],
      title: json['title'] == null
          ? const Selector()
          : Selector.fromJson(json['title'] as Map<String, dynamic>),
      subtitle: json['subtitle'] == null
          ? const Selector()
          : Selector.fromJson(json['subtitle'] as Map<String, dynamic>),
      uploadTime: json['uploadTime'] == null
          ? const Selector()
          : Selector.fromJson(json['uploadTime'] as Map<String, dynamic>),
      star: json['star'] == null
          ? const Selector()
          : Selector.fromJson(json['star'] as Map<String, dynamic>),
      imgCount: json['imgCount'] == null
          ? const Selector()
          : Selector.fromJson(json['imgCount'] as Map<String, dynamic>),
      pageCount: json['pageCount'] == null
          ? const Selector()
          : Selector.fromJson(json['pageCount'] as Map<String, dynamic>),
      language: json['language'] == null
          ? const Selector()
          : Selector.fromJson(json['language'] as Map<String, dynamic>),
      coverImg: json['coverImg'] == null
          ? const ImageSelector()
          : ImageSelector.fromJson(json['coverImg'] as Map<String, dynamic>),
      description: json['description'] == null
          ? const Selector()
          : Selector.fromJson(json['description'] as Map<String, dynamic>),
      successSelector: json['successSelector'] == null
          ? const Selector()
          : Selector.fromJson(json['successSelector'] as Map<String, dynamic>),
      failedSelector: json['failedSelector'] == null
          ? const Selector()
          : Selector.fromJson(json['failedSelector'] as Map<String, dynamic>),
      thumbnailSelector: json['thumbnailSelector'] == null
          ? const Selector()
          : Selector.fromJson(
              json['thumbnailSelector'] as Map<String, dynamic>),
      thumbnail: json['thumbnail'] == null
          ? const ImageSelector()
          : ImageSelector.fromJson(json['thumbnail'] as Map<String, dynamic>),
      target: json['target'] == null
          ? const Selector()
          : Selector.fromJson(json['target'] as Map<String, dynamic>),
      commentSelector: json['commentSelector'] == null
          ? const Selector()
          : Selector.fromJson(json['commentSelector'] as Map<String, dynamic>),
      comments: json['comments'] == null
          ? const CommentSelector()
          : CommentSelector.fromJson(json['comments'] as Map<String, dynamic>),
      tag: json['tag'] == null
          ? const Selector()
          : Selector.fromJson(json['tag'] as Map<String, dynamic>),
      tagColor: json['tagColor'] == null
          ? const Selector()
          : Selector.fromJson(json['tagColor'] as Map<String, dynamic>),
      badgeSelector: json['badgeSelector'] == null
          ? const Selector()
          : Selector.fromJson(json['badgeSelector'] as Map<String, dynamic>),
      badgeText: json['badgeText'] == null
          ? const Selector()
          : Selector.fromJson(json['badgeText'] as Map<String, dynamic>),
      badgeCategory: json['badgeCategory'] == null
          ? const Selector()
          : Selector.fromJson(json['badgeCategory'] as Map<String, dynamic>),
      chapterSelector: json['chapterSelector'] == null
          ? const Selector()
          : Selector.fromJson(json['chapterSelector'] as Map<String, dynamic>),
      chapterTitle: json['chapterTitle'] == null
          ? const Selector()
          : Selector.fromJson(json['chapterTitle'] as Map<String, dynamic>),
      chapterSubtitle: json['chapterSubtitle'] == null
          ? const Selector()
          : Selector.fromJson(json['chapterSubtitle'] as Map<String, dynamic>),
      chapterCover: json['chapterCover'] == null
          ? const ImageSelector()
          : ImageSelector.fromJson(
              json['chapterCover'] as Map<String, dynamic>),
      nextPage: json['nextPage'] == null
          ? const Selector()
          : Selector.fromJson(json['nextPage'] as Map<String, dynamic>),
      countPrePage: json['countPrePage'] == null
          ? const Selector()
          : Selector.fromJson(json['countPrePage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_GalleryParserToJson(_$_GalleryParser instance) =>
    <String, dynamic>{
      'parserType': ParserType._toType(instance.parserType),
      'name': instance.name,
      'uuid': instance.uuid,
      'extra': instance.extra?.toList(),
      'title': instance.title,
      'subtitle': instance.subtitle,
      'uploadTime': instance.uploadTime,
      'star': instance.star,
      'imgCount': instance.imgCount,
      'pageCount': instance.pageCount,
      'language': instance.language,
      'coverImg': instance.coverImg,
      'description': instance.description,
      'successSelector': instance.successSelector,
      'failedSelector': instance.failedSelector,
      'thumbnailSelector': instance.thumbnailSelector,
      'thumbnail': instance.thumbnail,
      'target': instance.target,
      'commentSelector': instance.commentSelector,
      'comments': instance.comments,
      'tag': instance.tag,
      'tagColor': instance.tagColor,
      'badgeSelector': instance.badgeSelector,
      'badgeText': instance.badgeText,
      'badgeCategory': instance.badgeCategory,
      'chapterSelector': instance.chapterSelector,
      'chapterTitle': instance.chapterTitle,
      'chapterSubtitle': instance.chapterSubtitle,
      'chapterCover': instance.chapterCover,
      'nextPage': instance.nextPage,
      'countPrePage': instance.countPrePage,
    };

_$_ListViewParser _$$_ListViewParserFromJson(Map<String, dynamic> json) =>
    _$_ListViewParser(
      parserType: json['parserType'] == null
          ? ParserType.listView
          : ParserType._fromType(json['parserType'] as String),
      name: json['name'] as String,
      uuid: json['uuid'] as String,
      extra: (json['extra'] as List<dynamic>?)
              ?.map((e) => ExtraSelector.fromJson(e as Map<String, dynamic>)) ??
          const [],
      itemSelector: json['itemSelector'] == null
          ? const Selector()
          : Selector.fromJson(json['itemSelector'] as Map<String, dynamic>),
      successSelector: json['successSelector'] == null
          ? const Selector()
          : Selector.fromJson(json['successSelector'] as Map<String, dynamic>),
      failedSelector: json['failedSelector'] == null
          ? const Selector()
          : Selector.fromJson(json['failedSelector'] as Map<String, dynamic>),
      title: json['title'] == null
          ? const Selector()
          : Selector.fromJson(json['title'] as Map<String, dynamic>),
      subtitle: json['subtitle'] == null
          ? const Selector()
          : Selector.fromJson(json['subtitle'] as Map<String, dynamic>),
      uploadTime: json['uploadTime'] == null
          ? const Selector()
          : Selector.fromJson(json['uploadTime'] as Map<String, dynamic>),
      star: json['star'] == null
          ? const Selector()
          : Selector.fromJson(json['star'] as Map<String, dynamic>),
      imgCount: json['imgCount'] == null
          ? const Selector()
          : Selector.fromJson(json['imgCount'] as Map<String, dynamic>),
      language: json['language'] == null
          ? const Selector()
          : Selector.fromJson(json['language'] as Map<String, dynamic>),
      previewImg: json['previewImg'] == null
          ? const ImageSelector()
          : ImageSelector.fromJson(json['previewImg'] as Map<String, dynamic>),
      target: json['target'] == null
          ? const Selector()
          : Selector.fromJson(json['target'] as Map<String, dynamic>),
      tag: json['tag'] == null
          ? const Selector()
          : Selector.fromJson(json['tag'] as Map<String, dynamic>),
      tagColor: json['tagColor'] == null
          ? const Selector()
          : Selector.fromJson(json['tagColor'] as Map<String, dynamic>),
      badgeSelector: json['badgeSelector'] == null
          ? const Selector()
          : Selector.fromJson(json['badgeSelector'] as Map<String, dynamic>),
      badgeText: json['badgeText'] == null
          ? const Selector()
          : Selector.fromJson(json['badgeText'] as Map<String, dynamic>),
      badgeColor: json['badgeColor'] == null
          ? const Selector()
          : Selector.fromJson(json['badgeColor'] as Map<String, dynamic>),
      paper: json['paper'] == null
          ? const Selector()
          : Selector.fromJson(json['paper'] as Map<String, dynamic>),
      idCode: json['idCode'] == null
          ? const Selector()
          : Selector.fromJson(json['idCode'] as Map<String, dynamic>),
      nextPage: json['nextPage'] == null
          ? const Selector()
          : Selector.fromJson(json['nextPage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ListViewParserToJson(_$_ListViewParser instance) =>
    <String, dynamic>{
      'parserType': ParserType._toType(instance.parserType),
      'name': instance.name,
      'uuid': instance.uuid,
      'extra': instance.extra?.toList(),
      'itemSelector': instance.itemSelector,
      'successSelector': instance.successSelector,
      'failedSelector': instance.failedSelector,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'uploadTime': instance.uploadTime,
      'star': instance.star,
      'imgCount': instance.imgCount,
      'language': instance.language,
      'previewImg': instance.previewImg,
      'target': instance.target,
      'tag': instance.tag,
      'tagColor': instance.tagColor,
      'badgeSelector': instance.badgeSelector,
      'badgeText': instance.badgeText,
      'badgeColor': instance.badgeColor,
      'paper': instance.paper,
      'idCode': instance.idCode,
      'nextPage': instance.nextPage,
    };

_$_AutoCompleteParser _$$_AutoCompleteParserFromJson(
        Map<String, dynamic> json) =>
    _$_AutoCompleteParser(
      parserType: json['parserType'] == null
          ? ParserType.autoComplete
          : ParserType._fromType(json['parserType'] as String),
      name: json['name'] as String,
      uuid: json['uuid'] as String,
      extra: (json['extra'] as List<dynamic>?)
              ?.map((e) => ExtraSelector.fromJson(e as Map<String, dynamic>)) ??
          const [],
      itemSelector: json['itemSelector'] == null
          ? const Selector()
          : Selector.fromJson(json['itemSelector'] as Map<String, dynamic>),
      itemComplete: json['itemComplete'] == null
          ? const Selector()
          : Selector.fromJson(json['itemComplete'] as Map<String, dynamic>),
      itemTitle: json['itemTitle'] == null
          ? const Selector()
          : Selector.fromJson(json['itemTitle'] as Map<String, dynamic>),
      itemSubtitle: json['itemSubtitle'] == null
          ? const Selector()
          : Selector.fromJson(json['itemSubtitle'] as Map<String, dynamic>),
      successSelector: json['successSelector'] == null
          ? const Selector()
          : Selector.fromJson(json['successSelector'] as Map<String, dynamic>),
      failedSelector: json['failedSelector'] == null
          ? const Selector()
          : Selector.fromJson(json['failedSelector'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AutoCompleteParserToJson(
        _$_AutoCompleteParser instance) =>
    <String, dynamic>{
      'parserType': ParserType._toType(instance.parserType),
      'name': instance.name,
      'uuid': instance.uuid,
      'extra': instance.extra?.toList(),
      'itemSelector': instance.itemSelector,
      'itemComplete': instance.itemComplete,
      'itemTitle': instance.itemTitle,
      'itemSubtitle': instance.itemSubtitle,
      'successSelector': instance.successSelector,
      'failedSelector': instance.failedSelector,
    };
