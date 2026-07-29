import 'package:catweb/data/models/ffi/result/base.dart';
import 'package:catweb/data/models/ffi/result/result.dart';
import 'package:catweb/data/models/image_with_preview.dart';

/// 图库详情页的元数据及不可变预览项集合。
final class GalleryPageModel {
  GalleryPageModel(this.pageData)
    : items = List<GalleryItemModel>.unmodifiable(
        (pageData.previews ?? const []).map(GalleryItemModel.new),
      );

  final DetailParserResult pageData;

  final List<GalleryItemModel> items;
}

/// 图库预览结果的不可变业务适配项。
final class GalleryItemModel implements ImageWithPreviewModel {
  GalleryItemModel(this.previewModel);

  final DetailPreviewItem previewModel;

  @override
  ImageResult get previewImage => previewModel.previewImage!;

  @override
  String? get idCode => previewModel.target;
}
