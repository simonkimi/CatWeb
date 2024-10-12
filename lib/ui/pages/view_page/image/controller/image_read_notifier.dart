import 'package:catweb/data/controller/settings.dart';
import 'package:catweb/navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ImageReadNotifier extends ChangeNotifier {
  var currentPage = 0;

  final ItemScrollController listController = ItemScrollController();
  final ItemPositionsListener listPositionsListener =
      ItemPositionsListener.create();
  final PageController pageController = PageController();
  final SettingService settingService = getIt.get();

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

  ReaderDirection get readerDirectory => settingService.readerDirectory;

  ReaderDisplayType get displayType => settingService.displayType;

  @override
  void dispose() {
    super.dispose();
  }
}
