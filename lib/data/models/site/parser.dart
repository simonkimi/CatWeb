import 'package:catweb/data/models/site/selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'parser.freezed.dart';

part 'parser.g.dart';

@freezed
class ParserModel with _$ParserModel {
  const ParserModel._();

  @override
  String get name;

  @override
  String get uuid;

  @override
  List<ExtraSelectorModel> get extra;

  const factory ParserModel.imageReader({
    @Default('') String name,
    @Default('') String uuid,
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

  const factory ParserModel.detail({
    @Default('') String name,
    @Default('') String uuid,
    @Default([]) List<ExtraSelectorModel> extra,
    @Default(SelectorModel()) SelectorModel title,
    @Default(SelectorModel()) SelectorModel subtitle,
    @Default(SelectorModel()) SelectorModel uploadTime,
    @Default(SelectorModel()) SelectorModel star,
    @Default(SelectorModel()) SelectorModel imageCount,
    @Default(SelectorModel()) SelectorModel pageCount,
    @Default(SelectorModel()) SelectorModel language,
    @Default(ImageSelectorModel()) ImageSelectorModel coverImage,
    @Default(SelectorModel()) SelectorModel description,
    @Default(SelectorModel()) SelectorModel successSelector,
    @Default(SelectorModel()) SelectorModel failedSelector,
    @Default(SelectorModel()) SelectorModel thumbnailSelector,
    @Default(ImageSelectorModel()) ImageSelectorModel thumbnail,
    @Default(SelectorModel()) SelectorModel target,
    @Default(SelectorModel()) SelectorModel commentSelector,
    @Default(CommentSelectorModel()) CommentSelectorModel comments,
    @Default(SelectorModel()) SelectorModel badgeSelector,
    @Default(TagSelectorModel()) TagSelectorModel badgeItem,
    @Default(SelectorModel()) SelectorModel tagSelector,
    @Default(TagSelectorModel()) TagSelectorModel tagItem,
    @Default(SelectorModel()) SelectorModel chapterSelector,
    @Default(SelectorModel()) SelectorModel chapterTitle,
    @Default(SelectorModel()) SelectorModel chapterSubtitle,
    @Default(ImageSelectorModel()) ImageSelectorModel chapterCover,
    @Default(SelectorModel()) SelectorModel nextPage,
    @Default(SelectorModel()) SelectorModel countPrePage,
  }) = ParserModelDetail;

  const factory ParserModel.list({
    @Default('') String name,
    @Default('') String uuid,
    @Default([]) List<ExtraSelectorModel> extra,
    @Default(SelectorModel()) SelectorModel itemSelector,
    @Default(SelectorModel()) SelectorModel itemComplete,
    @Default(SelectorModel()) SelectorModel successSelector,
    @Default(SelectorModel()) SelectorModel failedSelector,
    @Default(SelectorModel()) SelectorModel title,
    @Default(SelectorModel()) SelectorModel subtitle,
    @Default(SelectorModel()) SelectorModel uploadTime,
    @Default(SelectorModel()) SelectorModel star,
    @Default(SelectorModel()) SelectorModel imageCount,
    @Default(SelectorModel()) SelectorModel language,
    @Default(ImageSelectorModel()) ImageSelectorModel previewImage,
    @Default(SelectorModel()) SelectorModel target,
    @Default(SelectorModel()) SelectorModel badgeSelector,
    @Default(TagSelectorModel()) TagSelectorModel badgeItem,
    @Default(SelectorModel()) SelectorModel tag,
    @Default(TagSelectorModel()) TagSelectorModel tagItem,
    @Default(SelectorModel()) SelectorModel paper,
    @Default(SelectorModel()) SelectorModel idCode,
    @Default(SelectorModel()) SelectorModel nextPage,
  }) = ParserModelList;

  const factory ParserModel.autoComplete({
    @Default('') String name,
    @Default('') String uuid,
    @Default([]) List<ExtraSelectorModel> extra,
    @Default(SelectorModel()) SelectorModel itemSelector,
    @Default(SelectorModel()) SelectorModel itemComplete,
    @Default(SelectorModel()) SelectorModel itemTitle,
    @Default(SelectorModel()) SelectorModel itemSubtitle,
    @Default(SelectorModel()) SelectorModel successSelector,
    @Default(SelectorModel()) SelectorModel failedSelector,
  }) = ParserModelAutoComplete;

  factory ParserModel.fromJson(Map<String, dynamic> json) =>
      _$ParserModelFromJson(json);

  ParserModelType get type {
    return switch (this) {
      ParserModelAutoComplete() => ParserModelType.autoComplete,
      ParserModelDetail() => ParserModelType.detail,
      ParserModelImageReader() => ParserModelType.imageReader,
      ParserModelList() => ParserModelType.list,
      _ => throw UnimplementedError('未知的ParserModel类型 $runtimeType'),
    };
  }

  static ParserModel fromType(ParserModelType type) {
    return switch (type) {
      ParserModelType.autoComplete => const ParserModel.autoComplete(),
      ParserModelType.detail => const ParserModel.detail(),
      ParserModelType.imageReader => const ParserModel.imageReader(),
      ParserModelType.list => const ParserModel.list(),
    };
  }

  String getDescription(BuildContext context) {
    return switch (this) {
      ParserModelAutoComplete() => '自动完成',
      ParserModelDetail() => '详情页',
      ParserModelImageReader() => '图片阅读器',
      ParserModelList() => '列表页',
      _ => throw UnimplementedError('未知的ParserModel类型 $runtimeType'),
    };
  }
}

enum ParserModelType {
  autoComplete,
  detail,
  imageReader,
  list,
}
