import 'package:catweb/utils/rx_watcher.dart';
import 'package:get/get.dart';

class CardSize {
  static const int small = 1;
  static const int middle = 2;
  static const int large = 3;
  static const int huge = 4;

  static int of(int value) {
    switch (value) {
      case small:
        return 100;
      case middle:
        return 150;
      case large:
        return 200;
      case huge:
      default:
        return 250;
    }
  }
}


class SettingController extends GetxController {
  final cardSize = CardSize.middle.obs;
  final RxInt defaultSite = (-1).obs;

  @override
  Future<void> onInit() async {
    cardSize.watch('cardSize', CardSize.middle);
    defaultSite.watch('defaultSite', -1);
    super.onInit();
  }
}
