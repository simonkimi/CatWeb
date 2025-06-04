import 'package:catweb/data/models/ffi/result/base.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'result.freezed.dart';

part 'result.g.dart';

@freezed
sealed class DetailPreviewItem with _$DetailPreviewItem {
  const factory DetailPreviewItem({
    ImageResult? previewImage,
    String? target,
  }) = _PreviewItem;

  factory DetailPreviewItem.fromJson(Map<String, dynamic> json) =>
      _$DetailPreviewItemFromJson(json);
}

@freezed
sealed class DetailParserResult with _$DetailParserResult {
  const factory DetailParserResult({
    String? title,
    String? subtitle,
    String? language,
    int? imageCount,
    String? uploadTime,
    int? countPrePage,
    String? description,
    double? star,
    List<DetailPreviewItem>? previews,
    ImageResult? coverImage,
    List<TagResult>? badges,
    List<TagResult>? tags,
    List<CommentResult>? comments,
    String? nextPage,
    bool? isSuccess,
    String? failMessage,
    required List<EnvResult> envs,
    required List<ParserError> errors,
  }) = _DetailParserResult;

  factory DetailParserResult.fromJson(Map<String, dynamic> json) =>
      _$DetailParserResultFromJson(json);
}

@freezed
sealed class AutoCompleteResultItem with _$AutoCompleteResultItem {
  const factory AutoCompleteResultItem({
    String? title,
    String? subtitle,
    String? complete,
  }) = _AutoCompleteResultItem;

  factory AutoCompleteResultItem.fromJson(Map<String, dynamic> json) =>
      _$AutoCompleteResultItemFromJson(json);
}

@freezed
sealed class AutoCompleteResult with _$AutoCompleteResult {
  const factory AutoCompleteResult({
    List<AutoCompleteResultItem>? items,
    bool? isSuccess,
    String? failMessage,
    required List<EnvResult> envs,
    required List<ParserError> errors,
  }) = _AutoCompleteResult;

  factory AutoCompleteResult.fromJson(Map<String, dynamic> json) =>
      _$AutoCompleteResultFromJson(json);
}

@freezed
sealed class ImageReaderResult with _$ImageReaderResult {
  const factory ImageReaderResult({
    ImageResult? image,
    ImageResult? largerImage,
    ImageResult? rawImage,
    String? uploadTime,
    String? source,
    String? rating,
    double? score,
    List<TagResult>? badges,
    List<TagResult>? tags,
    List<CommentResult>? comments,
    bool? isSuccess,
    String? failMessage,
    required List<EnvResult> envs,
    required List<ParserError> errors,
  }) = _ImageReaderResult;

  factory ImageReaderResult.fromJson(Map<String, dynamic> json) =>
      _$ImageReaderResultFromJson(json);
}

@freezed
sealed class ListParserResultItem with _$ListParserResultItem {
  const factory ListParserResultItem({
    String? title,
    String? subtitle,
    String? uploadTime,
    double? star,
    int? imageCount,
    ImageResult? previewImage,
    List<TagResult>? badges,
    List<TagResult>? tags,
    String? idCode,
    String? language,
    String? paper,
  }) = _ListParserResultItem;

  factory ListParserResultItem.fromJson(Map<String, dynamic> json) =>
      _$ListParserResultItemFromJson(json);
}

@freezed
sealed class ListParserResult with _$ListParserResult {
  const factory ListParserResult({
    List<ListParserResultItem>? items,
    String? nextPage,
    bool? isSuccess,
    String? failMessage,
    required List<EnvResult> envs,
    required List<ParserError> errors,
  }) = _ListParserResult;

  factory ListParserResult.fromJson(Map<String, dynamic> json) =>
      _$ListParserResultFromJson(json);
}
