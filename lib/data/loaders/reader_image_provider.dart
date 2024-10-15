import 'dart:async';
import 'dart:ui';

import 'package:catweb/data/controller/global.dart';
import 'package:catweb/data/models/ffi/result/base.dart';
import 'package:catweb/navigator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class ReaderImageProvider extends ImageProvider<ReaderImageProvider> {
  final Dio dio;
  final ImageResult imageResult;
  final CancelToken _cancelToken = CancelToken();

  ReaderImageProvider({
    required this.dio,
    required this.imageResult,
  });

  @override
  Future<ReaderImageProvider> obtainKey(
      ImageConfiguration configuration) async {
    return this;
  }

  @override
  ImageStreamCompleter loadImage(
    ReaderImageProvider key,
    ImageDecoderCallback decode,
  ) {
    final StreamController<ImageChunkEvent> chunkEvents =
        StreamController<ImageChunkEvent>();
    return MultiFrameImageStreamCompleter(
      chunkEvents: chunkEvents.stream,
      codec: _loadAsync(key, decode, chunkEvents),
      scale: 1.0,
      debugLabel: imageResult.url,
      informationCollector: () {
        return <DiagnosticsNode>[
          DiagnosticsProperty<ImageProvider>('Image provider', this),
          DiagnosticsProperty<ReaderImageProvider>('Image key', key),
        ];
      },
    );
  }

  Future<Codec> _loadAsync(
    ReaderImageProvider key,
    ImageDecoderCallback decode,
    StreamController<ImageChunkEvent> chunkEvents,
  ) async {
    try {
      final rsp = await dio.get<Uint8List>(imageResult.url!,
          cancelToken: _cancelToken,
          onReceiveProgress: (r, t) => chunkEvents.add(ImageChunkEvent(
                cumulativeBytesLoaded: r,
                expectedTotalBytes: t,
              )),
          options: getIt
              .get<GlobalService>()
              .imageCacheOption
              .toOptions()
              .copyWith(responseType: ResponseType.bytes));
      if (rsp.data == null || rsp.data!.isEmpty) {
        chunkEvents.addError(StateError(
            '${imageResult.url} is empty and cannot be loaded as an image.'));
      }
      final buffer = await ImmutableBuffer.fromUint8List(rsp.data!);
      return decode(buffer);
    } catch (e, s) {
      chunkEvents.addError(e, s);
      rethrow;
    } finally {
      chunkEvents.close();
    }
  }

  void cancel() {
    _cancelToken.cancel();
  }
}
