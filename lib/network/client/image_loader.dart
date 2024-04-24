import 'package:catweb/data/controller/global.dart';
import 'package:catweb/data/loaders/async_progress_value.dart';
import 'package:catweb/data/models/ffi/result/base.dart';
import 'package:catweb/get.dart';
import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:flutter/cupertino.dart';

class ImageLoadNotifier extends ValueNotifier<AsyncProgressValue<Uint8List>> {
  ImageLoadNotifier({
    required this.model,
    required this.dio,
  }) : super(const AsyncProgressValue.idle());

  final ImageResult model;
  final Dio dio;

  String get key => model.cacheKey ?? model.url!;

  Future<void> load(CancelToken cancelToken) async {
    if (value is AsyncProgressLoading) {
      return;
    }
    value = const AsyncProgressValue.loading(0.0);
    value = await AsyncProgressValue.guard(() async {
      final rsp = await dio.get<Uint8List>(
        model.url!,
        onReceiveProgress: (r, t) => value = AsyncProgressValue.loading(r / t),
        options: inject(globalProvider)
            .imageCacheOption
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
    value = const AsyncProgressValue.idle();
  }
}
