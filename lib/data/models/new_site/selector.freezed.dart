// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selector.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SelectorModel _$SelectorModelFromJson(Map<String, dynamic> json) {
  return _SelectorModel.fromJson(json);
}

/// @nodoc
mixin _$SelectorModel {
  String get selector => throw _privateConstructorUsedError;
  SelectorType get type => throw _privateConstructorUsedError;
  SelectorFunctionType get function => throw _privateConstructorUsedError;
  String get param => throw _privateConstructorUsedError;
  String get regex => throw _privateConstructorUsedError;
  String get replace => throw _privateConstructorUsedError;
  ScriptField get script => throw _privateConstructorUsedError;
  String get defaultValue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SelectorModelCopyWith<SelectorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectorModelCopyWith<$Res> {
  factory $SelectorModelCopyWith(
          SelectorModel value, $Res Function(SelectorModel) then) =
      _$SelectorModelCopyWithImpl<$Res, SelectorModel>;
  @useResult
  $Res call(
      {String selector,
      SelectorType type,
      SelectorFunctionType function,
      String param,
      String regex,
      String replace,
      ScriptField script,
      String defaultValue});

  $ScriptFieldCopyWith<$Res> get script;
}

/// @nodoc
class _$SelectorModelCopyWithImpl<$Res, $Val extends SelectorModel>
    implements $SelectorModelCopyWith<$Res> {
  _$SelectorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selector = null,
    Object? type = null,
    Object? function = null,
    Object? param = null,
    Object? regex = null,
    Object? replace = null,
    Object? script = null,
    Object? defaultValue = null,
  }) {
    return _then(_value.copyWith(
      selector: null == selector
          ? _value.selector
          : selector // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SelectorType,
      function: null == function
          ? _value.function
          : function // ignore: cast_nullable_to_non_nullable
              as SelectorFunctionType,
      param: null == param
          ? _value.param
          : param // ignore: cast_nullable_to_non_nullable
              as String,
      regex: null == regex
          ? _value.regex
          : regex // ignore: cast_nullable_to_non_nullable
              as String,
      replace: null == replace
          ? _value.replace
          : replace // ignore: cast_nullable_to_non_nullable
              as String,
      script: null == script
          ? _value.script
          : script // ignore: cast_nullable_to_non_nullable
              as ScriptField,
      defaultValue: null == defaultValue
          ? _value.defaultValue
          : defaultValue // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ScriptFieldCopyWith<$Res> get script {
    return $ScriptFieldCopyWith<$Res>(_value.script, (value) {
      return _then(_value.copyWith(script: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SelectorModelImplCopyWith<$Res>
    implements $SelectorModelCopyWith<$Res> {
  factory _$$SelectorModelImplCopyWith(
          _$SelectorModelImpl value, $Res Function(_$SelectorModelImpl) then) =
      __$$SelectorModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String selector,
      SelectorType type,
      SelectorFunctionType function,
      String param,
      String regex,
      String replace,
      ScriptField script,
      String defaultValue});

  @override
  $ScriptFieldCopyWith<$Res> get script;
}

/// @nodoc
class __$$SelectorModelImplCopyWithImpl<$Res>
    extends _$SelectorModelCopyWithImpl<$Res, _$SelectorModelImpl>
    implements _$$SelectorModelImplCopyWith<$Res> {
  __$$SelectorModelImplCopyWithImpl(
      _$SelectorModelImpl _value, $Res Function(_$SelectorModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selector = null,
    Object? type = null,
    Object? function = null,
    Object? param = null,
    Object? regex = null,
    Object? replace = null,
    Object? script = null,
    Object? defaultValue = null,
  }) {
    return _then(_$SelectorModelImpl(
      selector: null == selector
          ? _value.selector
          : selector // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SelectorType,
      function: null == function
          ? _value.function
          : function // ignore: cast_nullable_to_non_nullable
              as SelectorFunctionType,
      param: null == param
          ? _value.param
          : param // ignore: cast_nullable_to_non_nullable
              as String,
      regex: null == regex
          ? _value.regex
          : regex // ignore: cast_nullable_to_non_nullable
              as String,
      replace: null == replace
          ? _value.replace
          : replace // ignore: cast_nullable_to_non_nullable
              as String,
      script: null == script
          ? _value.script
          : script // ignore: cast_nullable_to_non_nullable
              as ScriptField,
      defaultValue: null == defaultValue
          ? _value.defaultValue
          : defaultValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SelectorModelImpl implements _SelectorModel {
  const _$SelectorModelImpl(
      {this.selector = '',
      this.type = SelectorType.css,
      this.function = SelectorFunctionType.text,
      this.param = '',
      this.regex = '',
      this.replace = '',
      this.script = const ScriptField(),
      this.defaultValue = ''});

  factory _$SelectorModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SelectorModelImplFromJson(json);

  @override
  @JsonKey()
  final String selector;
  @override
  @JsonKey()
  final SelectorType type;
  @override
  @JsonKey()
  final SelectorFunctionType function;
  @override
  @JsonKey()
  final String param;
  @override
  @JsonKey()
  final String regex;
  @override
  @JsonKey()
  final String replace;
  @override
  @JsonKey()
  final ScriptField script;
  @override
  @JsonKey()
  final String defaultValue;

  @override
  String toString() {
    return 'SelectorModel(selector: $selector, type: $type, function: $function, param: $param, regex: $regex, replace: $replace, script: $script, defaultValue: $defaultValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectorModelImpl &&
            (identical(other.selector, selector) ||
                other.selector == selector) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.function, function) ||
                other.function == function) &&
            (identical(other.param, param) || other.param == param) &&
            (identical(other.regex, regex) || other.regex == regex) &&
            (identical(other.replace, replace) || other.replace == replace) &&
            (identical(other.script, script) || other.script == script) &&
            (identical(other.defaultValue, defaultValue) ||
                other.defaultValue == defaultValue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, selector, type, function, param,
      regex, replace, script, defaultValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectorModelImplCopyWith<_$SelectorModelImpl> get copyWith =>
      __$$SelectorModelImplCopyWithImpl<_$SelectorModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SelectorModelImplToJson(
      this,
    );
  }
}

abstract class _SelectorModel implements SelectorModel {
  const factory _SelectorModel(
      {final String selector,
      final SelectorType type,
      final SelectorFunctionType function,
      final String param,
      final String regex,
      final String replace,
      final ScriptField script,
      final String defaultValue}) = _$SelectorModelImpl;

  factory _SelectorModel.fromJson(Map<String, dynamic> json) =
      _$SelectorModelImpl.fromJson;

  @override
  String get selector;
  @override
  SelectorType get type;
  @override
  SelectorFunctionType get function;
  @override
  String get param;
  @override
  String get regex;
  @override
  String get replace;
  @override
  ScriptField get script;
  @override
  String get defaultValue;
  @override
  @JsonKey(ignore: true)
  _$$SelectorModelImplCopyWith<_$SelectorModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ImageSelectorModel _$ImageSelectorModelFromJson(Map<String, dynamic> json) {
  return _ImageSelectorModel.fromJson(json);
}

/// @nodoc
mixin _$ImageSelectorModel {
  SelectorModel get url => throw _privateConstructorUsedError;
  SelectorModel get width => throw _privateConstructorUsedError;
  SelectorModel get height => throw _privateConstructorUsedError;
  SelectorModel get x => throw _privateConstructorUsedError;
  SelectorModel get y => throw _privateConstructorUsedError;
  SelectorModel get cacheKey => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageSelectorModelCopyWith<ImageSelectorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageSelectorModelCopyWith<$Res> {
  factory $ImageSelectorModelCopyWith(
          ImageSelectorModel value, $Res Function(ImageSelectorModel) then) =
      _$ImageSelectorModelCopyWithImpl<$Res, ImageSelectorModel>;
  @useResult
  $Res call(
      {SelectorModel url,
      SelectorModel width,
      SelectorModel height,
      SelectorModel x,
      SelectorModel y,
      SelectorModel cacheKey});

  $SelectorModelCopyWith<$Res> get url;
  $SelectorModelCopyWith<$Res> get width;
  $SelectorModelCopyWith<$Res> get height;
  $SelectorModelCopyWith<$Res> get x;
  $SelectorModelCopyWith<$Res> get y;
  $SelectorModelCopyWith<$Res> get cacheKey;
}

/// @nodoc
class _$ImageSelectorModelCopyWithImpl<$Res, $Val extends ImageSelectorModel>
    implements $ImageSelectorModelCopyWith<$Res> {
  _$ImageSelectorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? width = null,
    Object? height = null,
    Object? x = null,
    Object? y = null,
    Object? cacheKey = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      cacheKey: null == cacheKey
          ? _value.cacheKey
          : cacheKey // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get url {
    return $SelectorModelCopyWith<$Res>(_value.url, (value) {
      return _then(_value.copyWith(url: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get width {
    return $SelectorModelCopyWith<$Res>(_value.width, (value) {
      return _then(_value.copyWith(width: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get height {
    return $SelectorModelCopyWith<$Res>(_value.height, (value) {
      return _then(_value.copyWith(height: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get x {
    return $SelectorModelCopyWith<$Res>(_value.x, (value) {
      return _then(_value.copyWith(x: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get y {
    return $SelectorModelCopyWith<$Res>(_value.y, (value) {
      return _then(_value.copyWith(y: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get cacheKey {
    return $SelectorModelCopyWith<$Res>(_value.cacheKey, (value) {
      return _then(_value.copyWith(cacheKey: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ImageSelectorModelImplCopyWith<$Res>
    implements $ImageSelectorModelCopyWith<$Res> {
  factory _$$ImageSelectorModelImplCopyWith(_$ImageSelectorModelImpl value,
          $Res Function(_$ImageSelectorModelImpl) then) =
      __$$ImageSelectorModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SelectorModel url,
      SelectorModel width,
      SelectorModel height,
      SelectorModel x,
      SelectorModel y,
      SelectorModel cacheKey});

  @override
  $SelectorModelCopyWith<$Res> get url;
  @override
  $SelectorModelCopyWith<$Res> get width;
  @override
  $SelectorModelCopyWith<$Res> get height;
  @override
  $SelectorModelCopyWith<$Res> get x;
  @override
  $SelectorModelCopyWith<$Res> get y;
  @override
  $SelectorModelCopyWith<$Res> get cacheKey;
}

/// @nodoc
class __$$ImageSelectorModelImplCopyWithImpl<$Res>
    extends _$ImageSelectorModelCopyWithImpl<$Res, _$ImageSelectorModelImpl>
    implements _$$ImageSelectorModelImplCopyWith<$Res> {
  __$$ImageSelectorModelImplCopyWithImpl(_$ImageSelectorModelImpl _value,
      $Res Function(_$ImageSelectorModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? width = null,
    Object? height = null,
    Object? x = null,
    Object? y = null,
    Object? cacheKey = null,
  }) {
    return _then(_$ImageSelectorModelImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      cacheKey: null == cacheKey
          ? _value.cacheKey
          : cacheKey // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageSelectorModelImpl implements _ImageSelectorModel {
  const _$ImageSelectorModelImpl(
      {this.url = const SelectorModel(),
      this.width = const SelectorModel(),
      this.height = const SelectorModel(),
      this.x = const SelectorModel(),
      this.y = const SelectorModel(),
      this.cacheKey = const SelectorModel()});

  factory _$ImageSelectorModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageSelectorModelImplFromJson(json);

  @override
  @JsonKey()
  final SelectorModel url;
  @override
  @JsonKey()
  final SelectorModel width;
  @override
  @JsonKey()
  final SelectorModel height;
  @override
  @JsonKey()
  final SelectorModel x;
  @override
  @JsonKey()
  final SelectorModel y;
  @override
  @JsonKey()
  final SelectorModel cacheKey;

  @override
  String toString() {
    return 'ImageSelectorModel(url: $url, width: $width, height: $height, x: $x, y: $y, cacheKey: $cacheKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageSelectorModelImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y) &&
            (identical(other.cacheKey, cacheKey) ||
                other.cacheKey == cacheKey));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, url, width, height, x, y, cacheKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageSelectorModelImplCopyWith<_$ImageSelectorModelImpl> get copyWith =>
      __$$ImageSelectorModelImplCopyWithImpl<_$ImageSelectorModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageSelectorModelImplToJson(
      this,
    );
  }
}

abstract class _ImageSelectorModel implements ImageSelectorModel {
  const factory _ImageSelectorModel(
      {final SelectorModel url,
      final SelectorModel width,
      final SelectorModel height,
      final SelectorModel x,
      final SelectorModel y,
      final SelectorModel cacheKey}) = _$ImageSelectorModelImpl;

  factory _ImageSelectorModel.fromJson(Map<String, dynamic> json) =
      _$ImageSelectorModelImpl.fromJson;

  @override
  SelectorModel get url;
  @override
  SelectorModel get width;
  @override
  SelectorModel get height;
  @override
  SelectorModel get x;
  @override
  SelectorModel get y;
  @override
  SelectorModel get cacheKey;
  @override
  @JsonKey(ignore: true)
  _$$ImageSelectorModelImplCopyWith<_$ImageSelectorModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CommentSelectorModel _$CommentSelectorModelFromJson(Map<String, dynamic> json) {
  return _CommentSelectorModel.fromJson(json);
}

/// @nodoc
mixin _$CommentSelectorModel {
  SelectorModel get username => throw _privateConstructorUsedError;
  SelectorModel get time => throw _privateConstructorUsedError;
  SelectorModel get content => throw _privateConstructorUsedError;
  SelectorModel get avatar => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentSelectorModelCopyWith<CommentSelectorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentSelectorModelCopyWith<$Res> {
  factory $CommentSelectorModelCopyWith(CommentSelectorModel value,
          $Res Function(CommentSelectorModel) then) =
      _$CommentSelectorModelCopyWithImpl<$Res, CommentSelectorModel>;
  @useResult
  $Res call(
      {SelectorModel username,
      SelectorModel time,
      SelectorModel content,
      SelectorModel avatar});

  $SelectorModelCopyWith<$Res> get username;
  $SelectorModelCopyWith<$Res> get time;
  $SelectorModelCopyWith<$Res> get content;
  $SelectorModelCopyWith<$Res> get avatar;
}

/// @nodoc
class _$CommentSelectorModelCopyWithImpl<$Res,
        $Val extends CommentSelectorModel>
    implements $CommentSelectorModelCopyWith<$Res> {
  _$CommentSelectorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? time = null,
    Object? content = null,
    Object? avatar = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get username {
    return $SelectorModelCopyWith<$Res>(_value.username, (value) {
      return _then(_value.copyWith(username: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get time {
    return $SelectorModelCopyWith<$Res>(_value.time, (value) {
      return _then(_value.copyWith(time: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get content {
    return $SelectorModelCopyWith<$Res>(_value.content, (value) {
      return _then(_value.copyWith(content: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get avatar {
    return $SelectorModelCopyWith<$Res>(_value.avatar, (value) {
      return _then(_value.copyWith(avatar: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CommentSelectorModelImplCopyWith<$Res>
    implements $CommentSelectorModelCopyWith<$Res> {
  factory _$$CommentSelectorModelImplCopyWith(_$CommentSelectorModelImpl value,
          $Res Function(_$CommentSelectorModelImpl) then) =
      __$$CommentSelectorModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SelectorModel username,
      SelectorModel time,
      SelectorModel content,
      SelectorModel avatar});

  @override
  $SelectorModelCopyWith<$Res> get username;
  @override
  $SelectorModelCopyWith<$Res> get time;
  @override
  $SelectorModelCopyWith<$Res> get content;
  @override
  $SelectorModelCopyWith<$Res> get avatar;
}

/// @nodoc
class __$$CommentSelectorModelImplCopyWithImpl<$Res>
    extends _$CommentSelectorModelCopyWithImpl<$Res, _$CommentSelectorModelImpl>
    implements _$$CommentSelectorModelImplCopyWith<$Res> {
  __$$CommentSelectorModelImplCopyWithImpl(_$CommentSelectorModelImpl _value,
      $Res Function(_$CommentSelectorModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? time = null,
    Object? content = null,
    Object? avatar = null,
  }) {
    return _then(_$CommentSelectorModelImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentSelectorModelImpl implements _CommentSelectorModel {
  const _$CommentSelectorModelImpl(
      {this.username = const SelectorModel(),
      this.time = const SelectorModel(),
      this.content = const SelectorModel(),
      this.avatar = const SelectorModel()});

  factory _$CommentSelectorModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentSelectorModelImplFromJson(json);

  @override
  @JsonKey()
  final SelectorModel username;
  @override
  @JsonKey()
  final SelectorModel time;
  @override
  @JsonKey()
  final SelectorModel content;
  @override
  @JsonKey()
  final SelectorModel avatar;

  @override
  String toString() {
    return 'CommentSelectorModel(username: $username, time: $time, content: $content, avatar: $avatar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentSelectorModelImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, username, time, content, avatar);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentSelectorModelImplCopyWith<_$CommentSelectorModelImpl>
      get copyWith =>
          __$$CommentSelectorModelImplCopyWithImpl<_$CommentSelectorModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentSelectorModelImplToJson(
      this,
    );
  }
}

abstract class _CommentSelectorModel implements CommentSelectorModel {
  const factory _CommentSelectorModel(
      {final SelectorModel username,
      final SelectorModel time,
      final SelectorModel content,
      final SelectorModel avatar}) = _$CommentSelectorModelImpl;

  factory _CommentSelectorModel.fromJson(Map<String, dynamic> json) =
      _$CommentSelectorModelImpl.fromJson;

  @override
  SelectorModel get username;
  @override
  SelectorModel get time;
  @override
  SelectorModel get content;
  @override
  SelectorModel get avatar;
  @override
  @JsonKey(ignore: true)
  _$$CommentSelectorModelImplCopyWith<_$CommentSelectorModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ExtraSelectorModel _$ExtraSelectorModelFromJson(Map<String, dynamic> json) {
  return _ExtraSelectorModel.fromJson(json);
}

/// @nodoc
mixin _$ExtraSelectorModel {
  SelectorModel get selector => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  bool get persistence => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExtraSelectorModelCopyWith<ExtraSelectorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExtraSelectorModelCopyWith<$Res> {
  factory $ExtraSelectorModelCopyWith(
          ExtraSelectorModel value, $Res Function(ExtraSelectorModel) then) =
      _$ExtraSelectorModelCopyWithImpl<$Res, ExtraSelectorModel>;
  @useResult
  $Res call({SelectorModel selector, String id, bool persistence});

  $SelectorModelCopyWith<$Res> get selector;
}

/// @nodoc
class _$ExtraSelectorModelCopyWithImpl<$Res, $Val extends ExtraSelectorModel>
    implements $ExtraSelectorModelCopyWith<$Res> {
  _$ExtraSelectorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selector = null,
    Object? id = null,
    Object? persistence = null,
  }) {
    return _then(_value.copyWith(
      selector: null == selector
          ? _value.selector
          : selector // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      persistence: null == persistence
          ? _value.persistence
          : persistence // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get selector {
    return $SelectorModelCopyWith<$Res>(_value.selector, (value) {
      return _then(_value.copyWith(selector: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ExtraSelectorModelImplCopyWith<$Res>
    implements $ExtraSelectorModelCopyWith<$Res> {
  factory _$$ExtraSelectorModelImplCopyWith(_$ExtraSelectorModelImpl value,
          $Res Function(_$ExtraSelectorModelImpl) then) =
      __$$ExtraSelectorModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SelectorModel selector, String id, bool persistence});

  @override
  $SelectorModelCopyWith<$Res> get selector;
}

/// @nodoc
class __$$ExtraSelectorModelImplCopyWithImpl<$Res>
    extends _$ExtraSelectorModelCopyWithImpl<$Res, _$ExtraSelectorModelImpl>
    implements _$$ExtraSelectorModelImplCopyWith<$Res> {
  __$$ExtraSelectorModelImplCopyWithImpl(_$ExtraSelectorModelImpl _value,
      $Res Function(_$ExtraSelectorModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selector = null,
    Object? id = null,
    Object? persistence = null,
  }) {
    return _then(_$ExtraSelectorModelImpl(
      selector: null == selector
          ? _value.selector
          : selector // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      persistence: null == persistence
          ? _value.persistence
          : persistence // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExtraSelectorModelImpl implements _ExtraSelectorModel {
  const _$ExtraSelectorModelImpl(
      {this.selector = const SelectorModel(),
      this.id = '',
      this.persistence = false});

  factory _$ExtraSelectorModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExtraSelectorModelImplFromJson(json);

  @override
  @JsonKey()
  final SelectorModel selector;
  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final bool persistence;

  @override
  String toString() {
    return 'ExtraSelectorModel(selector: $selector, id: $id, persistence: $persistence)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExtraSelectorModelImpl &&
            (identical(other.selector, selector) ||
                other.selector == selector) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.persistence, persistence) ||
                other.persistence == persistence));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, selector, id, persistence);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExtraSelectorModelImplCopyWith<_$ExtraSelectorModelImpl> get copyWith =>
      __$$ExtraSelectorModelImplCopyWithImpl<_$ExtraSelectorModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExtraSelectorModelImplToJson(
      this,
    );
  }
}

abstract class _ExtraSelectorModel implements ExtraSelectorModel {
  const factory _ExtraSelectorModel(
      {final SelectorModel selector,
      final String id,
      final bool persistence}) = _$ExtraSelectorModelImpl;

  factory _ExtraSelectorModel.fromJson(Map<String, dynamic> json) =
      _$ExtraSelectorModelImpl.fromJson;

  @override
  SelectorModel get selector;
  @override
  String get id;
  @override
  bool get persistence;
  @override
  @JsonKey(ignore: true)
  _$$ExtraSelectorModelImplCopyWith<_$ExtraSelectorModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TagSelectorModel _$TagSelectorModelFromJson(Map<String, dynamic> json) {
  return _TagSelectorModel.fromJson(json);
}

/// @nodoc
mixin _$TagSelectorModel {
  SelectorModel get text => throw _privateConstructorUsedError;
  SelectorModel get color => throw _privateConstructorUsedError;
  SelectorModel get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TagSelectorModelCopyWith<TagSelectorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagSelectorModelCopyWith<$Res> {
  factory $TagSelectorModelCopyWith(
          TagSelectorModel value, $Res Function(TagSelectorModel) then) =
      _$TagSelectorModelCopyWithImpl<$Res, TagSelectorModel>;
  @useResult
  $Res call({SelectorModel text, SelectorModel color, SelectorModel category});

  $SelectorModelCopyWith<$Res> get text;
  $SelectorModelCopyWith<$Res> get color;
  $SelectorModelCopyWith<$Res> get category;
}

/// @nodoc
class _$TagSelectorModelCopyWithImpl<$Res, $Val extends TagSelectorModel>
    implements $TagSelectorModelCopyWith<$Res> {
  _$TagSelectorModelCopyWithImpl(this._value, this._then);

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
              as SelectorModel,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get text {
    return $SelectorModelCopyWith<$Res>(_value.text, (value) {
      return _then(_value.copyWith(text: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get color {
    return $SelectorModelCopyWith<$Res>(_value.color, (value) {
      return _then(_value.copyWith(color: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get category {
    return $SelectorModelCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TagSelectorModelImplCopyWith<$Res>
    implements $TagSelectorModelCopyWith<$Res> {
  factory _$$TagSelectorModelImplCopyWith(_$TagSelectorModelImpl value,
          $Res Function(_$TagSelectorModelImpl) then) =
      __$$TagSelectorModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SelectorModel text, SelectorModel color, SelectorModel category});

  @override
  $SelectorModelCopyWith<$Res> get text;
  @override
  $SelectorModelCopyWith<$Res> get color;
  @override
  $SelectorModelCopyWith<$Res> get category;
}

/// @nodoc
class __$$TagSelectorModelImplCopyWithImpl<$Res>
    extends _$TagSelectorModelCopyWithImpl<$Res, _$TagSelectorModelImpl>
    implements _$$TagSelectorModelImplCopyWith<$Res> {
  __$$TagSelectorModelImplCopyWithImpl(_$TagSelectorModelImpl _value,
      $Res Function(_$TagSelectorModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? color = null,
    Object? category = null,
  }) {
    return _then(_$TagSelectorModelImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TagSelectorModelImpl implements _TagSelectorModel {
  const _$TagSelectorModelImpl(
      {this.text = const SelectorModel(),
      this.color = const SelectorModel(),
      this.category = const SelectorModel()});

  factory _$TagSelectorModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TagSelectorModelImplFromJson(json);

  @override
  @JsonKey()
  final SelectorModel text;
  @override
  @JsonKey()
  final SelectorModel color;
  @override
  @JsonKey()
  final SelectorModel category;

  @override
  String toString() {
    return 'TagSelectorModel(text: $text, color: $color, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TagSelectorModelImpl &&
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
  _$$TagSelectorModelImplCopyWith<_$TagSelectorModelImpl> get copyWith =>
      __$$TagSelectorModelImplCopyWithImpl<_$TagSelectorModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TagSelectorModelImplToJson(
      this,
    );
  }
}

abstract class _TagSelectorModel implements TagSelectorModel {
  const factory _TagSelectorModel(
      {final SelectorModel text,
      final SelectorModel color,
      final SelectorModel category}) = _$TagSelectorModelImpl;

  factory _TagSelectorModel.fromJson(Map<String, dynamic> json) =
      _$TagSelectorModelImpl.fromJson;

  @override
  SelectorModel get text;
  @override
  SelectorModel get color;
  @override
  SelectorModel get category;
  @override
  @JsonKey(ignore: true)
  _$$TagSelectorModelImplCopyWith<_$TagSelectorModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
