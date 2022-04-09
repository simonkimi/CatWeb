import 'package:catweb/ui/components/image_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'image_controller.dart';
import 'image_read_controller.dart';

class ImagePreviewSlider extends StatefulWidget {
  const ImagePreviewSlider({
    Key? key,
    required this.controller,
    required this.readController,
  }) : super(key: key);

  final ImageReaderController controller;
  final ImagePageController readController;

  @override
  State<ImagePreviewSlider> createState() => _ImagePreviewSliderState();
}

class _ImagePreviewSliderState extends State<ImagePreviewSlider> {
  ImageReaderController get controller => widget.controller;

  ImagePageController get readController => widget.readController;

  late final GlobalKey listGlobalKey;
  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    listGlobalKey = GlobalKey();
    scrollController = ScrollController();
    _onScroll();
    readController.rxPage.listen((index) {
      if (scrollController.hasClients) {
        final box =
            listGlobalKey.currentContext?.findRenderObject() as RenderBox?;
        final boxSize = box?.size;
        if (boxSize != null) {
          if (readController.isForwardDirection) {
            final offset = (index - 1) * (boxSize.height * 0.618 + 2);

            if ((offset - scrollController.offset).abs() >
                boxSize.width * 1.5) {
              scrollController.jumpTo(offset);
            }

            if (offset > scrollController.position.maxScrollExtent) {
              scrollController.animateTo(
                  scrollController.position.maxScrollExtent,
                  duration: 300.milliseconds,
                  curve: Curves.ease);
              return;
            }

            scrollController.animateTo(offset,
                duration: 300.milliseconds, curve: Curves.ease);
          } else {
            final offset =
                (index + 2) * (boxSize.height * 0.618 + 2) - boxSize.width;

            if ((offset - scrollController.offset).abs() >
                boxSize.width * 1.5) {
              scrollController.jumpTo(offset);
            }

            if (offset < 0) {
              scrollController.animateTo(0,
                  duration: 300.milliseconds, curve: Curves.ease);
              return;
            }

            scrollController.animateTo(offset,
                duration: 300.milliseconds, curve: Curves.ease);
          }
        }
      }
    });
  }

  void _onScroll() {
    scrollController.addListener(() {
      final box =
          listGlobalKey.currentContext?.findRenderObject() as RenderBox?;
      final boxSize = box?.size;
      if (boxSize != null) {
        final offset = scrollController.offset;
        final end =
            ((offset + boxSize.width) / (boxSize.height * 0.618 + 2)).ceil();
        final start = (offset / (boxSize.height * 0.618 + 2)).floor();

        for (var i = start; i < end; i++) {
          controller.readerInfo.requestLoadIndex(i);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        key: listGlobalKey,
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: controller.imageLoaderList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => readController.jumpToPage(index),
            child: Padding(
              key: ValueKey(index),
              padding: const EdgeInsets.symmetric(horizontal: 1),
              child: Obx(() => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      border: readController.currentPage == index
                          ? Border.all(
                              color: CupertinoColors.white,
                              width: 1,
                            )
                          : null,
                    ),
                    child: AspectRatio(
                      aspectRatio: 0.618,
                      child: Obx(() => controller
                                  .imageLoaderList[index].previewModel.value !=
                              null
                          ? ImageLoader(
                              concurrency:
                                  controller.readerInfo.previewConcurrency,
                              model: controller
                                  .imageLoaderList[index].previewModel.value!,
                              enableHero: false,
                            )
                          : Center(
                              child: Text(
                                '${index + 1}',
                                style: const TextStyle(
                                  color: CupertinoColors.white,
                                  fontSize: 12,
                                ),
                              ),
                            )),
                    ),
                  )),
            ),
          );
        },
      ),
    );
  }
}
