import 'package:catweb/gen/protobuf/model.pb.dart';
import 'package:catweb/utils/state_mixin.dart';

/// 带预览的图片，此model可用于列表与瀑布流
abstract class ImageWithPreviewModel<T> with LoadStateMixin {
  ImageWithPreviewModel({
    required this.index,
    required this.previewModel,
  });

  final int index;
  ImageReaderRpcModel? imageModel;

  T previewModel;
  ImageRpcModel get preview;
}


