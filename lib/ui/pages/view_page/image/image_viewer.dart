import 'package:catweb/data/loaders/async_progress_value.dart';
import 'package:catweb/data/models/ffi/result/base.dart';
import 'package:catweb/data/models/image_with_preview.dart';
import 'package:catweb/ui/widgets/cupertino_progress_bar.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';

typedef ChildWidgetBuilder = Widget Function(
    BuildContext context, Widget child);

Widget _defaultChildBuilder(BuildContext context, Widget child) {
  return child;
}

class ImageViewer extends StatelessWidget {
  const ImageViewer({
    super.key,
    required this.index,
    required this.imageWithPreviewModel,
    ChildWidgetBuilder? imageWrapBuilder,
  }) : imageWrapBuilder = imageWrapBuilder ?? _defaultChildBuilder;

  final int index;
  final ImageWithPreviewModel? imageWithPreviewModel;
  final ChildWidgetBuilder imageWrapBuilder;

  @override
  Widget build(BuildContext context) {
    if (imageWithPreviewModel == null) {
      return _buildInfProgressBar(context);
    }
    return AnimatedBuilder(
      animation: imageWithPreviewModel!,
      builder: (context, child) {
        return switch (imageWithPreviewModel!.imageModel) {
          AsyncProgressValue.idle ||
          AsyncProgressValue.loading =>
            _buildInfProgressBar(context),
          AsyncProgressError(:final error, :final stackTrace) =>
            _buildError(context, error, stackTrace),
          AsyncProgressValue.data =>
            _defaultImageBuilder(context, imageWithPreviewModel!.getImage()),
          _ => throw UnimplementedError()
        };
      },
    );
  }

  Widget _buildError(
    BuildContext context,
    Object error,
    StackTrace stackTrace,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildIndexText(),
        const SizedBox(height: 50),
        Text(
          '貌似出了点问题: ${error.toString()}',
          maxLines: 10,
          style: const TextStyle(color: CupertinoColors.white),
        ),
      ],
    );
  }

  Widget _defaultImageBuilder(BuildContext context, ImageResult? model) {
    if (model == null) {
      return _buildInfProgressBar(context);
    }
    if (model.x != null &&
        model.y != null &&
        model.width != null &&
        model.height != null) {
      return ExtendedImage(
        width: model.width,
        height: model.height,
        image: imageWithPreviewModel!.imageProvider!,
        enableLoadState: true,
        handleLoadingProgress: true,
        loadStateChanged: (state) {
          if (state.extendedImageLoadState case LoadState.completed) {
            final img = ExtendedRawImage(
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
              // scale: 0.2,
            );

            if (model.width != null && model.height != null) {
              return AspectRatio(
                aspectRatio: model.width! / model.height!,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: imageWrapBuilder(context, img),
                ),
              );
            }
            return imageWrapBuilder(context, img);
          } else {
            return _buildCommonState(state);
          }
        },
      );
    }

    return ExtendedImage(
      image: imageWithPreviewModel!.imageProvider!,
      enableLoadState: true,
      handleLoadingProgress: true,
      loadStateChanged: (state) {
        return _buildCommonState(state) ??
            imageWrapBuilder(context, state.completedWidget);
      },
    );
  }

  Widget _buildInfProgressBar(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildIndexText(),
        const SizedBox(height: 50),
        const CupertinoInfProgress(),
      ],
    );
  }

  Widget _buildIndexText() {
    return Text(
      '${index + 1}',
      style: const TextStyle(
        color: CupertinoColors.white,
        fontSize: 60,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget? _buildCommonState(ExtendedImageState state) {
    switch (state.extendedImageLoadState) {
      case LoadState.loading:
        final progress = state.loadingProgress?.expectedTotalBytes != null
            ? state.loadingProgress!.cumulativeBytesLoaded /
                state.loadingProgress!.expectedTotalBytes!
            : 0.0;
        return _buildCenterColumn([
          _buildIndexText(),
          const SizedBox(height: 50),
          CupertinoProgress(
            progress: progress,
          ),
        ]);
      case LoadState.completed:
        return null;
      case LoadState.failed:
        return _buildCenterColumn([
          _buildIndexText(),
          const SizedBox(height: 50),
          Text(
            '貌似出了点问题: ${state.lastException?.toString()}',
            maxLines: 10,
            style: const TextStyle(color: CupertinoColors.white),
          ),
        ]);
    }
  }

  Widget _buildCenterColumn(List<Widget> children) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }
}
