import 'package:catweb/data/loaders/page_loader.dart';
import 'package:catweb/data/models/ffi/result/base.dart';
import 'package:catweb/data/models/ffi/result/result.dart';
import 'package:catweb/data/models/image_with_preview.dart';

class GalleryPageModel extends BasePageData<GalleryItemModel> {
  GalleryPageModel(this.pageData)
      : _items = pageData.previews!.map((e) => GalleryItemModel(e)).toList();

  final DetailParserResult pageData;

  final List<GalleryItemModel> _items;

  @override
  List<GalleryItemModel> get items => _items;

  @override
  void dispose() {}
}

/// Detail带预览的加载项目
class GalleryItemModel extends ImageWithPreviewModel {
  GalleryItemModel(this.previewModel);

  final DetailPreviewItem previewModel;

  @override
  ImageResult get previewImage => previewModel.previewImage!;

  @override
  String? get idCode => previewModel.target;
}
