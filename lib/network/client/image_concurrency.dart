import 'package:catweb/data/controller/setting_service.dart';
import 'package:catweb/data/controller/site_service.dart';
import 'package:catweb/data/models/ffi/models.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'image_loader.dart';

/// 用于加载图片, 同url公用用一个imageProvider
class ImageListConcurrency {
  ImageListConcurrency({
    Dio? dio,
    int? concurrency,
  })  : concurrency =
            concurrency ?? Get.find<SettingService>().concurrencyCount.value,
        dio = dio ?? Get.find<SiteService>().website.client.imageDio;

  final Dio dio;
  final int concurrency;

  final _globalCancelToken = CancelToken();

  final _imageMap = <String, ImageLoadModel>{};

  List<ImageLoadModel> get activeImage =>
      _imageMap.values.where((e) => e.needLoad).toList();

  ImageLoadModel create(ImageRspModel model) {
    late ImageLoadModel exist;

    final cacheKey = model.cacheKey ?? model.url;

    if (_imageMap.containsKey(cacheKey)) {
      exist = _imageMap[cacheKey]!..handle();
    } else {
      exist = ImageLoadModel(model: model, dio: dio);
      _imageMap[cacheKey] = exist;
    }

    _trigger();
    exist.loadCache().whenComplete(() => _trigger());
    return exist;
  }

  void reload(ImageLoadModel model) {
    model.reset();
    _trigger();
  }

  void dispose() {
    _globalCancelToken.cancel();
    _imageMap.forEach((key, value) {
      value.dispose();
    });
  }

  void _trigger() {
    while ((activeImage.length < concurrency || concurrency == 0) &&
        activeImage.isNotEmpty) {
      activeImage.first.load().whenComplete(_trigger);
    }
  }
}
