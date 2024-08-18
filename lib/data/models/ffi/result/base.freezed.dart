// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ImageResult _$ImageResultFromJson(Map<String, dynamic> json) {
  return _ImageResult.fromJson(json);
}

/// @nodoc
mixin _$ImageResult {
  String? get url => throw _privateConstructorUsedError;
  String? get cacheKey => throw _privateConstructorUsedError;
  double? get width => throw _privateConstructorUsedError;
  double? get height => throw _privateConstructorUsedError;
  double? get x => throw _privateConstructorUsedError;
  double? get y => throw _privateConstructorUsedError;

  /// Serializes this ImageResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ImageResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ImageResultCopyWith<ImageResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageResultCopyWith<$Res> {
  factory $ImageResultCopyWith(
          ImageResult value, $Res Function(ImageResult) then) =
      _$ImageResultCopyWithImpl<$Res, ImageResult>;
  @useResult
  $Res call(
      {String? url,
      String? cacheKey,
      double? width,
      double? height,
      double? x,
      double? y});
}

/// @nodoc
class _$ImageResultCopyWithImpl<$Res, $Val extends ImageResult>
    implements $ImageResultCopyWith<$Res> {
  _$ImageResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ImageResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? cacheKey = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? x = freezed,
    Object? y = freezed,
  }) {
    return _then(_value.copyWith(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      cacheKey: freezed == cacheKey
          ? _value.cacheKey
          : cacheKey // ignore: cast_nullable_to_non_nullable
              as String?,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      x: freezed == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double?,
      y: freezed == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageResultImplCopyWith<$Res>
    implements $ImageResultCopyWith<$Res> {
  factory _$$ImageResultImplCopyWith(
          _$ImageResultImpl value, $Res Function(_$ImageResultImpl) then) =
      __$$ImageResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? url,
      String? cacheKey,
      double? width,
      double? height,
      double? x,
      double? y});
}

/// @nodoc
class __$$ImageResultImplCopyWithImpl<$Res>
    extends _$ImageResultCopyWithImpl<$Res, _$ImageResultImpl>
    implements _$$ImageResultImplCopyWith<$Res> {
  __$$ImageResultImplCopyWithImpl(
      _$ImageResultImpl _value, $Res Function(_$ImageResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of ImageResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? cacheKey = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? x = freezed,
    Object? y = freezed,
  }) {
    return _then(_$ImageResultImpl(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      cacheKey: freezed == cacheKey
          ? _value.cacheKey
          : cacheKey // ignore: cast_nullable_to_non_nullable
              as String?,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      x: freezed == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double?,
      y: freezed == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageResultImpl with DiagnosticableTreeMixin implements _ImageResult {
  const _$ImageResultImpl(
      {this.url, this.cacheKey, this.width, this.height, this.x, this.y});

  factory _$ImageResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageResultImplFromJson(json);

  @override
  final String? url;
  @override
  final String? cacheKey;
  @override
  final double? width;
  @override
  final double? height;
  @override
  final double? x;
  @override
  final double? y;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ImageResult(url: $url, cacheKey: $cacheKey, width: $width, height: $height, x: $x, y: $y)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ImageResult'))
      ..add(DiagnosticsProperty('url', url))
      ..add(DiagnosticsProperty('cacheKey', cacheKey))
      ..add(DiagnosticsProperty('width', width))
      ..add(DiagnosticsProperty('height', height))
      ..add(DiagnosticsProperty('x', x))
      ..add(DiagnosticsProperty('y', y));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageResultImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.cacheKey, cacheKey) ||
                other.cacheKey == cacheKey) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, url, cacheKey, width, height, x, y);

  /// Create a copy of ImageResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageResultImplCopyWith<_$ImageResultImpl> get copyWith =>
      __$$ImageResultImplCopyWithImpl<_$ImageResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageResultImplToJson(
      this,
    );
  }
}

abstract class _ImageResult implements ImageResult {
  const factory _ImageResult(
      {final String? url,
      final String? cacheKey,
      final double? width,
      final double? height,
      final double? x,
      final double? y}) = _$ImageResultImpl;

  factory _ImageResult.fromJson(Map<String, dynamic> json) =
      _$ImageResultImpl.fromJson;

  @override
  String? get url;
  @override
  String? get cacheKey;
  @override
  double? get width;
  @override
  double? get height;
  @override
  double? get x;
  @override
  double? get y;

  /// Create a copy of ImageResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImageResultImplCopyWith<_$ImageResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CommentResult _$CommentResultFromJson(Map<String, dynamic> json) {
  return _CommentResult.fromJson(json);
}

/// @nodoc
mixin _$CommentResult {
  String? get username => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  String? get time => throw _privateConstructorUsedError;
  String? get score => throw _privateConstructorUsedError;
  ImageResult? get avatar => throw _privateConstructorUsedError;

  /// Serializes this CommentResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommentResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommentResultCopyWith<CommentResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentResultCopyWith<$Res> {
  factory $CommentResultCopyWith(
          CommentResult value, $Res Function(CommentResult) then) =
      _$CommentResultCopyWithImpl<$Res, CommentResult>;
  @useResult
  $Res call(
      {String? username,
      String? content,
      String? time,
      String? score,
      ImageResult? avatar});

  $ImageResultCopyWith<$Res>? get avatar;
}

/// @nodoc
class _$CommentResultCopyWithImpl<$Res, $Val extends CommentResult>
    implements $CommentResultCopyWith<$Res> {
  _$CommentResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommentResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = freezed,
    Object? content = freezed,
    Object? time = freezed,
    Object? score = freezed,
    Object? avatar = freezed,
  }) {
    return _then(_value.copyWith(
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as ImageResult?,
    ) as $Val);
  }

  /// Create a copy of CommentResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImageResultCopyWith<$Res>? get avatar {
    if (_value.avatar == null) {
      return null;
    }

    return $ImageResultCopyWith<$Res>(_value.avatar!, (value) {
      return _then(_value.copyWith(avatar: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CommentResultImplCopyWith<$Res>
    implements $CommentResultCopyWith<$Res> {
  factory _$$CommentResultImplCopyWith(
          _$CommentResultImpl value, $Res Function(_$CommentResultImpl) then) =
      __$$CommentResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? username,
      String? content,
      String? time,
      String? score,
      ImageResult? avatar});

  @override
  $ImageResultCopyWith<$Res>? get avatar;
}

/// @nodoc
class __$$CommentResultImplCopyWithImpl<$Res>
    extends _$CommentResultCopyWithImpl<$Res, _$CommentResultImpl>
    implements _$$CommentResultImplCopyWith<$Res> {
  __$$CommentResultImplCopyWithImpl(
      _$CommentResultImpl _value, $Res Function(_$CommentResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommentResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = freezed,
    Object? content = freezed,
    Object? time = freezed,
    Object? score = freezed,
    Object? avatar = freezed,
  }) {
    return _then(_$CommentResultImpl(
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as ImageResult?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentResultImpl
    with DiagnosticableTreeMixin
    implements _CommentResult {
  const _$CommentResultImpl(
      {this.username, this.content, this.time, this.score, this.avatar});

  factory _$CommentResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentResultImplFromJson(json);

  @override
  final String? username;
  @override
  final String? content;
  @override
  final String? time;
  @override
  final String? score;
  @override
  final ImageResult? avatar;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CommentResult(username: $username, content: $content, time: $time, score: $score, avatar: $avatar)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CommentResult'))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('time', time))
      ..add(DiagnosticsProperty('score', score))
      ..add(DiagnosticsProperty('avatar', avatar));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentResultImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, username, content, time, score, avatar);

  /// Create a copy of CommentResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentResultImplCopyWith<_$CommentResultImpl> get copyWith =>
      __$$CommentResultImplCopyWithImpl<_$CommentResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentResultImplToJson(
      this,
    );
  }
}

abstract class _CommentResult implements CommentResult {
  const factory _CommentResult(
      {final String? username,
      final String? content,
      final String? time,
      final String? score,
      final ImageResult? avatar}) = _$CommentResultImpl;

  factory _CommentResult.fromJson(Map<String, dynamic> json) =
      _$CommentResultImpl.fromJson;

  @override
  String? get username;
  @override
  String? get content;
  @override
  String? get time;
  @override
  String? get score;
  @override
  ImageResult? get avatar;

  /// Create a copy of CommentResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommentResultImplCopyWith<_$CommentResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TagResult _$TagResultFromJson(Map<String, dynamic> json) {
  return _TagResult.fromJson(json);
}

/// @nodoc
mixin _$TagResult {
  String? get text => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;

  /// Serializes this TagResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TagResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TagResultCopyWith<TagResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagResultCopyWith<$Res> {
  factory $TagResultCopyWith(TagResult value, $Res Function(TagResult) then) =
      _$TagResultCopyWithImpl<$Res, TagResult>;
  @useResult
  $Res call({String? text, String? color, String? category});
}

/// @nodoc
class _$TagResultCopyWithImpl<$Res, $Val extends TagResult>
    implements $TagResultCopyWith<$Res> {
  _$TagResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TagResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? color = freezed,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TagResultImplCopyWith<$Res>
    implements $TagResultCopyWith<$Res> {
  factory _$$TagResultImplCopyWith(
          _$TagResultImpl value, $Res Function(_$TagResultImpl) then) =
      __$$TagResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? text, String? color, String? category});
}

/// @nodoc
class __$$TagResultImplCopyWithImpl<$Res>
    extends _$TagResultCopyWithImpl<$Res, _$TagResultImpl>
    implements _$$TagResultImplCopyWith<$Res> {
  __$$TagResultImplCopyWithImpl(
      _$TagResultImpl _value, $Res Function(_$TagResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of TagResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? color = freezed,
    Object? category = freezed,
  }) {
    return _then(_$TagResultImpl(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TagResultImpl with DiagnosticableTreeMixin implements _TagResult {
  const _$TagResultImpl({this.text, this.color, this.category});

  factory _$TagResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$TagResultImplFromJson(json);

  @override
  final String? text;
  @override
  final String? color;
  @override
  final String? category;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TagResult(text: $text, color: $color, category: $category)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TagResult'))
      ..add(DiagnosticsProperty('text', text))
      ..add(DiagnosticsProperty('color', color))
      ..add(DiagnosticsProperty('category', category));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TagResultImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, text, color, category);

  /// Create a copy of TagResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TagResultImplCopyWith<_$TagResultImpl> get copyWith =>
      __$$TagResultImplCopyWithImpl<_$TagResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TagResultImplToJson(
      this,
    );
  }
}

abstract class _TagResult implements TagResult {
  const factory _TagResult(
      {final String? text,
      final String? color,
      final String? category}) = _$TagResultImpl;

  factory _TagResult.fromJson(Map<String, dynamic> json) =
      _$TagResultImpl.fromJson;

  @override
  String? get text;
  @override
  String? get color;
  @override
  String? get category;

  /// Create a copy of TagResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TagResultImplCopyWith<_$TagResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EnvResult _$EnvResultFromJson(Map<String, dynamic> json) {
  return _EnvResult.fromJson(json);
}

/// @nodoc
mixin _$EnvResult {
  String? get id => throw _privateConstructorUsedError;
  bool? get global => throw _privateConstructorUsedError;
  String? get value => throw _privateConstructorUsedError;

  /// Serializes this EnvResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EnvResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EnvResultCopyWith<EnvResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnvResultCopyWith<$Res> {
  factory $EnvResultCopyWith(EnvResult value, $Res Function(EnvResult) then) =
      _$EnvResultCopyWithImpl<$Res, EnvResult>;
  @useResult
  $Res call({String? id, bool? global, String? value});
}

/// @nodoc
class _$EnvResultCopyWithImpl<$Res, $Val extends EnvResult>
    implements $EnvResultCopyWith<$Res> {
  _$EnvResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EnvResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? global = freezed,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      global: freezed == global
          ? _value.global
          : global // ignore: cast_nullable_to_non_nullable
              as bool?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EnvResultImplCopyWith<$Res>
    implements $EnvResultCopyWith<$Res> {
  factory _$$EnvResultImplCopyWith(
          _$EnvResultImpl value, $Res Function(_$EnvResultImpl) then) =
      __$$EnvResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, bool? global, String? value});
}

/// @nodoc
class __$$EnvResultImplCopyWithImpl<$Res>
    extends _$EnvResultCopyWithImpl<$Res, _$EnvResultImpl>
    implements _$$EnvResultImplCopyWith<$Res> {
  __$$EnvResultImplCopyWithImpl(
      _$EnvResultImpl _value, $Res Function(_$EnvResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of EnvResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? global = freezed,
    Object? value = freezed,
  }) {
    return _then(_$EnvResultImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      global: freezed == global
          ? _value.global
          : global // ignore: cast_nullable_to_non_nullable
              as bool?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EnvResultImpl with DiagnosticableTreeMixin implements _EnvResult {
  const _$EnvResultImpl({this.id, this.global, this.value});

  factory _$EnvResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$EnvResultImplFromJson(json);

  @override
  final String? id;
  @override
  final bool? global;
  @override
  final String? value;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EnvResult(id: $id, global: $global, value: $value)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EnvResult'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('global', global))
      ..add(DiagnosticsProperty('value', value));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnvResultImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.global, global) || other.global == global) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, global, value);

  /// Create a copy of EnvResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EnvResultImplCopyWith<_$EnvResultImpl> get copyWith =>
      __$$EnvResultImplCopyWithImpl<_$EnvResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EnvResultImplToJson(
      this,
    );
  }
}

abstract class _EnvResult implements EnvResult {
  const factory _EnvResult(
      {final String? id,
      final bool? global,
      final String? value}) = _$EnvResultImpl;

  factory _EnvResult.fromJson(Map<String, dynamic> json) =
      _$EnvResultImpl.fromJson;

  @override
  String? get id;
  @override
  bool? get global;
  @override
  String? get value;

  /// Create a copy of EnvResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EnvResultImplCopyWith<_$EnvResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ParserError _$ParserErrorFromJson(Map<String, dynamic> json) {
  return _ParserError.fromJson(json);
}

/// @nodoc
mixin _$ParserError {
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  /// Serializes this ParserError to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ParserError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ParserErrorCopyWith<ParserError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParserErrorCopyWith<$Res> {
  factory $ParserErrorCopyWith(
          ParserError value, $Res Function(ParserError) then) =
      _$ParserErrorCopyWithImpl<$Res, ParserError>;
  @useResult
  $Res call({int code, String message});
}

/// @nodoc
class _$ParserErrorCopyWithImpl<$Res, $Val extends ParserError>
    implements $ParserErrorCopyWith<$Res> {
  _$ParserErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ParserError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ParserErrorImplCopyWith<$Res>
    implements $ParserErrorCopyWith<$Res> {
  factory _$$ParserErrorImplCopyWith(
          _$ParserErrorImpl value, $Res Function(_$ParserErrorImpl) then) =
      __$$ParserErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int code, String message});
}

/// @nodoc
class __$$ParserErrorImplCopyWithImpl<$Res>
    extends _$ParserErrorCopyWithImpl<$Res, _$ParserErrorImpl>
    implements _$$ParserErrorImplCopyWith<$Res> {
  __$$ParserErrorImplCopyWithImpl(
      _$ParserErrorImpl _value, $Res Function(_$ParserErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ParserError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
  }) {
    return _then(_$ParserErrorImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ParserErrorImpl with DiagnosticableTreeMixin implements _ParserError {
  const _$ParserErrorImpl({required this.code, required this.message});

  factory _$ParserErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$ParserErrorImplFromJson(json);

  @override
  final int code;
  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ParserError(code: $code, message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ParserError'))
      ..add(DiagnosticsProperty('code', code))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParserErrorImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, message);

  /// Create a copy of ParserError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParserErrorImplCopyWith<_$ParserErrorImpl> get copyWith =>
      __$$ParserErrorImplCopyWithImpl<_$ParserErrorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ParserErrorImplToJson(
      this,
    );
  }
}

abstract class _ParserError implements ParserError {
  const factory _ParserError(
      {required final int code,
      required final String message}) = _$ParserErrorImpl;

  factory _ParserError.fromJson(Map<String, dynamic> json) =
      _$ParserErrorImpl.fromJson;

  @override
  int get code;
  @override
  String get message;

  /// Create a copy of ParserError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParserErrorImplCopyWith<_$ParserErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
