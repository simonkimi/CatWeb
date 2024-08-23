import 'package:catweb/data/loaders/page_loader.dart';
import 'package:catweb/data/models/gallery_models.dart';

class ViewerGalleryNotifier
    extends BasePageLoaderNotifier<GalleryItemModel, GalleryPageModel> {
  final DetailParserResult detailModel;

  @override
  Future<GalleryPageModel> loadPageImpl(int page) {
    // TODO: implement loadPageImpl
    throw UnimplementedError();
  }

  @override
  int? get totalSize => throw UnimplementedError();

  @override
  int? get chunkSize => throw UnimplementedError();
}
