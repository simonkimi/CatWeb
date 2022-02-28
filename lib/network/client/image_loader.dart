import 'package:catweb/data/controller/setting_controller.dart';
import 'package:catweb/data/protocol/model/model.dart';
import 'package:catweb/gen/protobuf/model.pbserver.dart';
import 'package:dio/dio.dart';
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
    if (state == ImageLoadState.cached || state == ImageLoadState.waiting) {
      final db = Get.find<SettingController>().dbCacheStore;
      final cache = await db.get(key);
      if (cache != null) {
        await load();
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
        _data = null;
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

abstract class ImageConcurrency {
  ImageLoadModel create(ImageRpcModel model);

  void reload(ImageLoadModel imageLoadModel);

  void dispose();
}

class ImageListConcurrency implements ImageConcurrency {
  ImageListConcurrency({required this.dio, this.concurrency = 0});

  final Dio dio;
  final int concurrency;

  final _globalCancelToken = CancelToken();

  final _imageMap = <String, ImageLoadModel>{};

  List<ImageLoadModel> get activeImage =>
      _imageMap.values.where((e) => e.needLoad).toList();

  @override
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

  @override
  void reload(ImageLoadModel model) {
    model.reset();
    _trigger();
  }

  @override
  void dispose() {
    _globalCancelToken.cancel();
  }

  void _trigger() {
    while ((activeImage.length < concurrency || concurrency == 0) &&
        activeImage.isNotEmpty) {
      final item = activeImage[0];
      item.load().then((value) {
        _trigger();
      });
    }
  }
}
