import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.g.dart';

part 'models.freezed.dart';

@freezed
class ImageRspModel with _$ImageRspModel {
  const ImageRspModel._();

  factory ImageRspModel({
    required String url,
    required String cacheKey,
    required double width,
    required double height,
    required double imgX,
    required double imgY,
  }) = _ImageRspModel;

  factory ImageRspModel.fromJson(Map<String, dynamic> json) =>
      _$ImageRspModelFromJson(json);
}

@freezed
class ColorRspModel with _$ColorRspModel {
  const ColorRspModel._();

  factory ColorRspModel({
    required int? a,
    required int r,
    required int g,
    required int b,
  }) = _ColorRspModel;

  factory ColorRspModel.fromJson(Map<String, dynamic> json) =>
      _$ColorRspModelFromJson(json);
}

@freezed
class TagRspModel with _$TagRspModel{
  const TagRspModel._();

  factory TagRspModel({
    required String text,
    required ColorRspModel color,
    required String category,
  }) = _TagRspModel;

  factory TagRspModel.fromJson(Map<String, dynamic> json) =>
      _$TagRspModelFromJson(json);
}

