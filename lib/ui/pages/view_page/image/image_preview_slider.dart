import 'dart:math';

import 'package:catweb/data/controller/settings.dart';
import 'package:catweb/app.dart';
import 'package:catweb/ui/pages/view_page/image/controller/image_read_notifier.dart';
import 'package:catweb/ui/widgets/image_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ImagePreviewSlider extends StatefulWidget {
  const ImagePreviewSlider({
    super.key,
  });

  @override
  State<ImagePreviewSlider> createState() => _ImagePreviewSliderState();
}

class _ImagePreviewSliderState extends State<ImagePreviewSlider> {
  late final GlobalKey listGlobalKey;
  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    listGlobalKey = GlobalKey();
    scrollController = ScrollController();
    _onScroll();

    final ReaderNotifier controller = context.watch();
    const aniDuration = Duration(milliseconds: 300);

    controller.addListener(() {
      if (!scrollController.hasClients) {
        return;
      }
      final RenderBox? box =
          listGlobalKey.currentContext?.findRenderObject() as RenderBox?;
      final boxSize = box?.size;
      if (boxSize == null) {
        return;
      }
      if (controller.isForwardDirection) {
        final offset =
            (controller.currentPage - 1) * (boxSize.height * 0.618 + 2);

        if ((offset - scrollController.offset).abs() > boxSize.width * 1.5) {
          scrollController.jumpTo(offset);
        }

        if (offset > scrollController.position.maxScrollExtent) {
          scrollController.animateTo(scrollController.position.maxScrollExtent,
              duration: aniDuration, curve: Curves.ease);
          return;
        }

        scrollController.animateTo(offset,
            duration: aniDuration, curve: Curves.ease);
      } else {
        final offset =
            (controller.currentPage + 2) * (boxSize.height * 0.618 + 2) -
                boxSize.width;

        if ((offset - scrollController.offset).abs() > boxSize.width * 1.5) {
          scrollController.jumpTo(offset);
        }

        if (offset < 0) {
          scrollController.animateTo(0,
              duration: aniDuration, curve: Curves.ease);
          return;
        }

        scrollController.animateTo(offset,
            duration: aniDuration, curve: Curves.ease);
      }
    });
  }

  void _onScroll() {
    final ReaderNotifier controller = context.read();
    scrollController.addListener(() {
      final box =
          listGlobalKey.currentContext?.findRenderObject() as RenderBox?;
      final boxSize = box?.size;
      if (boxSize != null) {
        final offset = scrollController.offset;
        final end = min(controller.imageLoadNotifier.readerInfo.items.length,
            ((offset + boxSize.width) / (boxSize.height * 0.618 + 2)).ceil());
        final start = (offset / (boxSize.height * 0.618 + 2)).floor();

        for (var i = max(start, 0); i < end; i++) {
          controller.imageLoadNotifier.readerInfo.loadIndexModel(i);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final ReaderNotifier controller = context.read();

    return SizedBox(
      height: 50,
      child: ValueListenableBuilder(
        valueListenable: settingService.readerDirectoryNotifier,
        builder: (context, directory, child) {
          return ListView.builder(
            reverse: directory == ReaderDirection.rtl,
            key: listGlobalKey,
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: controller.imageLoadNotifier.readerInfo.items.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => controller.jumpToPage(index),
                child: Padding(
                  key: ValueKey(index),
                  padding: const EdgeInsets.symmetric(horizontal: 1),
                  child: Selector<ReaderNotifier, int>(
                    selector: (c, v) => v.currentPage,
                    builder: (context, currentPage, child) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          border: currentPage == index
                              ? Border.all(
                                  color: CupertinoColors.white,
                                  width: 1,
                                )
                              : null,
                        ),
                        child: AspectRatio(
                          aspectRatio: 0.618,
                          child: AnimatedBuilder(
                            animation: controller.imageLoadNotifier.readerInfo,
                            builder: (context, child) {
                              final item = controller
                                  .imageLoadNotifier.readerInfo.items
                                  .toList()[index];
                              if (item == null) {
                                return Center(
                                  child: Text(
                                    '${index + 1}',
                                    style: const TextStyle(
                                      color: CupertinoColors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                );
                              }
                              return ImageLoader(
                                queue: controller.imageLoadNotifier.readerInfo
                                    .previewConcurrency,
                                model: controller
                                    .imageLoadNotifier.readerInfo.items
                                    .toList()[index]!
                                    .previewImage!,
                                enableHero: false,
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  SettingService get settingService => getIt.get();
}
