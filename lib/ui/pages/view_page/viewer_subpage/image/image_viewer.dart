import 'dart:typed_data';

import 'package:catweb/gen/protobuf/model.pb.dart';
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
    // 图片数据没有加载完毕或模型加载出来的, 但是还没到处理的时候
    if (!model.state.isComplete ||
        model.imageModel.value?.state.isIdle == true) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '${model.index + 1}',
            style: const TextStyle(
              color: CupertinoColors.white,
              fontSize: 60,
              fontWeight: FontWeight.bold,
            ),
          ),
          const CupertinoActivityIndicator(),
        ],
      );
    }

    // 图片数据已经加载完毕了, 而且正在加载图片
    if (model.imageModel.value?.state.isLoading == true &&
        model.imageModel.value?.progress != 0) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '${model.index + 1}',
            style: const TextStyle(
              color: CupertinoColors.white,
              fontSize: 60,
              fontWeight: FontWeight.bold,
            ),
          ),
          CupertinoActivityIndicator.partiallyRevealed(
            progress: model.imageModel.value!.progress,
          ),
        ],
      );
    }

    // 全部已经加载完毕了, 可以显示图片
    if (model.imageModel.value?.state.isFinish == true &&
        model.imageModel.value?.data != null) {
      return _defaultImageBuilder(context, model.imageModel.value!.data!,
          model.imageModel.value!.model);
    }

    throw Exception('未知的状态');
  }

  Widget _defaultImageBuilder(
      BuildContext context, Uint8List imgData, ImageRpcModel model) {
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
      child = Image.memory(imgData);
    }

    return child;
  }
}
