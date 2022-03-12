import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/ui/components/cupertino_app_bar.dart';
import 'package:catweb/ui/components/image_loader.dart';
import 'package:catweb/ui/components/zoom.dart';
import 'package:catweb/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import 'image_controller.dart';

class ImageReaderViewer extends StatefulWidget {
  const ImageReaderViewer({
    Key? key,
    required this.readerInfo,
    required this.blueprint,
  }) : super(key: key);

  final ReaderInfo readerInfo;
  final PageBlueprintModel blueprint;

  @override
  _ImageReaderViewerState createState() => _ImageReaderViewerState();
}

class _ImageReaderViewerState extends State<ImageReaderViewer>
    with TickerProviderStateMixin {
  late final ImageReaderController controller;

  static const doubleTapScales = <double>[0.99, 2.0, 3.0];

  @override
  void initState() {
    super.initState();
    controller = ImageReaderController(
      blueprint: widget.blueprint,
      localEnv: SiteEnvModel(),
      readerInfo: widget.readerInfo,
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
      child: PhotoViewGallery.builder(
        itemCount: controller.imageIdCode.trueLength,
        builder: (context, index) {
          final zoomController = PhotoViewController();
          return PhotoViewGalleryPageOptions.customChild(
            minScale: 1.0,
            maxScale: 5.0,
            controller: zoomController,
            child: _buildImagePage(context, index),
          );
        },
      ),
    );
  }

  Widget _buildImagePage(
    BuildContext context,
    int index, {
    bool isHorizontal = true,
    PhotoViewController? controller,
  }) {
    final animation = ZoomAnimation(
      this,
      duration: const Duration(milliseconds: 200),
    );

    return GestureDetector(
      child: ImageLoader(
        model: null,
        concurrency: null,
        imageWidgetBuilder: (context, child) {
          return _buildZoomWidget(
            context,
            child: child,
            controller: controller,
            animation: animation,
            canZoom: isHorizontal,
          );
        },
      ),
    );
  }

  Widget _buildZoomWidget(
    BuildContext context, {
    required Widget child,
    required PhotoViewController? controller,
    required ZoomAnimation animation,
    required bool canZoom,
  }) {
    return canZoom
        ? GestureDetector(
            key: UniqueKey(),
            onDoubleTapDown: (detail) {
              // 缩放
              final position = detail.globalPosition;
              final currentScale = controller!.scale ?? 1.0;
              var index = doubleTapScales
                      .indexOf(currentScale.nearList(doubleTapScales)) +
                  1;
              if (index >= doubleTapScales.length) index = 0;
              final scale = doubleTapScales[index];
              animation.animationScale(currentScale, scale);

              // 位移
              final mediaSize = MediaQuery.of(context).size;
              final currentX = controller.position.dx;
              final currentY = controller.position.dy;
              final targetX = (mediaSize.width / 2 - position.dx) * (scale - 1);
              final targetY =
                  (mediaSize.height / 2 - position.dy) * (scale - 1);
              animation.animationOffset(
                Offset(currentX, currentY),
                Offset(targetX, targetY),
              );

              animation.listen((model) {
                controller.scale = model.scale;
                controller.position = model.offset;
              });
            },
          )
        : child;
  }
}
