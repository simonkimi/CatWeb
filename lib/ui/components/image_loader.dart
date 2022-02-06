import 'dart:typed_data';

import 'package:catweb/gen/protobuf/model.pbserver.dart';
import 'package:catweb/network/client/image_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

typedef ImageWidgetBuilder = Widget Function(
  BuildContext context,
  Uint8List imgData,
);

typedef LoadingWidgetBuilder = Widget Function(
  BuildContext context,
  double progress,
);

typedef ErrorBuilder = Widget Function(
  BuildContext context,
  Object? err,
  VoidCallback reload,
);

class ImageLoader extends StatefulWidget {
  const ImageLoader({
    Key? key,
    required this.concurrency,
    required this.model,
    this.imageBuilder,
    this.loadingBuilder,
    this.errorBuilder,
  }) : super(key: key);

  final ImageConcurrency concurrency;
  final ImageRpcModel model;
  final ImageWidgetBuilder? imageBuilder;
  final LoadingWidgetBuilder? loadingBuilder;
  final ErrorBuilder? errorBuilder;

  @override
  _ImageLoaderState createState() => _ImageLoaderState();
}

class _ImageLoaderState extends State<ImageLoader> {
  late final ImageLoadModel _imageLoadModel;

  late final ErrorBuilder errorBuilder;

  late final LoadingWidgetBuilder loadingBuilder;

  late final ImageWidgetBuilder imageBuilder;

  @override
  void initState() {
    loadingBuilder = widget.loadingBuilder ?? _defaultLoadingBuilder;
    imageBuilder = widget.imageBuilder ?? _defaultImageBuilder;
    errorBuilder = widget.errorBuilder ?? _defaultErrorBuilder;
    _imageLoadModel = widget.concurrency.create(widget.model);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (_imageLoadModel.state) {
        case ImageLoadState.init:
        case ImageLoadState.cached:
        case ImageLoadState.waiting:
          return loadingBuilder(context, 0);
        case ImageLoadState.loading:
          return loadingBuilder(context, _imageLoadModel.progress);
        case ImageLoadState.finish:
          return imageBuilder(context, _imageLoadModel.data!);
        case ImageLoadState.error:
          return errorBuilder(
              context, _imageLoadModel.lastException.value!, () {});
      }
    });
  }

  @override
  void dispose() {
    _imageLoadModel.dispose();
    super.dispose();
  }

  Widget _defaultImageBuilder(BuildContext context, Uint8List imgData) {
    return Image.memory(imgData);
  }

  Widget _defaultLoadingBuilder(BuildContext context, double progress) {
    return const Center(
      child: SizedBox(
        width: 24,
        height: 24,
        child: CupertinoActivityIndicator(),
      ),
    );
  }

  Widget _defaultErrorBuilder(
    BuildContext context,
    Object? err,
    VoidCallback reload,
  ) {
    return GestureDetector(
      onTap: () => reload(),
      child: const Center(
        child: Icon(Icons.info),
      ),
    );
  }
}
