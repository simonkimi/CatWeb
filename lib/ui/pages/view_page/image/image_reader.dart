import 'dart:math';
import 'dart:ui';

import 'package:catweb/data/controller/settings.dart';
import 'package:catweb/data/models/site/page.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/navigator.dart';
import 'package:catweb/ui/pages/setting_page/setting_subpage/display_setting.dart';
import 'package:catweb/ui/theme/colors.dart';
import 'package:catweb/ui/widgets/cupertino_app_bar.dart';
import 'package:catweb/ui/widgets/zoom.dart';
import 'package:flutter/cupertino.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'controller/image_read_notifier.dart';
import 'controller/reader_load_notifier.dart';
import 'image_preview_slider.dart';
import 'image_slider.dart';
import 'image_viewer.dart';
import 'image_zoom.dart';

class ImageReader extends StatefulWidget {
  const ImageReader({
    super.key,
    required this.readerInfo,
    required this.sitePageRule,
  });

  final ReaderInfo readerInfo;
  final SitePageRule sitePageRule;

  @override
  State<ImageReader> createState() => _ImageReaderState();
}

class _ImageReaderState extends State<ImageReader>
    with TickerProviderStateMixin {
  late final AnimationController hideToolbarAniController;
  late final Animation<Offset> hideToolbarAni;
  late final Animation<Offset> hideTabBarAni;

  @override
  void initState() {
    super.initState();
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
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ReaderLoaderNotifier(
        readerInfo: widget.readerInfo,
        sitePageRule: widget.sitePageRule,
        localEnv: SiteEnvStore(),
      ),
      builder: (context, child) {
        return ChangeNotifierProvider(
          create: (context) =>
              ReaderNotifier(imageLoadNotifier: context.read()),
          builder: (context, child) => _buildScaffold(context),
        );
      },
    );
  }

  Widget _buildScaffold(BuildContext context) {
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
          AnimatedBuilder(
            animation: Listenable.merge([
              settingService.readerDirectoryNotifier,
              settingService.displayTypeNotifier
            ]),
            builder: (context, _) {
              return _buildBody(context);
            },
          ),
          _buildSlider(context),
        ],
      ),
    );
  }

  Widget _buildSlider(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SlideTransition(
        position: hideTabBarAni,
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: FixColor.navigationBarBackground.darkColor,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ImagePreviewSlider(),
                    SizedBox(
                      height: 50,
                      child: CupertinoImageSlider(),
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

  Widget _buildBody(BuildContext context) {
    final readController = context.read<ReaderNotifier>();
    final loader = context.read<ReaderLoaderNotifier>();
    if (readerDirectory == ReaderDirection.ttb) {
      return GestureDetector(
        onTap: () {},
        onTapUp: (detail) => _onImageTap(context, detail),
        child: ScrollablePositionedList.builder(
          itemScrollController: readController.listController,
          itemCount: readController.displayPageCount,
          itemPositionsListener: readController.listPositionsListener,
          initialScrollIndex: readController.currentPage,
          itemBuilder: (context, index) {
            return ImageViewer(
              readerInfo: loader.readerInfo,
              index: index,
            );
          },
        ),
      );
    }

    return PhotoViewGallery.builder(
      itemCount: readController.displayPageCount,
      builder: (context, index) {
        return readController.isSingleWidget(index)
            ? _buildSinglePageImage(context, index)
            : _buildDoublePageImage(context, index);
      },
    );
  }

  PhotoViewGalleryPageOptions _buildSinglePageImage(
    BuildContext context,
    int index,
  ) {
    final controller = context.read<ReaderNotifier>();
    final loader = context.read<ReaderLoaderNotifier>();

    final int readIndex = switch (settingService.displayType) {
      ReaderDisplayType.double => index * 2,
      ReaderDisplayType.doubleCover => max((index - 1) * 2 + 1, 0),
      ReaderDisplayType.single => index,
    };

    return PhotoViewGalleryPageOptions.customChild(
      minScale: 1.0,
      maxScale: 5.0,
      controller: controller.photoViewController,
      child: GestureDetector(
        onTap: () {},
        onTapUp: (detail) => _onImageTap(context, detail),
        child: ImageViewer(
          // TODO 空检查
          readerInfo: loader.readerInfo,
          index: readIndex,
          imageWrapBuilder: (context, child) {
            return ZoomWidget(
              controller: controller.photoViewController,
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

  PhotoViewGalleryPageOptions _buildDoublePageImage(
    BuildContext context,
    int index,
  ) {
    final realIndex = switch (settingService.displayType) {
      ReaderDisplayType.double => index * 2,
      ReaderDisplayType.doubleCover => max((index - 1) * 2 + 1, 0),
      ReaderDisplayType.single => throw ArgumentError('displayType is single'),
    };

    final loader = context.read<ReaderLoaderNotifier>();
    final zoomController = PhotoViewController();

    return PhotoViewGalleryPageOptions.customChild(
      minScale: 1.0,
      maxScale: 5.0,
      controller: zoomController,
      child: GestureDetector(
        onTap: () {},
        onTapUp: (detail) => _onImageTap(context, detail),
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
                  readerInfo: loader.readerInfo,
                  index: realIndex,
                ),
              ),
              Expanded(
                child: ImageViewer(
                  readerInfo: loader.readerInfo,
                  index: realIndex + 1,
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
        AnimatedBuilder(
          animation: Listenable.merge([
            settingService.readerDirectoryNotifier,
            settingService.displayTypeNotifier
          ]),
          builder: (context, _) {
            if (readerDirectory == ReaderDirection.ttb) {
              return const SizedBox();
            }
            return CupertinoButton(
              padding: EdgeInsets.zero,
              minSize: 0,
              child: Icon(switch (displayType) {
                ReaderDisplayType.single => CupertinoIcons.square,
                ReaderDisplayType.double => CupertinoIcons.square_split_2x1,
                ReaderDisplayType.doubleCover =>
                  CupertinoIcons.square_split_2x1_fill,
              }),
              onPressed: () {
                settingService.displayTypeNotifier.value =
                    switch (displayType) {
                  ReaderDisplayType.single => ReaderDisplayType.double,
                  ReaderDisplayType.double => ReaderDisplayType.doubleCover,
                  ReaderDisplayType.doubleCover => ReaderDisplayType.single,
                };
              },
            );
          },
        ),
        const SizedBox(width: 5),
        CupertinoButton(
          padding: EdgeInsets.zero,
          minSize: 0,
          child: const Icon(
            CupertinoIcons.settings,
            color: CupertinoColors.white,
          ),
          onPressed: () {
            Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
              return const DisplaySettingPage(
                fromSetting: false,
              );
            }));
          },
        ),
      ],
    );
  }

  void _onImageTap(BuildContext context, TapUpDetails details) {
    ReaderNotifier controller = context.read();
    final screenSize = MediaQuery.of(context).size;

    final left = screenSize.width / 3;
    final right = left * 2;
    final tap = details.globalPosition.dx;

    if (left < tap && tap < right) {
      _onHideToolbar();
    } else if (tap < left) {
      controller.toPreviousPage();
    } else {
      controller.toNextPage();
    }
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

  SettingService get settingService => getIt.get();

  ReaderDisplayType get displayType => settingService.displayType;

  ReaderDirection get readerDirectory => settingService.readerDirectory;
}
