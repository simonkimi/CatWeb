import 'dart:math';

import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/ui/components/cupertino_app_bar.dart';
import 'package:catweb/ui/components/zoom.dart';
import 'package:catweb/ui/pages/view_page/viewer_subpage/image/image_zoom.dart';
import 'package:flutter/cupertino.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:get/get.dart';
import 'image_controller.dart';
import 'image_read_controller.dart';
import 'image_viewer.dart';

class ImageReader extends StatefulWidget {
  const ImageReader({
    Key? key,
    required this.readerInfo,
    required this.blueprint,
  }) : super(key: key);

  final ReaderInfo readerInfo;
  final PageBlueprintModel blueprint;
  final ReaderDisplayType displayType = ReaderDisplayType.single;

  @override
  _ImageReaderViewerState createState() => _ImageReaderViewerState();
}

class _ImageReaderViewerState extends State<ImageReader>
    with TickerProviderStateMixin {
  late final ImageReaderController c;

  late final ImageReadController readController;

  @override
  void initState() {
    super.initState();
    c = ImageReaderController(
      blueprint: widget.blueprint,
      localEnv: SiteEnvModel(),
      readerInfo: widget.readerInfo,
    );
    readController = ImageReadController(
      displayType: widget.displayType,
      controller: c,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: Color(0x00000000),
        leading: CupertinoBackLeading(
          color: CupertinoColors.white,
        ),
      ),
      backgroundColor: CupertinoColors.darkBackgroundGray,
      child: Obx(() => PhotoViewGallery.builder(
            itemCount: readController.pageCount,
            onPageChanged: readController.onPageIndexChanged,
            builder: (context, index) {
              return readController.isSingleWidget(index)
                  ? _buildSinglePageImage(context, index)
                  : _buildDoublePageImage(context, index);
            },
          )),
    );
  }

  /// 构建单图片页面, 图片外面套一个缩放控件
  PhotoViewGalleryPageOptions _buildSinglePageImage(
    BuildContext context,
    int index,
  ) {
    final zoomController = PhotoViewController();

    late final int readIndex;
    switch (widget.displayType) {
      case ReaderDisplayType.single:
        readIndex = index;
        break;
      case ReaderDisplayType.double:
        readIndex = index * 2;
        break;
      case ReaderDisplayType.doubleCover:
        readIndex = max((index - 1) * 2 + 1, 0);
        break;
    }

    return PhotoViewGalleryPageOptions.customChild(
      minScale: 1.0,
      maxScale: 5.0,
      controller: zoomController,
      child: ImageViewer(
        model: c.imageLoaderList[readIndex],
        imageBuilder: (context, child) {
          return ZoomWidget(
            controller: zoomController,
            animation: ZoomAnimation(
              this,
              duration: const Duration(milliseconds: 200),
            ),
            canZoom: true,
            child: child,
          );
        },
      ),
    );
  }

  /// 构建双图片页面, 图片外面套一个缩放控件
  PhotoViewGalleryPageOptions _buildDoublePageImage(
    BuildContext context,
    int index,
  ) {
    final realIndex = widget.displayType == ReaderDisplayType.double
        ? index * 2
        : max((index - 1) * 2 + 1, 0);

    return PhotoViewGalleryPageOptions.customChild(
      minScale: 1.0,
      maxScale: 5.0,
      controller: PhotoViewController(),
      child: ZoomWidget(
        controller: PhotoViewController(),
        animation: ZoomAnimation(
          this,
          duration: const Duration(milliseconds: 200),
        ),
        canZoom: true,
        child: Row(
          children: [
            Expanded(
              child: ImageViewer(model: c.imageLoaderList[realIndex]),
            ),
            Expanded(
              child: ImageViewer(model: c.imageLoaderList[realIndex + 1]),
            ),
          ],
        ),
      ),
    );
  }
}
