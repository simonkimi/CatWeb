import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

extension RxWatcherInt on RxInt {
  Future<void> watch(String key, int defaultValue) async {
    final prefs = await SharedPreferences.getInstance();
    value = prefs.getInt(key) ?? defaultValue;
    ever<int>(this, (int value) => prefs.setInt(key, value));
  }
}

extension RxWatcherDouble on RxDouble {
  Future<void> watch(String key, double defaultValue) async {
    final prefs = await SharedPreferences.getInstance();
    value = prefs.getDouble(key) ?? defaultValue;
    ever<double>(this, (double value) => prefs.setDouble(key, value));
  }
}

extension RxWatcherBool on RxBool {
  Future<void> watch(String key, bool defaultValue) async {
    final prefs = await SharedPreferences.getInstance();
    value = prefs.getBool(key) ?? defaultValue;
    ever<bool>(this, (bool value) => prefs.setBool(key, value));
  }
}

extension RxWatcherString on RxString {
  Future<void> watch(String key, String defaultValue) async {
    final prefs = await SharedPreferences.getInstance();
    value = prefs.getString(key) ?? defaultValue;
    ever<String>(this, (String value) => prefs.setString(key, value));
  }
}
