import 'package:catweb/data/controller/settings.dart';
import 'package:catweb/data/controller/site.dart';
import 'package:catweb/data/loaders/async_progress_value.dart';
import 'package:catweb/data/loaders/reader_image_provider.dart';
import 'package:catweb/data/models/ffi/result/base.dart';
import 'package:catweb/data/models/ffi/result/result.dart';
import 'package:catweb/data/models/site/page.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/app.dart';

import 'package:flutter/widgets.dart';

/// 一个图片, 只包含预览图和一个大图, 大图需要调用load进行异步加载
abstract class ImageWithPreviewModel extends ChangeNotifier {
  ImageResult? get previewImage;

  /// 从初始
  String? get idCode;

  /// 大图的数据
  AsyncProgressValue<ImageReaderResult?> imageModel =
      const AsyncProgressValue.idle();

  ReaderImageProvider? imageProvider;

  Future<void> load({
    required SitePageRule pageRule,
    required SiteEnvStore localEnv,
  }) async {
    imageModel = const AsyncProgressValue.loading(0);
    notifyListeners();
    imageModel = await AsyncProgressValue.guard(() async {
      final url = pageRule.url.isEmpty ? idCode! : pageRule.url;
      SiteService siteService = getIt.get();
      return siteService.currentSite!.client.getReadImage(
        url: url,
        model: pageRule,
        localEnv: localEnv,
      );
    });

    final result = getImage();
    if (result != null) {
      imageProvider = ReaderImageProvider(
        dio: getIt.get<SiteService>().currentSite!.client.imageDio,
        imageResult: result,
      );
    }

    notifyListeners();
  }

  ImageResult? getImage() {
    if (imageModel case AsyncProgressData(:final value)) {
      return switch (getIt.get<SettingService>().imageQuality) {
        ImageQuality.original =>
          value?.rawImage ?? value?.largerImage ?? value?.image,
        ImageQuality.larger =>
          value?.largerImage ?? value?.image ?? value?.rawImage,
        ImageQuality.defaultQ =>
          value?.image ?? value?.largerImage ?? value?.rawImage
      };
    }
    return null;
  }
}
