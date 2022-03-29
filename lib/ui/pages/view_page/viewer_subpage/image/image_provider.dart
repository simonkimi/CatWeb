import 'dart:async';
import 'dart:typed_data';

import 'package:catweb/data/controller/setting_controller.dart';
import 'package:catweb/gen/protobuf/model.pb.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

class ReaderImageProvider extends ImageProvider<ReaderImageProvider> {
  ReaderImageProvider({
    required this.model,
    required this.dio,
    this.scale = 1.0,
  });

  final Dio dio;
  final ImageRpcModel model;
  final double scale;

  final _cancelToken = CancelToken().obs;

  @override
  ImageStreamCompleter load(ReaderImageProvider key, DecoderCallback decode) {
    final StreamController<ImageChunkEvent> chunkEvents =
        StreamController<ImageChunkEvent>();
    return MultiFrameImageStreamCompleter(
      chunkEvents: chunkEvents.stream,
      codec: _loadAsync(key, decode, chunkEvents),
      scale: key.scale,
      debugLabel: model.url,
      informationCollector: () {
        return <DiagnosticsNode>[
          DiagnosticsProperty<ImageProvider>('Image provider', this),
          DiagnosticsProperty<ReaderImageProvider>('Image key', key),
        ];
      },
    );
  }

  Future<ui.Codec> _loadAsync(ReaderImageProvider key, DecoderCallback decode,
      StreamController<ImageChunkEvent> chunkEvents) async {
    final rsp = await dio.get<Uint8List>(
      model.url,
      cancelToken: _cancelToken.value,
      onReceiveProgress: (r, t) => chunkEvents.add(ImageChunkEvent(
        cumulativeBytesLoaded: r,
        expectedTotalBytes: t,
      )),
      options: Get.find<SettingController>()
          .imageCacheOption
          .toOptions()
          .copyWith(responseType: ResponseType.bytes),
    );
    if (rsp.data == null || rsp.data!.isEmpty) {
      throw StateError(
          '${model.url} is empty and cannot be loaded as an image.');
    }
    return await decode(rsp.data!);
  }

  @override
  Future<ReaderImageProvider> obtainKey(ImageConfiguration configuration) {
    return SynchronousFuture<ReaderImageProvider>(this);
  }

  void cancel() => _cancelToken.value.cancel();
}
