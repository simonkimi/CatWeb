import 'package:catweb/data/protocol/model/interface.dart';
import 'package:catweb/gen/protobuf/model.pbserver.dart';
import 'package:catweb/utils/utils.dart';
import 'package:uuid/uuid.dart';

class ImageModel implements PbAble {
  ImageModel.fromPb(ImageRpcModel pb)
      : url = pb.url,
        cacheKey = has(pb.cacheKey, pb.hasCacheKey),
        width = has(pb.width, pb.hasWidth),
        height = has(pb.height, pb.hasHeight),
        imgX = has(pb.imgX, pb.hasImgX),
        imgY = has(pb.imgY, pb.hasImgY),
        target = has(pb.target, pb.hasTarget);

  ImageModel({
    required this.url,
    this.cacheKey,
    this.width,
    this.height,
    this.imgX,
    this.imgY,
    this.target,
  });

  final String url;
  final String? cacheKey;
  final double? width;
  final double? height;
  final double? imgX;
  final double? imgY;
  final String? target;

  String get key => cacheKey ?? const Uuid().v5(Uuid.NAMESPACE_URL, url);

  bool get repeatImage => imgY != null || imgX != null;

  @override
  String toString() =>
      '<img url="$url" ${width != null ? 'width: $width' : ''} ${height != null ? 'width: $height' : ''}>';

  @override
  ImageRpcModel toPb() => ImageRpcModel(
        url: url,
        cacheKey: cacheKey,
        height: height,
        imgX: imgX,
        imgY: imgY,
        target: target,
        width: width,
      );
}
