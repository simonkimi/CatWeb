import 'package:catweb/data/controller/setting_controller.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:drift/drift.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

enum ImageLoadState {
  waiting,
  loading,
  finish,
  error,
}

class ImageLoadModel {
  ImageLoadModel({
    required this.url,
    required this.dio,
    this.cacheKey,
  });

  final String url;
  final Dio dio;
  final String? cacheKey;

  final Rx<ImageLoadState> _state = ImageLoadState.waiting.obs;
  final RxDouble _progress = 0.0.obs;
  final RxInt _handleWidget = 1.obs;
  final Rx<Exception?> _lastException = Rx(null);

  bool _hasCache = false; // 是否已经有了缓存，如果有缓存，则无视释放规则
  Uint8List? _data;

  Uint8List? get data => _data;

  double get progress => _progress.value;

  String get key => cacheKey ?? const Uuid().v5(Uuid.NAMESPACE_URL, url);

  Future<void> loadCache() async {
    if (_hasCache && _state.value == ImageLoadState.waiting) {
      final db = Get.find<SettingController>().dbCacheStore;
      final cache = await db.get(key);
      if (cache != null) await load();
    }
  }

  Future<void> load() async {
    try {
      final rsp = await dio.get<Uint8List>(
        url,
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
        throw StateError('$url is empty and cannot be loaded as an image.');
      }
      _data = rsp.data;
      _hasCache = true;
      _state.value = ImageLoadState.finish;
    } on Exception catch (e) {
      _lastException.value = e;
      _state.value = ImageLoadState.error;
      onDisplayError();
    }
  }

  void handle() => _handleWidget.value += 1;

  void dispose() {
    _handleWidget.value -= 1;
    if (_handleWidget.value == 0) {
      _state.value = ImageLoadState.waiting;
      _progress.value = 0.0;
    }
  }

  void onDisplayError() {
    _state.value = ImageLoadState.error;
    _progress.value = 0.0;
    _data = null;
    Get.find<SettingController>().dbCacheStore.delete(key);
  }
}

class ImageLoader {
  ImageLoader({required this.dio, this.concurrency = 0});

  final Dio dio;
  final int concurrency;

  final _globalCancelToken = CancelToken();

  final _imageMap = RxMap<String, ImageLoadModel>();

  ImageLoadModel create(String url) {
    if (!_imageMap.containsKey(url)) {
      _imageMap[url] = ImageLoadModel(url: url, dio: dio);
    } else {
      _imageMap[url]!.handle();
    }
    _trigger();
    return _imageMap[url]!;
  }

  void dispose() {
    _globalCancelToken.cancel();
  }

  void _trigger() {}
}
