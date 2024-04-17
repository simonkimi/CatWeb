import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'settings_models.g.dart';

part 'settings_models.freezed.dart';

@freezed
class SettingModel with _$SettingModel {
  const SettingModel._();

  @HiveType(typeId: 0)
  const factory SettingModel({
    @HiveField(0) @Default(-1) int defaultSite,
    @HiveField(1) @Default(true) bool imageMaskInDarkMode,
    @HiveField(2) @Default(CardSize.medium) CardSize cardSize,
    @HiveField(3) @Default(3) int preloadCount,
    @HiveField(4) @Default(ReaderDirection.rtl) ReaderDirection readerDirectory,
    @HiveField(5)
    @Default(ReaderDisplayType.single)
    ReaderDisplayType displayType,
    @HiveField(6) @Default(3) int concurrencyCount,
    @HiveField(7) @Default(true) bool protectCookie,
    @HiveField(8) @Default(false) bool blurWhenBackground,
  }) = _SettingModels;
}

@HiveType(typeId: 1)
enum CardSize {
  @HiveField(0)
  small,
  @HiveField(1)
  medium,
  @HiveField(2)
  large,
  @HiveField(3)
  huge;
}

@HiveType(typeId: 2)
enum ReaderDirection {
  @HiveField(0)
  ltr,
  @HiveField(1)
  rtl,
  @HiveField(2)
  ttb;
}

@HiveType(typeId: 3)
enum ReaderDisplayType {
  @HiveField(0)
  single,
  @HiveField(1)
  double,
  @HiveField(2)
  doubleCover;
}
