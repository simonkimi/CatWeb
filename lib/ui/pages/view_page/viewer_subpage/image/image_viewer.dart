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
    return Center(
      child: Text(
        '${model.index + 1}',
        style: const TextStyle(
          color: CupertinoColors.white,
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    // if (!model.state.isComplete ||  // 模型没有加载完毕
    //     model.imageModel.value?.state.isIdle == true) {
    //   return const CupertinoActivityIndicator();
    // }
    return const CupertinoActivityIndicator();
  }
}
