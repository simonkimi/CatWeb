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
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ParserModelImageReaderImplToJson(
        _$ParserModelImageReaderImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uuid': instance.uuid,
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
      'runtimeType': instance.$type,
    };

_$ParserModelDetailImpl _$$ParserModelDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$ParserModelDetailImpl(
      name: json['name'] as String? ?? '',
      uuid: json['uuid'] as String? ?? '',
      extra: (json['extra'] as List<dynamic>?)
              ?.map(
                  (e) => ExtraSelectorModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      title: json['title'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(json['title'] as Map<String, dynamic>),
      subtitle: json['subtitle'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(json['subtitle'] as Map<String, dynamic>),
      uploadTime: json['uploadTime'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(json['uploadTime'] as Map<String, dynamic>),
      star: json['star'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(json['star'] as Map<String, dynamic>),
      imageCount: json['imageCount'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(json['imageCount'] as Map<String, dynamic>),
      pageCount: json['pageCount'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(json['pageCount'] as Map<String, dynamic>),
      language: json['language'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(json['language'] as Map<String, dynamic>),
      coverImage: json['coverImage'] == null
          ? const ImageSelectorModel()
          : ImageSelectorModel.fromJson(
              json['coverImage'] as Map<String, dynamic>),
      description: json['description'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(json['description'] as Map<String, dynamic>),
      successSelector: json['successSelector'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(
              json['successSelector'] as Map<String, dynamic>),
      failedSelector: json['failedSelector'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(
              json['failedSelector'] as Map<String, dynamic>),
      thumbnailSelector: json['thumbnailSelector'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(
              json['thumbnailSelector'] as Map<String, dynamic>),
      thumbnail: json['thumbnail'] == null
          ? const ImageSelectorModel()
          : ImageSelectorModel.fromJson(
              json['thumbnail'] as Map<String, dynamic>),
      target: json['target'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(json['target'] as Map<String, dynamic>),
      commentSelector: json['commentSelector'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(
              json['commentSelector'] as Map<String, dynamic>),
      comments: json['comments'] == null
          ? const CommentSelectorModel()
          : CommentSelectorModel.fromJson(
              json['comments'] as Map<String, dynamic>),
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
      chapterSelector: json['chapterSelector'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(
              json['chapterSelector'] as Map<String, dynamic>),
      chapterTitle: json['chapterTitle'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(
              json['chapterTitle'] as Map<String, dynamic>),
      chapterSubtitle: json['chapterSubtitle'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(
              json['chapterSubtitle'] as Map<String, dynamic>),
      chapterCover: json['chapterCover'] == null
          ? const ImageSelectorModel()
          : ImageSelectorModel.fromJson(
              json['chapterCover'] as Map<String, dynamic>),
      nextPage: json['nextPage'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(json['nextPage'] as Map<String, dynamic>),
      countPrePage: json['countPrePage'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(
              json['countPrePage'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ParserModelDetailImplToJson(
        _$ParserModelDetailImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uuid': instance.uuid,
      'extra': instance.extra,
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
      'runtimeType': instance.$type,
    };

_$ParserModelListImpl _$$ParserModelListImplFromJson(
        Map<String, dynamic> json) =>
    _$ParserModelListImpl(
      name: json['name'] as String? ?? '',
      uuid: json['uuid'] as String? ?? '',
      extra: (json['extra'] as List<dynamic>?)
              ?.map(
                  (e) => ExtraSelectorModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      itemSelector: json['itemSelector'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(
              json['itemSelector'] as Map<String, dynamic>),
      itemComplete: json['itemComplete'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(
              json['itemComplete'] as Map<String, dynamic>),
      successSelector: json['successSelector'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(
              json['successSelector'] as Map<String, dynamic>),
      failedSelector: json['failedSelector'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(
              json['failedSelector'] as Map<String, dynamic>),
      title: json['title'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(json['title'] as Map<String, dynamic>),
      subtitle: json['subtitle'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(json['subtitle'] as Map<String, dynamic>),
      uploadTime: json['uploadTime'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(json['uploadTime'] as Map<String, dynamic>),
      star: json['star'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(json['star'] as Map<String, dynamic>),
      imageCount: json['imageCount'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(json['imageCount'] as Map<String, dynamic>),
      language: json['language'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(json['language'] as Map<String, dynamic>),
      previewImage: json['previewImage'] == null
          ? const ImageSelectorModel()
          : ImageSelectorModel.fromJson(
              json['previewImage'] as Map<String, dynamic>),
      target: json['target'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(json['target'] as Map<String, dynamic>),
      badgeSelector: json['badgeSelector'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(
              json['badgeSelector'] as Map<String, dynamic>),
      badgeItem: json['badgeItem'] == null
          ? const TagSelectorModel()
          : TagSelectorModel.fromJson(
              json['badgeItem'] as Map<String, dynamic>),
      tag: json['tag'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(json['tag'] as Map<String, dynamic>),
      tagItem: json['tagItem'] == null
          ? const TagSelectorModel()
          : TagSelectorModel.fromJson(json['tagItem'] as Map<String, dynamic>),
      paper: json['paper'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(json['paper'] as Map<String, dynamic>),
      idCode: json['idCode'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(json['idCode'] as Map<String, dynamic>),
      nextPage: json['nextPage'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(json['nextPage'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ParserModelListImplToJson(
        _$ParserModelListImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uuid': instance.uuid,
      'extra': instance.extra,
      'itemSelector': instance.itemSelector,
      'itemComplete': instance.itemComplete,
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
      'runtimeType': instance.$type,
    };

_$ParserModelAutoCompleteImpl _$$ParserModelAutoCompleteImplFromJson(
        Map<String, dynamic> json) =>
    _$ParserModelAutoCompleteImpl(
      name: json['name'] as String? ?? '',
      uuid: json['uuid'] as String? ?? '',
      extra: (json['extra'] as List<dynamic>?)
              ?.map(
                  (e) => ExtraSelectorModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      itemSelector: json['itemSelector'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(
              json['itemSelector'] as Map<String, dynamic>),
      itemComplete: json['itemComplete'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(
              json['itemComplete'] as Map<String, dynamic>),
      itemTitle: json['itemTitle'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(json['itemTitle'] as Map<String, dynamic>),
      itemSubtitle: json['itemSubtitle'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(
              json['itemSubtitle'] as Map<String, dynamic>),
      successSelector: json['successSelector'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(
              json['successSelector'] as Map<String, dynamic>),
      failedSelector: json['failedSelector'] == null
          ? const SelectorModel()
          : SelectorModel.fromJson(
              json['failedSelector'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ParserModelAutoCompleteImplToJson(
        _$ParserModelAutoCompleteImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uuid': instance.uuid,
      'extra': instance.extra,
      'itemSelector': instance.itemSelector,
      'itemComplete': instance.itemComplete,
      'itemTitle': instance.itemTitle,
      'itemSubtitle': instance.itemSubtitle,
      'successSelector': instance.successSelector,
      'failedSelector': instance.failedSelector,
      'runtimeType': instance.$type,
    };
