import 'package:catweb/data/database/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'dart:math' as math;

import 'image_controller.dart';
import 'package:get/get.dart';

enum ReaderDisplayType {
  single, // 单面情况
  double, // 双面情况
  doubleCover, // 封面单独占一面的双面情况
}

class ImagePageController {
  ImagePageController({
    required ReaderDisplayType displayType,
    required this.controller,
  }) : _displayType = displayType.obs;

  final Rx<ReaderDisplayType> _displayType;
  final ImageReaderController controller;
  final PageController pageController = PageController();

  final listController = ItemScrollController();

  final Rx<int> _currentPage = 0.obs;

  var _isForwardDirection = 0;

  void onPageInitFinish() {
    if (controller.readerInfo.startPage != null) {
      if (controller.readerInfo.startPage! > 0) {
        _currentPage.value = controller.readerInfo.startPage!;
        pageController
            .jumpToPage(_getRealIndex(controller.readerInfo.startPage!));
      } else {
        _currentPage.value = 0;
        onPageIndexChanged(0);
      }
    } else {
      _currentPage.value = 0;
      onPageIndexChanged(0);
    }
  }

  int _getRealIndex(int index) {
    if (_displayType.value == ReaderDisplayType.single) {
      return index;
    } else if (_displayType.value == ReaderDisplayType.double) {
      return index * 2;
    } else if (_displayType.value == ReaderDisplayType.doubleCover) {
      return math.max((index - 1) * 2 + 1, 0);
    }
    return 0;
  }

  bool isSingleWidget(int index) {
    switch (displayType) {
      case ReaderDisplayType.single: // 单面
        return true;
      case ReaderDisplayType.double: // 普通双面多出一面
        return controller.imageLoaderList.length.isOdd &&
            index == displayPageCount - 1;
      case ReaderDisplayType.doubleCover: // 封面双面的封面和多出的一面
        return index == 0 ||
            (controller.imageLoaderList.length.isEven &&
                index == displayPageCount - 1);
    }
  }

  Future<void> onPageIndexChanged(int index) async {
    final realIndex = _getRealIndex(index);
    if (realIndex >= controller.imageLoaderList.length) {
      return;
    }
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
    await controller.requestLoadImageModelIndex(index, isForwardDirection);

    // 记录加载数据
    if (controller.readerInfo.idCode != null) {
      final db = DB().readerHistoryDao;
      final entity = await db.get(
        uuid: controller.readerInfo.fromUuid,
        idCode: controller.readerInfo.idCode!,
      );
      if (entity != null) {
        await db.replace(entity.copyWith(
          pageIndex: realIndex,
        ));
      }
    }
  }

  void toNextPage() {
    final displayIndex = _getDisplayIndex(index);

    if (displayIndex < displayPageCount - 1) {
      jumpToPage(displayIndex + 1);
    }
  }

  void toPreviousPage() {
    final displayIndex = _getDisplayIndex(index);
    if (displayIndex - 1 > 0) {
      jumpToPage(displayIndex - 1);
    }
  }

  void jumpToPage(int index) {
    if (pageController.hasClients) {
      pageController.jumpToPage(index);
    }
    if (listController.isAttached) {
      listController.scrollTo(index: index, duration: 200.milliseconds);
    }
  }

  int _getDisplayIndex(int index) {
    switch (displayType) {
      case ReaderDisplayType.single:
        return index;
      case ReaderDisplayType.double:
        return (index / 2).ceil();
      case ReaderDisplayType.doubleCover:
        return ((index + 1) / 2).floor();
    }
  }

  int get displayPageCount {
    switch (displayType) {
      case ReaderDisplayType.single:
        return controller.imageLoaderList.length;
      case ReaderDisplayType.double:
        return 1 + ((controller.imageLoaderList.length - 1) / 2).ceil();
      case ReaderDisplayType.doubleCover:
        return (controller.imageLoaderList.length / 2).ceil();
    }
  }

  ReaderDisplayType get displayType => _displayType.value;

  int get index => _getRealIndex((pageController.page ?? 0).toInt());

  int get currentPage => _currentPage.value;

  Rx<int> get rxPage => _currentPage;

  bool get isForwardDirection => _isForwardDirection >= 0;
}
