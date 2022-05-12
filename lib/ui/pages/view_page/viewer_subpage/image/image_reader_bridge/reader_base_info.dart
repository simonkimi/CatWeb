import 'package:catweb/gen/protobuf/model.pb.dart';
import 'package:catweb/utils/state_mixin.dart';

/// 每个图片的基本信息, 具体加载逻辑也是由上一级来做
abstract class ImageReaderItem with LoadStateMixin {
  ImageReaderItem({required this.index});

  final int index;

  ImageReaderRpcModel? get model;

  ImageRpcModel? get previewImage;

  /// 当预加载遇到[model]为空的时候, 可以调用这个方法来获取预加载的图片
  Future<void> requestLoad();
}
