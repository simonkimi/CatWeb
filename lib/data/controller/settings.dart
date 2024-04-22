import 'package:catweb/data/new_model/settings_models.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final settingsProvider = StateNotifierProvider<SettingsNotifier, SettingModel>(
  (ref) => SettingsNotifier(),
);

class SettingsNotifier extends StateNotifier<SettingModel> {
  SettingsNotifier() : super(const SettingModel());

  Future<void> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    state = SettingModel(
      defaultSite: prefs.getInt('defaultSite') ?? -1,
      imageMaskInDarkMode: prefs.getBool('imageMaskInDarkMode') ?? true,
      cardSize: CardSize.values[prefs.getInt('cardSize') ?? 1],
      preloadCount: prefs.getInt('preloadCount') ?? 3,
      readerDirectory:
          ReaderDirection.values[prefs.getInt('readerDirectory') ?? 1],
      displayType: ReaderDisplayType.values[prefs.getInt('displayType') ?? 0],
      concurrencyCount: prefs.getInt('concurrencyCount') ?? 3,
      protectCookie: prefs.getBool('protectCookie') ?? true,
      blurWhenBackground: prefs.getBool('blurWhenBackground') ?? false,
    );
  }

  Future<void> saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('defaultSite', state.defaultSite);
    await prefs.setBool('imageMaskInDarkMode', state.imageMaskInDarkMode);
    await prefs.setInt('cardSize', state.cardSize.index);
    await prefs.setInt('preloadCount', state.preloadCount);
    await prefs.setInt('readerDirectory', state.readerDirectory.index);
    await prefs.setInt('displayType', state.displayType.index);
    await prefs.setInt('concurrencyCount', state.concurrencyCount);
    await prefs.setBool('protectCookie', state.protectCookie);
    await prefs.setBool('blurWhenBackground', state.blurWhenBackground);
  }

  void setDefaultSite(int site) {
    state = state.copyWith(defaultSite: site);
    saveSettings();
  }

  void setImageMaskInDarkMode(bool value) {
    state = state.copyWith(imageMaskInDarkMode: value);
    saveSettings();
  }

  void setCardSize(CardSize size) {
    state = state.copyWith(cardSize: size);
    saveSettings();
  }

  void setPreloadCount(int count) {
    state = state.copyWith(preloadCount: count);
    saveSettings();
  }

  void setReaderDirectory(ReaderDirection direction) {
    state = state.copyWith(readerDirectory: direction);
    saveSettings();
  }

  void setDisplayType(ReaderDisplayType type) {
    state = state.copyWith(displayType: type);
    saveSettings();
  }

  void setConcurrencyCount(int count) {
    state = state.copyWith(concurrencyCount: count);
    saveSettings();
  }

  void setProtectCookie(bool value) {
    state = state.copyWith(protectCookie: value);
    saveSettings();
  }

  void setBlurWhenBackground(bool value) {
    state = state.copyWith(blurWhenBackground: value);
    saveSettings();
  }
}
