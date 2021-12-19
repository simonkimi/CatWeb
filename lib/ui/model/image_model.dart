class ImageModel {
  final String? url;
  final double? width;
  final double? height;
  final int? imgX;
  final int? imgY;

  ImageModel({
    this.url,
    this.width,
    this.height,
    this.imgX,
    this.imgY,
  });

  @override
  String toString() =>
      '<img url="$url" ${width != null ? 'width: $width' : ''} ${height != null ? 'width: $height' : ''}>';
}
