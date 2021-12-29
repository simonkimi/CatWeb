import 'dart:math';

import 'package:catweb/data/controller/setting_controller.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:drift/drift.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class ImageModel {
  ImageModel({
    required this.url,
    this.cacheKey,
    this.width,
    this.height,
    this.imgX,
    this.imgY,
  });

  final String url;
  final String? cacheKey;
  final double? width;
  final double? height;
  final int? imgX;
  final int? imgY;

  String get key => cacheKey ?? const Uuid().v5(Uuid.NAMESPACE_URL, url);

  bool get repeatImage => imgY != null || imgX != null;

  @override
  String toString() =>
      '<img url="$url" ${width != null ? 'width: $width' : ''} ${height != null ? 'width: $height' : ''}>';
}

enum ImageLoadState {
  cached,
  waiting,
  loading,
  finish,
  error,
}

class ImageLoadModel {
  ImageLoadModel({
    required this.model,
    required this.dio,
  });

  final ImageModel model;
  final Dio dio;

  final Rx<ImageLoadState> _state = ImageLoadState.waiting.obs;
  final RxDouble _progress = 0.0.obs;
  final RxInt _handleWidget = 1.obs;
  final Rx<Exception?> _lastException = Rx(null);

  Uint8List? _data;

  Uint8List? get data => _data;

  double get progress => _progress.value;

  String get key => model.key;

  bool get needLoad =>
      _state.value == ImageLoadState.waiting && _handleWidget.value > 0;

  Future<void> debugLoad() async {
    print('开始加载 ${model.url}');
    final rnd = Random().nextInt(10);
    await Future.delayed(Duration(seconds: rnd));
    _state.value = ImageLoadState.finish;
    print('加载 ${model.url} 耗时 $rnd 秒');
  }

  Future<void> loadCache() async {
    if (_state.value == ImageLoadState.cached) {
      final db = Get.find<SettingController>().dbCacheStore;
      final cache = await db.get(key);
      if (cache != null) await load();
    }
  }

  Future<ImageLoadModel> load() async {
    try {
      _state.value = ImageLoadState.loading;
      final rsp = await dio.get<Uint8List>(
        model.url,
        onReceiveProgress: (r, t) => _progress.value = r / t,
        options: Get.find<SettingController>()
            .dioCacheOptions
            .copyWith(
              policy: CachePolicy.request,
              keyBuilder: (req) => key,
            )
            .toOptions(),
      );
      if (rsp.data == null || rsp.data!.isEmpty) {
        throw StateError(
            '${model.url} is empty and cannot be loaded as an image.');
      }
      _data = rsp.data;
      _state.value = ImageLoadState.finish;
    } on Exception catch (e) {
      _lastException.value = e;
      await onDisplayError();
      rethrow;
    }
    return this;
  }

  void handle() => _handleWidget.value += 1;

  int get handleCount => _handleWidget.value;

  void dispose() {
    _handleWidget.value -= 1;
    if (_handleWidget.value == 0) {
      _state.value = ImageLoadState.waiting;
      _progress.value = 0.0;
    }
  }

  Future<void> onDisplayError() async {
    _state.value = ImageLoadState.error;
    _progress.value = 0.0;
    _data = null;
    Get.find<SettingController>().dbCacheStore.delete(key);
  }
}

class ImageConcurrency {
  ImageConcurrency({required this.dio, this.concurrency = 0});

  final Dio dio;
  final int concurrency;

  final _globalCancelToken = CancelToken();
  final _loadCompleteImages = <String, ImageLoadModel>{};
  final _waitLoadImages = <String, ImageLoadModel>{};
  final _loadingImages = <String, ImageLoadModel>{};

  List<ImageLoadModel> get activeImage =>
      _waitLoadImages.values.where((e) => e.needLoad).toList();

  ImageLoadModel create(ImageModel model) {
    if (_loadCompleteImages.containsKey(model.key)) {
      final exist = _loadCompleteImages[model.key]!
        ..handle()
        ..loadCache();

      _trigger();
      return exist;
    }

    if (_waitLoadImages.containsKey(model.key)) {
      final exist = _waitLoadImages[model.key]!
        ..handle()
        ..loadCache();
      _trigger();
      return exist;
    }

    if (_loadingImages.containsKey(model.key)) {
      final exist = _loadingImages[model.key]!
        ..handle()
        ..loadCache();
      _trigger();
      return exist;
    }

    final loadModel = ImageLoadModel(model: model, dio: dio);
    _waitLoadImages[model.key] = loadModel;
    _trigger();
    return loadModel;
  }

  void dispose() {
    _globalCancelToken.cancel();
  }

  void _trigger() {
    while ((_loadingImages.length < concurrency || concurrency == 0) &&
        activeImage.isNotEmpty) {
      final item = activeImage[0];
      _waitLoadImages.remove(item.key);
      _loadingImages[item.key] = item;
      item.debugLoad().then((value) {
        _loadCompleteImages[item.key] = item;
      }).catchError((err) {
        _waitLoadImages[item.key] = item;
      }).then((value) {
        _loadingImages.remove(item.key);
        _trigger();
      });
    }
  }
}
