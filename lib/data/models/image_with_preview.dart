import 'package:catweb/data/models/ffi/result/base.dart';

/// 列表、图库和阅读器之间共享的不可变预览项契约。
///
/// 业务模型只描述图片与跳转目标，不在模型内部发起网络请求或读取应用设置。
abstract interface class ImageWithPreviewModel {
  ImageResult? get previewImage;
  String? get idCode;
}
