import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'base.freezed.dart';

part 'base.g.dart';

@freezed
sealed class ImageResult with _$ImageResult {
  const factory ImageResult({
    String? url,
    String? cacheKey,
    double? width,
    double? height,
    double? x,
    double? y,
  }) = _ImageResult;

  factory ImageResult.fromJson(Map<String, dynamic> json) =>
      _$ImageResultFromJson(json);
}

@freezed
sealed class CommentResult with _$CommentResult {
  const factory CommentResult({
    String? username,
    String? content,
    String? time,
    String? score,
    ImageResult? avatar,
  }) = _CommentResult;

  factory CommentResult.fromJson(Map<String, dynamic> json) =>
      _$CommentResultFromJson(json);
}

@freezed
sealed class TagResult with _$TagResult {
  const factory TagResult({
    String? text,
    String? color,
    String? category,
  }) = _TagResult;

  factory TagResult.fromJson(Map<String, dynamic> json) =>
      _$TagResultFromJson(json);
}

@freezed
sealed class EnvResult with _$EnvResult {
  const factory EnvResult({
    String? id,
    bool? global,
    String? value,
  }) = _EnvResult;

  factory EnvResult.fromJson(Map<String, dynamic> json) =>
      _$EnvResultFromJson(json);
}

@freezed
sealed class ParserError with _$ParserError {
  const factory ParserError({
    required int code,
    required String message,
  }) = _ParserError;

  factory ParserError.fromJson(Map<String, dynamic> json) =>
      _$ParserErrorFromJson(json);
}
