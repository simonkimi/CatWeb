import 'dart:math';
import 'dart:ui';

import 'package:catweb/data/controller/setting_controller.dart';
import 'package:catweb/data/controller/setting_enum.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/ui/widgets/cupertino_app_bar.dart';
import 'package:catweb/ui/widgets/cupertino_router.dart';
import 'package:catweb/ui/widgets/zoom.dart';
import 'package:catweb/ui/pages/setting_page/setting_subpage/display_setting.dart';
import 'package:catweb/ui/pages/view_page/viewer_subpage/image/image_zoom.dart';
import 'package:catweb/ui/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'controller/image_load_controller.dart';
import 'image_preview_slider.dart';
import 'controller/image_read_controller.dart';
import 'image_slider.dart';
import 'image_viewer.dart';

class ImageReader extends StatefulWidget {
  const ImageReader({
    super.key,
    required this.readerInfo,
    required this.blueprint,
  });

  final ReaderInfo readerInfo;
  final PageBlueprintModel blueprint;

  @override
  State<ImageReader> createState() => _ImageReaderViewerState();
}

class _ImageReaderViewerState extends State<ImageReader>
    with TickerProviderStateMixin {
  late final ReaderLoaderController c;
  late final ImagePageController readController;

  late final AnimationController hideToolbarAniController;
  late final Animation<Offset> hideToolbarAni;
  late final Animation<Offset> hideTabBarAni;

  final settings = Get.find<SettingController>();

  @override
  void initState() {
    super.initState();
    c = ReaderLoaderController(
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
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
      child: Obx(() => Stack(
            children: [
              if (settings.readerDirectory.value == ReaderDirection.ttb)
                Obx(() => GestureDetector(
                      onTap: () {},
                      onTapUp: _onImageTap,
                      child: ScrollablePositionedList.builder(
                        itemScrollController: readController.listController,
                        itemCount: readController.displayPageCount,
                        itemPositionsListener:
                            readController.listPositionsListener,
                        initialScrollIndex: readController.currentPage,
                        itemBuilder: (context, index) {
                          return ImageViewer(
                            // TODO 空检查
                            model: c.readerInfo.items.toList()[index]!,
                            index: index,
                          );
                        },
                      ),
                    ))
              else
                Builder(builder: (context) {
                  Future.delayed(const Duration(milliseconds: 100), () {
                    readController.onPageViewBuild();
                  });
                  return Obx(() => PhotoViewGallery.builder(
                        reverse: settings.readerDirectory.value ==
                            ReaderDirection.rtl,
                        pageController: readController.pageController,
                        itemCount: readController.displayPageCount,
                        onPageChanged: readController.onPageIndexChanged,
                        builder: (context, index) {
                          return readController.isSingleWidget(index)
                              ? _buildSinglePageImage(context, index)
                              : _buildDoublePageImage(context, index);
                        },
                      ));
                }),
              _buildSlider(context),
            ],
          )),
    );
  }

  Align _buildSlider(BuildContext context) {
    return Align(
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
                            pageCount: c.readerInfo.items.length,
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
          // TODO 空检查
          model: c.readerInfo.items.toList()[readIndex]!,
          index: readIndex,
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
              // TODO 空检查
              Expanded(
                child: ImageViewer(
                  model: c.readerInfo.items.toList()[realIndex]!,
                  index: realIndex,
                ),
              ),
              Expanded(
                child: ImageViewer(
                  model: c.readerInfo.items.toList()[realIndex + 1]!,
                  index: realIndex,
                ),
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
        Obx(() => readController.readerDirectory == ReaderDirection.ttb
            ? const SizedBox()
            : CupertinoButton(
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
