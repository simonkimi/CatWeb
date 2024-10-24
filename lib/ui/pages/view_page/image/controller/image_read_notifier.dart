import 'dart:math' as math;
import 'package:catweb/data/controller/settings.dart';
import 'package:catweb/app.dart';
import 'package:catweb/ui/pages/view_page/image/controller/reader_load_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:photo_view/photo_view.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ReaderNotifier extends ChangeNotifier {
  final ReaderLoaderNotifier imageLoadNotifier;

  ReaderNotifier({required this.imageLoadNotifier});

  int currentPage = 0;

  final ItemScrollController listController = ItemScrollController();
  final ItemPositionsListener listPositionsListener =
      ItemPositionsListener.create();
  final PageController pageController = PageController();
  final SettingService settingService = getIt.get();
  final PhotoViewController photoViewController = PhotoViewController();

  int _isForwardDirection = 0;

  void jumpToPage(int index) {
    final displayIndex = _getDisplayIndex(index);
    if (pageController.hasClients) {
      pageController.jumpToPage(displayIndex);
    }
    if (listController.isAttached) {
      listController.jumpTo(index: index);
    }
  }

  void onPageIndexChanged(int index) {
    final realIndex = _getRealIndex(index);
    if (realIndex >= imageLoadNotifier.readerInfo.items.length) {
      return;
    }

    if ((realIndex - currentPage).abs() == 1) {
      // 跳页不作为翻页
      if (realIndex > currentPage) {
        _isForwardDirection = math.max(2, _isForwardDirection + 1);
      } else {
        _isForwardDirection = math.min(-3, _isForwardDirection - 1);
      }
    }
    imageLoadNotifier.onIndexChanged(index, isForwardDirection);
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

  bool isSingleWidget(int index) {
    switch (displayType) {
      case ReaderDisplayType.double: // 普通双面多出一面
        return imageLoadNotifier.readerInfo.items.length.isOdd &&
            index == displayPageCount - 1;
      case ReaderDisplayType.doubleCover: // 封面双面的封面和多出的一面

        return index == 0 ||
            (imageLoadNotifier.readerInfo.items.length.isEven &&
                index == displayPageCount - 1);
      case ReaderDisplayType.single: // 单面
      default:
        return true;
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
      return imageLoadNotifier.readerInfo.items.length;
    }
    switch (displayType) {
      case ReaderDisplayType.double:
        return 1 + ((imageLoadNotifier.readerInfo.items.length - 1) / 2).ceil();
      case ReaderDisplayType.doubleCover:
        return (imageLoadNotifier.readerInfo.items.length / 2).ceil();
      case ReaderDisplayType.single:
      default:
        return imageLoadNotifier.readerInfo.items.length;
    }
  }

  ReaderDirection get readerDirectory => settingService.readerDirectory;

  ReaderDisplayType get displayType => settingService.displayType;

  bool get isForwardDirection => _isForwardDirection >= 0;

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
    photoViewController.dispose();
  }
}
