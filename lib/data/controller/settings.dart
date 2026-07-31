import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingService {
  late SharedPreferences _prefs;

  final defaultSiteNotifier = ValueNotifier<int>(-1);
  final imageMaskInDarkModeNotifier = ValueNotifier<bool>(true);
  final cardSizeNotifier = ValueNotifier<CardSize>(CardSize.medium);
  final preloadCountNotifier = ValueNotifier<int>(3);
  final readerDirectoryNotifier = ValueNotifier<ReaderDirection>(
    ReaderDirection.rtl,
  );
  final displayTypeNotifier = ValueNotifier<ReaderDisplayType>(
    ReaderDisplayType.single,
  );
  final concurrencyCountNotifier = ValueNotifier<int>(3);
  final protectCookieNotifier = ValueNotifier<bool>(true);
  final blurWhenBackgroundNotifier = ValueNotifier<bool>(false);
  final imageQualityNotifier = ValueNotifier<ImageQuality>(
    ImageQuality.defaultQ,
  );

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
    imageQualityNotifier.value =
        ImageQuality.values[_prefs.getInt('imageQuality') ?? 0];
    _bindPersistence();
    return this;
  }

  void _bindPersistence() {
    defaultSiteNotifier.addListener(_persistDefaultSite);
    imageMaskInDarkModeNotifier.addListener(_persistImageMaskInDarkMode);
    cardSizeNotifier.addListener(_persistCardSize);
    preloadCountNotifier.addListener(_persistPreloadCount);
    readerDirectoryNotifier.addListener(_persistReaderDirectory);
    displayTypeNotifier.addListener(_persistDisplayType);
    concurrencyCountNotifier.addListener(_persistConcurrencyCount);
    protectCookieNotifier.addListener(_persistProtectCookie);
    blurWhenBackgroundNotifier.addListener(_persistBlurWhenBackground);
    imageQualityNotifier.addListener(_persistImageQuality);
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

  ImageQuality get imageQuality => imageQualityNotifier.value;

  void setDefaultSite(int value) {
    defaultSiteNotifier.value = value;
  }

  void setImageMaskInDarkMode(bool value) {
    imageMaskInDarkModeNotifier.value = value;
  }

  void setCardSize(CardSize value) {
    cardSizeNotifier.value = value;
  }

  void setPreloadCount(int value) {
    preloadCountNotifier.value = value;
  }

  void setReaderDirectory(ReaderDirection value) {
    readerDirectoryNotifier.value = value;
  }

  void setDisplayType(ReaderDisplayType value) {
    displayTypeNotifier.value = value;
  }

  void setConcurrencyCount(int value) {
    concurrencyCountNotifier.value = value;
  }

  void setProtectCookie(bool value) {
    protectCookieNotifier.value = value;
  }

  void setBlurWhenBackground(bool value) {
    blurWhenBackgroundNotifier.value = value;
  }

  void setImageQuality(ImageQuality value) {
    imageQualityNotifier.value = value;
  }

  void _persistDefaultSite() =>
      unawaited(_prefs.setInt('defaultSite', defaultSite));

  void _persistImageMaskInDarkMode() => unawaited(
    _prefs.setBool('imageMaskInDarkMode', imageMaskInDarkMode),
  );

  void _persistCardSize() =>
      unawaited(_prefs.setInt('cardSize', cardSize.index));

  void _persistPreloadCount() =>
      unawaited(_prefs.setInt('preloadCount', preloadCount));

  void _persistReaderDirectory() =>
      unawaited(_prefs.setInt('readerDirectory', readerDirectory.index));

  void _persistDisplayType() =>
      unawaited(_prefs.setInt('displayType', displayType.index));

  void _persistConcurrencyCount() =>
      unawaited(_prefs.setInt('concurrencyCount', concurrencyCount));

  void _persistProtectCookie() =>
      unawaited(_prefs.setBool('protectCookie', protectCookie));

  void _persistBlurWhenBackground() =>
      unawaited(_prefs.setBool('blurWhenBackground', blurWhenBackground));

  void _persistImageQuality() =>
      unawaited(_prefs.setInt('imageQuality', imageQuality.index));

  void dispose() {
    defaultSiteNotifier.removeListener(_persistDefaultSite);
    imageMaskInDarkModeNotifier.removeListener(_persistImageMaskInDarkMode);
    cardSizeNotifier.removeListener(_persistCardSize);
    preloadCountNotifier.removeListener(_persistPreloadCount);
    readerDirectoryNotifier.removeListener(_persistReaderDirectory);
    displayTypeNotifier.removeListener(_persistDisplayType);
    concurrencyCountNotifier.removeListener(_persistConcurrencyCount);
    protectCookieNotifier.removeListener(_persistProtectCookie);
    blurWhenBackgroundNotifier.removeListener(_persistBlurWhenBackground);
    imageQualityNotifier.removeListener(_persistImageQuality);
    defaultSiteNotifier.dispose();
    imageMaskInDarkModeNotifier.dispose();
    cardSizeNotifier.dispose();
    preloadCountNotifier.dispose();
    readerDirectoryNotifier.dispose();
    displayTypeNotifier.dispose();
    concurrencyCountNotifier.dispose();
    protectCookieNotifier.dispose();
    blurWhenBackgroundNotifier.dispose();
    imageQualityNotifier.dispose();
  }
}

enum CardSize { small, medium, large, huge }

enum ReaderDirection { ltr, rtl, ttb }

enum ReaderDisplayType { single, double, doubleCover }

enum ImageQuality { defaultQ, larger, original }
