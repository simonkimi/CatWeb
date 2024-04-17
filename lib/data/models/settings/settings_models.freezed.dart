// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SettingModel {
  @HiveField(0)
  int get defaultSite => throw _privateConstructorUsedError;
  @HiveField(1)
  bool get imageMaskInDarkMode => throw _privateConstructorUsedError;
  @HiveField(2)
  CardSize get cardSize => throw _privateConstructorUsedError;
  @HiveField(3)
  int get preloadCount => throw _privateConstructorUsedError;
  @HiveField(4)
  ReaderDirection get readerDirectory => throw _privateConstructorUsedError;
  @HiveField(5)
  ReaderDisplayType get displayType => throw _privateConstructorUsedError;
  @HiveField(6)
  int get concurrencyCount => throw _privateConstructorUsedError;
  @HiveField(7)
  bool get protectCookie => throw _privateConstructorUsedError;
  @HiveField(8)
  bool get blurWhenBackground => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingModelCopyWith<SettingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingModelCopyWith<$Res> {
  factory $SettingModelCopyWith(
          SettingModel value, $Res Function(SettingModel) then) =
      _$SettingModelCopyWithImpl<$Res, SettingModel>;
  @useResult
  $Res call(
      {@HiveField(0) int defaultSite,
      @HiveField(1) bool imageMaskInDarkMode,
      @HiveField(2) CardSize cardSize,
      @HiveField(3) int preloadCount,
      @HiveField(4) ReaderDirection readerDirectory,
      @HiveField(5) ReaderDisplayType displayType,
      @HiveField(6) int concurrencyCount,
      @HiveField(7) bool protectCookie,
      @HiveField(8) bool blurWhenBackground});
}

/// @nodoc
class _$SettingModelCopyWithImpl<$Res, $Val extends SettingModel>
    implements $SettingModelCopyWith<$Res> {
  _$SettingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? defaultSite = null,
    Object? imageMaskInDarkMode = null,
    Object? cardSize = null,
    Object? preloadCount = null,
    Object? readerDirectory = null,
    Object? displayType = null,
    Object? concurrencyCount = null,
    Object? protectCookie = null,
    Object? blurWhenBackground = null,
  }) {
    return _then(_value.copyWith(
      defaultSite: null == defaultSite
          ? _value.defaultSite
          : defaultSite // ignore: cast_nullable_to_non_nullable
              as int,
      imageMaskInDarkMode: null == imageMaskInDarkMode
          ? _value.imageMaskInDarkMode
          : imageMaskInDarkMode // ignore: cast_nullable_to_non_nullable
              as bool,
      cardSize: null == cardSize
          ? _value.cardSize
          : cardSize // ignore: cast_nullable_to_non_nullable
              as CardSize,
      preloadCount: null == preloadCount
          ? _value.preloadCount
          : preloadCount // ignore: cast_nullable_to_non_nullable
              as int,
      readerDirectory: null == readerDirectory
          ? _value.readerDirectory
          : readerDirectory // ignore: cast_nullable_to_non_nullable
              as ReaderDirection,
      displayType: null == displayType
          ? _value.displayType
          : displayType // ignore: cast_nullable_to_non_nullable
              as ReaderDisplayType,
      concurrencyCount: null == concurrencyCount
          ? _value.concurrencyCount
          : concurrencyCount // ignore: cast_nullable_to_non_nullable
              as int,
      protectCookie: null == protectCookie
          ? _value.protectCookie
          : protectCookie // ignore: cast_nullable_to_non_nullable
              as bool,
      blurWhenBackground: null == blurWhenBackground
          ? _value.blurWhenBackground
          : blurWhenBackground // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SettingModelsImplCopyWith<$Res>
    implements $SettingModelCopyWith<$Res> {
  factory _$$SettingModelsImplCopyWith(
          _$SettingModelsImpl value, $Res Function(_$SettingModelsImpl) then) =
      __$$SettingModelsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int defaultSite,
      @HiveField(1) bool imageMaskInDarkMode,
      @HiveField(2) CardSize cardSize,
      @HiveField(3) int preloadCount,
      @HiveField(4) ReaderDirection readerDirectory,
      @HiveField(5) ReaderDisplayType displayType,
      @HiveField(6) int concurrencyCount,
      @HiveField(7) bool protectCookie,
      @HiveField(8) bool blurWhenBackground});
}

/// @nodoc
class __$$SettingModelsImplCopyWithImpl<$Res>
    extends _$SettingModelCopyWithImpl<$Res, _$SettingModelsImpl>
    implements _$$SettingModelsImplCopyWith<$Res> {
  __$$SettingModelsImplCopyWithImpl(
      _$SettingModelsImpl _value, $Res Function(_$SettingModelsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? defaultSite = null,
    Object? imageMaskInDarkMode = null,
    Object? cardSize = null,
    Object? preloadCount = null,
    Object? readerDirectory = null,
    Object? displayType = null,
    Object? concurrencyCount = null,
    Object? protectCookie = null,
    Object? blurWhenBackground = null,
  }) {
    return _then(_$SettingModelsImpl(
      defaultSite: null == defaultSite
          ? _value.defaultSite
          : defaultSite // ignore: cast_nullable_to_non_nullable
              as int,
      imageMaskInDarkMode: null == imageMaskInDarkMode
          ? _value.imageMaskInDarkMode
          : imageMaskInDarkMode // ignore: cast_nullable_to_non_nullable
              as bool,
      cardSize: null == cardSize
          ? _value.cardSize
          : cardSize // ignore: cast_nullable_to_non_nullable
              as CardSize,
      preloadCount: null == preloadCount
          ? _value.preloadCount
          : preloadCount // ignore: cast_nullable_to_non_nullable
              as int,
      readerDirectory: null == readerDirectory
          ? _value.readerDirectory
          : readerDirectory // ignore: cast_nullable_to_non_nullable
              as ReaderDirection,
      displayType: null == displayType
          ? _value.displayType
          : displayType // ignore: cast_nullable_to_non_nullable
              as ReaderDisplayType,
      concurrencyCount: null == concurrencyCount
          ? _value.concurrencyCount
          : concurrencyCount // ignore: cast_nullable_to_non_nullable
              as int,
      protectCookie: null == protectCookie
          ? _value.protectCookie
          : protectCookie // ignore: cast_nullable_to_non_nullable
              as bool,
      blurWhenBackground: null == blurWhenBackground
          ? _value.blurWhenBackground
          : blurWhenBackground // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 0)
class _$SettingModelsImpl extends _SettingModels {
  const _$SettingModelsImpl(
      {@HiveField(0) this.defaultSite = -1,
      @HiveField(1) this.imageMaskInDarkMode = true,
      @HiveField(2) this.cardSize = CardSize.medium,
      @HiveField(3) this.preloadCount = 3,
      @HiveField(4) this.readerDirectory = ReaderDirection.rtl,
      @HiveField(5) this.displayType = ReaderDisplayType.single,
      @HiveField(6) this.concurrencyCount = 3,
      @HiveField(7) this.protectCookie = true,
      @HiveField(8) this.blurWhenBackground = false})
      : super._();

  @override
  @JsonKey()
  @HiveField(0)
  final int defaultSite;
  @override
  @JsonKey()
  @HiveField(1)
  final bool imageMaskInDarkMode;
  @override
  @JsonKey()
  @HiveField(2)
  final CardSize cardSize;
  @override
  @JsonKey()
  @HiveField(3)
  final int preloadCount;
  @override
  @JsonKey()
  @HiveField(4)
  final ReaderDirection readerDirectory;
  @override
  @JsonKey()
  @HiveField(5)
  final ReaderDisplayType displayType;
  @override
  @JsonKey()
  @HiveField(6)
  final int concurrencyCount;
  @override
  @JsonKey()
  @HiveField(7)
  final bool protectCookie;
  @override
  @JsonKey()
  @HiveField(8)
  final bool blurWhenBackground;

  @override
  String toString() {
    return 'SettingModel(defaultSite: $defaultSite, imageMaskInDarkMode: $imageMaskInDarkMode, cardSize: $cardSize, preloadCount: $preloadCount, readerDirectory: $readerDirectory, displayType: $displayType, concurrencyCount: $concurrencyCount, protectCookie: $protectCookie, blurWhenBackground: $blurWhenBackground)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingModelsImpl &&
            (identical(other.defaultSite, defaultSite) ||
                other.defaultSite == defaultSite) &&
            (identical(other.imageMaskInDarkMode, imageMaskInDarkMode) ||
                other.imageMaskInDarkMode == imageMaskInDarkMode) &&
            (identical(other.cardSize, cardSize) ||
                other.cardSize == cardSize) &&
            (identical(other.preloadCount, preloadCount) ||
                other.preloadCount == preloadCount) &&
            (identical(other.readerDirectory, readerDirectory) ||
                other.readerDirectory == readerDirectory) &&
            (identical(other.displayType, displayType) ||
                other.displayType == displayType) &&
            (identical(other.concurrencyCount, concurrencyCount) ||
                other.concurrencyCount == concurrencyCount) &&
            (identical(other.protectCookie, protectCookie) ||
                other.protectCookie == protectCookie) &&
            (identical(other.blurWhenBackground, blurWhenBackground) ||
                other.blurWhenBackground == blurWhenBackground));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      defaultSite,
      imageMaskInDarkMode,
      cardSize,
      preloadCount,
      readerDirectory,
      displayType,
      concurrencyCount,
      protectCookie,
      blurWhenBackground);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingModelsImplCopyWith<_$SettingModelsImpl> get copyWith =>
      __$$SettingModelsImplCopyWithImpl<_$SettingModelsImpl>(this, _$identity);
}

abstract class _SettingModels extends SettingModel {
  const factory _SettingModels(
      {@HiveField(0) final int defaultSite,
      @HiveField(1) final bool imageMaskInDarkMode,
      @HiveField(2) final CardSize cardSize,
      @HiveField(3) final int preloadCount,
      @HiveField(4) final ReaderDirection readerDirectory,
      @HiveField(5) final ReaderDisplayType displayType,
      @HiveField(6) final int concurrencyCount,
      @HiveField(7) final bool protectCookie,
      @HiveField(8) final bool blurWhenBackground}) = _$SettingModelsImpl;
  const _SettingModels._() : super._();

  @override
  @HiveField(0)
  int get defaultSite;
  @override
  @HiveField(1)
  bool get imageMaskInDarkMode;
  @override
  @HiveField(2)
  CardSize get cardSize;
  @override
  @HiveField(3)
  int get preloadCount;
  @override
  @HiveField(4)
  ReaderDirection get readerDirectory;
  @override
  @HiveField(5)
  ReaderDisplayType get displayType;
  @override
  @HiveField(6)
  int get concurrencyCount;
  @override
  @HiveField(7)
  bool get protectCookie;
  @override
  @HiveField(8)
  bool get blurWhenBackground;
  @override
  @JsonKey(ignore: true)
  _$$SettingModelsImplCopyWith<_$SettingModelsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
