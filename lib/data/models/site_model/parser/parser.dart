import 'package:catweb/data/models/site_model/parser/selector.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'parser.g.dart';

part 'parser.freezed.dart';

enum ParserType {
  imageReader('ImageReader'),
  listView('ListValue'),
  autoComplete('AutoComplete'),
  gallery('Gallery');

  const ParserType(this.value);

  final String value;

  factory ParserType.fromString(String value) {
    return ParserType.values.firstWhere((e) => e.value == value);
  }

  static String _toType(ParserType type) => type.value;

  static ParserType _fromType(String type) => ParserType.fromString(type);
}

abstract class IParserBase {
  final String name;
  final String uuid;
  final ParserType parserType;
  late List<ExtraSelector> extra;

  IParserBase(this.name, this.uuid, this.extra, this.parserType);

  Map<String, dynamic> toJson();

  static IParserBase fromJson(Map<String, dynamic> json) {
    final type = ParserType.fromString(json['parserType'] as String);
    return switch (type) {
      ParserType.imageReader => ImageReaderParser.fromJson(json),
      ParserType.listView => ListViewParser.fromJson(json),
      ParserType.autoComplete => AutoCompleteParser.fromJson(json),
      ParserType.gallery => GalleryParser.fromJson(json),
    };
  }
}

@unfreezed
class ImageReaderParser with _$ImageReaderParser implements IParserBase {
  ImageReaderParser._();

  @Assert(
      'parserType == ParserType.imageReader', 'parserType must be imageReader')
  factory ImageReaderParser({
    @JsonKey(toJson: ParserType._toType, fromJson: ParserType._fromType)
    @Default(ParserType.imageReader)
    ParserType parserType,
    required String name,
    required String uuid,
    @Default([]) List<ExtraSelector> extra,
    @Default(ImageSelector()) ImageSelector image,
    @Default(Selector()) Selector largerImage,
    @Default(Selector()) Selector rawImage,
    @Default(Selector()) Selector rating,
    @Default(Selector()) Selector score,
    @Default(Selector()) Selector source,
    @Default(Selector()) Selector uploadTime,
    @Default(Selector()) Selector successSelector,
    @Default(Selector()) Selector failedSelector,
    @Default(Selector()) Selector badgeSelector,
    @Default(Selector()) Selector badgeText,
    @Default(Selector()) Selector badgeCategory,
  }) = _ImageReaderParser;

  factory ImageReaderParser.fromJson(Map<String, dynamic> json) =>
      _$ImageReaderParserFromJson(json);
}

@unfreezed
class GalleryParser with _$GalleryParser implements IParserBase {
  GalleryParser._();

  @Assert('parserType == ParserType.gallery', 'parserType must be gallery')
  factory GalleryParser({
    @JsonKey(toJson: ParserType._toType, fromJson: ParserType._fromType)
    @Default(ParserType.gallery)
    ParserType parserType,
    required String name,
    required String uuid,
    @Default([]) List<ExtraSelector> extra,
    @Default(Selector()) Selector title,
    @Default(Selector()) Selector subtitle,
    @Default(Selector()) Selector uploadTime,
    @Default(Selector()) Selector star,
    @Default(Selector()) Selector imgCount,
    @Default(Selector()) Selector pageCount,
    @Default(Selector()) Selector language,
    @Default(ImageSelector()) ImageSelector coverImg,
    @Default(Selector()) Selector description,
    @Default(Selector()) Selector successSelector,
    @Default(Selector()) Selector failedSelector,
    @Default(Selector()) Selector thumbnailSelector,
    @Default(ImageSelector()) ImageSelector thumbnail,
    @Default(Selector()) Selector target,
    @Default(Selector()) Selector commentSelector,
    @Default(CommentSelector()) CommentSelector comments,
    @Default(Selector()) Selector tag,
    @Default(Selector()) Selector tagColor,
    @Default(Selector()) Selector badgeSelector,
    @Default(Selector()) Selector badgeText,
    @Default(Selector()) Selector badgeCategory,
    @Default(Selector()) Selector chapterSelector,
    @Default(Selector()) Selector chapterTitle,
    @Default(Selector()) Selector chapterSubtitle,
    @Default(ImageSelector()) ImageSelector chapterCover,
    @Default(Selector()) Selector nextPage,
    @Default(Selector()) Selector countPrePage,
  }) = _GalleryParser;

  factory GalleryParser.fromJson(Map<String, dynamic> json) =>
      _$GalleryParserFromJson(json);
}

@unfreezed
class ListViewParser with _$ListViewParser implements IParserBase {
  ListViewParser._();

  @Assert('parserType == ParserType.listView', 'parserType must be listView')
  factory ListViewParser({
    @JsonKey(toJson: ParserType._toType, fromJson: ParserType._fromType)
    @Default(ParserType.listView)
    ParserType parserType,
    required String name,
    required String uuid,
    @Default([]) List<ExtraSelector> extra,
    @Default(Selector()) Selector itemSelector,
    @Default(Selector()) Selector successSelector,
    @Default(Selector()) Selector failedSelector,
    @Default(Selector()) Selector title,
    @Default(Selector()) Selector subtitle,
    @Default(Selector()) Selector uploadTime,
    @Default(Selector()) Selector star,
    @Default(Selector()) Selector imgCount,
    @Default(Selector()) Selector language,
    @Default(ImageSelector()) ImageSelector previewImg,
    @Default(Selector()) Selector target,
    @Default(Selector()) Selector tag,
    @Default(Selector()) Selector tagColor,
    @Default(Selector()) Selector badgeSelector,
    @Default(Selector()) Selector badgeText,
    @Default(Selector()) Selector badgeColor,
    @Default(Selector()) Selector paper,
    @Default(Selector()) Selector idCode,
    @Default(Selector()) Selector nextPage,
  }) = _ListViewParser;

  factory ListViewParser.fromJson(Map<String, dynamic> json) =>
      _$ListViewParserFromJson(json);
}

@unfreezed
class AutoCompleteParser with _$AutoCompleteParser implements IParserBase {
  AutoCompleteParser._();

  @Assert('parserType == ParserType.autoComplete',
      'parserType must be autoComplete')
  factory AutoCompleteParser({
    @JsonKey(toJson: ParserType._toType, fromJson: ParserType._fromType)
    @Default(ParserType.autoComplete)
    ParserType parserType,
    required String name,
    required String uuid,
    @Default([]) List<ExtraSelector> extra,
    @Default(Selector()) Selector itemSelector,
    @Default(Selector()) Selector itemComplete,
    @Default(Selector()) Selector itemTitle,
    @Default(Selector()) Selector itemSubtitle,
    @Default(Selector()) Selector successSelector,
    @Default(Selector()) Selector failedSelector,
  }) = _AutoCompleteParser;

  factory AutoCompleteParser.fromJson(Map<String, dynamic> json) =>
      _$AutoCompleteParserFromJson(json);
}
