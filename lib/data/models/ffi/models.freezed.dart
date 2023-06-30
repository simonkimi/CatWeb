// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ImageRspModel _$ImageRspModelFromJson(Map<String, dynamic> json) {
  return _ImageRspModel.fromJson(json);
}

/// @nodoc
mixin _$ImageRspModel {
  String get url => throw _privateConstructorUsedError;
  String get cacheKey => throw _privateConstructorUsedError;
  double get width => throw _privateConstructorUsedError;
  double get height => throw _privateConstructorUsedError;
  double get imgX => throw _privateConstructorUsedError;
  double get imgY => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageRspModelCopyWith<ImageRspModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageRspModelCopyWith<$Res> {
  factory $ImageRspModelCopyWith(
          ImageRspModel value, $Res Function(ImageRspModel) then) =
      _$ImageRspModelCopyWithImpl<$Res, ImageRspModel>;
  @useResult
  $Res call(
      {String url,
      String cacheKey,
      double width,
      double height,
      double imgX,
      double imgY});
}

/// @nodoc
class _$ImageRspModelCopyWithImpl<$Res, $Val extends ImageRspModel>
    implements $ImageRspModelCopyWith<$Res> {
  _$ImageRspModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? cacheKey = null,
    Object? width = null,
    Object? height = null,
    Object? imgX = null,
    Object? imgY = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      cacheKey: null == cacheKey
          ? _value.cacheKey
          : cacheKey // ignore: cast_nullable_to_non_nullable
              as String,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      imgX: null == imgX
          ? _value.imgX
          : imgX // ignore: cast_nullable_to_non_nullable
              as double,
      imgY: null == imgY
          ? _value.imgY
          : imgY // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ImageRspModelCopyWith<$Res>
    implements $ImageRspModelCopyWith<$Res> {
  factory _$$_ImageRspModelCopyWith(
          _$_ImageRspModel value, $Res Function(_$_ImageRspModel) then) =
      __$$_ImageRspModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String url,
      String cacheKey,
      double width,
      double height,
      double imgX,
      double imgY});
}

/// @nodoc
class __$$_ImageRspModelCopyWithImpl<$Res>
    extends _$ImageRspModelCopyWithImpl<$Res, _$_ImageRspModel>
    implements _$$_ImageRspModelCopyWith<$Res> {
  __$$_ImageRspModelCopyWithImpl(
      _$_ImageRspModel _value, $Res Function(_$_ImageRspModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? cacheKey = null,
    Object? width = null,
    Object? height = null,
    Object? imgX = null,
    Object? imgY = null,
  }) {
    return _then(_$_ImageRspModel(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      cacheKey: null == cacheKey
          ? _value.cacheKey
          : cacheKey // ignore: cast_nullable_to_non_nullable
              as String,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      imgX: null == imgX
          ? _value.imgX
          : imgX // ignore: cast_nullable_to_non_nullable
              as double,
      imgY: null == imgY
          ? _value.imgY
          : imgY // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ImageRspModel extends _ImageRspModel {
  _$_ImageRspModel(
      {required this.url,
      required this.cacheKey,
      required this.width,
      required this.height,
      required this.imgX,
      required this.imgY})
      : super._();

  factory _$_ImageRspModel.fromJson(Map<String, dynamic> json) =>
      _$$_ImageRspModelFromJson(json);

  @override
  final String url;
  @override
  final String cacheKey;
  @override
  final double width;
  @override
  final double height;
  @override
  final double imgX;
  @override
  final double imgY;

  @override
  String toString() {
    return 'ImageRspModel(url: $url, cacheKey: $cacheKey, width: $width, height: $height, imgX: $imgX, imgY: $imgY)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImageRspModel &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.cacheKey, cacheKey) ||
                other.cacheKey == cacheKey) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.imgX, imgX) || other.imgX == imgX) &&
            (identical(other.imgY, imgY) || other.imgY == imgY));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, url, cacheKey, width, height, imgX, imgY);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ImageRspModelCopyWith<_$_ImageRspModel> get copyWith =>
      __$$_ImageRspModelCopyWithImpl<_$_ImageRspModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ImageRspModelToJson(
      this,
    );
  }
}

abstract class _ImageRspModel extends ImageRspModel {
  factory _ImageRspModel(
      {required final String url,
      required final String cacheKey,
      required final double width,
      required final double height,
      required final double imgX,
      required final double imgY}) = _$_ImageRspModel;
  _ImageRspModel._() : super._();

  factory _ImageRspModel.fromJson(Map<String, dynamic> json) =
      _$_ImageRspModel.fromJson;

  @override
  String get url;
  @override
  String get cacheKey;
  @override
  double get width;
  @override
  double get height;
  @override
  double get imgX;
  @override
  double get imgY;
  @override
  @JsonKey(ignore: true)
  _$$_ImageRspModelCopyWith<_$_ImageRspModel> get copyWith =>
      throw _privateConstructorUsedError;
}

ColorRspModel _$ColorRspModelFromJson(Map<String, dynamic> json) {
  return _ColorRspModel.fromJson(json);
}

/// @nodoc
mixin _$ColorRspModel {
  int? get a => throw _privateConstructorUsedError;
  int get r => throw _privateConstructorUsedError;
  int get g => throw _privateConstructorUsedError;
  int get b => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ColorRspModelCopyWith<ColorRspModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColorRspModelCopyWith<$Res> {
  factory $ColorRspModelCopyWith(
          ColorRspModel value, $Res Function(ColorRspModel) then) =
      _$ColorRspModelCopyWithImpl<$Res, ColorRspModel>;
  @useResult
  $Res call({int? a, int r, int g, int b});
}

/// @nodoc
class _$ColorRspModelCopyWithImpl<$Res, $Val extends ColorRspModel>
    implements $ColorRspModelCopyWith<$Res> {
  _$ColorRspModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? a = freezed,
    Object? r = null,
    Object? g = null,
    Object? b = null,
  }) {
    return _then(_value.copyWith(
      a: freezed == a
          ? _value.a
          : a // ignore: cast_nullable_to_non_nullable
              as int?,
      r: null == r
          ? _value.r
          : r // ignore: cast_nullable_to_non_nullable
              as int,
      g: null == g
          ? _value.g
          : g // ignore: cast_nullable_to_non_nullable
              as int,
      b: null == b
          ? _value.b
          : b // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ColorRspModelCopyWith<$Res>
    implements $ColorRspModelCopyWith<$Res> {
  factory _$$_ColorRspModelCopyWith(
          _$_ColorRspModel value, $Res Function(_$_ColorRspModel) then) =
      __$$_ColorRspModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? a, int r, int g, int b});
}

/// @nodoc
class __$$_ColorRspModelCopyWithImpl<$Res>
    extends _$ColorRspModelCopyWithImpl<$Res, _$_ColorRspModel>
    implements _$$_ColorRspModelCopyWith<$Res> {
  __$$_ColorRspModelCopyWithImpl(
      _$_ColorRspModel _value, $Res Function(_$_ColorRspModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? a = freezed,
    Object? r = null,
    Object? g = null,
    Object? b = null,
  }) {
    return _then(_$_ColorRspModel(
      a: freezed == a
          ? _value.a
          : a // ignore: cast_nullable_to_non_nullable
              as int?,
      r: null == r
          ? _value.r
          : r // ignore: cast_nullable_to_non_nullable
              as int,
      g: null == g
          ? _value.g
          : g // ignore: cast_nullable_to_non_nullable
              as int,
      b: null == b
          ? _value.b
          : b // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ColorRspModel extends _ColorRspModel {
  _$_ColorRspModel(
      {required this.a, required this.r, required this.g, required this.b})
      : super._();

  factory _$_ColorRspModel.fromJson(Map<String, dynamic> json) =>
      _$$_ColorRspModelFromJson(json);

  @override
  final int? a;
  @override
  final int r;
  @override
  final int g;
  @override
  final int b;

  @override
  String toString() {
    return 'ColorRspModel(a: $a, r: $r, g: $g, b: $b)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ColorRspModel &&
            (identical(other.a, a) || other.a == a) &&
            (identical(other.r, r) || other.r == r) &&
            (identical(other.g, g) || other.g == g) &&
            (identical(other.b, b) || other.b == b));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, a, r, g, b);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ColorRspModelCopyWith<_$_ColorRspModel> get copyWith =>
      __$$_ColorRspModelCopyWithImpl<_$_ColorRspModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ColorRspModelToJson(
      this,
    );
  }
}

abstract class _ColorRspModel extends ColorRspModel {
  factory _ColorRspModel(
      {required final int? a,
      required final int r,
      required final int g,
      required final int b}) = _$_ColorRspModel;
  _ColorRspModel._() : super._();

  factory _ColorRspModel.fromJson(Map<String, dynamic> json) =
      _$_ColorRspModel.fromJson;

  @override
  int? get a;
  @override
  int get r;
  @override
  int get g;
  @override
  int get b;
  @override
  @JsonKey(ignore: true)
  _$$_ColorRspModelCopyWith<_$_ColorRspModel> get copyWith =>
      throw _privateConstructorUsedError;
}

TagRspModel _$TagRspModelFromJson(Map<String, dynamic> json) {
  return _TagRspModel.fromJson(json);
}

/// @nodoc
mixin _$TagRspModel {
  String get text => throw _privateConstructorUsedError;
  ColorRspModel get color => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TagRspModelCopyWith<TagRspModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagRspModelCopyWith<$Res> {
  factory $TagRspModelCopyWith(
          TagRspModel value, $Res Function(TagRspModel) then) =
      _$TagRspModelCopyWithImpl<$Res, TagRspModel>;
  @useResult
  $Res call({String text, ColorRspModel color, String category});

  $ColorRspModelCopyWith<$Res> get color;
}

/// @nodoc
class _$TagRspModelCopyWithImpl<$Res, $Val extends TagRspModel>
    implements $TagRspModelCopyWith<$Res> {
  _$TagRspModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? color = null,
    Object? category = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as ColorRspModel,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ColorRspModelCopyWith<$Res> get color {
    return $ColorRspModelCopyWith<$Res>(_value.color, (value) {
      return _then(_value.copyWith(color: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TagRspModelCopyWith<$Res>
    implements $TagRspModelCopyWith<$Res> {
  factory _$$_TagRspModelCopyWith(
          _$_TagRspModel value, $Res Function(_$_TagRspModel) then) =
      __$$_TagRspModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, ColorRspModel color, String category});

  @override
  $ColorRspModelCopyWith<$Res> get color;
}

/// @nodoc
class __$$_TagRspModelCopyWithImpl<$Res>
    extends _$TagRspModelCopyWithImpl<$Res, _$_TagRspModel>
    implements _$$_TagRspModelCopyWith<$Res> {
  __$$_TagRspModelCopyWithImpl(
      _$_TagRspModel _value, $Res Function(_$_TagRspModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? color = null,
    Object? category = null,
  }) {
    return _then(_$_TagRspModel(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as ColorRspModel,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TagRspModel extends _TagRspModel {
  _$_TagRspModel(
      {required this.text, required this.color, required this.category})
      : super._();

  factory _$_TagRspModel.fromJson(Map<String, dynamic> json) =>
      _$$_TagRspModelFromJson(json);

  @override
  final String text;
  @override
  final ColorRspModel color;
  @override
  final String category;

  @override
  String toString() {
    return 'TagRspModel(text: $text, color: $color, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TagRspModel &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text, color, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TagRspModelCopyWith<_$_TagRspModel> get copyWith =>
      __$$_TagRspModelCopyWithImpl<_$_TagRspModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TagRspModelToJson(
      this,
    );
  }
}

abstract class _TagRspModel extends TagRspModel {
  factory _TagRspModel(
      {required final String text,
      required final ColorRspModel color,
      required final String category}) = _$_TagRspModel;
  _TagRspModel._() : super._();

  factory _TagRspModel.fromJson(Map<String, dynamic> json) =
      _$_TagRspModel.fromJson;

  @override
  String get text;
  @override
  ColorRspModel get color;
  @override
  String get category;
  @override
  @JsonKey(ignore: true)
  _$$_TagRspModelCopyWith<_$_TagRspModel> get copyWith =>
      throw _privateConstructorUsedError;
}
