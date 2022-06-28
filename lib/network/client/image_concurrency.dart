import 'package:catweb/data/controller/setting_controller.dart';
import 'package:catweb/data/controller/site_controller.dart';
import 'package:catweb/data/protocol/model/model.dart';
import 'package:catweb/gen/protobuf/model.pb.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'image_loader.dart';

class ImageListConcurrency {
  ImageListConcurrency({
    Dio? dio,
    int? concurrency,
  })  : concurrency =
            concurrency ?? Get.find<SettingController>().concurrencyCount.value,
        dio = dio ?? Get.find<GlobalController>().website.client.imageDio;

  final Dio dio;
  final int concurrency;

  final _globalCancelToken = CancelToken();

  final _imageMap = <String, ImageLoadModel>{};

  List<ImageLoadModel> get activeImage =>
      _imageMap.values.where((e) => e.needLoad).toList();

  ImageLoadModel create(ImageRpcModel model) {
    late ImageLoadModel exist;
    if (_imageMap.containsKey(model.key)) {
      exist = _imageMap[model.key]!..handle();
    } else {
      exist = ImageLoadModel(model: model, dio: dio);
      _imageMap[model.key] = exist;
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
      activeImage[0].load().then((value) => _trigger());
    }
  }
}
