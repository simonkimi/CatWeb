import 'package:catweb/data/controller/settings.dart';
import 'package:catweb/data/controller/site.dart';
import 'package:catweb/data/models/ffi/result/base.dart';
import 'package:catweb/navigator.dart';

import 'package:dio/dio.dart';

import 'image_loader.dart';

class ImageLoaderQueue {
  ImageLoaderQueue({
    Dio? dio,
    int? concurrency,
  })  : concurrency = concurrency ?? settingsService.concurrencyCount,
        dio = dio ?? siteService.currentSite!.client.imageDio;

  final Dio dio;
  final int concurrency;
  final _container = <String, ImageLoadNotifier>{};
  final CancelToken cancelToken = CancelToken();

  List<ImageLoadNotifier> get activeImage =>
      _container.values.where((e) => e.needLoad).toList();

  ImageLoadNotifier create(ImageResult model) {
    final key = model.cacheKey ?? model.url!;

    late ImageLoadNotifier exist;
    if (_container.containsKey(key)) {
      exist = _container[key]!;
    } else {
      exist = ImageLoadNotifier(model: model, dio: dio);
      _container[key] = exist;
    }
    exist.handleMounted();
    trigger();
    return exist;
  }

  void dispose() {
    cancelToken.cancel();
    for (final notifier in _container.values) {
      notifier.dispose();
    }
    _container.clear();
  }

  void trigger() {
    while ((activeImage.length < concurrency || concurrency == 0) &&
        activeImage.isNotEmpty) {
      activeImage.first.load(cancelToken).whenComplete(trigger);
    }
  }

  static SettingService get settingsService => getIt.get();

  static SiteService get siteService => getIt.get();
}
