import 'package:catweb/data/controller/setting_controller.dart';
import 'package:catweb/data/protocol/model/model.dart';
import 'package:catweb/gen/protobuf/model.pbserver.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:drift/drift.dart';
import 'package:get/get.dart';

enum ImageLoadState {
  cached, // 已缓存
  waiting, // 等待加载
  loading, // 加载中
  finish, // 加载完成
  error, // 加载失败
}

class ImageLoadModel {
  ImageLoadModel({
    required this.model,
    required this.dio,
  });

  final ImageRpcModel model;
  final Dio dio;

  final Rx<ImageLoadState> _state = ImageLoadState.waiting.obs;
  final RxDouble _progress = 0.0.obs;
  final RxInt _handleWidget = 1.obs;
  final Rx<Exception?> lastException = Rx(null);

  Uint8List? _data;

  Uint8List? get data => _data;

  double get progress => _progress.value;

  String get key => model.key;

  bool get needLoad =>
      _state.value == ImageLoadState.waiting && _handleWidget.value > 0;

  ImageLoadState get state => _state.value;

  void reset() {
    _state.value = ImageLoadState.waiting;
    _progress.value = 0.0;
    _data = null;
  }

  Future<void> loadCache() async {
    if (_state.value == ImageLoadState.cached) {
      final db = Get.find<SettingController>().dbCacheStore;
      final cache = await db.get(key);
      if (cache != null) {
        await load();
      } else {
        _state.value = ImageLoadState.waiting;
      }
    }
  }

  Future<ImageLoadModel> load() async {
    try {
      _state.value = ImageLoadState.loading;
      final rsp = await dio.get<Uint8List>(
        model.url,
        onReceiveProgress: (r, t) => _progress.value = r / t,
        options: Get.find<SettingController>()
            .imageCacheOption
            .copyWith(
              keyBuilder: (req) => key,
            )
            .toOptions()
            .copyWith(responseType: ResponseType.bytes),
      );
      if (rsp.data == null || rsp.data!.isEmpty) {
        throw StateError(
            '${model.url} is empty and cannot be loaded as an image.');
      }
      _data = rsp.data;
      _state.value = ImageLoadState.finish;
    } on Exception catch (e) {
      lastException.value = e;
      await _onDisplayError();
      rethrow;
    }
    return this;
  }

  void handle() => _handleWidget.value += 1;

  int get handleCount => _handleWidget.value;

  void dispose() {
    _handleWidget.value -= 1;
    if (_handleWidget.value == 0) {
      if (_state.value == ImageLoadState.finish) {
        _state.value = ImageLoadState.cached;
      } else {
        _state.value = ImageLoadState.waiting;
      }
      _progress.value = 0.0;
    }
  }

  Future<void> _onDisplayError() async {
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

  ImageLoadModel create(ImageRpcModel model) {
    late ImageLoadModel exist;
    if (_loadCompleteImages.containsKey(model.key)) {
      exist = _loadCompleteImages[model.key]!..handle();
    } else if (_waitLoadImages.containsKey(model.key)) {
      exist = _waitLoadImages[model.key]!..handle();
    } else if (_loadingImages.containsKey(model.key)) {
      exist = _loadingImages[model.key]!..handle();
    } else {
      exist = ImageLoadModel(model: model, dio: dio);
      _waitLoadImages[model.key] = exist;
    }

    _trigger();
    exist.loadCache().whenComplete(() => _trigger());
    return exist;
  }

  void reload(ImageLoadModel model) {
    _loadCompleteImages.remove(model.key);
    _loadingImages.remove(model.key);
    if (!_waitLoadImages.containsKey(model.key)) {
      _waitLoadImages[model.key] = model;
    }
    model.reset();
    _trigger();
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
      item.load().then((value) {
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
