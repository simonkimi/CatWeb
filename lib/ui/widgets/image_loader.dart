import 'dart:async';
import 'dart:typed_data';

import 'package:catweb/data/loading/resource_loader.dart';
import 'package:catweb/data/media/image_repository.dart';
import 'package:catweb/data/models/ffi/result/base.dart';
import 'package:catweb/ui/widgets/dark_image.dart';
import 'package:catweb/utils/debug.dart';
import 'package:dio/dio.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef ImageWidgetBuilder =
    Widget Function(BuildContext context, Uint8List imgData);
typedef LoadingWidgetBuilder =
    Widget Function(BuildContext context, double? progress);
typedef ErrorBuilder =
    Widget Function(BuildContext context, Object? err, VoidCallback reload);
typedef WidgetBuilder = Widget Function(BuildContext context, Widget child);

class ImageLoader extends StatefulWidget {
  const ImageLoader({
    super.key,
    required this.repository,
    required this.model,
    this.imageBuilder,
    this.errorBuilder,
    this.hasSize = false,
    this.loadingBuilder,
    this.imageWidgetBuilder,
    this.innerImageBuilder,
    this.enableHero = true,
    this.variant = ImageResourceVariant.preview,
  });

  final ImageRepository repository;
  final ImageResult model;
  final ImageWidgetBuilder? imageBuilder;
  final ErrorBuilder? errorBuilder;
  final bool hasSize;
  final bool enableHero;
  final ImageResourceVariant variant;
  final LoadingWidgetBuilder? loadingBuilder;
  final WidgetBuilder? imageWidgetBuilder;
  final WidgetBuilder? innerImageBuilder;

  @override
  State<ImageLoader> createState() => _ImageLoaderState();
}

class _ImageLoaderState extends State<ImageLoader> {
  late ResourceHandle<ImageResourceKey, Uint8List> _handle;
  StreamSubscription<ResourceSnapshot<Uint8List>>? _subscription;
  late ResourceSnapshot<Uint8List> _state;

  ErrorBuilder get errorBuilder => widget.errorBuilder ?? _defaultErrorBuilder;
  LoadingWidgetBuilder get loadingBuilder =>
      widget.loadingBuilder ?? _defaultLoadingBuilder;
  ImageWidgetBuilder get imageBuilder =>
      widget.imageBuilder ?? _defaultImageBuilder;
  WidgetBuilder get imageWidgetBuilder =>
      widget.imageWidgetBuilder ?? _defaultWidgetBuilder;
  WidgetBuilder get innerImageBuilder =>
      widget.innerImageBuilder ?? _defaultWidgetBuilder;

  @override
  void initState() {
    super.initState();
    _acquire();
  }

  @override
  void didUpdateWidget(ImageLoader oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.repository != widget.repository ||
        oldWidget.model.url != widget.model.url ||
        oldWidget.model.cacheKey != widget.model.cacheKey ||
        oldWidget.variant != widget.variant) {
      final oldHandle = _handle;
      final oldSubscription = _subscription;
      _subscription = null;
      _acquire();
      unawaited(_release(oldHandle, oldSubscription));
    }
  }

  void _acquire() {
    _handle = widget.repository.acquire(
      ImageResourceDescriptor.fromUrl(
        widget.model.url ?? '',
        cacheKey: widget.model.cacheKey,
      ),
      variant: widget.variant,
    );
    _state = _handle.state;
    _subscription = _handle.states.listen((state) {
      if (mounted) setState(() => _state = state);
    });
  }

  @override
  Widget build(BuildContext context) {
    return switch (_state) {
      ResourceIdle<Uint8List>() => loadingBuilder(context, null),
      ResourceLoading<Uint8List>(:final progress) => loadingBuilder(
        context,
        progress?.fraction,
      ),
      ResourceFailure<Uint8List>(:final failure) => errorBuilder(
        context,
        failure.error,
        _handle.retry,
      ),
      ResourceSuccess<Uint8List>(:final value) => imageWidgetBuilder(
        context,
        imageBuilder(context, value),
      ),
    };
  }

  Future<void> _release(
    ResourceHandle<ImageResourceKey, Uint8List> handle,
    StreamSubscription<ResourceSnapshot<Uint8List>>? subscription,
  ) async {
    await subscription?.cancel();
    await handle.release();
  }

  @override
  void dispose() {
    unawaited(_release(_handle, _subscription));
    _subscription = null;
    super.dispose();
  }

  Widget _defaultImageBuilder(BuildContext context, Uint8List imgData) {
    late Widget child;
    final model = widget.model;
    if (model.width != null && model.height != null) {
      child = ExtendedImage(
        width: model.width,
        height: model.height,
        image: MemoryImage(imgData),
        loadStateChanged: (state) {
          if (state.extendedImageLoadState != LoadState.completed) return null;
          final image = ExtendedRawImage(
            image: state.extendedImageInfo?.image,
            width: model.width,
            height: model.height,
            fit: BoxFit.fill,
            sourceRect: Rect.fromLTWH(
              model.x ?? 0,
              model.y ?? 0,
              model.width!,
              model.height!,
            ),
            scale: 0.2,
          );
          return AspectRatio(
            aspectRatio: model.width! / model.height!,
            child: FittedBox(
              fit: BoxFit.contain,
              child: innerImageBuilder(context, image),
            ),
          );
        },
      );
    } else {
      child = Center(child: innerImageBuilder(context, Image.memory(imgData)));
    }

    return widget.enableHero
        ? Hero(
            tag: widget.model.cacheKey ?? widget.model.url!,
            child: DarkWidget(child: child),
          )
        : DarkWidget(child: child);
  }
}

Widget _defaultWidgetBuilder(BuildContext context, Widget widget) => widget;

Widget _defaultErrorBuilder(
  BuildContext context,
  Object? err,
  VoidCallback reload,
) {
  if (err is DioException) {
    logger.e('图片网络错误: ${err.requestOptions.path}');
  } else {
    logger.e('图片加载错误', err);
  }
  return GestureDetector(
    onTap: reload,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.info),
        Padding(
          padding: const EdgeInsets.only(right: 5, left: 5, top: 5),
          child: Text(err?.toString() ?? '', maxLines: 5),
        ),
      ],
    ),
  );
}

Widget _defaultLoadingBuilder(BuildContext context, double? progress) {
  return const Center(
    child: SizedBox(width: 24, height: 24, child: CupertinoActivityIndicator()),
  );
}
