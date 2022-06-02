import 'package:catweb/gen/protobuf/model.pb.dart';
import 'package:catweb/utils/state_mixin.dart';

/// 带预览的图片，此model可用于列表与瀑布流以及
abstract class ImageWithPreviewModel with LoadStateMixin {
  ImageWithPreviewModel({required this.index});

  final int index;

  /// 大图的地址模型
  ImageReaderRpcModel? get model;

  /// 预览的地址模型
  ImageRpcModel? get preview;

  /// 当预加载遇到[model]为空的时候, 可以调用这个方法来获取预加载的图片
  Future<void> loadModel();

  /// 当预加载遇到[preview]为空的时候, 可以调用这个方法来获取预加载的图片
  Future<void> loadPreview();
}
