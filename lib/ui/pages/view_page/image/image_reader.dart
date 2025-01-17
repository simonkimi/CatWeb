import 'dart:math';
import 'dart:ui';

import 'package:catweb/data/controller/settings.dart';
import 'package:catweb/data/models/site/page.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/app.dart';
import 'package:catweb/ui/pages/setting_page/setting_subpage/display_setting.dart';
import 'package:catweb/ui/theme/colors.dart';
import 'package:catweb/ui/widgets/cupertino_app_bar.dart';
import 'package:catweb/ui/widgets/zoom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'controller/image_read_notifier.dart';
import 'controller/reader_load_notifier.dart';
import 'image_preview_slider.dart';
import 'image_slider.dart';
import 'image_viewer.dart';
import 'image_zoom.dart';

class ImageReader extends HookWidget {
  const ImageReader({
    super.key,
    required this.readerInfo,
    required this.sitePageRule,
  });

  final ReaderInfo readerInfo;
  final SitePageRule sitePageRule;

  @override
  Widget build(BuildContext context) {
    final hideToolbarAniController = useAnimationController(
      duration: const Duration(milliseconds: 200),
    );

    final hideToolbarAni = useMemoized(() => Tween(
          begin: const Offset(0, 0),
          end: const Offset(0, -1),
        ).animate(hideToolbarAniController));

    final hideTabBarAni = useMemoized(() => Tween(
          begin: const Offset(0, 0),
          end: const Offset(0, 1),
        ).animate(hideToolbarAniController));

    void onHideToolbar() {
      if (hideToolbarAniController.isAnimating) return;
      if (hideToolbarAniController.status == AnimationStatus.completed) {
        hideToolbarAniController.reverse();
      } else {
        hideToolbarAniController.forward();
      }
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ReaderLoaderNotifier(
            readerInfo: readerInfo,
            sitePageRule: sitePageRule,
            localEnv: SiteEnvStore(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => ReaderNotifier(
            imageLoadNotifier: context.read<ReaderLoaderNotifier>(),
          ),
        ),
      ],
      builder: (context, _) => _buildScaffold(
        context,
        hideToolbarAni,
        hideTabBarAni,
        onHideToolbar,
      ),
    );
  }

  Widget _buildScaffold(
    BuildContext context,
    Animation<Offset> hideToolbarAni,
    Animation<Offset> hideTabBarAni,
    VoidCallback onHideToolbar,
  ) {
    return CupertinoPageScaffold(
      navigationBar: OffsetCupertinoAppBar(
        offset: hideToolbarAni,
        child: CupertinoNavigationBar(
          backgroundColor: FixColor.navigationBarBackground.darkColor,
          leading: const CupertinoBackLeading(
            color: CupertinoColors.white,
          ),
          trailing: _ImageReaderTrailing(),
        ),
      ),
      backgroundColor: CupertinoColors.darkBackgroundGray,
      child: Stack(
        children: [
          _ImageReaderImage(onImageCenterTap: onHideToolbar),
          Align(
            alignment: Alignment.bottomCenter,
            child: SlideTransition(
              position: hideTabBarAni,
              child: _ImageReaderSlider(),
            ),
          ),
        ],
      ),
    );
  }
}

class _ImageReaderTrailing extends HookWidget {
  const _ImageReaderTrailing();

  @override
  Widget build(BuildContext context) {
    final readerDirectory =
        useValueListenable(settingService.readerDirectoryNotifier);
    final displayType = useValueListenable(settingService.displayTypeNotifier);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        switch (readerDirectory) {
          ReaderDirection.ttb => const SizedBox(),
          ReaderDirection.ltr || ReaderDirection.rtl => CupertinoButton(
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
            ),
        },
        const SizedBox(width: 5),
        CupertinoButton(
          padding: EdgeInsets.zero,
          minSize: 0,
          child: const Icon(
            CupertinoIcons.settings,
            color: CupertinoColors.white,
          ),
          onPressed: () {
            context.to(const DisplaySettingPage(fromSetting: false));
          },
        ),
      ],
    );
  }

  SettingService get settingService => getIt.get();
}

class _ImageReaderImage extends HookWidget {
  const _ImageReaderImage({required this.onImageCenterTap});

  final VoidCallback onImageCenterTap;

  @override
  Widget build(BuildContext context) {
    final readController = context.read<ReaderNotifier>();
    final itemList =
        context.read<ReaderLoaderNotifier>().readerInfo.items.toList();
    final ticker = useSingleTickerProvider();

    final readerDirectory =
        useValueListenable(settingService.readerDirectoryNotifier);

    return switch (readerDirectory) {
      ReaderDirection.ttb => GestureDetector(
          onTap: () {},
          onTapUp: (detail) => _onImageTap(context, detail),
          child: ScrollablePositionedList.builder(
            itemScrollController: readController.listController,
            itemCount: readController.displayPageCount,
            itemPositionsListener: readController.listPositionsListener,
            initialScrollIndex: readController.currentPage,
            itemBuilder: (context, index) {
              return ImageViewer(
                index: index,
                imageWithPreviewModel: itemList.elementAtOrNull(index),
              );
            },
          ),
        ),
      ReaderDirection.ltr || ReaderDirection.rtl => PhotoViewGallery.builder(
          itemCount: readController.displayPageCount,
          builder: (context, index) {
            return readController.isSingleWidget(index)
                ? _buildSinglePageImage(context, index, ticker)
                : _buildDoublePageImage(context, index, ticker);
          },
        ),
    };
  }

  PhotoViewGalleryPageOptions _buildSinglePageImage(
    BuildContext context,
    int index,
    TickerProvider ticker,
  ) {
    final controller = context.read<ReaderNotifier>();
    final loader = context.read<ReaderLoaderNotifier>();

    final int readIndex = switch (settingService.displayType) {
      ReaderDisplayType.double => index * 2,
      ReaderDisplayType.doubleCover => max((index - 1) * 2 + 1, 0),
      ReaderDisplayType.single => index,
    };
    final itemList = loader.readerInfo.items.toList();
    return PhotoViewGalleryPageOptions.customChild(
      minScale: 1.0,
      maxScale: 5.0,
      controller: controller.photoViewController,
      child: GestureDetector(
        onTap: () {},
        onTapUp: (detail) => _onImageTap(context, detail),
        child: ImageViewer(
          // TODO 空检查
          index: readIndex,
          imageWithPreviewModel: itemList.elementAtOrNull(readIndex),
          imageWrapBuilder: (context, child) {
            return ZoomWidget(
              controller: controller.photoViewController,
              animation: ZoomAnimation(
                ticker,
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
    TickerProvider ticker,
  ) {
    final realIndex = switch (settingService.displayType) {
      ReaderDisplayType.double => index * 2,
      ReaderDisplayType.doubleCover => max((index - 1) * 2 + 1, 0),
      ReaderDisplayType.single => throw ArgumentError('displayType is single'),
    };

    final notifier = context.read<ReaderNotifier>();
    final loader = context.read<ReaderLoaderNotifier>();
    final itemList = loader.readerInfo.items.toList();

    return PhotoViewGalleryPageOptions.customChild(
      minScale: 1.0,
      maxScale: 5.0,
      controller: notifier.photoViewController,
      child: GestureDetector(
        onTap: () {},
        onTapUp: (detail) => _onImageTap(context, detail),
        child: ZoomWidget(
          controller: notifier.photoViewController,
          animation: ZoomAnimation(
            ticker,
            duration: const Duration(milliseconds: 200),
          ),
          canZoom: true,
          child: Row(
            children: [
              // TODO 空检查
              Expanded(
                child: ImageViewer(
                  imageWithPreviewModel: itemList.elementAtOrNull(realIndex),
                  index: realIndex,
                ),
              ),
              Expanded(
                child: ImageViewer(
                  imageWithPreviewModel:
                      itemList.elementAtOrNull(realIndex + 1),
                  index: realIndex + 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onImageTap(BuildContext context, TapUpDetails details) {
    ReaderNotifier controller = context.read();
    final screenSize = MediaQuery.of(context).size;

    final left = screenSize.width / 3;
    final right = left * 2;
    final tap = details.globalPosition.dx;

    if (left < tap && tap < right) {
      onImageCenterTap();
    } else if (tap < left) {
      controller.toPreviousPage();
    } else {
      controller.toNextPage();
    }
  }

  SettingService get settingService => getIt.get();
}

class _ImageReaderSlider extends StatelessWidget {
  const _ImageReaderSlider();

  @override
  Widget build(BuildContext context) {
    return ClipRect(
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
    );
  }
}
