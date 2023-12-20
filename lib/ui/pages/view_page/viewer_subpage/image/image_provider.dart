import 'dart:async';
import 'package:catweb/data/controller/setting_service.dart';
import 'package:catweb/data/models/ffi/result/base.dart';
import 'package:catweb/navigator.dart';
import 'package:catweb/utils/obs_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'dart:ui' as ui;

class DioImageProvider extends ImageProvider<DioImageProvider> {
  DioImageProvider({
    required this.imageModel,
    required this.dio,
    this.scale = 1.0,
  });

  final Dio dio;
  final ImageResult imageModel;
  final double scale;

  final _cancelToken = CancelToken().obs;

  @override
  ImageStreamCompleter loadImage(
      DioImageProvider key, ImageDecoderCallback decode) {
    final StreamController<ImageChunkEvent> chunkEvents =
        StreamController<ImageChunkEvent>();
    return MultiFrameImageStreamCompleter(
      chunkEvents: chunkEvents.stream,
      codec: _loadAsync(key, decode, chunkEvents),
      scale: key.scale,
      debugLabel: imageModel.url,
      informationCollector: () {
        return <DiagnosticsNode>[
          DiagnosticsProperty<ImageProvider>('Image provider', this),
          DiagnosticsProperty<DioImageProvider>('Image key', key),
        ];
      },
    );
  }

  Future<ui.Codec> _loadAsync(DioImageProvider key, ImageDecoderCallback decode,
      StreamController<ImageChunkEvent> chunkEvents) async {
    final rsp = await dio.get<Uint8List>(
      imageModel.url!,
      cancelToken: _cancelToken.value,
      onReceiveProgress: (r, t) => chunkEvents.add(ImageChunkEvent(
        cumulativeBytesLoaded: r,
        expectedTotalBytes: t,
      )),
      options: get<SettingService>()
          .imageCacheOption
          .toOptions()
          .copyWith(responseType: ResponseType.bytes),
    );
    if (rsp.data == null || rsp.data!.isEmpty) {
      throw StateError(
          '${imageModel.url} is empty and cannot be loaded as an image.');
    }
    final buffer = await ui.ImmutableBuffer.fromUint8List(rsp.data!);
    return decode(buffer);
  }

  @override
  Future<DioImageProvider> obtainKey(ImageConfiguration configuration) {
    return SynchronousFuture<DioImageProvider>(this);
  }

  void cancel() => _cancelToken.value.cancel();
}
