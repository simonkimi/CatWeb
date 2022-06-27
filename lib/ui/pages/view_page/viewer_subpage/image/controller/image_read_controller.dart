import 'package:catweb/data/controller/setting_controller.dart';
import 'package:catweb/data/controller/setting_enum.dart';
import 'package:catweb/utils/debug.dart';
import 'package:flutter/cupertino.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'dart:math' as math;

import 'package:get/get.dart';
import 'image_load_controller.dart';

class ImagePageController {
  ImagePageController({
    required this.controller,
  }) : _currentPage = controller.readerInfo.startReadIndex != null
            ? controller.readerInfo.startReadIndex!.obs
            : 0.obs;

  final ReaderLoaderController controller;
  final PageController pageController = PageController();

  final listController = ItemScrollController();
  final listPositionsListener = ItemPositionsListener.create();

  final settings = Get.find<SettingController>();

  final Rx<int> _currentPage;

  var _isForwardDirection = 0;

  void onPageInitFinish() {
    listPositionsListener.itemPositions.addListener(() {
      if (listController.isAttached) {
        final index = listPositionsListener.itemPositions.value.first.index;
        if (index != currentPage) {
          onPageIndexChanged(index);
        }
      }
    });

    if (currentPage > 0) {
      final start = _getDisplayIndex(controller.readerInfo.startReadIndex!);
      _currentPage.value = start;
      onPageIndexChanged(start);
      jumpToPage(start);
    } else {
      onPageIndexChanged(0);
    }
  }

  void onPageViewBuild() {
    if (currentPage > 0) {
      jumpToPage(currentPage);
    }
  }

  int _getRealIndex(int index) {
    if (readerDirectory == ReaderDirection.ttb) {
      return index;
    }
    if (displayType == ReaderDisplayType.single) {
      return index;
    } else if (displayType == ReaderDisplayType.double) {
      return index * 2;
    } else if (displayType == ReaderDisplayType.doubleCover) {
      return math.max((index - 1) * 2 + 1, 0);
    }
    return 0;
  }

  bool isSingleWidget(int index) {
    switch (displayType) {
      case ReaderDisplayType.double: // 普通双面多出一面
        return controller.readerInfo.items.length.isOdd &&
            index == displayPageCount - 1;
      case ReaderDisplayType.doubleCover: // 封面双面的封面和多出的一面

        return index == 0 ||
            (controller.readerInfo.items.length.isEven &&
                index == displayPageCount - 1);
      case ReaderDisplayType.single: // 单面
      default:
        return true;
    }
  }

  Future<void> onPageIndexChanged(int index) async {
    final realIndex = _getRealIndex(index);
    if (realIndex >= controller.readerInfo.items.length) {
      return;
    }
    logger.d('Page changed: $index -> $realIndex');

    if ((realIndex - currentPage).abs() == 1) {
      // 跳页不作为翻页
      if (realIndex > currentPage) {
        _isForwardDirection =
            _isForwardDirection >= 2 ? 2 : _isForwardDirection + 1;
      } else {
        _isForwardDirection =
            _isForwardDirection <= -3 ? -3 : _isForwardDirection - 1;
      }
    }
    _currentPage.value = realIndex;
    // 预加载
    controller.readerInfo.onReaderIndexChanged(realIndex);
    await controller.onIndexChanged(index, isForwardDirection);
  }

  void toNextPage() {
    final displayIndex = _getDisplayIndex(currentPage);

    if (displayIndex < displayPageCount - 1) {
      jumpToPage(displayIndex + 1);
    }
  }

  void toPreviousPage() {
    final displayIndex = _getDisplayIndex(currentPage);
    if (displayIndex - 1 > 0) {
      jumpToPage(displayIndex - 1);
    }
  }

  void jumpToPage(int index) {
    final displayIndex = _getDisplayIndex(index);
    if (pageController.hasClients) {
      pageController.jumpToPage(displayIndex);
    }
    if (listController.isAttached) {
      listController.jumpTo(index: index);
    }
  }

  int _getDisplayIndex(int index) {
    if (readerDirectory == ReaderDirection.ttb) {
      return index;
    }
    switch (displayType) {
      case ReaderDisplayType.double:
        return (index / 2).ceil();
      case ReaderDisplayType.doubleCover:
        return ((index + 1) / 2).floor();
      case ReaderDisplayType.single:
      default:
        return index;
    }
  }

  int get displayPageCount {
    if (readerDirectory == ReaderDirection.ttb) {
      return controller.readerInfo.items.length;
    }
    switch (displayType) {
      case ReaderDisplayType.double:
        return 1 + ((controller.readerInfo.items.length - 1) / 2).ceil();
      case ReaderDisplayType.doubleCover:
        return (controller.readerInfo.items.length / 2).ceil();
      case ReaderDisplayType.single:
      default:
        return controller.readerInfo.items.length;
    }
  }

  int get displayType => settings.displayType.value;

  int get readerDirectory => settings.readerDirectory.value;

  int get currentPage => _currentPage.value;

  Rx<int> get rxPage => _currentPage;

  bool get isForwardDirection => _isForwardDirection >= 0;
}
