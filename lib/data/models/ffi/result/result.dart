import 'package:catweb/data/models/ffi/result/base.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'result.freezed.dart';

part 'result.g.dart';

@freezed
class PreviewItem with _$PreviewItem {
  const factory PreviewItem({
    ImageResult? previewImage,
    String? target,
  }) = _PreviewItem;

  factory PreviewItem.fromJson(Map<String, dynamic> json) =>
      _$PreviewItemFromJson(json);
}

@freezed
class DetailParserResult with _$DetailParserResult {
  const factory DetailParserResult({
    String? title,
    String? subtitle,
    String? language,
    int? imageCount,
    String? uploadTime,
    int? countPrePage,
    String? description,
    double? star,
    List<PreviewItem>? previews,
    ImageResult? coverImage,
    List<TagResult>? badges,
    List<TagResult>? tags,
    List<CommentResult>? comments,
    String? nextPage,
    bool? isSuccess,
    String? failMessage,
    List<EnvResult>? env,
  }) = _DetailParserResult;

  factory DetailParserResult.fromJson(Map<String, dynamic> json) =>
      _$DetailParserResultFromJson(json);
}
