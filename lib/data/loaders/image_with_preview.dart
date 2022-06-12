import 'package:catweb/data/protocol/model/model.dart';
import 'package:catweb/gen/protobuf/model.pb.dart';
import 'package:catweb/utils/state_mixin.dart';

/// 带预览的图片，此model可用于列表与瀑布流
abstract class ImageWithPreviewModel<T> with LoadStateMixin {
  ImageWithPreviewModel(this.previewModel);

  ImageReaderRpcModel? imageModel;

  T previewModel;

  ImageRpcModel get previewImage;
}

class GalleryImageWithPreview
    extends ImageWithPreviewModel<GalleryRpcModel_Item> {
  GalleryImageWithPreview(super.previewModel);

  @override
  ImageRpcModel get previewImage => previewModel.previewImg;
}

class ListItemModel extends ImageWithPreviewModel<ListRpcModel_Item> {
  ListItemModel(super.previewModel);

  @override
  ImageRpcModel get previewImage => previewModel.previewImg;
}
