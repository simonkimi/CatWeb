import 'package:catweb/gen/protobuf/model.pb.dart';

import 'load_more_mixin.dart';
import 'load_more_model.dart';

/// 带预览的图片，此model可用于列表与瀑布流
abstract class ImageWithPreviewModel<T>
    with LoadStateMixin
    implements LoadMoreItem<T> {
  ImageWithPreviewModel(this.previewModel);

  ImageReaderRpcModel? imageModel;

  T previewModel;

  ImageRpcModel get previewImage;
}

/// Gallery带预览的加载项目
class GalleryImageWithPreview
    extends ImageWithPreviewModel<GalleryRpcModel_Item> {
  GalleryImageWithPreview(super.previewModel);

  @override
  ImageRpcModel get previewImage => previewModel.previewImg;

  @override
  GalleryRpcModel_Item get item => previewModel;
}

/// List带预览加载的项目
class ListItemModel extends ImageWithPreviewModel<ListRpcModel_Item> {
  ListItemModel(super.previewModel);

  @override
  ImageRpcModel get previewImage => previewModel.previewImg;

  @override
  ListRpcModel_Item get item => previewModel;
}
