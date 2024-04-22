import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_models.freezed.dart';

@freezed
class SettingModel with _$SettingModel {
  const SettingModel._();

  const factory SettingModel({
    @Default(-1) int defaultSite,
    @Default(true) bool imageMaskInDarkMode,
    @Default(CardSize.medium) CardSize cardSize,
    @Default(3) int preloadCount,
    @Default(ReaderDirection.rtl) ReaderDirection readerDirectory,
    @Default(ReaderDisplayType.single) ReaderDisplayType displayType,
    @Default(3) int concurrencyCount,
    @Default(true) bool protectCookie,
    @Default(false) bool blurWhenBackground,
  }) = _SettingModels;
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
