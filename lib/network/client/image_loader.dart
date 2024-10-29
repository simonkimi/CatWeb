import 'package:catweb/data/controller/global.dart';
import 'package:catweb/data/loaders/async_progress_value.dart';
import 'package:catweb/data/models/ffi/result/base.dart';
import 'package:catweb/app.dart';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ImageLoadNotifier extends ValueNotifier<AsyncProgressValue<Uint8List>> {
  ImageLoadNotifier({
    required this.model,
    required this.dio,
  }) : super(const AsyncProgressValue.idle());

  int _mountedCount = 0;
  final ImageResult model;
  final Dio dio;

  String get key => model.cacheKey ?? model.url!;

  bool get needLoad => value is AsyncProgressIdle && _mountedCount > 0;

  Future<void> load(CancelToken cancelToken) async {
    if (value is AsyncProgressLoading) {
      return;
    }
    value = const AsyncProgressValue.loading(0.0);
    value = await AsyncProgressValue.guard(() async {
      final rsp = await dio.get<Uint8List>(
        model.url!,
        onReceiveProgress: (r, t) => value = AsyncProgressValue.loading(r / t),
        options: global.imageCacheOption
            .copyWith(keyBuilder: (req) => key)
            .toOptions()
            .copyWith(responseType: ResponseType.bytes),
        cancelToken: cancelToken,
      );
      if (rsp.data == null) {
        throw Exception('data is null');
      }
      return rsp.data!;
    });
  }

  Future<void> free() async {
    value = const AsyncProgressValue.cached();
  }

  void handleMounted() {
    _mountedCount++;
  }

  void handleUnMounted() {
    _mountedCount--;
    if (_mountedCount <= 0) {
      free();
    }
  }

  GlobalService get global => getIt.get();
}
