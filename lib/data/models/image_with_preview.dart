import 'package:catweb/data/controller/site_service.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/gen/protobuf/model.pb.dart';
import 'package:catweb/ui/pages/view_page/viewer_subpage/image/image_provider.dart';
import 'package:catweb/utils/debug.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../loaders/load_more_mixin.dart';
import '../loaders/load_more_model.dart';

/// 带预览的图片，此model可用于列表与瀑布流
abstract class ImageWithPreviewModel<T>
    with LoadStateMixin
    implements LoadMoreItem<T> {
  ImageWithPreviewModel(this.previewModel);

  /// 预览图的数据, 初始状态下就能拿到
  T previewModel;

  ImageRpcModel? get previewImage;

  /// 从初始
  String? get idCode;

  /// 大图的数据
  Rx<ImageReaderRpcModel?> imageModel = Rx(null);
  Rx<DioImageProvider?> imageProvider = Rx(null);

  /// 加载模型
  Future<void> loadReaderModel({
    required PageBlueprintModel blueprint,
    required SiteEnvModel localEnv,
  }) async {
    try {
      if (imageModel.value != null || state.isLoading) return;
      loadStart();
      final url = blueprint.url.isEmpty ? idCode! : blueprint.url.value;
      final global = Get.find<SiteService>();
      final env = localEnv.clone()..set('idCode', idCode!);
      imageModel.value = await global.website.client.getReadImage(
        url: url,
        model: blueprint,
        localEnv: env,
      );
      imageProvider.value = DioImageProvider(
        rpcModel: imageModel.value!.image,
        dio: global.website.client.imageDio,
      );
      imageProvider.value?.resolve(const ImageConfiguration());
      loadComplete();
    } on Exception catch (e) {
      logger.e(e);
      loadError(e);
    }
  }
}
