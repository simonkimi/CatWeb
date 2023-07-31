import 'package:catweb/data/models/site_model/parser/selector.dart';
import 'package:get/get.dart';

enum ParserType {
  imageReader('ImageReader'),
  listView('ListValue'),
  autoComplete('AutoComplete'),
  gallery('Gallery');

  const ParserType(this.value);

  final String value;

  factory ParserType.fromJson(String value) {
    return ParserType.values.firstWhere((e) => e.value == value);
  }
}

abstract class IParserBase {
  final String name;
  final String uuid;
  final ParserType parserType;

  final RxList<ExtraSelector> extra;

  Map<String, dynamic> toJson();

  IParserBase(this.name, this.uuid, this.parserType, this.extra);

  static IParserBase fromJson(Map<String, dynamic> json) {
    final parserType = ParserType.fromJson(json['parserType']);
    return switch (parserType) {
      ParserType.imageReader => ImageReaderParser.fromJson(json),
      ParserType.listView => ListViewParser.fromJson(json),
      ParserType.autoComplete => AutoCompleteParser.fromJson(json),
      ParserType.gallery => GalleryParser.fromJson(json)
    };
  }
}

class ImageReaderParser implements IParserBase {
  @override
  final String name;
  @override
  final String uuid;
  @override
  final ParserType parserType;
  @override
  final RxList<ExtraSelector> extra;

  final Selector id;
  final ImageSelector image;
  final Selector largerImage;
  final Selector rawImage;
  final Selector rating;
  final Selector score;
  final Selector source;
  final Selector uploadTime;
  final Selector successSelector;
  final Selector failedSelector;
  final Selector badgeSelector;
  final Selector badgeText;
  final Selector badgeCategory;

  ImageReaderParser({
    required this.name,
    required this.uuid,
    Selector? id,
    List<ExtraSelector>? extra,
    ImageSelector? image,
    Selector? largerImage,
    Selector? rawImage,
    Selector? rating,
    Selector? score,
    Selector? source,
    Selector? uploadTime,
    Selector? successSelector,
    Selector? failedSelector,
    Selector? badgeSelector,
    Selector? badgeText,
    Selector? badgeCategory,
  })  : id = id ?? Selector(),
        image = image ?? ImageSelector(),
        largerImage = largerImage ?? Selector(),
        rawImage = rawImage ?? Selector(),
        rating = rating ?? Selector(),
        score = score ?? Selector(),
        source = source ?? Selector(),
        uploadTime = uploadTime ?? Selector(),
        successSelector = successSelector ?? Selector(),
        failedSelector = failedSelector ?? Selector(),
        badgeSelector = badgeSelector ?? Selector(),
        badgeText = badgeText ?? Selector(),
        badgeCategory = badgeCategory ?? Selector(),
        extra = extra?.obs ?? <ExtraSelector>[].obs,
        parserType = ParserType.imageReader;

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'uuid': uuid,
      'parserType': parserType.value,
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

  factory ImageReaderParser.fromJson(Map<String, dynamic> json) {
    return ImageReaderParser(
      name: json['name'] as String,
      uuid: json['uuid'] as String,
      extra: (json['extra'] as List<dynamic>)
          .map((e) => ExtraSelector.fromJson(e))
          .toList()
          .obs,
      image: ImageSelector.fromJson(json['image'] as Map<String, dynamic>),
      largerImage:
          Selector.fromJson(json['largerImage'] as Map<String, dynamic>),
      rawImage: Selector.fromJson(json['rawImage'] as Map<String, dynamic>),
      rating: Selector.fromJson(json['rating'] as Map<String, dynamic>),
      score: Selector.fromJson(json['score'] as Map<String, dynamic>),
      source: Selector.fromJson(json['source'] as Map<String, dynamic>),
      uploadTime: Selector.fromJson(json['uploadTime'] as Map<String, dynamic>),
      successSelector:
          Selector.fromJson(json['successSelector'] as Map<String, dynamic>),
      failedSelector:
          Selector.fromJson(json['failedSelector'] as Map<String, dynamic>),
      badgeSelector:
          Selector.fromJson(json['badgeSelector'] as Map<String, dynamic>),
      badgeText: Selector.fromJson(json['badgeText'] as Map<String, dynamic>),
      badgeCategory:
          Selector.fromJson(json['badgeCategory'] as Map<String, dynamic>),
    );
  }
}

class GalleryParser implements IParserBase {
  @override
  final String name;
  @override
  final String uuid;
  @override
  final ParserType parserType;
  @override
  final RxList<ExtraSelector> extra;

  final Selector title;
  final Selector subtitle;
  final Selector uploadTime;
  final Selector star;
  final Selector imgCount;
  final Selector pageCount;
  final Selector language;
  final ImageSelector coverImg;
  final Selector description;
  final Selector successSelector;
  final Selector failedSelector;
  final Selector thumbnailSelector;
  final ImageSelector thumbnail;
  final Selector target;
  final Selector commentSelector;
  final CommentSelector comments;
  final Selector tag;
  final Selector tagColor;
  final Selector badgeSelector;
  final Selector badgeText;
  final Selector badgeCategory;
  final Selector chapterSelector;
  final Selector chapterTitle;
  final Selector chapterSubtitle;
  final ImageSelector chapterCover;
  final Selector nextPage;
  final Selector countPrePage;

  GalleryParser({
    required this.name,
    required this.uuid,
    List<ExtraSelector>? extra,
    Selector? title,
    Selector? subtitle,
    Selector? uploadTime,
    Selector? star,
    Selector? imgCount,
    Selector? pageCount,
    Selector? language,
    ImageSelector? coverImg,
    Selector? description,
    Selector? successSelector,
    Selector? failedSelector,
    Selector? thumbnailSelector,
    ImageSelector? thumbnail,
    Selector? target,
    Selector? commentSelector,
    CommentSelector? comments,
    Selector? tag,
    Selector? tagColor,
    Selector? badgeSelector,
    Selector? badgeText,
    Selector? badgeCategory,
    Selector? chapterSelector,
    Selector? chapterTitle,
    Selector? chapterSubtitle,
    ImageSelector? chapterCover,
    Selector? nextPage,
    Selector? countPrePage,
  })  : title = title ?? Selector(),
        subtitle = subtitle ?? Selector(),
        uploadTime = uploadTime ?? Selector(),
        star = star ?? Selector(),
        imgCount = imgCount ?? Selector(),
        pageCount = pageCount ?? Selector(),
        language = language ?? Selector(),
        coverImg = coverImg ?? ImageSelector(),
        description = description ?? Selector(),
        successSelector = successSelector ?? Selector(),
        failedSelector = failedSelector ?? Selector(),
        thumbnailSelector = thumbnailSelector ?? Selector(),
        thumbnail = thumbnail ?? ImageSelector(),
        target = target ?? Selector(),
        commentSelector = commentSelector ?? Selector(),
        comments = comments ?? CommentSelector(),
        tag = tag ?? Selector(),
        tagColor = tagColor ?? Selector(),
        badgeSelector = badgeSelector ?? Selector(),
        badgeText = badgeText ?? Selector(),
        badgeCategory = badgeCategory ?? Selector(),
        chapterSelector = chapterSelector ?? Selector(),
        chapterTitle = chapterTitle ?? Selector(),
        chapterSubtitle = chapterSubtitle ?? Selector(),
        chapterCover = chapterCover ?? ImageSelector(),
        nextPage = nextPage ?? Selector(),
        countPrePage = countPrePage ?? Selector(),
        extra = extra?.obs ?? <ExtraSelector>[].obs,
        parserType = ParserType.gallery;

  @override
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

  factory GalleryParser.fromJson(Map<String, dynamic> json) {
    return GalleryParser(
        name: json['name'] as String,
        uuid: json['uuid'] as String,
        extra: (json['extra'] as List<dynamic>)
            .map((e) => ExtraSelector.fromJson(e))
            .toList()
            .obs,
        title: Selector.fromJson(json['title'] as Map<String, dynamic>),
        subtitle: Selector.fromJson(json['subtitle'] as Map<String, dynamic>),
        uploadTime:
            Selector.fromJson(json['uploadTime'] as Map<String, dynamic>),
        star: Selector.fromJson(json['star'] as Map<String, dynamic>),
        imgCount: Selector.fromJson(json['imgCount'] as Map<String, dynamic>),
        pageCount: Selector.fromJson(json['pageCount'] as Map<String, dynamic>),
        language: Selector.fromJson(json['language'] as Map<String, dynamic>),
        coverImg:
            ImageSelector.fromJson(json['coverImg'] as Map<String, dynamic>),
        description:
            Selector.fromJson(json['description'] as Map<String, dynamic>),
        successSelector:
            Selector.fromJson(json['successSelector'] as Map<String, dynamic>),
        failedSelector:
            Selector.fromJson(json['failedSelector'] as Map<String, dynamic>),
        thumbnailSelector: Selector.fromJson(
            json['thumbnailSelector'] as Map<String, dynamic>),
        thumbnail:
            ImageSelector.fromJson(json['thumbnail'] as Map<String, dynamic>),
        target: Selector.fromJson(json['target'] as Map<String, dynamic>),
        commentSelector:
            Selector.fromJson(json['commentSelector'] as Map<String, dynamic>),
        comments:
            CommentSelector.fromJson(json['comments'] as Map<String, dynamic>),
        tag: Selector.fromJson(json['tag'] as Map<String, dynamic>),
        tagColor: Selector.fromJson(json['tagColor'] as Map<String, dynamic>),
        badgeSelector:
            Selector.fromJson(json['badgeSelector'] as Map<String, dynamic>),
        badgeText: Selector.fromJson(json['badgeText'] as Map<String, dynamic>),
        badgeCategory:
            Selector.fromJson(json['badgeCategory'] as Map<String, dynamic>),
        chapterSelector:
            Selector.fromJson(json['chapterSelector'] as Map<String, dynamic>),
        chapterTitle:
            Selector.fromJson(json['chapterTitle'] as Map<String, dynamic>),
        chapterSubtitle:
            Selector.fromJson(json['chapterSubtitle'] as Map<String, dynamic>),
        chapterCover: ImageSelector.fromJson(
            json['chapterCover'] as Map<String, dynamic>),
        nextPage: Selector.fromJson(json['nextPage'] as Map<String, dynamic>),
        countPrePage:
            Selector.fromJson(json['countPrePage'] as Map<String, dynamic>));
  }
}

class ListViewParser implements IParserBase {
  @override
  final String name;
  @override
  final String uuid;
  @override
  final ParserType parserType;
  @override
  final RxList<ExtraSelector> extra;

  final Selector itemSelector;
  final Selector successSelector;
  final Selector failedSelector;
  final Selector title;
  final Selector subtitle;
  final Selector uploadTime;
  final Selector star;
  final Selector imgCount;
  final Selector language;
  final ImageSelector previewImg;
  final Selector target;
  final Selector tag;
  final Selector tagColor;
  final Selector badgeSelector;
  final Selector badgeText;
  final Selector badgeColor;
  final Selector paper;
  final Selector idCode;
  final Selector nextPage;

  ListViewParser({
    required this.name,
    required this.uuid,
    List<ExtraSelector>? extra,
    Selector? itemSelector,
    Selector? successSelector,
    Selector? failedSelector,
    Selector? title,
    Selector? subtitle,
    Selector? uploadTime,
    Selector? star,
    Selector? imgCount,
    Selector? language,
    ImageSelector? previewImg,
    Selector? target,
    Selector? tag,
    Selector? tagColor,
    Selector? badgeSelector,
    Selector? badgeText,
    Selector? badgeColor,
    Selector? paper,
    Selector? idCode,
    Selector? nextPage,
  })  : itemSelector = itemSelector ?? Selector(),
        successSelector = successSelector ?? Selector(),
        failedSelector = failedSelector ?? Selector(),
        title = title ?? Selector(),
        subtitle = subtitle ?? Selector(),
        uploadTime = uploadTime ?? Selector(),
        star = star ?? Selector(),
        imgCount = imgCount ?? Selector(),
        language = language ?? Selector(),
        previewImg = previewImg ?? ImageSelector(),
        target = target ?? Selector(),
        tag = tag ?? Selector(),
        tagColor = tagColor ?? Selector(),
        badgeSelector = badgeSelector ?? Selector(),
        badgeText = badgeText ?? Selector(),
        badgeColor = badgeColor ?? Selector(),
        paper = paper ?? Selector(),
        idCode = idCode ?? Selector(),
        nextPage = nextPage ?? Selector(),
        extra = extra?.obs ?? <ExtraSelector>[].obs,
        parserType = ParserType.listView;

  @override
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
      'badgeCategory': badgeColor.toJson(),
      'paper': paper.toJson(),
      'idCode': idCode.toJson(),
      'nextPage': nextPage.toJson(),
    };
  }

  factory ListViewParser.fromJson(Map<String, dynamic> json) {
    return ListViewParser(
        name: json['name'] as String,
        uuid: json['uuid'] as String,
        extra: (json['extra'] as List<dynamic>)
            .map((e) => ExtraSelector.fromJson(e))
            .toList()
            .obs,
        itemSelector:
            Selector.fromJson(json['itemSelector'] as Map<String, dynamic>),
        successSelector:
            Selector.fromJson(json['successSelector'] as Map<String, dynamic>),
        failedSelector:
            Selector.fromJson(json['failedSelector'] as Map<String, dynamic>),
        title: Selector.fromJson(json['title'] as Map<String, dynamic>),
        subtitle: Selector.fromJson(json['subtitle'] as Map<String, dynamic>),
        uploadTime:
            Selector.fromJson(json['uploadTime'] as Map<String, dynamic>),
        star: Selector.fromJson(json['star'] as Map<String, dynamic>),
        imgCount: Selector.fromJson(json['imgCount'] as Map<String, dynamic>),
        language: Selector.fromJson(json['language'] as Map<String, dynamic>),
        previewImg:
            ImageSelector.fromJson(json['previewImg'] as Map<String, dynamic>),
        target: Selector.fromJson(json['target'] as Map<String, dynamic>),
        tag: Selector.fromJson(json['tag'] as Map<String, dynamic>),
        tagColor: Selector.fromJson(json['tagColor'] as Map<String, dynamic>),
        badgeSelector:
            Selector.fromJson(json['badgeSelector'] as Map<String, dynamic>),
        badgeText: Selector.fromJson(json['badgeText'] as Map<String, dynamic>),
        badgeColor:
            Selector.fromJson(json['badgeCategory'] as Map<String, dynamic>),
        paper: Selector.fromJson(json['paper'] as Map<String, dynamic>),
        idCode: Selector.fromJson(json['idCode'] as Map<String, dynamic>),
        nextPage: Selector.fromJson(json['nextPage'] as Map<String, dynamic>));
  }
}

class AutoCompleteParser implements IParserBase {
  @override
  final String name;
  @override
  final String uuid;
  @override
  final ParserType parserType;
  @override
  final RxList<ExtraSelector> extra;

  final Selector itemSelector;
  final Selector itemComplete;
  final Selector itemTitle;
  final Selector itemSubtitle;
  final Selector successSelector;
  final Selector failedSelector;

  AutoCompleteParser({
    required this.name,
    required this.uuid,
    List<ExtraSelector>? extra,
    Selector? itemSelector,
    Selector? itemComplete,
    Selector? itemTitle,
    Selector? itemSubtitle,
    Selector? successSelector,
    Selector? failedSelector,
  })  : itemSelector = itemSelector ?? Selector(),
        itemComplete = itemComplete ?? Selector(),
        itemTitle = itemTitle ?? Selector(),
        itemSubtitle = itemSubtitle ?? Selector(),
        successSelector = successSelector ?? Selector(),
        failedSelector = failedSelector ?? Selector(),
        extra = extra?.obs ?? <ExtraSelector>[].obs,
        parserType = ParserType.autoComplete;

  @override
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

  factory AutoCompleteParser.fromJson(Map<String, dynamic> json) {
    return AutoCompleteParser(
        name: json['name'] as String,
        uuid: json['uuid'] as String,
        extra: (json['extra'] as List<dynamic>)
            .map((e) => ExtraSelector.fromJson(e))
            .toList()
            .obs,
        itemSelector:
            Selector.fromJson(json['itemSelector'] as Map<String, dynamic>),
        itemComplete:
            Selector.fromJson(json['itemComplete'] as Map<String, dynamic>),
        itemTitle: Selector.fromJson(json['itemTitle'] as Map<String, dynamic>),
        itemSubtitle:
            Selector.fromJson(json['itemSubtitle'] as Map<String, dynamic>),
        successSelector:
            Selector.fromJson(json['successSelector'] as Map<String, dynamic>),
        failedSelector:
            Selector.fromJson(json['failedSelector'] as Map<String, dynamic>));
  }
}
