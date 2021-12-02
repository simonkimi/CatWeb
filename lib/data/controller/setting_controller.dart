import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

extension _RxWatcher<T> on Rx<T> {
  Future<void> watch(String key, T defaultValue) async {
    final prefs = await SharedPreferences.getInstance();

    if (T is int) {
      value = prefs.getInt(key) as T ?? defaultValue;
      ever<T>(this, (T value) => prefs.setInt(key, value as int));
    } else if (T is double) {
      value = prefs.getDouble(key) as T ?? defaultValue;
      ever<T>(this, (T value) => prefs.setDouble(key, value as double));
    } else if (T is String) {
      value = prefs.getString(key) as T ?? defaultValue;
      ever<T>(this, (T value) => prefs.setString(key, value as String));
    } else if (T is bool) {
      value = prefs.getBool(key) as T ?? defaultValue;
      ever<T>(this, (T value) => prefs.setBool(key, value as bool));
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
