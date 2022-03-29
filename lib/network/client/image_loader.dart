import 'package:catweb/data/controller/setting_controller.dart';
import 'package:catweb/data/protocol/model/model.dart';
import 'package:catweb/gen/protobuf/model.pbserver.dart';
import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:get/get.dart';

class ImageLoadState {
  ImageLoadState._({
    this.isCached = false,
    this.isWaiting = false,
    this.isFinish = false,
    this.isError = false,
    this.isLoading = false,
    this.error,
  });

  final bool isCached;
  final bool isWaiting;
  final bool isFinish;
  final bool isError;
  final bool isLoading;
  Exception? error;

  bool get isIdle => isWaiting || isCached;

  factory ImageLoadState.cached() => ImageLoadState._(isCached: true);

  factory ImageLoadState.waiting() => ImageLoadState._(isWaiting: true);

  factory ImageLoadState.finish() => ImageLoadState._(isFinish: true);

  factory ImageLoadState.loading() => ImageLoadState._(isLoading: true);

  factory ImageLoadState.error([Exception? error]) =>
      ImageLoadState._(isError: true, error: error);

  @override
  String toString() {
    if (isCached) {
      return 'ImageLoadState.cached';
    }
    if (isWaiting) {
      return 'ImageLoadState.waiting';
    }
    if (isFinish) {
      return 'ImageLoadState.finish';
    }
    if (isError) {
      return 'ImageLoadState.error';
    }
    if (isLoading) {
      return 'ImageLoadState.loading';
    }
    return 'ImageLoadState.idle';
  }
}

class ImageLoadModel {
  ImageLoadModel({
    required this.model,
    required this.dio,
  });

  final ImageRpcModel model;
  final Dio dio;

  final Rx<ImageLoadState> _state = ImageLoadState.waiting().obs;
  final RxDouble _progress = 0.0.obs;
  final RxInt _handleWidget = 1.obs;

  Uint8List? _data;

  Uint8List? get data => _data;

  double get progress => _progress.value;

  String get key => model.key;

  bool get needLoad => _state.value.isWaiting && _handleWidget.value > 0;

  ImageLoadState get state => _state.value;

  Future<void> tryLoad() async {
    if (state.isFinish || state.isLoading) return;
    if (state.isCached) {
      await loadCache();
      return;
    }
    if (state.isIdle) {
      await load();
    }
  }

  void reset() {
    _state.value = ImageLoadState.waiting();
    _progress.value = 0.0;
    _data = null;
  }

  Future<void> loadCache() async {
    if (state.isCached || state.isWaiting) {
      final db = Get.find<SettingController>().dbCacheStore;
      final cache = await db.get(key);
      if (cache != null) {
        await load();
      }
    }
  }

  Future<ImageLoadModel> load() async {
    try {
      _state.value = ImageLoadState.loading();
      final rsp = await dio.get<Uint8List>(
        model.url,
        onReceiveProgress: (r, t) => _progress.value = r / t,
        options: Get.find<SettingController>()
            .imageCacheOption
            .copyWith(keyBuilder: (req) => key)
            .toOptions()
            .copyWith(responseType: ResponseType.bytes),
      );
      if (rsp.data == null || rsp.data!.isEmpty) {
        throw StateError(
            '${model.url} is empty and cannot be loaded as an image.');
      }
      _data = rsp.data;
      _state.value = ImageLoadState.finish();
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        return this;
      }
      await _onDisplayError(e);
    } on Exception catch (e) {
      await _onDisplayError(e);
      rethrow;
    }
    return this;
  }

  void handle() => _handleWidget.value += 1;

  int get handleCount => _handleWidget.value;

  void dispose() {
    _handleWidget.value -= 1;
    if (_handleWidget.value == 0) {
      if (_state.value.isFinish) {
        _state.value = ImageLoadState.cached();
        _data = null;
      } else {
        _state.value = ImageLoadState.waiting();
      }
      _progress.value = 0.0;
    }
  }

  Future<void> _onDisplayError(Exception e) async {
    _state.value = ImageLoadState.error(e);
    _progress.value = 0.0;
    _data = null;
    Get.find<SettingController>().dbCacheStore.delete(key);
  }
}
