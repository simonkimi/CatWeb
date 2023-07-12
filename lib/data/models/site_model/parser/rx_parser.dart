import 'package:catweb/data/models/site_model/parser/parser.dart';
import 'package:catweb/data/models/site_model/parser/rx_selector.dart';
import 'package:get/get.dart';

abstract class RxParserBase {
  final String name;
  final String uuid;
  final ParserType parserType;

  final RxList<RxExtraSelector> extra;

  RxParserBase(this.name, this.uuid, this.parserType, this.extra);
}

class RxImageReaderParser implements RxParserBase {
  @override
  final String name;
  @override
  final String uuid;
  @override
  final ParserType parserType;
  @override
  final RxList<RxExtraSelector> extra;

  final RxImageSelector image;
  final RxSelector largerImage;
  final RxSelector rawImage;
  final RxSelector rating;
  final RxSelector score;
  final RxSelector source;
  final RxSelector uploadTime;
  final RxSelector successSelector;
  final RxSelector failedSelector;
  final RxSelector badgeSelector;
  final RxSelector badgeText;
  final RxSelector badgeCategory;

  RxImageReaderParser({
    required this.name,
    required this.uuid,
    required this.parserType,
    List<RxExtraSelector>? extra,
    RxImageSelector? image,
    RxSelector? largerImage,
    RxSelector? rawImage,
    RxSelector? rating,
    RxSelector? score,
    RxSelector? source,
    RxSelector? uploadTime,
    RxSelector? successSelector,
    RxSelector? failedSelector,
    RxSelector? badgeSelector,
    RxSelector? badgeText,
    RxSelector? badgeCategory,
  })  : image = image ?? RxImageSelector(),
        largerImage = largerImage ?? RxSelector(),
        rawImage = rawImage ?? RxSelector(),
        rating = rating ?? RxSelector(),
        score = score ?? RxSelector(),
        source = source ?? RxSelector(),
        uploadTime = uploadTime ?? RxSelector(),
        successSelector = successSelector ?? RxSelector(),
        failedSelector = failedSelector ?? RxSelector(),
        badgeSelector = badgeSelector ?? RxSelector(),
        badgeText = badgeText ?? RxSelector(),
        badgeCategory = badgeCategory ?? RxSelector(),
        extra = extra?.obs ?? <RxExtraSelector>[].obs;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'uuid': uuid,
      'parserType': parserType.toString(),
      'extra': extra.map((e) => e.toJson()).toList(),
      'image': image.toJson(),
      'largerImage': largerImage.toJson(),
      'rawImage': rawImage.toJson(),
      'rating': rating.toJson(),
      'score': score.toJson(),
      'source': source.toJson(),
      'uploadTime': uploadTime.toJson(),
      'successSelector': successSelector.toJson(),
      'failedSelector': failedSelector.toJson(),
      'badgeSelector': badgeSelector.toJson(),
      'badgeText': badgeText.toJson(),
      'badgeCategory': badgeCategory.toJson(),
    };
  }

  static RxImageReaderParser fromJson(Map<String, dynamic> json) {
    return RxImageReaderParser(
      name: json['name'] as String,
      uuid: json['uuid'] as String,
      parserType: ParserType.fromJson(json['parserType'] as String),
      extra: (json['extra'] as List<dynamic>)
          .map((e) => RxExtraSelector.fromJson(e))
          .toList()
          .obs,
      image: RxImageSelector.fromJson(json['image'] as Map<String, dynamic>),
      largerImage:
          RxSelector.fromJson(json['largerImage'] as Map<String, dynamic>),
      rawImage: RxSelector.fromJson(json['rawImage'] as Map<String, dynamic>),
      rating: RxSelector.fromJson(json['rating'] as Map<String, dynamic>),
      score: RxSelector.fromJson(json['score'] as Map<String, dynamic>),
      source: RxSelector.fromJson(json['source'] as Map<String, dynamic>),
      uploadTime:
          RxSelector.fromJson(json['uploadTime'] as Map<String, dynamic>),
      successSelector:
          RxSelector.fromJson(json['successSelector'] as Map<String, dynamic>),
      failedSelector:
          RxSelector.fromJson(json['failedSelector'] as Map<String, dynamic>),
      badgeSelector:
          RxSelector.fromJson(json['badgeSelector'] as Map<String, dynamic>),
      badgeText: RxSelector.fromJson(json['badgeText'] as Map<String, dynamic>),
      badgeCategory:
          RxSelector.fromJson(json['badgeCategory'] as Map<String, dynamic>),
    );
  }
}

class RxGalleryParser implements RxParserBase {
  @override
  final String name;
  @override
  final String uuid;
  @override
  final ParserType parserType;
  @override
  final RxList<RxExtraSelector> extra;

  final RxSelector title;
  final RxSelector subtitle;
  final RxSelector uploadTime;
  final RxSelector star;
  final RxSelector imgCount;
  final RxSelector pageCount;
  final RxSelector language;
  final RxImageSelector coverImg;
  final RxSelector description;
  final RxSelector successSelector;
  final RxSelector failedSelector;
  final RxSelector thumbnailSelector;
  final RxImageSelector thumbnail;
  final RxSelector target;
  final RxSelector commentSelector;
  final RxCommentSelector comments;
  final RxSelector tag;
  final RxSelector tagColor;
  final RxSelector badgeSelector;
  final RxSelector badgeText;
  final RxSelector badgeCategory;
  final RxSelector chapterSelector;
  final RxSelector chapterTitle;
  final RxSelector chapterSubtitle;
  final RxImageSelector chapterCover;
  final RxSelector nextPage;
  final RxSelector countPrePage;

  RxGalleryParser({
    required this.name,
    required this.uuid,
    required this.parserType,
    List<RxExtraSelector>? extra,
    RxSelector? title,
    RxSelector? subtitle,
    RxSelector? uploadTime,
    RxSelector? star,
    RxSelector? imgCount,
    RxSelector? pageCount,
    RxSelector? language,
    RxImageSelector? coverImg,
    RxSelector? description,
    RxSelector? successSelector,
    RxSelector? failedSelector,
    RxSelector? thumbnailSelector,
    RxImageSelector? thumbnail,
    RxSelector? target,
    RxSelector? commentSelector,
    RxCommentSelector? comments,
    RxSelector? tag,
    RxSelector? tagColor,
    RxSelector? badgeSelector,
    RxSelector? badgeText,
    RxSelector? badgeCategory,
    RxSelector? chapterSelector,
    RxSelector? chapterTitle,
    RxSelector? chapterSubtitle,
    RxImageSelector? chapterCover,
    RxSelector? nextPage,
    RxSelector? countPrePage,
  })  : title = title ?? RxSelector(),
        subtitle = subtitle ?? RxSelector(),
        uploadTime = uploadTime ?? RxSelector(),
        star = star ?? RxSelector(),
        imgCount = imgCount ?? RxSelector(),
        pageCount = pageCount ?? RxSelector(),
        language = language ?? RxSelector(),
        coverImg = coverImg ?? RxImageSelector(),
        description = description ?? RxSelector(),
        successSelector = successSelector ?? RxSelector(),
        failedSelector = failedSelector ?? RxSelector(),
        thumbnailSelector = thumbnailSelector ?? RxSelector(),
        thumbnail = thumbnail ?? RxImageSelector(),
        target = target ?? RxSelector(),
        commentSelector = commentSelector ?? RxSelector(),
        comments = comments ?? RxCommentSelector(),
        tag = tag ?? RxSelector(),
        tagColor = tagColor ?? RxSelector(),
        badgeSelector = badgeSelector ?? RxSelector(),
        badgeText = badgeText ?? RxSelector(),
        badgeCategory = badgeCategory ?? RxSelector(),
        chapterSelector = chapterSelector ?? RxSelector(),
        chapterTitle = chapterTitle ?? RxSelector(),
        chapterSubtitle = chapterSubtitle ?? RxSelector(),
        chapterCover = chapterCover ?? RxImageSelector(),
        nextPage = nextPage ?? RxSelector(),
        countPrePage = countPrePage ?? RxSelector(),
        extra = extra?.obs ?? <RxExtraSelector>[].obs;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'uuid': uuid,
      'parserType': parserType.toString(),
      'extra': extra.map((e) => e.toJson()).toList(),
      'title': title.toJson(),
      'subtitle': subtitle.toJson(),
      'uploadTime': uploadTime.toJson(),
      'star': star.toJson(),
      'imgCount': imgCount.toJson(),
      'pageCount': pageCount.toJson(),
      'language': language.toJson(),
      'coverImg': coverImg.toJson(),
      'description': description.toJson(),
      'successSelector': successSelector.toJson(),
      'failedSelector': failedSelector.toJson(),
      'thumbnailSelector': thumbnailSelector.toJson(),
      'thumbnail': thumbnail.toJson(),
      'target': target.toJson(),
      'commentSelector': commentSelector.toJson(),
      'comments': comments.toJson(),
      'tag': tag.toJson(),
      'tagColor': tagColor.toJson(),
      'badgeSelector': badgeSelector.toJson(),
      'badgeText': badgeText.toJson(),
      'badgeCategory': badgeCategory.toJson(),
      'chapterSelector': chapterSelector.toJson(),
      'chapterTitle': chapterTitle.toJson(),
      'chapterSubtitle': chapterSubtitle.toJson(),
      'chapterCover': chapterCover.toJson(),
      'nextPage': nextPage.toJson(),
      'countPrePage': countPrePage.toJson(),
    };
  }

  factory RxGalleryParser.fromJson(Map<String, dynamic> json) {
    return RxGalleryParser(
        name: json['name'] as String,
        uuid: json['uuid'] as String,
        parserType: ParserType.fromJson(json['parserType'] as String),
        extra: (json['extra'] as List<dynamic>)
            .map((e) => RxExtraSelector.fromJson(e))
            .toList()
            .obs,
        title: RxSelector.fromJson(json['title'] as Map<String, dynamic>),
        subtitle: RxSelector.fromJson(json['subtitle'] as Map<String, dynamic>),
        uploadTime:
            RxSelector.fromJson(json['uploadTime'] as Map<String, dynamic>),
        star: RxSelector.fromJson(json['star'] as Map<String, dynamic>),
        imgCount: RxSelector.fromJson(json['imgCount'] as Map<String, dynamic>),
        pageCount:
            RxSelector.fromJson(json['pageCount'] as Map<String, dynamic>),
        language: RxSelector.fromJson(json['language'] as Map<String, dynamic>),
        coverImg:
            RxImageSelector.fromJson(json['coverImg'] as Map<String, dynamic>),
        description:
            RxSelector.fromJson(json['description'] as Map<String, dynamic>),
        successSelector: RxSelector.fromJson(
            json['successSelector'] as Map<String, dynamic>),
        failedSelector:
            RxSelector.fromJson(json['failedSelector'] as Map<String, dynamic>),
        thumbnailSelector: RxSelector.fromJson(
            json['thumbnailSelector'] as Map<String, dynamic>),
        thumbnail:
            RxImageSelector.fromJson(json['thumbnail'] as Map<String, dynamic>),
        target: RxSelector.fromJson(json['target'] as Map<String, dynamic>),
        commentSelector: RxSelector.fromJson(
            json['commentSelector'] as Map<String, dynamic>),
        comments: RxCommentSelector.fromJson(
            json['comments'] as Map<String, dynamic>),
        tag: RxSelector.fromJson(json['tag'] as Map<String, dynamic>),
        tagColor: RxSelector.fromJson(json['tagColor'] as Map<String, dynamic>),
        badgeSelector:
            RxSelector.fromJson(json['badgeSelector'] as Map<String, dynamic>),
        badgeText:
            RxSelector.fromJson(json['badgeText'] as Map<String, dynamic>),
        badgeCategory:
            RxSelector.fromJson(json['badgeCategory'] as Map<String, dynamic>),
        chapterSelector: RxSelector.fromJson(
            json['chapterSelector'] as Map<String, dynamic>),
        chapterTitle:
            RxSelector.fromJson(json['chapterTitle'] as Map<String, dynamic>),
        chapterSubtitle: RxSelector.fromJson(
            json['chapterSubtitle'] as Map<String, dynamic>),
        chapterCover: RxImageSelector.fromJson(
            json['chapterCover'] as Map<String, dynamic>),
        nextPage: RxSelector.fromJson(json['nextPage'] as Map<String, dynamic>),
        countPrePage: RxSelector.fromJson(json['countPrePage'] as Map<String, dynamic>));
  }
}

class ListViewParser implements RxParserBase {
  @override
  final String name;
  @override
  final String uuid;
  @override
  final ParserType parserType;
  @override
  final RxList<RxExtraSelector> extra;

  final RxSelector itemSelector;
  final RxSelector successSelector;
  final RxSelector failedSelector;
  final RxSelector title;
  final RxSelector subtitle;
  final RxSelector uploadTime;
  final RxSelector star;
  final RxSelector imgCount;
  final RxSelector language;
  final RxImageSelector previewImg;
  final RxSelector target;
  final RxSelector tag;
  final RxSelector tagColor;
  final RxSelector badgeSelector;
  final RxSelector badgeText;
  final RxSelector badgeCategory;
  final RxSelector paper;
  final RxSelector idCode;
  final RxSelector nextPage;

  ListViewParser({
    required this.name,
    required this.uuid,
    required this.parserType,
    List<RxExtraSelector>? extra,
    RxSelector? itemSelector,
    RxSelector? successSelector,
    RxSelector? failedSelector,
    RxSelector? title,
    RxSelector? subtitle,
    RxSelector? uploadTime,
    RxSelector? star,
    RxSelector? imgCount,
    RxSelector? language,
    RxImageSelector? previewImg,
    RxSelector? target,
    RxSelector? tag,
    RxSelector? tagColor,
    RxSelector? badgeSelector,
    RxSelector? badgeText,
    RxSelector? badgeCategory,
    RxSelector? paper,
    RxSelector? idCode,
    RxSelector? nextPage,
  })  : itemSelector = itemSelector ?? RxSelector(),
        successSelector = successSelector ?? RxSelector(),
        failedSelector = failedSelector ?? RxSelector(),
        title = title ?? RxSelector(),
        subtitle = subtitle ?? RxSelector(),
        uploadTime = uploadTime ?? RxSelector(),
        star = star ?? RxSelector(),
        imgCount = imgCount ?? RxSelector(),
        language = language ?? RxSelector(),
        previewImg = previewImg ?? RxImageSelector(),
        target = target ?? RxSelector(),
        tag = tag ?? RxSelector(),
        tagColor = tagColor ?? RxSelector(),
        badgeSelector = badgeSelector ?? RxSelector(),
        badgeText = badgeText ?? RxSelector(),
        badgeCategory = badgeCategory ?? RxSelector(),
        paper = paper ?? RxSelector(),
        idCode = idCode ?? RxSelector(),
        nextPage = nextPage ?? RxSelector(),
        extra = extra?.obs ?? <RxExtraSelector>[].obs;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'uuid': uuid,
      'parserType': parserType.value,
      'extra': extra.map((e) => e.toJson()).toList(),
      'itemSelector': itemSelector.toJson(),
      'successSelector': successSelector.toJson(),
      'failedSelector': failedSelector.toJson(),
      'title': title.toJson(),
      'subtitle': subtitle.toJson(),
      'uploadTime': uploadTime.toJson(),
      'star': star.toJson(),
      'imgCount': imgCount.toJson(),
      'language': language.toJson(),
      'previewImg': previewImg.toJson(),
      'target': target.toJson(),
      'tag': tag.toJson(),
      'tagColor': tagColor.toJson(),
      'badgeSelector': badgeSelector.toJson(),
      'badgeText': badgeText.toJson(),
      'badgeCategory': badgeCategory.toJson(),
      'paper': paper.toJson(),
      'idCode': idCode.toJson(),
      'nextPage': nextPage.toJson(),
    };
  }

  factory ListViewParser.fromJson(Map<String, dynamic> json) {
    return ListViewParser(
        name: json['name'] as String,
        uuid: json['uuid'] as String,
        parserType: ParserType.fromJson(json['parserType'] as String),
        extra: (json['extra'] as List<dynamic>)
            .map((e) => RxExtraSelector.fromJson(e))
            .toList()
            .obs,
        itemSelector:
            RxSelector.fromJson(json['itemSelector'] as Map<String, dynamic>),
        successSelector: RxSelector.fromJson(
            json['successSelector'] as Map<String, dynamic>),
        failedSelector:
            RxSelector.fromJson(json['failedSelector'] as Map<String, dynamic>),
        title: RxSelector.fromJson(json['title'] as Map<String, dynamic>),
        subtitle: RxSelector.fromJson(json['subtitle'] as Map<String, dynamic>),
        uploadTime:
            RxSelector.fromJson(json['uploadTime'] as Map<String, dynamic>),
        star: RxSelector.fromJson(json['star'] as Map<String, dynamic>),
        imgCount: RxSelector.fromJson(json['imgCount'] as Map<String, dynamic>),
        language: RxSelector.fromJson(json['language'] as Map<String, dynamic>),
        previewImg: RxImageSelector.fromJson(
            json['previewImg'] as Map<String, dynamic>),
        target: RxSelector.fromJson(json['target'] as Map<String, dynamic>),
        tag: RxSelector.fromJson(json['tag'] as Map<String, dynamic>),
        tagColor: RxSelector.fromJson(json['tagColor'] as Map<String, dynamic>),
        badgeSelector:
            RxSelector.fromJson(json['badgeSelector'] as Map<String, dynamic>),
        badgeText:
            RxSelector.fromJson(json['badgeText'] as Map<String, dynamic>),
        badgeCategory:
            RxSelector.fromJson(json['badgeCategory'] as Map<String, dynamic>),
        paper: RxSelector.fromJson(json['paper'] as Map<String, dynamic>),
        idCode: RxSelector.fromJson(json['idCode'] as Map<String, dynamic>),
        nextPage:
            RxSelector.fromJson(json['nextPage'] as Map<String, dynamic>));
  }
}

class RxAutoCompleteParser implements RxParserBase {
  @override
  final String name;
  @override
  final String uuid;
  @override
  final ParserType parserType;
  @override
  final RxList<RxExtraSelector> extra;

  final RxSelector itemSelector;
  final RxSelector itemComplete;
  final RxSelector itemTitle;
  final RxSelector itemSubtitle;
  final RxSelector successSelector;
  final RxSelector failedSelector;

  RxAutoCompleteParser({
    required this.name,
    required this.uuid,
    required this.parserType,
    List<RxExtraSelector>? extra,
    RxSelector? itemSelector,
    RxSelector? itemComplete,
    RxSelector? itemTitle,
    RxSelector? itemSubtitle,
    RxSelector? successSelector,
    RxSelector? failedSelector,
  })  : itemSelector = itemSelector ?? RxSelector(),
        itemComplete = itemComplete ?? RxSelector(),
        itemTitle = itemTitle ?? RxSelector(),
        itemSubtitle = itemSubtitle ?? RxSelector(),
        successSelector = successSelector ?? RxSelector(),
        failedSelector = failedSelector ?? RxSelector(),
        extra = extra?.obs ?? <RxExtraSelector>[].obs;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'uuid': uuid,
      'parserType': parserType.value,
      'extra': extra.map((e) => e.toJson()).toList(),
      'itemSelector': itemSelector.toJson(),
      'itemComplete': itemComplete.toJson(),
      'itemTitle': itemTitle.toJson(),
      'itemSubtitle': itemSubtitle.toJson(),
      'successSelector': successSelector.toJson(),
      'failedSelector': failedSelector.toJson(),
    };
  }

  factory RxAutoCompleteParser.fromJson(Map<String, dynamic> json) {
    return RxAutoCompleteParser(
        name: json['name'] as String,
        uuid: json['uuid'] as String,
        parserType: ParserType.fromJson(json['parserType'] as String),
        extra: (json['extra'] as List<dynamic>)
            .map((e) => RxExtraSelector.fromJson(e))
            .toList()
            .obs,
        itemSelector:
            RxSelector.fromJson(json['itemSelector'] as Map<String, dynamic>),
        itemComplete:
            RxSelector.fromJson(json['itemComplete'] as Map<String, dynamic>),
        itemTitle:
            RxSelector.fromJson(json['itemTitle'] as Map<String, dynamic>),
        itemSubtitle:
            RxSelector.fromJson(json['itemSubtitle'] as Map<String, dynamic>),
        successSelector: RxSelector.fromJson(
            json['successSelector'] as Map<String, dynamic>),
        failedSelector: RxSelector.fromJson(
            json['failedSelector'] as Map<String, dynamic>));
  }
}
