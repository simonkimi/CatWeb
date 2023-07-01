import 'package:catweb/data/controller/setting_service.dart';
import 'package:catweb/data/loaders/load_more_mixin.dart';
import 'package:catweb/data/models/ffi/models.dart';
import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:get/get.dart';

class ImageLoadModel {
  ImageLoadModel({
    required this.model,
    required this.dio,
  });

  final ImageRspModel model;
  final Dio dio;

  final Rx<ImageLoadState> _state = ImageLoadState.waiting().obs;
  final RxDouble _progress = 0.0.obs;
  final RxInt _handleWidget = 1.obs;

  Uint8List? _data;

  Uint8List? get data => _data;

  double get progress => _progress.value;

  String get key => model.cacheKey ?? model.url;

  bool get needLoad => _state.value.isWaiting && _handleWidget.value > 0;

  ImageLoadState get state => _state.value;

  void reset() {
    _state.value = ImageLoadState.waiting();
    _progress.value = 0.0;
    _data = null;
  }

  Future<void> loadCache() async {
    if (state.isCached || state.isWaiting) {
      final db = Get.find<SettingService>().dbCacheStore;
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
        options: Get.find<SettingService>()
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
    } on DioException catch (e) {
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
    Get.find<SettingService>().dbCacheStore.delete(key);
  }
}
