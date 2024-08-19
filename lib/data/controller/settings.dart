import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingService {
  late SharedPreferences _prefs;

  final defaultSiteNotifier = ValueNotifier<int>(-1);
  final imageMaskInDarkModeNotifier = ValueNotifier<bool>(true);
  final cardSizeNotifier = ValueNotifier<CardSize>(CardSize.medium);
  final preloadCountNotifier = ValueNotifier<int>(3);
  final readerDirectoryNotifier =
      ValueNotifier<ReaderDirection>(ReaderDirection.rtl);
  final displayTypeNotifier =
      ValueNotifier<ReaderDisplayType>(ReaderDisplayType.single);
  final concurrencyCountNotifier = ValueNotifier<int>(3);
  final protectCookieNotifier = ValueNotifier<bool>(true);
  final blurWhenBackgroundNotifier = ValueNotifier<bool>(false);

  Future<SettingService> init() async {
    _prefs = await SharedPreferences.getInstance();
    defaultSiteNotifier.value = _prefs.getInt('defaultSite') ?? -1;
    imageMaskInDarkModeNotifier.value =
        _prefs.getBool('imageMaskInDarkMode') ?? true;
    cardSizeNotifier.value = CardSize.values[_prefs.getInt('cardSize') ?? 1];
    preloadCountNotifier.value = _prefs.getInt('preloadCount') ?? 3;
    readerDirectoryNotifier.value =
        ReaderDirection.values[_prefs.getInt('readerDirectory') ?? 1];
    displayTypeNotifier.value =
        ReaderDisplayType.values[_prefs.getInt('displayType') ?? 0];
    concurrencyCountNotifier.value = _prefs.getInt('concurrencyCount') ?? 3;
    protectCookieNotifier.value = _prefs.getBool('protectCookie') ?? true;
    blurWhenBackgroundNotifier.value =
        _prefs.getBool('blurWhenBackground') ?? false;
    return this;
  }

  int get defaultSite => defaultSiteNotifier.value;

  bool get imageMaskInDarkMode => imageMaskInDarkModeNotifier.value;

  CardSize get cardSize => cardSizeNotifier.value;

  int get preloadCount => preloadCountNotifier.value;

  ReaderDirection get readerDirectory => readerDirectoryNotifier.value;

  ReaderDisplayType get displayType => displayTypeNotifier.value;

  int get concurrencyCount => concurrencyCountNotifier.value;

  bool get protectCookie => protectCookieNotifier.value;

  bool get blurWhenBackground => blurWhenBackgroundNotifier.value;

  void setDefaultSite(int value) {
    _prefs.setInt('defaultSite', value);
    defaultSiteNotifier.value = value;
  }

  void setImageMaskInDarkMode(bool value) {
    _prefs.setBool('imageMaskInDarkMode', value);
    imageMaskInDarkModeNotifier.value = value;
  }

  void setCardSize(CardSize value) {
    _prefs.setInt('cardSize', value.index);
    cardSizeNotifier.value = value;
  }

  void setPreloadCount(int value) {
    _prefs.setInt('preloadCount', value);
    preloadCountNotifier.value = value;
  }

  void setReaderDirectory(ReaderDirection value) {
    _prefs.setInt('readerDirectory', value.index);
    readerDirectoryNotifier.value = value;
  }

  void setDisplayType(ReaderDisplayType value) {
    _prefs.setInt('displayType', value.index);
    displayTypeNotifier.value = value;
  }

  void setConcurrencyCount(int value) {
    _prefs.setInt('concurrencyCount', value);
    concurrencyCountNotifier.value = value;
  }

  void setProtectCookie(bool value) {
    _prefs.setBool('protectCookie', value);
    protectCookieNotifier.value = value;
  }

  void setBlurWhenBackground(bool value) {
    _prefs.setBool('blurWhenBackground', value);
    blurWhenBackgroundNotifier.value = value;
  }
}

enum CardSize {
  small,
  medium,
  large,
  huge;
}

enum ReaderDirection {
  ltr,
  rtl,
  ttb;
}

enum ReaderDisplayType {
  single,
  double,
  doubleCover;
}
