import 'package:catweb/data/models/image_with_preview.dart';
import 'package:catweb/gen/protobuf/model.pb.dart';
import 'package:catweb/ui/widgets/cupertino_progress_bar.dart';
import 'package:catweb/ui/pages/view_page/viewer_subpage/image/image_provider.dart';
import 'package:catweb/utils/helper.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'controller/image_load_controller.dart';

class ImageViewer extends StatefulWidget {
  const ImageViewer({
    super.key,
    required this.readerInfo,
    this.imageWrapBuilder,
    required this.index,
  });

  final ReaderInfo readerInfo;
  final int index;

  final Widget Function(BuildContext context, Widget child)? imageWrapBuilder;

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  ImageWithPreviewModel? get model =>
      widget.readerInfo.items.toList().index(widget.index);

  late final _imageWrapBuilder =
      widget.imageWrapBuilder ?? (BuildContext context, Widget child) => child;

  @override
  Widget build(BuildContext context) {

    return Obx(() => _buildImage(context));
  }

  Widget _buildAspRation(BuildContext context, Widget child) {
    if (model?.previewImage?.hasWidth() == true &&
        model?.previewImage?.hasHeight() == true) {
      return AspectRatio(
        aspectRatio: model!.previewImage!.width / model!.previewImage!.height,
        child: child,
      );
    }
    return child;
  }

  Widget _buildImage(BuildContext context) {
    // 还没有加载完图片数据
    if (model == null || model!.imageModel.value == null) {
      return _buildAspRation(
          context,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildIndexText(),
              const SizedBox(height: 50),
              const CupertinoInfProgress(),
            ],
          ));
    }
    return _buildAspRation(
        context,
        _defaultImageBuilder(
          context,
          model!.imageProvider.value!,
          model!.imageModel.value!.image,
        ));
  }

  Widget _defaultImageBuilder(
    BuildContext context,
    DioImageProvider imageProvider,
    ImageRpcModel model,
  ) {
    late Widget child;
    if ((!model.imgX.isNaN || !model.imgY.isNaN) &&
        model.hasWidth() &&
        model.hasHeight()) {
      child = ExtendedImage(
        width: model.width.nan2null,
        height: model.height.nan2null,
        image: imageProvider,
        enableLoadState: true,
        handleLoadingProgress: true,
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
              // scale: 0.2,
            );

            if (!model.width.isNaN && !model.height.isNaN) {
              return AspectRatio(
                aspectRatio: model.width / model.height,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: _imageWrapBuilder(context, img),
                ),
              );
            }
            return _imageWrapBuilder(context, img);
          } else {
            return _buildCommonState(state);
          }
        },
      );
    } else {
      child = ExtendedImage(
        image: imageProvider,
        enableLoadState: true,
        handleLoadingProgress: true,
        loadStateChanged: (state) {
          return _buildCommonState(state) ??
              _imageWrapBuilder(context, state.completedWidget);
        },
      );
    }

    return child;
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

  Widget _buildIndexText() {
    return Text(
      '${widget.index + 1}',
      style: const TextStyle(
        color: CupertinoColors.white,
        fontSize: 60,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
