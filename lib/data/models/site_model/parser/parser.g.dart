// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parser.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageReaderParser _$ImageReaderParserFromJson(Map<String, dynamic> json) =>
    ImageReaderParser(
      name: json['name'] as String,
      uuid: json['uuid'] as String,
      extra: (json['extra'] as List<dynamic>?)
          ?.map((e) => ExtraSelector.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] == null
          ? null
          : Selector.fromJson(json['id'] as Map<String, dynamic>),
      image: json['image'] == null
          ? null
          : ImageSelector.fromJson(json['image'] as Map<String, dynamic>),
      largerImage: json['largerImage'] == null
          ? null
          : Selector.fromJson(json['largerImage'] as Map<String, dynamic>),
      rawImage: json['rawImage'] == null
          ? null
          : Selector.fromJson(json['rawImage'] as Map<String, dynamic>),
      rating: json['rating'] == null
          ? null
          : Selector.fromJson(json['rating'] as Map<String, dynamic>),
      score: json['score'] == null
          ? null
          : Selector.fromJson(json['score'] as Map<String, dynamic>),
      source: json['source'] == null
          ? null
          : Selector.fromJson(json['source'] as Map<String, dynamic>),
      uploadTime: json['uploadTime'] == null
          ? null
          : Selector.fromJson(json['uploadTime'] as Map<String, dynamic>),
      successSelector: json['successSelector'] == null
          ? null
          : Selector.fromJson(json['successSelector'] as Map<String, dynamic>),
      failedSelector: json['failedSelector'] == null
          ? null
          : Selector.fromJson(json['failedSelector'] as Map<String, dynamic>),
      badgeSelector: json['badgeSelector'] == null
          ? null
          : Selector.fromJson(json['badgeSelector'] as Map<String, dynamic>),
      badgeItem: json['badgeItem'] == null
          ? null
          : TagSelector.fromJson(json['badgeItem'] as Map<String, dynamic>),
      tagSelector: json['tagSelector'] == null
          ? null
          : Selector.fromJson(json['tagSelector'] as Map<String, dynamic>),
      tagItem: json['tagItem'] == null
          ? null
          : TagSelector.fromJson(json['tagItem'] as Map<String, dynamic>),
      commentSelector: json['commentSelector'] == null
          ? null
          : Selector.fromJson(json['commentSelector'] as Map<String, dynamic>),
      commentItem: json['commentItem'] == null
          ? null
          : CommentSelector.fromJson(
              json['commentItem'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ImageReaderParserToJson(ImageReaderParser instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uuid': instance.uuid,
      'extra': const ExtraListConverter().toJson(instance.extra),
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

DetailParser _$DetailParserFromJson(Map<String, dynamic> json) => DetailParser(
      name: json['name'] as String,
      uuid: json['uuid'] as String,
      extra: (json['extra'] as List<dynamic>?)
          ?.map((e) => ExtraSelector.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] == null
          ? null
          : Selector.fromJson(json['title'] as Map<String, dynamic>),
      subtitle: json['subtitle'] == null
          ? null
          : Selector.fromJson(json['subtitle'] as Map<String, dynamic>),
      uploadTime: json['uploadTime'] == null
          ? null
          : Selector.fromJson(json['uploadTime'] as Map<String, dynamic>),
      star: json['star'] == null
          ? null
          : Selector.fromJson(json['star'] as Map<String, dynamic>),
      imageCount: json['imageCount'] == null
          ? null
          : Selector.fromJson(json['imageCount'] as Map<String, dynamic>),
      pageCount: json['pageCount'] == null
          ? null
          : Selector.fromJson(json['pageCount'] as Map<String, dynamic>),
      language: json['language'] == null
          ? null
          : Selector.fromJson(json['language'] as Map<String, dynamic>),
      coverImage: json['coverImage'] == null
          ? null
          : ImageSelector.fromJson(json['coverImage'] as Map<String, dynamic>),
      description: json['description'] == null
          ? null
          : Selector.fromJson(json['description'] as Map<String, dynamic>),
      successSelector: json['successSelector'] == null
          ? null
          : Selector.fromJson(json['successSelector'] as Map<String, dynamic>),
      failedSelector: json['failedSelector'] == null
          ? null
          : Selector.fromJson(json['failedSelector'] as Map<String, dynamic>),
      thumbnailSelector: json['thumbnailSelector'] == null
          ? null
          : Selector.fromJson(
              json['thumbnailSelector'] as Map<String, dynamic>),
      thumbnail: json['thumbnail'] == null
          ? null
          : ImageSelector.fromJson(json['thumbnail'] as Map<String, dynamic>),
      target: json['target'] == null
          ? null
          : Selector.fromJson(json['target'] as Map<String, dynamic>),
      commentSelector: json['commentSelector'] == null
          ? null
          : Selector.fromJson(json['commentSelector'] as Map<String, dynamic>),
      comments: json['comments'] == null
          ? null
          : CommentSelector.fromJson(json['comments'] as Map<String, dynamic>),
      badgeSelector: json['badgeSelector'] == null
          ? null
          : Selector.fromJson(json['badgeSelector'] as Map<String, dynamic>),
      badgeItem: json['badgeItem'] == null
          ? null
          : TagSelector.fromJson(json['badgeItem'] as Map<String, dynamic>),
      tagSelector: json['tagSelector'] == null
          ? null
          : Selector.fromJson(json['tagSelector'] as Map<String, dynamic>),
      tagItem: json['tagItem'] == null
          ? null
          : TagSelector.fromJson(json['tagItem'] as Map<String, dynamic>),
      chapterSelector: json['chapterSelector'] == null
          ? null
          : Selector.fromJson(json['chapterSelector'] as Map<String, dynamic>),
      chapterTitle: json['chapterTitle'] == null
          ? null
          : Selector.fromJson(json['chapterTitle'] as Map<String, dynamic>),
      chapterSubtitle: json['chapterSubtitle'] == null
          ? null
          : Selector.fromJson(json['chapterSubtitle'] as Map<String, dynamic>),
      chapterCover: json['chapterCover'] == null
          ? null
          : ImageSelector.fromJson(
              json['chapterCover'] as Map<String, dynamic>),
      nextPage: json['nextPage'] == null
          ? null
          : Selector.fromJson(json['nextPage'] as Map<String, dynamic>),
      countPrePage: json['countPrePage'] == null
          ? null
          : Selector.fromJson(json['countPrePage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DetailParserToJson(DetailParser instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uuid': instance.uuid,
      'extra': const ExtraListConverter().toJson(instance.extra),
      'title': instance.title,
      'subtitle': instance.subtitle,
      'uploadTime': instance.uploadTime,
      'star': instance.star,
      'imageCount': instance.imageCount,
      'pageCount': instance.pageCount,
      'language': instance.language,
      'coverImage': instance.coverImage,
      'description': instance.description,
      'successSelector': instance.successSelector,
      'failedSelector': instance.failedSelector,
      'thumbnailSelector': instance.thumbnailSelector,
      'thumbnail': instance.thumbnail,
      'target': instance.target,
      'commentSelector': instance.commentSelector,
      'comments': instance.comments,
      'badgeSelector': instance.badgeSelector,
      'badgeItem': instance.badgeItem,
      'tagSelector': instance.tagSelector,
      'tagItem': instance.tagItem,
      'chapterSelector': instance.chapterSelector,
      'chapterTitle': instance.chapterTitle,
      'chapterSubtitle': instance.chapterSubtitle,
      'chapterCover': instance.chapterCover,
      'nextPage': instance.nextPage,
      'countPrePage': instance.countPrePage,
    };

ListViewParser _$ListViewParserFromJson(Map<String, dynamic> json) =>
    ListViewParser(
      name: json['name'] as String,
      uuid: json['uuid'] as String,
      extra: (json['extra'] as List<dynamic>?)
          ?.map((e) => ExtraSelector.fromJson(e as Map<String, dynamic>))
          .toList(),
      itemSelector: json['itemSelector'] == null
          ? null
          : Selector.fromJson(json['itemSelector'] as Map<String, dynamic>),
      successSelector: json['successSelector'] == null
          ? null
          : Selector.fromJson(json['successSelector'] as Map<String, dynamic>),
      failedSelector: json['failedSelector'] == null
          ? null
          : Selector.fromJson(json['failedSelector'] as Map<String, dynamic>),
      title: json['title'] == null
          ? null
          : Selector.fromJson(json['title'] as Map<String, dynamic>),
      subtitle: json['subtitle'] == null
          ? null
          : Selector.fromJson(json['subtitle'] as Map<String, dynamic>),
      uploadTime: json['uploadTime'] == null
          ? null
          : Selector.fromJson(json['uploadTime'] as Map<String, dynamic>),
      star: json['star'] == null
          ? null
          : Selector.fromJson(json['star'] as Map<String, dynamic>),
      imageCount: json['imageCount'] == null
          ? null
          : Selector.fromJson(json['imageCount'] as Map<String, dynamic>),
      language: json['language'] == null
          ? null
          : Selector.fromJson(json['language'] as Map<String, dynamic>),
      previewImage: json['previewImage'] == null
          ? null
          : ImageSelector.fromJson(
              json['previewImage'] as Map<String, dynamic>),
      target: json['target'] == null
          ? null
          : Selector.fromJson(json['target'] as Map<String, dynamic>),
      badgeSelector: json['badgeSelector'] == null
          ? null
          : Selector.fromJson(json['badgeSelector'] as Map<String, dynamic>),
      badgeItem: json['badgeItem'] == null
          ? null
          : TagSelector.fromJson(json['badgeItem'] as Map<String, dynamic>),
      tag: json['tag'] == null
          ? null
          : Selector.fromJson(json['tag'] as Map<String, dynamic>),
      tagItem: json['tagItem'] == null
          ? null
          : TagSelector.fromJson(json['tagItem'] as Map<String, dynamic>),
      paper: json['paper'] == null
          ? null
          : Selector.fromJson(json['paper'] as Map<String, dynamic>),
      idCode: json['idCode'] == null
          ? null
          : Selector.fromJson(json['idCode'] as Map<String, dynamic>),
      nextPage: json['nextPage'] == null
          ? null
          : Selector.fromJson(json['nextPage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ListViewParserToJson(ListViewParser instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uuid': instance.uuid,
      'extra': const ExtraListConverter().toJson(instance.extra),
      'itemSelector': instance.itemSelector,
      'successSelector': instance.successSelector,
      'failedSelector': instance.failedSelector,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'uploadTime': instance.uploadTime,
      'star': instance.star,
      'imageCount': instance.imageCount,
      'language': instance.language,
      'previewImage': instance.previewImage,
      'target': instance.target,
      'badgeSelector': instance.badgeSelector,
      'badgeItem': instance.badgeItem,
      'tag': instance.tag,
      'tagItem': instance.tagItem,
      'paper': instance.paper,
      'idCode': instance.idCode,
      'nextPage': instance.nextPage,
    };

AutoCompleteParser _$AutoCompleteParserFromJson(Map<String, dynamic> json) =>
    AutoCompleteParser(
      name: json['name'] as String,
      uuid: json['uuid'] as String,
      extra: (json['extra'] as List<dynamic>?)
          ?.map((e) => ExtraSelector.fromJson(e as Map<String, dynamic>))
          .toList(),
      itemSelector: json['itemSelector'] == null
          ? null
          : Selector.fromJson(json['itemSelector'] as Map<String, dynamic>),
      itemComplete: json['itemComplete'] == null
          ? null
          : Selector.fromJson(json['itemComplete'] as Map<String, dynamic>),
      itemTitle: json['itemTitle'] == null
          ? null
          : Selector.fromJson(json['itemTitle'] as Map<String, dynamic>),
      itemSubtitle: json['itemSubtitle'] == null
          ? null
          : Selector.fromJson(json['itemSubtitle'] as Map<String, dynamic>),
      successSelector: json['successSelector'] == null
          ? null
          : Selector.fromJson(json['successSelector'] as Map<String, dynamic>),
      failedSelector: json['failedSelector'] == null
          ? null
          : Selector.fromJson(json['failedSelector'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AutoCompleteParserToJson(AutoCompleteParser instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uuid': instance.uuid,
      'extra': const ExtraListConverter().toJson(instance.extra),
      'itemSelector': instance.itemSelector,
      'itemComplete': instance.itemComplete,
      'itemTitle': instance.itemTitle,
      'itemSubtitle': instance.itemSubtitle,
      'successSelector': instance.successSelector,
      'failedSelector': instance.failedSelector,
    };
