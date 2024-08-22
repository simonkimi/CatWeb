import 'package:catweb/data/controller/site.dart';
import 'package:catweb/data/loaders/async_value.dart';
import 'package:catweb/data/models/ffi/result/base.dart';
import 'package:catweb/data/models/ffi/result/result.dart';
import 'package:catweb/data/models/site/page.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/get.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

/// 一个图片, 只包含预览图和一个大图, 大图需要调用load进行异步加载
abstract class ImageWithPreviewModel extends ChangeNotifier {
  ImageResult? get previewImage;

  /// 从初始
  String? get idCode;

  /// 大图的数据
  AsyncValue<ImageReaderResult?> imageModel = const AsyncValue.idle();

  Future<void> load({
    required SitePageRule blueprint,
    required SiteEnvStore localEnv,
  }) async {
    imageModel = const AsyncValue.loading();
    notifyListeners();
    imageModel = await AsyncValue.guard(() async {
      final url = blueprint.url.isEmpty ? idCode! : blueprint.url;
      SiteService siteService = inject();
      return siteService.currentSite!.client.getReadImage(
        url: url,
        model: blueprint,
        localEnv: localEnv,
      );
    });
    notifyListeners();
  }
}
