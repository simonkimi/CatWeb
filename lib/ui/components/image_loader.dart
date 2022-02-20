import 'dart:typed_data';

import 'package:catweb/gen/protobuf/model.pbserver.dart';
import 'package:catweb/network/client/image_loader.dart';
import 'package:catweb/utils/utils.dart';
import 'package:extended_image/extended_image.dart';
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
        case ImageLoadState.cached:
        case ImageLoadState.waiting:
          return loadingBuilder(context, 0);
        case ImageLoadState.loading:
          return loadingBuilder(context, _imageLoadModel.progress);
        case ImageLoadState.finish:
          return imageBuilder(context, _imageLoadModel.data!);
        case ImageLoadState.error:
          return errorBuilder(
              context, _imageLoadModel.lastException.value!, _onReload);
      }
    });
  }

  void _onReload() {
    widget.concurrency.reload(_imageLoadModel);
  }

  @override
  void dispose() {
    _imageLoadModel.dispose();
    super.dispose();
  }

  Widget _defaultImageBuilder(BuildContext context, Uint8List imgData) {
    final model = widget.model;

    late Widget child;

    if ((!model.imgX.isNaN || !model.imgY.isNaN) &&
        model.hasWidth() &&
        model.hasHeight()) {
      child = ExtendedImage(
        width: model.width.nan2null,
        height: model.height.nan2null,
        image: MemoryImage(imgData),
        loadStateChanged: (state) {
          if (state.extendedImageLoadState == LoadState.completed) {
            final img = ExtendedRawImage(
              image: state.extendedImageInfo?.image,
              width: model.width,
              height: model.height,
              fit: BoxFit.fill,
              sourceRect: Rect.fromLTWH(
                model.imgX.nan2zero,
                model.imgY.nan2zero,
                model.width,
                model.height,
              ),
              scale: 0.2,
            );

            if (!model.width.isNaN && !model.height.isNaN) {
              return AspectRatio(
                aspectRatio: model.width / model.height,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: img,
                ),
              );
            }
            return img;
          }
          return null;
        },
      );
    } else {
      child = Hero(
        tag: widget.model.url,
        child: Image.memory(imgData),
      );
    }

    // if (model.hasWidth() && model.hasHeight()) {
    //   return AspectRatio(
    //     aspectRatio: model.width / model.height,
    //     child: child,
    //   );
    // }
    return child;
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.info),
          Padding(
            padding: const EdgeInsets.only(right: 5, left: 5, top: 5),
            child: Text(
              err?.toString() ?? '',
              maxLines: 5,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
