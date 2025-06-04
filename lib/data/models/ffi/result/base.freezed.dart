// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ImageResult implements DiagnosticableTreeMixin {
  String? get url;
  String? get cacheKey;
  double? get width;
  double? get height;
  double? get x;
  double? get y;

  /// Create a copy of ImageResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ImageResultCopyWith<ImageResult> get copyWith =>
      _$ImageResultCopyWithImpl<ImageResult>(this as ImageResult, _$identity);

  /// Serializes this ImageResult to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
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
            other is ImageResult &&
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

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ImageResult(url: $url, cacheKey: $cacheKey, width: $width, height: $height, x: $x, y: $y)';
  }
}

/// @nodoc
abstract mixin class $ImageResultCopyWith<$Res> {
  factory $ImageResultCopyWith(
          ImageResult value, $Res Function(ImageResult) _then) =
      _$ImageResultCopyWithImpl;
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
class _$ImageResultCopyWithImpl<$Res> implements $ImageResultCopyWith<$Res> {
  _$ImageResultCopyWithImpl(this._self, this._then);

  final ImageResult _self;
  final $Res Function(ImageResult) _then;

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
    return _then(_self.copyWith(
      url: freezed == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      cacheKey: freezed == cacheKey
          ? _self.cacheKey
          : cacheKey // ignore: cast_nullable_to_non_nullable
              as String?,
      width: freezed == width
          ? _self.width
          : width // ignore: cast_nullable_to_non_nullable
              as double?,
      height: freezed == height
          ? _self.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      x: freezed == x
          ? _self.x
          : x // ignore: cast_nullable_to_non_nullable
              as double?,
      y: freezed == y
          ? _self.y
          : y // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ImageResult with DiagnosticableTreeMixin implements ImageResult {
  const _ImageResult(
      {this.url, this.cacheKey, this.width, this.height, this.x, this.y});
  factory _ImageResult.fromJson(Map<String, dynamic> json) =>
      _$ImageResultFromJson(json);

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

  /// Create a copy of ImageResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ImageResultCopyWith<_ImageResult> get copyWith =>
      __$ImageResultCopyWithImpl<_ImageResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ImageResultToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
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
            other is _ImageResult &&
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

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ImageResult(url: $url, cacheKey: $cacheKey, width: $width, height: $height, x: $x, y: $y)';
  }
}

/// @nodoc
abstract mixin class _$ImageResultCopyWith<$Res>
    implements $ImageResultCopyWith<$Res> {
  factory _$ImageResultCopyWith(
          _ImageResult value, $Res Function(_ImageResult) _then) =
      __$ImageResultCopyWithImpl;
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
class __$ImageResultCopyWithImpl<$Res> implements _$ImageResultCopyWith<$Res> {
  __$ImageResultCopyWithImpl(this._self, this._then);

  final _ImageResult _self;
  final $Res Function(_ImageResult) _then;

  /// Create a copy of ImageResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? url = freezed,
    Object? cacheKey = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? x = freezed,
    Object? y = freezed,
  }) {
    return _then(_ImageResult(
      url: freezed == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      cacheKey: freezed == cacheKey
          ? _self.cacheKey
          : cacheKey // ignore: cast_nullable_to_non_nullable
              as String?,
      width: freezed == width
          ? _self.width
          : width // ignore: cast_nullable_to_non_nullable
              as double?,
      height: freezed == height
          ? _self.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      x: freezed == x
          ? _self.x
          : x // ignore: cast_nullable_to_non_nullable
              as double?,
      y: freezed == y
          ? _self.y
          : y // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
mixin _$CommentResult implements DiagnosticableTreeMixin {
  String? get username;
  String? get content;
  String? get time;
  String? get score;
  ImageResult? get avatar;

  /// Create a copy of CommentResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CommentResultCopyWith<CommentResult> get copyWith =>
      _$CommentResultCopyWithImpl<CommentResult>(
          this as CommentResult, _$identity);

  /// Serializes this CommentResult to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
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
            other is CommentResult &&
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

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CommentResult(username: $username, content: $content, time: $time, score: $score, avatar: $avatar)';
  }
}

/// @nodoc
abstract mixin class $CommentResultCopyWith<$Res> {
  factory $CommentResultCopyWith(
          CommentResult value, $Res Function(CommentResult) _then) =
      _$CommentResultCopyWithImpl;
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
class _$CommentResultCopyWithImpl<$Res>
    implements $CommentResultCopyWith<$Res> {
  _$CommentResultCopyWithImpl(this._self, this._then);

  final CommentResult _self;
  final $Res Function(CommentResult) _then;

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
    return _then(_self.copyWith(
      username: freezed == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _self.score
          : score // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _self.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as ImageResult?,
    ));
  }

  /// Create a copy of CommentResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImageResultCopyWith<$Res>? get avatar {
    if (_self.avatar == null) {
      return null;
    }

    return $ImageResultCopyWith<$Res>(_self.avatar!, (value) {
      return _then(_self.copyWith(avatar: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _CommentResult with DiagnosticableTreeMixin implements CommentResult {
  const _CommentResult(
      {this.username, this.content, this.time, this.score, this.avatar});
  factory _CommentResult.fromJson(Map<String, dynamic> json) =>
      _$CommentResultFromJson(json);

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

  /// Create a copy of CommentResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CommentResultCopyWith<_CommentResult> get copyWith =>
      __$CommentResultCopyWithImpl<_CommentResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CommentResultToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
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
            other is _CommentResult &&
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

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CommentResult(username: $username, content: $content, time: $time, score: $score, avatar: $avatar)';
  }
}

/// @nodoc
abstract mixin class _$CommentResultCopyWith<$Res>
    implements $CommentResultCopyWith<$Res> {
  factory _$CommentResultCopyWith(
          _CommentResult value, $Res Function(_CommentResult) _then) =
      __$CommentResultCopyWithImpl;
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
class __$CommentResultCopyWithImpl<$Res>
    implements _$CommentResultCopyWith<$Res> {
  __$CommentResultCopyWithImpl(this._self, this._then);

  final _CommentResult _self;
  final $Res Function(_CommentResult) _then;

  /// Create a copy of CommentResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? username = freezed,
    Object? content = freezed,
    Object? time = freezed,
    Object? score = freezed,
    Object? avatar = freezed,
  }) {
    return _then(_CommentResult(
      username: freezed == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _self.score
          : score // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _self.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as ImageResult?,
    ));
  }

  /// Create a copy of CommentResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImageResultCopyWith<$Res>? get avatar {
    if (_self.avatar == null) {
      return null;
    }

    return $ImageResultCopyWith<$Res>(_self.avatar!, (value) {
      return _then(_self.copyWith(avatar: value));
    });
  }
}

/// @nodoc
mixin _$TagResult implements DiagnosticableTreeMixin {
  String? get text;
  String? get color;
  String? get category;

  /// Create a copy of TagResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TagResultCopyWith<TagResult> get copyWith =>
      _$TagResultCopyWithImpl<TagResult>(this as TagResult, _$identity);

  /// Serializes this TagResult to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
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
            other is TagResult &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, text, color, category);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TagResult(text: $text, color: $color, category: $category)';
  }
}

/// @nodoc
abstract mixin class $TagResultCopyWith<$Res> {
  factory $TagResultCopyWith(TagResult value, $Res Function(TagResult) _then) =
      _$TagResultCopyWithImpl;
  @useResult
  $Res call({String? text, String? color, String? category});
}

/// @nodoc
class _$TagResultCopyWithImpl<$Res> implements $TagResultCopyWith<$Res> {
  _$TagResultCopyWithImpl(this._self, this._then);

  final TagResult _self;
  final $Res Function(TagResult) _then;

  /// Create a copy of TagResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? color = freezed,
    Object? category = freezed,
  }) {
    return _then(_self.copyWith(
      text: freezed == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _self.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _TagResult with DiagnosticableTreeMixin implements TagResult {
  const _TagResult({this.text, this.color, this.category});
  factory _TagResult.fromJson(Map<String, dynamic> json) =>
      _$TagResultFromJson(json);

  @override
  final String? text;
  @override
  final String? color;
  @override
  final String? category;

  /// Create a copy of TagResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TagResultCopyWith<_TagResult> get copyWith =>
      __$TagResultCopyWithImpl<_TagResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TagResultToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
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
            other is _TagResult &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, text, color, category);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TagResult(text: $text, color: $color, category: $category)';
  }
}

/// @nodoc
abstract mixin class _$TagResultCopyWith<$Res>
    implements $TagResultCopyWith<$Res> {
  factory _$TagResultCopyWith(
          _TagResult value, $Res Function(_TagResult) _then) =
      __$TagResultCopyWithImpl;
  @override
  @useResult
  $Res call({String? text, String? color, String? category});
}

/// @nodoc
class __$TagResultCopyWithImpl<$Res> implements _$TagResultCopyWith<$Res> {
  __$TagResultCopyWithImpl(this._self, this._then);

  final _TagResult _self;
  final $Res Function(_TagResult) _then;

  /// Create a copy of TagResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? text = freezed,
    Object? color = freezed,
    Object? category = freezed,
  }) {
    return _then(_TagResult(
      text: freezed == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _self.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$EnvResult implements DiagnosticableTreeMixin {
  String? get id;
  bool? get global;
  String? get value;

  /// Create a copy of EnvResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EnvResultCopyWith<EnvResult> get copyWith =>
      _$EnvResultCopyWithImpl<EnvResult>(this as EnvResult, _$identity);

  /// Serializes this EnvResult to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
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
            other is EnvResult &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.global, global) || other.global == global) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, global, value);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EnvResult(id: $id, global: $global, value: $value)';
  }
}

/// @nodoc
abstract mixin class $EnvResultCopyWith<$Res> {
  factory $EnvResultCopyWith(EnvResult value, $Res Function(EnvResult) _then) =
      _$EnvResultCopyWithImpl;
  @useResult
  $Res call({String? id, bool? global, String? value});
}

/// @nodoc
class _$EnvResultCopyWithImpl<$Res> implements $EnvResultCopyWith<$Res> {
  _$EnvResultCopyWithImpl(this._self, this._then);

  final EnvResult _self;
  final $Res Function(EnvResult) _then;

  /// Create a copy of EnvResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? global = freezed,
    Object? value = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      global: freezed == global
          ? _self.global
          : global // ignore: cast_nullable_to_non_nullable
              as bool?,
      value: freezed == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _EnvResult with DiagnosticableTreeMixin implements EnvResult {
  const _EnvResult({this.id, this.global, this.value});
  factory _EnvResult.fromJson(Map<String, dynamic> json) =>
      _$EnvResultFromJson(json);

  @override
  final String? id;
  @override
  final bool? global;
  @override
  final String? value;

  /// Create a copy of EnvResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EnvResultCopyWith<_EnvResult> get copyWith =>
      __$EnvResultCopyWithImpl<_EnvResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EnvResultToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
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
            other is _EnvResult &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.global, global) || other.global == global) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, global, value);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EnvResult(id: $id, global: $global, value: $value)';
  }
}

/// @nodoc
abstract mixin class _$EnvResultCopyWith<$Res>
    implements $EnvResultCopyWith<$Res> {
  factory _$EnvResultCopyWith(
          _EnvResult value, $Res Function(_EnvResult) _then) =
      __$EnvResultCopyWithImpl;
  @override
  @useResult
  $Res call({String? id, bool? global, String? value});
}

/// @nodoc
class __$EnvResultCopyWithImpl<$Res> implements _$EnvResultCopyWith<$Res> {
  __$EnvResultCopyWithImpl(this._self, this._then);

  final _EnvResult _self;
  final $Res Function(_EnvResult) _then;

  /// Create a copy of EnvResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? global = freezed,
    Object? value = freezed,
  }) {
    return _then(_EnvResult(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      global: freezed == global
          ? _self.global
          : global // ignore: cast_nullable_to_non_nullable
              as bool?,
      value: freezed == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$ParserError implements DiagnosticableTreeMixin {
  int get code;
  String get message;

  /// Create a copy of ParserError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ParserErrorCopyWith<ParserError> get copyWith =>
      _$ParserErrorCopyWithImpl<ParserError>(this as ParserError, _$identity);

  /// Serializes this ParserError to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ParserError'))
      ..add(DiagnosticsProperty('code', code))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ParserError &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, message);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ParserError(code: $code, message: $message)';
  }
}

/// @nodoc
abstract mixin class $ParserErrorCopyWith<$Res> {
  factory $ParserErrorCopyWith(
          ParserError value, $Res Function(ParserError) _then) =
      _$ParserErrorCopyWithImpl;
  @useResult
  $Res call({int code, String message});
}

/// @nodoc
class _$ParserErrorCopyWithImpl<$Res> implements $ParserErrorCopyWith<$Res> {
  _$ParserErrorCopyWithImpl(this._self, this._then);

  final ParserError _self;
  final $Res Function(ParserError) _then;

  /// Create a copy of ParserError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
  }) {
    return _then(_self.copyWith(
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ParserError with DiagnosticableTreeMixin implements ParserError {
  const _ParserError({required this.code, required this.message});
  factory _ParserError.fromJson(Map<String, dynamic> json) =>
      _$ParserErrorFromJson(json);

  @override
  final int code;
  @override
  final String message;

  /// Create a copy of ParserError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ParserErrorCopyWith<_ParserError> get copyWith =>
      __$ParserErrorCopyWithImpl<_ParserError>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ParserErrorToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ParserError'))
      ..add(DiagnosticsProperty('code', code))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ParserError &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, message);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ParserError(code: $code, message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ParserErrorCopyWith<$Res>
    implements $ParserErrorCopyWith<$Res> {
  factory _$ParserErrorCopyWith(
          _ParserError value, $Res Function(_ParserError) _then) =
      __$ParserErrorCopyWithImpl;
  @override
  @useResult
  $Res call({int code, String message});
}

/// @nodoc
class __$ParserErrorCopyWithImpl<$Res> implements _$ParserErrorCopyWith<$Res> {
  __$ParserErrorCopyWithImpl(this._self, this._then);

  final _ParserError _self;
  final $Res Function(_ParserError) _then;

  /// Create a copy of ParserError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? code = null,
    Object? message = null,
  }) {
    return _then(_ParserError(
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
