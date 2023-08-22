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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
abstract class _$$_ImageResultCopyWith<$Res>
    implements $ImageResultCopyWith<$Res> {
  factory _$$_ImageResultCopyWith(
          _$_ImageResult value, $Res Function(_$_ImageResult) then) =
      __$$_ImageResultCopyWithImpl<$Res>;
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
class __$$_ImageResultCopyWithImpl<$Res>
    extends _$ImageResultCopyWithImpl<$Res, _$_ImageResult>
    implements _$$_ImageResultCopyWith<$Res> {
  __$$_ImageResultCopyWithImpl(
      _$_ImageResult _value, $Res Function(_$_ImageResult) _then)
      : super(_value, _then);

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
    return _then(_$_ImageResult(
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
class _$_ImageResult with DiagnosticableTreeMixin implements _ImageResult {
  const _$_ImageResult(
      {this.url, this.cacheKey, this.width, this.height, this.x, this.y});

  factory _$_ImageResult.fromJson(Map<String, dynamic> json) =>
      _$$_ImageResultFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImageResult &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.cacheKey, cacheKey) ||
                other.cacheKey == cacheKey) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, url, cacheKey, width, height, x, y);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ImageResultCopyWith<_$_ImageResult> get copyWith =>
      __$$_ImageResultCopyWithImpl<_$_ImageResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ImageResultToJson(
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
      final double? y}) = _$_ImageResult;

  factory _ImageResult.fromJson(Map<String, dynamic> json) =
      _$_ImageResult.fromJson;

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
  @override
  @JsonKey(ignore: true)
  _$$_ImageResultCopyWith<_$_ImageResult> get copyWith =>
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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
abstract class _$$_CommentResultCopyWith<$Res>
    implements $CommentResultCopyWith<$Res> {
  factory _$$_CommentResultCopyWith(
          _$_CommentResult value, $Res Function(_$_CommentResult) then) =
      __$$_CommentResultCopyWithImpl<$Res>;
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
class __$$_CommentResultCopyWithImpl<$Res>
    extends _$CommentResultCopyWithImpl<$Res, _$_CommentResult>
    implements _$$_CommentResultCopyWith<$Res> {
  __$$_CommentResultCopyWithImpl(
      _$_CommentResult _value, $Res Function(_$_CommentResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = freezed,
    Object? content = freezed,
    Object? time = freezed,
    Object? score = freezed,
    Object? avatar = freezed,
  }) {
    return _then(_$_CommentResult(
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
class _$_CommentResult with DiagnosticableTreeMixin implements _CommentResult {
  const _$_CommentResult(
      {this.username, this.content, this.time, this.score, this.avatar});

  factory _$_CommentResult.fromJson(Map<String, dynamic> json) =>
      _$$_CommentResultFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommentResult &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, username, content, time, score, avatar);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CommentResultCopyWith<_$_CommentResult> get copyWith =>
      __$$_CommentResultCopyWithImpl<_$_CommentResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommentResultToJson(
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
      final ImageResult? avatar}) = _$_CommentResult;

  factory _CommentResult.fromJson(Map<String, dynamic> json) =
      _$_CommentResult.fromJson;

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
  @override
  @JsonKey(ignore: true)
  _$$_CommentResultCopyWith<_$_CommentResult> get copyWith =>
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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
abstract class _$$_TagResultCopyWith<$Res> implements $TagResultCopyWith<$Res> {
  factory _$$_TagResultCopyWith(
          _$_TagResult value, $Res Function(_$_TagResult) then) =
      __$$_TagResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? text, String? color, String? category});
}

/// @nodoc
class __$$_TagResultCopyWithImpl<$Res>
    extends _$TagResultCopyWithImpl<$Res, _$_TagResult>
    implements _$$_TagResultCopyWith<$Res> {
  __$$_TagResultCopyWithImpl(
      _$_TagResult _value, $Res Function(_$_TagResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? color = freezed,
    Object? category = freezed,
  }) {
    return _then(_$_TagResult(
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
class _$_TagResult with DiagnosticableTreeMixin implements _TagResult {
  const _$_TagResult({this.text, this.color, this.category});

  factory _$_TagResult.fromJson(Map<String, dynamic> json) =>
      _$$_TagResultFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TagResult &&
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
  _$$_TagResultCopyWith<_$_TagResult> get copyWith =>
      __$$_TagResultCopyWithImpl<_$_TagResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TagResultToJson(
      this,
    );
  }
}

abstract class _TagResult implements TagResult {
  const factory _TagResult(
      {final String? text,
      final String? color,
      final String? category}) = _$_TagResult;

  factory _TagResult.fromJson(Map<String, dynamic> json) =
      _$_TagResult.fromJson;

  @override
  String? get text;
  @override
  String? get color;
  @override
  String? get category;
  @override
  @JsonKey(ignore: true)
  _$$_TagResultCopyWith<_$_TagResult> get copyWith =>
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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
abstract class _$$_EnvResultCopyWith<$Res> implements $EnvResultCopyWith<$Res> {
  factory _$$_EnvResultCopyWith(
          _$_EnvResult value, $Res Function(_$_EnvResult) then) =
      __$$_EnvResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, bool? global, String? value});
}

/// @nodoc
class __$$_EnvResultCopyWithImpl<$Res>
    extends _$EnvResultCopyWithImpl<$Res, _$_EnvResult>
    implements _$$_EnvResultCopyWith<$Res> {
  __$$_EnvResultCopyWithImpl(
      _$_EnvResult _value, $Res Function(_$_EnvResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? global = freezed,
    Object? value = freezed,
  }) {
    return _then(_$_EnvResult(
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
class _$_EnvResult with DiagnosticableTreeMixin implements _EnvResult {
  const _$_EnvResult({this.id, this.global, this.value});

  factory _$_EnvResult.fromJson(Map<String, dynamic> json) =>
      _$$_EnvResultFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EnvResult &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.global, global) || other.global == global) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, global, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EnvResultCopyWith<_$_EnvResult> get copyWith =>
      __$$_EnvResultCopyWithImpl<_$_EnvResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EnvResultToJson(
      this,
    );
  }
}

abstract class _EnvResult implements EnvResult {
  const factory _EnvResult(
      {final String? id,
      final bool? global,
      final String? value}) = _$_EnvResult;

  factory _EnvResult.fromJson(Map<String, dynamic> json) =
      _$_EnvResult.fromJson;

  @override
  String? get id;
  @override
  bool? get global;
  @override
  String? get value;
  @override
  @JsonKey(ignore: true)
  _$$_EnvResultCopyWith<_$_EnvResult> get copyWith =>
      throw _privateConstructorUsedError;
}

ParserError _$ParserErrorFromJson(Map<String, dynamic> json) {
  return _ParserError.fromJson(json);
}

/// @nodoc
mixin _$ParserError {
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
abstract class _$$_ParserErrorCopyWith<$Res>
    implements $ParserErrorCopyWith<$Res> {
  factory _$$_ParserErrorCopyWith(
          _$_ParserError value, $Res Function(_$_ParserError) then) =
      __$$_ParserErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int code, String message});
}

/// @nodoc
class __$$_ParserErrorCopyWithImpl<$Res>
    extends _$ParserErrorCopyWithImpl<$Res, _$_ParserError>
    implements _$$_ParserErrorCopyWith<$Res> {
  __$$_ParserErrorCopyWithImpl(
      _$_ParserError _value, $Res Function(_$_ParserError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
  }) {
    return _then(_$_ParserError(
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
class _$_ParserError with DiagnosticableTreeMixin implements _ParserError {
  const _$_ParserError({required this.code, required this.message});

  factory _$_ParserError.fromJson(Map<String, dynamic> json) =>
      _$$_ParserErrorFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ParserError &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ParserErrorCopyWith<_$_ParserError> get copyWith =>
      __$$_ParserErrorCopyWithImpl<_$_ParserError>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ParserErrorToJson(
      this,
    );
  }
}

abstract class _ParserError implements ParserError {
  const factory _ParserError(
      {required final int code,
      required final String message}) = _$_ParserError;

  factory _ParserError.fromJson(Map<String, dynamic> json) =
      _$_ParserError.fromJson;

  @override
  int get code;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_ParserErrorCopyWith<_$_ParserError> get copyWith =>
      throw _privateConstructorUsedError;
}
