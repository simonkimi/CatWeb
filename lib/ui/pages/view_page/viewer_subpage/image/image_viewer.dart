import 'package:catweb/gen/protobuf/model.pb.dart';
import 'package:catweb/ui/pages/view_page/viewer_subpage/image/image_provider.dart';
import 'package:catweb/utils/utils.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'image_controller.dart';

class ImageViewer extends StatefulWidget {
  const ImageViewer({
    Key? key,
    required this.model,
    this.imageBuilder,
  }) : super(key: key);

  final ReaderImageLoader model;

  final Widget Function(BuildContext context, Widget child)? imageBuilder;

  @override
  _ImageViewerState createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  ReaderImageLoader get model => widget.model;

  @override
  Widget build(BuildContext context) {
    return Obx(() => _buildImage(context));
  }

  Widget _buildImage(BuildContext context) {
    // 还没有加载完图片数据
    if (!model.state.isComplete || model.imageModel.value == null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildIndexText(),
          const Text(
            '正在加载模型...',
            style: TextStyle(
              color: CupertinoColors.white,
            ),
          ),
        ],
      );
    }

    return _defaultImageBuilder(
      context,
      model.imageModel.value!,
      model.model!.image,
    );
  }

  Widget _defaultImageBuilder(BuildContext context,
      ReaderImageProvider imageProvider, ImageRpcModel model) {
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: img,
                  ),
                ),
              );
            }
            return img;
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
          return _buildCommonState(state) ?? state.completedWidget;
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
          Text(
            '${(progress * 100).toInt()}%',
            style: const TextStyle(
              color: CupertinoColors.white,
            ),
          ),
        ]);
      case LoadState.completed:
        return null;
      case LoadState.failed:
        return _buildCenterColumn([
          _buildIndexText(),
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
      '${model.index + 1}',
      style: const TextStyle(
        color: CupertinoColors.white,
        fontSize: 60,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
