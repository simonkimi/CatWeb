import 'package:catweb/data/models/site_model/parser/selector.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';

part 'parser.g.dart';

@JsonEnum(valueField: 'value')
enum ParserType {
  imageReader('ImageReader'),
  listView('ListValue'),
  autoComplete('AutoComplete'),
  detail('Detail');

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

  @ExtraListConverter()
  final RxList<ExtraSelector> extra;

  Map<String, dynamic> toJson();

  IParserBase(this.name, this.uuid, this.parserType, this.extra);

  static IParserBase fromJson(Map<String, dynamic> json) {
    final parserType = ParserType.fromJson(json['parserType']);
    return switch (parserType) {
      ParserType.imageReader => ImageReaderParser.fromJson(json),
      ParserType.listView => ListViewParser.fromJson(json),
      ParserType.autoComplete => AutoCompleteParser.fromJson(json),
      ParserType.detail => DetailParser.fromJson(json)
    };
  }
}

@JsonSerializable()
class ImageReaderParser implements IParserBase {
  @override
  final String name;
  @override
  final String uuid;
  @override
  final ParserType parserType;

  @override
  @ExtraListConverter()
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

  ImageReaderParser({
    required this.name,
    required this.uuid,
    List<ExtraSelector>? extra,
    Selector? id,
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
    TagSelector? badgeItem,
    Selector? tagSelector,
    TagSelector? tagItem,
    Selector? commentSelector,
    CommentSelector? commentItem,
  })  : extra = extra?.obs ?? RxList<ExtraSelector>(),
        id = id ?? Selector(),
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
        badgeItem = badgeItem ?? TagSelector(),
        tagSelector = tagSelector ?? Selector(),
        tagItem = tagItem ?? TagSelector(),
        commentSelector = commentSelector ?? Selector(),
        commentItem = commentItem ?? CommentSelector(),
        parserType = ParserType.imageReader;

  factory ImageReaderParser.fromJson(Map<String, dynamic> json) =>
      _$ImageReaderParserFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ImageReaderParserToJson(this);
}

@JsonSerializable()
class DetailParser implements IParserBase {
  @override
  final String name;
  @override
  final String uuid;
  @override
  final ParserType parserType;
  @override
  @ExtraListConverter()
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

  DetailParser({
    required this.name,
    required this.uuid,
    List<ExtraSelector>? extra,
    Selector? title,
    Selector? subtitle,
    Selector? uploadTime,
    Selector? star,
    Selector? imageCount,
    Selector? pageCount,
    Selector? language,
    ImageSelector? coverImage,
    Selector? description,
    Selector? successSelector,
    Selector? failedSelector,
    Selector? thumbnailSelector,
    ImageSelector? thumbnail,
    Selector? target,
    Selector? commentSelector,
    CommentSelector? comments,
    Selector? badgeSelector,
    TagSelector? badgeItem,
    Selector? tagSelector,
    TagSelector? tagItem,
    Selector? chapterSelector,
    Selector? chapterTitle,
    Selector? chapterSubtitle,
    ImageSelector? chapterCover,
    Selector? nextPage,
    Selector? countPrePage,
  })  : extra = extra?.obs ?? RxList<ExtraSelector>(),
        title = title ?? Selector(),
        subtitle = subtitle ?? Selector(),
        uploadTime = uploadTime ?? Selector(),
        star = star ?? Selector(),
        imageCount = imageCount ?? Selector(),
        pageCount = pageCount ?? Selector(),
        language = language ?? Selector(),
        coverImage = coverImage ?? ImageSelector(),
        description = description ?? Selector(),
        successSelector = successSelector ?? Selector(),
        failedSelector = failedSelector ?? Selector(),
        thumbnailSelector = thumbnailSelector ?? Selector(),
        thumbnail = thumbnail ?? ImageSelector(),
        target = target ?? Selector(),
        commentSelector = commentSelector ?? Selector(),
        comments = comments ?? CommentSelector(),
        badgeSelector = badgeSelector ?? Selector(),
        badgeItem = badgeItem ?? TagSelector(),
        tagSelector = tagSelector ?? Selector(),
        tagItem = tagItem ?? TagSelector(),
        chapterSelector = chapterSelector ?? Selector(),
        chapterTitle = chapterTitle ?? Selector(),
        chapterSubtitle = chapterSubtitle ?? Selector(),
        chapterCover = chapterCover ?? ImageSelector(),
        nextPage = nextPage ?? Selector(),
        countPrePage = countPrePage ?? Selector(),
        parserType = ParserType.detail;

  factory DetailParser.fromJson(Map<String, dynamic> json) =>
      _$DetailParserFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DetailParserToJson(this);
}

@JsonSerializable()
class ListViewParser implements IParserBase {
  @override
  final String name;
  @override
  final String uuid;
  @override
  final ParserType parserType;
  @override
  @ExtraListConverter()
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

  ListViewParser({
    required this.name,
    required this.uuid,
    List<ExtraSelector>? extra,
    Selector? itemSelector,
    Selector? itemComplete,
    Selector? successSelector,
    Selector? failedSelector,
    Selector? title,
    Selector? subtitle,
    Selector? uploadTime,
    Selector? star,
    Selector? imageCount,
    Selector? language,
    ImageSelector? previewImage,
    Selector? target,
    Selector? badgeSelector,
    TagSelector? badgeItem,
    Selector? tag,
    TagSelector? tagItem,
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
        imageCount = imageCount ?? Selector(),
        language = language ?? Selector(),
        previewImage = previewImage ?? ImageSelector(),
        target = target ?? Selector(),
        badgeSelector = badgeSelector ?? Selector(),
        badgeItem = badgeItem ?? TagSelector(),
        tag = tag ?? Selector(),
        tagItem = tagItem ?? TagSelector(),
        paper = paper ?? Selector(),
        idCode = idCode ?? Selector(),
        nextPage = nextPage ?? Selector(),
        extra = extra?.obs ?? <ExtraSelector>[].obs,
        parserType = ParserType.listView;

  @override
  Map<String, dynamic> toJson() => _$ListViewParserToJson(this);

  factory ListViewParser.fromJson(Map<String, dynamic> json) =>
      _$ListViewParserFromJson(json);
}

@JsonSerializable()
class AutoCompleteParser implements IParserBase {
  @override
  final String name;
  @override
  final String uuid;
  @override
  final ParserType parserType;
  @override
  @ExtraListConverter()
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
  Map<String, dynamic> toJson() => _$AutoCompleteParserToJson(this);

  factory AutoCompleteParser.fromJson(Map<String, dynamic> json) =>
      _$AutoCompleteParserFromJson(json);
}

class ExtraListConverter
    implements
        JsonConverter<RxList<ExtraSelector>, List<Map<String, dynamic>>> {
  const ExtraListConverter();

  @override
  RxList<ExtraSelector> fromJson(List<Map<String, dynamic>> json) {
    return json.map((e) => ExtraSelector.fromJson(e)).toList().obs;
  }

  @override
  List<Map<String, dynamic>> toJson(RxList<ExtraSelector> object) {
    return object.map((e) => e.toJson()).toList();
  }
}
