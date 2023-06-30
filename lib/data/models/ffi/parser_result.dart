import 'package:catweb/data/models/ffi/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'parser_result.freezed.dart';

part 'parser_result.g.dart';

abstract class IParserResult {
  IParserResult(
    this.enableSuccess,
    this.enableFail,
    this.isSuccess,
    this.failedMessage,
    this.localEnv,
    this.globalEnv,
  );

  final bool? enableSuccess;
  final bool? enableFail;
  final bool? isSuccess;
  final String? failedMessage;

  final Map<String, String> localEnv;
  final Map<String, String> globalEnv;
}

@freezed
class ListParserResultItem with _$ListParserResultItem {
  factory ListParserResultItem({
    required String? title,
    required String? subtitle,
    required String? uploadTime,
    required double? star,
    required int? imgCount,
    required ImageRspModel? previewImg,
    required String? language,
    required TagRspModel? tag,
    required List<TagRspModel> badges,
    required String? paper,
    required String? target,
    required String? nextPage,
    required Map<String, String> env,
  }) = _ListParserItem;

  factory ListParserResultItem.fromJson(Map<String, dynamic> json) =>
      _$$_ListParserItemFromJson(json);
}

@freezed
class ListParserResult with _$ListParserResult implements IParserResult {
  factory ListParserResult({
    required List<ListParserResultItem> items,
    required String nextPage,
    required bool enableSuccess,
    required bool enableFail,
    required bool isSuccess,
    required String failedMessage,
    required Map<String, String> localEnv,
    required Map<String, String> globalEnv,
  }) = _ListParserResult;

  factory ListParserResult.fromJson(Map<String, dynamic> json) =>
      _$ListParserResultFromJson(json);
}

@freezed
class GalleryParserResult with _$GalleryParserResult implements IParserResult {
  factory GalleryParserResult({
    required String? title,
    required String? subtitle,
    required String? language,
    required int? imageCount,
    required String? uploadTime,
    required int? countPrePage,
    required String? description,
    required double? star,
    required List<GalleryParserResultItem> items,
    required ImageRspModel? coverImg,
    required TagRspModel? tag,
    required List<TagRspModel> badges,
    required List<GalleryParserResultComment> comments,
    required String? nextPage,
    required bool? enableSuccess,
    required bool? enableFail,
    required bool? isSuccess,
    required String? failedMessage,
    required Map<String, String> localEnv,
    required Map<String, String> globalEnv,
  }) = _GalleryParserResult;

  factory GalleryParserResult.fromJson(Map<String, dynamic> json) =>
      _$GalleryParserResultFromJson(json);
}

@freezed
class GalleryParserResultComment with _$GalleryParserResultComment {
  const GalleryParserResultComment._();

  factory GalleryParserResultComment({
    required String? username,
    required String? content,
    required String? time,
    required String? score,
    required ImageRspModel avatar,
  }) = _GalleryParserResultComment;

  factory GalleryParserResultComment.fromJson(Map<String, dynamic> json) =>
      _$GalleryParserResultCommentFromJson(json);
}

@freezed
class GalleryParserResultItem with _$GalleryParserResultItem {
  const GalleryParserResultItem._();

  factory GalleryParserResultItem({
    required ImageRspModel? previewImg,
    required String? target,
  }) = _GalleryParserResultItem;

  factory GalleryParserResultItem.fromJson(Map<String, dynamic> json) =>
      _$GalleryParserResultItemFromJson(json);
}

@freezed
class ImageReaderParserResult
    with _$ImageReaderParserResult
    implements IParserResult {
  const ImageReaderParserResult._();

  factory ImageReaderParserResult({
    required ImageRspModel image,
    required String? largerImageUrl,
    required String? rawImageUrl,
    required String? uploadTime,
    required String? source,
    required String? rating,
    required String? score,
    required List<TagRspModel> badges,
    required Map<String, String> localEnv,
    required Map<String, String> globalEnv,
    required bool? enableSuccess,
    required bool? enableFail,
    required bool? isSuccess,
    required String? failedMessage,
  }) = _ImageReaderParserResult;

  factory ImageReaderParserResult.fromJson(Map<String, dynamic> json) =>
      _$ImageReaderParserResultFromJson(json);
}

@freezed
class AutoCompleteParserResultItem with _$AutoCompleteParserResultItem {
  const AutoCompleteParserResultItem._();

  factory AutoCompleteParserResultItem({
    required String? title,
    required String? subtitle,
    required String? complete,
  }) = _AutoCompleteParserResultItem;

  factory AutoCompleteParserResultItem.fromJson(Map<String, dynamic> json) =>
      _$AutoCompleteParserResultItemFromJson(json);
}

@freezed
class AutoCompleteParserResult
    with _$AutoCompleteParserResult
    implements IParserResult {
  const AutoCompleteParserResult._();

  factory AutoCompleteParserResult({
    required List<AutoCompleteParserResultItem> items,
    required Map<String, String> localEnv,
    required Map<String, String> globalEnv,
    required bool? enableSuccess,
    required bool? enableFail,
    required bool? isSuccess,
    required String? failedMessage,
  }) = _AutoCompleteParserResult;

  factory AutoCompleteParserResult.fromJson(Map<String, dynamic> json) =>
      _$AutoCompleteParserResultFromJson(json);
}
