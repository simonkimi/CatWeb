import 'dart:typed_data';

import 'package:catweb/gen/protobuf/model.pbserver.dart';
import 'package:catweb/network/client/image_concurrency.dart';
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

typedef WidgetBuilder = Widget Function(
  BuildContext context,
  Widget child,
);

class ImageLoader extends StatefulWidget {
  const ImageLoader({
    Key? key,
    required this.concurrency,
    required this.model,
    this.imageBuilder,
    this.loadingBuilder,
    this.errorBuilder,
    this.hasSize = false,
    this.loadingWidgetBuilder,
    this.imageWidgetBuilder,
  }) : super(key: key);

  final ImageConcurrency concurrency;
  final ImageRpcModel model;
  final ImageWidgetBuilder? imageBuilder;
  final LoadingWidgetBuilder? loadingBuilder;
  final ErrorBuilder? errorBuilder;
  final bool hasSize;

  final WidgetBuilder? loadingWidgetBuilder;
  final WidgetBuilder? imageWidgetBuilder;

  @override
  _ImageLoaderState createState() => _ImageLoaderState();
}

class _ImageLoaderState extends State<ImageLoader> {
  late final ImageLoadModel _imageLoadModel;
  late final ErrorBuilder errorBuilder;
  late final LoadingWidgetBuilder loadingBuilder;
  late final ImageWidgetBuilder imageBuilder;
  late final WidgetBuilder loadingWidgetBuilder;
  late final WidgetBuilder imageWidgetBuilder;

  @override
  void initState() {
    loadingBuilder = widget.loadingBuilder ?? _defaultLoadingBuilder;
    imageBuilder = widget.imageBuilder ?? _defaultImageBuilder;
    errorBuilder = widget.errorBuilder ?? _defaultErrorBuilder;
    _imageLoadModel = widget.concurrency.create(widget.model);
    loadingWidgetBuilder = widget.loadingWidgetBuilder ?? _defaultWidgetBuilder;
    imageWidgetBuilder = widget.imageWidgetBuilder ?? _defaultWidgetBuilder;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final state = _imageLoadModel.state;

      if (state.isWaiting || state.isCached) {
        return loadingWidgetBuilder(context, loadingBuilder(context, 0));
      } else if (state.isError) {
        return errorBuilder(context, state.error, _onReload);
      } else if (state.isLoading) {
        return loadingWidgetBuilder(
          context,
          loadingBuilder(context, _imageLoadModel.progress),
        );
      } else if (state.isFinish) {
        return imageWidgetBuilder(
          context,
          imageBuilder(context, _imageLoadModel.data!),
        );
      }
      throw Exception('Unknown state');
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

  Widget _defaultWidgetBuilder(BuildContext context, Widget widget) => widget;

  Widget _defaultImageBuilder(BuildContext context, Uint8List imgData) {
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
                  fit: BoxFit.contain,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: img,
                  ),
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

  ImageRpcModel get model => widget.model;
}
