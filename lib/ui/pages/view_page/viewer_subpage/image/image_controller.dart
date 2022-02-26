abstract class ImageViewerTargetModel {
  List<String> get targets;

  int? get imageCount;
}

class ImageController {
  ImageController({required this.model});

  final ImageViewerTargetModel model;
}
