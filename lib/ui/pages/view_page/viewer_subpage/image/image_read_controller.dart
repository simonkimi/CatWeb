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

class ImageReadController {
  ImageReadController({
    required ReaderDisplayType displayType,
    required this.controller,
  }) : _displayType = displayType.obs;

  final Rx<ReaderDisplayType> _displayType;
  final ImageReaderController controller;
  final PageController pageController = PageController();
  final listController = ItemScrollController();

  void onPageInitFinish() {
    if (controller.readerInfo.startPage != null) {
      if (controller.readerInfo.startPage! > 0) {
        pageController.jumpToPage(controller.readerInfo.startPage!);
      } else {
        onPageIndexChanged(0);
      }
    } else {
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

  int get pageCount {
    switch (displayType) {
      case ReaderDisplayType.single:
        return controller.imageLoaderList.length;
      case ReaderDisplayType.double:
        return 1 + ((controller.imageLoaderList.length - 1) / 2).ceil();
      case ReaderDisplayType.doubleCover:
        return (controller.imageLoaderList.length / 2).ceil();
    }
  }

  bool isSingleWidget(int index) {
    switch (displayType) {
      case ReaderDisplayType.single: // 单面
        return true;
      case ReaderDisplayType.double: // 普通双面多出一面
        return controller.imageLoaderList.length.isOdd &&
            index == pageCount - 1;
      case ReaderDisplayType.doubleCover: // 封面双面的封面和多出的一面
        return index == 0 ||
            (controller.imageLoaderList.length.isEven &&
                index == pageCount - 1);
    }
  }

  Future<void> onPageIndexChanged(int index) async {
    final realIndex = _getRealIndex(index);
    if (realIndex >= controller.imageLoaderList.length) {
      return;
    }
    // 预加载
    await controller.requestLoadIndex(index);

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

  ReaderDisplayType get displayType => _displayType.value;

  void toNextPage() {
    final displayIndex = _getDisplayIndex(index);

    if (displayIndex < pageCount - 1) {
      _jumpToPage(displayIndex + 1);
    }
  }

  void toPreviousPage() {
    final displayIndex = _getDisplayIndex(index);
    if (displayIndex - 1 > 0) {
      _jumpToPage(displayIndex - 1);
    }
  }

  int get index => _getRealIndex((pageController.page ?? 0).toInt());

  void _jumpToPage(int index) {
    if (pageController.hasClients) {
      pageController.jumpToPage(index);
    }
    if (listController.isAttached) {
      listController.scrollTo(index: index, duration: 200.milliseconds);
    }
  }
}
