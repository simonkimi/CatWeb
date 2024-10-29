import 'package:catweb/data/controller/settings.dart';
import 'package:catweb/data/controller/site.dart';
import 'package:catweb/data/loaders/async_progress_value.dart';
import 'package:catweb/data/loaders/priority_task_query.dart';
import 'package:catweb/data/models/ffi/result/base.dart';
import 'package:catweb/app.dart';
import 'package:collection/collection.dart';

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

  final Set<ImageLoadNotifier> _loadingQueue = {};

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
    if (exist.value is AsyncProgressCached) {
      exist.load(cancelToken);
    } else {
      trigger();
    }

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
    while (_loadingQueue.length < concurrency || concurrency == 0) {
      final img = _container.values.firstWhereOrNull((e) => e.needLoad);
      if (img == null) {
        break;
      }
      _loadingQueue.add(img);
      img.load(cancelToken).whenComplete(() {
        _loadingQueue.remove(img);
        Future.microtask(trigger);
      });
    }
  }

  static SettingService get settingsService => getIt.get();

  static SiteService get siteService => getIt.get();
}
