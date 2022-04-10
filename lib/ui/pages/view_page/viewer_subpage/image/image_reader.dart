import 'dart:math';
import 'dart:ui';

import 'package:catweb/data/controller/setting_controller.dart';
import 'package:catweb/data/controller/setting_enum.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/ui/components/cupertino_app_bar.dart';
import 'package:catweb/ui/components/cupertino_router.dart';
import 'package:catweb/ui/components/zoom.dart';
import 'package:catweb/ui/pages/setting_page/setting_subpage/display_setting.dart';
import 'package:catweb/ui/pages/view_page/viewer_subpage/image/image_zoom.dart';
import 'package:catweb/ui/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:get/get.dart';
import 'image_controller.dart';
import 'image_preview_slider.dart';
import 'image_read_controller.dart';
import 'image_slider.dart';
import 'image_viewer.dart';

class ImageReader extends StatefulWidget {
  const ImageReader({
    Key? key,
    required this.readerInfo,
    required this.blueprint,
  }) : super(key: key);

  final ReaderInfo readerInfo;
  final PageBlueprintModel blueprint;

  @override
  _ImageReaderViewerState createState() => _ImageReaderViewerState();
}

class _ImageReaderViewerState extends State<ImageReader>
    with TickerProviderStateMixin {
  late final ImageReaderController c;
  late final ImagePageController readController;

  late final AnimationController hideToolbarAniController;
  late final Animation<Offset> hideToolbarAni;
  late final Animation<Offset> hideTabBarAni;

  @override
  void initState() {
    super.initState();
    c = ImageReaderController(
      blueprint: widget.blueprint,
      localEnv: SiteEnvModel(),
      readerInfo: widget.readerInfo,
    );
    readController = ImagePageController(controller: c);
    hideToolbarAniController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    hideToolbarAni = Tween(
      begin: const Offset(0, 0),
      end: const Offset(0, -1),
    ).animate(hideToolbarAniController);
    hideTabBarAni = Tween(
      begin: const Offset(0, 0),
      end: const Offset(0, 1),
    ).animate(hideToolbarAniController);
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      readController.onPageInitFinish();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: OffsetCupertinoAppBar(
        offset: hideToolbarAni,
        child: CupertinoNavigationBar(
          backgroundColor: FixColor.navigationBarBackground.darkColor,
          leading: const CupertinoBackLeading(
            color: CupertinoColors.white,
          ),
          trailing: _buildTrailing(context),
        ),
      ),
      backgroundColor: CupertinoColors.darkBackgroundGray,
      child: Stack(
        children: [
          Obx(() => PhotoViewGallery.builder(
                reverse: Get.find<SettingController>().readerDirectory.value ==
                    ReaderDirection.rtl,
                pageController: readController.pageController,
                itemCount: readController.displayPageCount,
                onPageChanged: readController.onPageIndexChanged,
                builder: (context, index) {
                  return readController.isSingleWidget(index)
                      ? _buildSinglePageImage(context, index)
                      : _buildDoublePageImage(context, index);
                },
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: SlideTransition(
              position: hideTabBarAni,
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    color: FixColor.navigationBarBackground.darkColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ImagePreviewSlider(
                            controller: c,
                            readController: readController,
                          ),
                          SizedBox(
                            height: 50,
                            child: Obx(() => CupertinoImageSlider(
                                  value: readController.currentPage,
                                  pageCount: c.imageLoaderList.length,
                                  onChanged: (value) {
                                    readController.jumpToPage(value);
                                  },
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onHideToolbar() {
    if (hideToolbarAniController.isAnimating) {
      return;
    }
    if (hideToolbarAniController.status == AnimationStatus.completed) {
      hideToolbarAniController.reverse();
    } else {
      hideToolbarAniController.forward();
    }
  }

  void _onImageTap(TapUpDetails details) {
    final screenSize = MediaQuery.of(context).size;

    final left = screenSize.width / 3;
    final right = left * 2;
    final tap = details.globalPosition.dx;

    if (left < tap && tap < right) {
      _onHideToolbar();
    } else if (tap < left) {
      readController.toPreviousPage();
    } else {
      readController.toNextPage();
    }
  }

  /// 构建单图片页面, 图片外面套一个缩放控件
  PhotoViewGalleryPageOptions _buildSinglePageImage(
    BuildContext context,
    int index,
  ) {
    final zoomController = PhotoViewController();

    late final int readIndex;
    switch (readController.displayType) {
      case ReaderDisplayType.double:
        readIndex = index * 2;
        break;
      case ReaderDisplayType.doubleCover:
        readIndex = max((index - 1) * 2 + 1, 0);
        break;
      case ReaderDisplayType.single:
        readIndex = index;
        break;
    }

    return PhotoViewGalleryPageOptions.customChild(
      minScale: 1.0,
      maxScale: 5.0,
      controller: zoomController,
      child: GestureDetector(
        onTap: () {},
        onTapUp: _onImageTap,
        child: ImageViewer(
          model: c.imageLoaderList[readIndex],
          imageWrapBuilder: (context, child) {
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
      ),
    );
  }

  /// 构建双图片页面, 图片外面套一个缩放控件
  PhotoViewGalleryPageOptions _buildDoublePageImage(
    BuildContext context,
    int index,
  ) {
    final realIndex = readController.displayType == ReaderDisplayType.double
        ? index * 2
        : max((index - 1) * 2 + 1, 0);

    final zoomController = PhotoViewController();

    return PhotoViewGalleryPageOptions.customChild(
      minScale: 1.0,
      maxScale: 5.0,
      controller: zoomController,
      child: GestureDetector(
        onTap: () {},
        onTapUp: _onImageTap,
        child: ZoomWidget(
          controller: zoomController,
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
      ),
    );
  }

  Widget _buildTrailing(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Obx(() => CupertinoButton(
              padding: EdgeInsets.zero,
              minSize: 0,
              child: Icon(
                readController.displayType == ReaderDisplayType.single
                    ? CupertinoIcons.square
                    : readController.displayType == ReaderDisplayType.double
                        ? CupertinoIcons.square_split_2x1
                        : CupertinoIcons.square_split_2x1_fill,
                color: CupertinoColors.white,
              ),
              onPressed: () {
                final setting = Get.find<SettingController>();
                switch (readController.displayType) {
                  case ReaderDisplayType.single:
                    setting.displayType.value = ReaderDisplayType.double;
                    break;
                  case ReaderDisplayType.double:
                    setting.displayType.value = ReaderDisplayType.doubleCover;
                    break;
                  case ReaderDisplayType.doubleCover:
                    setting.displayType.value = ReaderDisplayType.single;
                    break;
                }
              },
            )),
        const SizedBox(width: 5),
        CupertinoButton(
          padding: EdgeInsets.zero,
          minSize: 0,
          child: const Icon(
            CupertinoIcons.settings,
            color: CupertinoColors.white,
          ),
          onPressed: () {
            Navigator.of(context).push(CupertinoWithModalsPageRoute(
                builder: (context) => const DisplaySettingPage(
                      fromSetting: false,
                    )));
          },
        ),
      ],
    );
  }
}
