import 'package:catweb/data/controller/settings.dart';
import 'package:catweb/data/controller/site.dart';
import 'package:catweb/data/models/ffi/result/base.dart';
import 'package:catweb/get.dart';
import 'package:dio/dio.dart';

import 'image_loader.dart';

class ImageLoaderQueue {
  ImageLoaderQueue({
    Dio? dio,
    int? concurrency,
  })  : concurrency = concurrency ?? inject(settingsProvider).concurrencyCount,
        dio = dio ?? inject(siteProvider)!.client.imageDio;

  final Dio dio;
  final int concurrency;
  final _container = <String, ImageLoadNotifier>{};

  ImageLoadNotifier insert(ImageResult model) {
    final key = model.cacheKey ?? model.url!;

    late ImageLoadNotifier exist;
    if (_container.containsKey(key)) {
      exist = _container[key]!;
    } else {
      exist = ImageLoadNotifier(model: model, dio: dio);
      _container[key] = exist;
    }
    return exist;
  }
}
