import 'package:catweb/data/models/new_site/selector.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'parser.freezed.dart';

part 'parser.g.dart';

enum ParserType {
  @JsonValue('imageReader')
  imageReader,
  @JsonValue('listView')
  listView,
  @JsonValue('autoComplete')
  autoComplete,
  @JsonValue('detail')
  detail,
}

abstract interface class ISiteParser {
  String get name;

  String get uuid;

  ParserType get parserType;

  List<ExtraSelectorModel> get extra;
}

@freezed
class ParserModel with _$ParserModel {
  @Implements<ISiteParser>()
  const factory ParserModel.imageReader({
    @Default('') String name,
    @Default('') String uuid,
    @Default(ParserType.imageReader) ParserType parserType,
    @Default([]) List<ExtraSelectorModel> extra,
    @Default(SelectorModel()) SelectorModel id,
    @Default(ImageSelectorModel()) ImageSelectorModel image,
    @Default(SelectorModel()) SelectorModel largerImage,
    @Default(SelectorModel()) SelectorModel rawImage,
    @Default(SelectorModel()) SelectorModel rating,
    @Default(SelectorModel()) SelectorModel score,
    @Default(SelectorModel()) SelectorModel source,
    @Default(SelectorModel()) SelectorModel uploadTime,
    @Default(SelectorModel()) SelectorModel successSelector,
    @Default(SelectorModel()) SelectorModel failedSelector,
    @Default(SelectorModel()) SelectorModel badgeSelector,
    @Default(TagSelectorModel()) TagSelectorModel badgeItem,
    @Default(SelectorModel()) SelectorModel tagSelector,
    @Default(TagSelectorModel()) TagSelectorModel tagItem,
    @Default(SelectorModel()) SelectorModel commentSelector,
    @Default(CommentSelectorModel()) CommentSelectorModel commentItem,
  }) = ParserModelImageReader;

  factory ParserModel.fromJson(Map<String, dynamic> json) =>
      _$ParserModelFromJson(json);
}
