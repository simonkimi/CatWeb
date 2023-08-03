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
      ParserType.gallery => DetailParser.fromJson(json)
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
  final TagSelector badgeItem;
  final Selector tagSelector;
  final TagSelector tagItem;
  final Selector commentSelector;
  final CommentSelector commentItem;
}

class DetailParser implements IParserBase {
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
  final Selector imageCount;
  final Selector pageCount;
  final Selector language;
  final ImageSelector coverImage;
  final Selector description;
  final Selector successSelector;
  final Selector failedSelector;
  final Selector thumbnailSelector;
  final ImageSelector thumbnail;
  final Selector target;
  final Selector commentSelector;
  final CommentSelector comments;
  final Selector badgeSelector;
  final TagSelector badgeItem;
  final Selector tagSelector;
  final TagSelector tagItem;
  final Selector chapterSelector;
  final Selector chapterTitle;
  final Selector chapterSubtitle;
  final ImageSelector chapterCover;
  final Selector nextPage;
  final Selector countPrePage;
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
  final Selector imageCount;
  final Selector language;
  final ImageSelector previewImage;
  final Selector target;
  final Selector badgeSelector;
  final TagSelector badgeItem;
  final Selector tag;
  final TagSelector tagItem;
  final Selector paper;
  final Selector idCode;
  final Selector nextPage;
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
