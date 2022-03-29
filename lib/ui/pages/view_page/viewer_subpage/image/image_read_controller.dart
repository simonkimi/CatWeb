import 'package:catweb/data/controller/setting_controller.dart';
import 'package:flutter/cupertino.dart';

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
  }) : _displayType = displayType.obs {
    onPageIndexChanged(0);
  }

  final Rx<ReaderDisplayType> _displayType;
  final ImageReaderController controller;

  int _getRealIndex(int index) {
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
    final preloadCount = Get.find<SettingController>().preloadCount.value;
    if (preloadCount >= 0) {
      controller.imageLoaderList.skip(realIndex).take(preloadCount).forEach(
        (imageLoader) {
          if (imageLoader.imageModel.value == null) {
            imageLoader.requestLoad(true).then((value) {
              imageLoader.imageModel.value?.resolve(const ImageConfiguration());
            });
          } else {
            imageLoader.imageModel.value!.resolve(const ImageConfiguration());
          }
        },
      );
    }
  }

  ReaderDisplayType get displayType => _displayType.value;
}
