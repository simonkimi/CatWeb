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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Selector _$SelectorFromJson(Map<String, dynamic> json) {
  return _Selector.fromJson(json);
}

/// @nodoc
mixin _$Selector {
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
  $SelectorCopyWith<Selector> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectorCopyWith<$Res> {
  factory $SelectorCopyWith(Selector value, $Res Function(Selector) then) =
      _$SelectorCopyWithImpl<$Res, Selector>;
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
class _$SelectorCopyWithImpl<$Res, $Val extends Selector>
    implements $SelectorCopyWith<$Res> {
  _$SelectorCopyWithImpl(this._value, this._then);

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
abstract class _$$_SelectorCopyWith<$Res> implements $SelectorCopyWith<$Res> {
  factory _$$_SelectorCopyWith(
          _$_Selector value, $Res Function(_$_Selector) then) =
      __$$_SelectorCopyWithImpl<$Res>;
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
class __$$_SelectorCopyWithImpl<$Res>
    extends _$SelectorCopyWithImpl<$Res, _$_Selector>
    implements _$$_SelectorCopyWith<$Res> {
  __$$_SelectorCopyWithImpl(
      _$_Selector _value, $Res Function(_$_Selector) _then)
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
    return _then(_$_Selector(
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
class _$_Selector extends _Selector {
  const _$_Selector(
      {this.selector = '',
      this.type = SelectorType.css,
      this.function = SelectorFunctionType.text,
      this.param = '',
      this.regex = '',
      this.replace = '',
      this.script = const ScriptField(),
      this.defaultValue = ''})
      : super._();

  factory _$_Selector.fromJson(Map<String, dynamic> json) =>
      _$$_SelectorFromJson(json);

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
    return 'Selector(selector: $selector, type: $type, function: $function, param: $param, regex: $regex, replace: $replace, script: $script, defaultValue: $defaultValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Selector &&
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
  _$$_SelectorCopyWith<_$_Selector> get copyWith =>
      __$$_SelectorCopyWithImpl<_$_Selector>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SelectorToJson(
      this,
    );
  }
}

abstract class _Selector extends Selector {
  const factory _Selector(
      {final String selector,
      final SelectorType type,
      final SelectorFunctionType function,
      final String param,
      final String regex,
      final String replace,
      final ScriptField script,
      final String defaultValue}) = _$_Selector;
  const _Selector._() : super._();

  factory _Selector.fromJson(Map<String, dynamic> json) = _$_Selector.fromJson;

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
  _$$_SelectorCopyWith<_$_Selector> get copyWith =>
      throw _privateConstructorUsedError;
}

ImageSelector _$ImageSelectorFromJson(Map<String, dynamic> json) {
  return _ImageSelector.fromJson(json);
}

/// @nodoc
mixin _$ImageSelector {
  Selector get imgUrl => throw _privateConstructorUsedError;
  Selector get imgWidth => throw _privateConstructorUsedError;
  Selector get imgHeight => throw _privateConstructorUsedError;
  Selector get imgX => throw _privateConstructorUsedError;
  Selector get imgY => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageSelectorCopyWith<ImageSelector> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageSelectorCopyWith<$Res> {
  factory $ImageSelectorCopyWith(
          ImageSelector value, $Res Function(ImageSelector) then) =
      _$ImageSelectorCopyWithImpl<$Res, ImageSelector>;
  @useResult
  $Res call(
      {Selector imgUrl,
      Selector imgWidth,
      Selector imgHeight,
      Selector imgX,
      Selector imgY});

  $SelectorCopyWith<$Res> get imgUrl;
  $SelectorCopyWith<$Res> get imgWidth;
  $SelectorCopyWith<$Res> get imgHeight;
  $SelectorCopyWith<$Res> get imgX;
  $SelectorCopyWith<$Res> get imgY;
}

/// @nodoc
class _$ImageSelectorCopyWithImpl<$Res, $Val extends ImageSelector>
    implements $ImageSelectorCopyWith<$Res> {
  _$ImageSelectorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imgUrl = null,
    Object? imgWidth = null,
    Object? imgHeight = null,
    Object? imgX = null,
    Object? imgY = null,
  }) {
    return _then(_value.copyWith(
      imgUrl: null == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as Selector,
      imgWidth: null == imgWidth
          ? _value.imgWidth
          : imgWidth // ignore: cast_nullable_to_non_nullable
              as Selector,
      imgHeight: null == imgHeight
          ? _value.imgHeight
          : imgHeight // ignore: cast_nullable_to_non_nullable
              as Selector,
      imgX: null == imgX
          ? _value.imgX
          : imgX // ignore: cast_nullable_to_non_nullable
              as Selector,
      imgY: null == imgY
          ? _value.imgY
          : imgY // ignore: cast_nullable_to_non_nullable
              as Selector,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get imgUrl {
    return $SelectorCopyWith<$Res>(_value.imgUrl, (value) {
      return _then(_value.copyWith(imgUrl: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get imgWidth {
    return $SelectorCopyWith<$Res>(_value.imgWidth, (value) {
      return _then(_value.copyWith(imgWidth: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get imgHeight {
    return $SelectorCopyWith<$Res>(_value.imgHeight, (value) {
      return _then(_value.copyWith(imgHeight: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get imgX {
    return $SelectorCopyWith<$Res>(_value.imgX, (value) {
      return _then(_value.copyWith(imgX: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get imgY {
    return $SelectorCopyWith<$Res>(_value.imgY, (value) {
      return _then(_value.copyWith(imgY: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ImageSelectorCopyWith<$Res>
    implements $ImageSelectorCopyWith<$Res> {
  factory _$$_ImageSelectorCopyWith(
          _$_ImageSelector value, $Res Function(_$_ImageSelector) then) =
      __$$_ImageSelectorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Selector imgUrl,
      Selector imgWidth,
      Selector imgHeight,
      Selector imgX,
      Selector imgY});

  @override
  $SelectorCopyWith<$Res> get imgUrl;
  @override
  $SelectorCopyWith<$Res> get imgWidth;
  @override
  $SelectorCopyWith<$Res> get imgHeight;
  @override
  $SelectorCopyWith<$Res> get imgX;
  @override
  $SelectorCopyWith<$Res> get imgY;
}

/// @nodoc
class __$$_ImageSelectorCopyWithImpl<$Res>
    extends _$ImageSelectorCopyWithImpl<$Res, _$_ImageSelector>
    implements _$$_ImageSelectorCopyWith<$Res> {
  __$$_ImageSelectorCopyWithImpl(
      _$_ImageSelector _value, $Res Function(_$_ImageSelector) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imgUrl = null,
    Object? imgWidth = null,
    Object? imgHeight = null,
    Object? imgX = null,
    Object? imgY = null,
  }) {
    return _then(_$_ImageSelector(
      imgUrl: null == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as Selector,
      imgWidth: null == imgWidth
          ? _value.imgWidth
          : imgWidth // ignore: cast_nullable_to_non_nullable
              as Selector,
      imgHeight: null == imgHeight
          ? _value.imgHeight
          : imgHeight // ignore: cast_nullable_to_non_nullable
              as Selector,
      imgX: null == imgX
          ? _value.imgX
          : imgX // ignore: cast_nullable_to_non_nullable
              as Selector,
      imgY: null == imgY
          ? _value.imgY
          : imgY // ignore: cast_nullable_to_non_nullable
              as Selector,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ImageSelector implements _ImageSelector {
  const _$_ImageSelector(
      {this.imgUrl = const Selector(),
      this.imgWidth = const Selector(),
      this.imgHeight = const Selector(),
      this.imgX = const Selector(),
      this.imgY = const Selector()});

  factory _$_ImageSelector.fromJson(Map<String, dynamic> json) =>
      _$$_ImageSelectorFromJson(json);

  @override
  @JsonKey()
  final Selector imgUrl;
  @override
  @JsonKey()
  final Selector imgWidth;
  @override
  @JsonKey()
  final Selector imgHeight;
  @override
  @JsonKey()
  final Selector imgX;
  @override
  @JsonKey()
  final Selector imgY;

  @override
  String toString() {
    return 'ImageSelector(imgUrl: $imgUrl, imgWidth: $imgWidth, imgHeight: $imgHeight, imgX: $imgX, imgY: $imgY)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImageSelector &&
            (identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl) &&
            (identical(other.imgWidth, imgWidth) ||
                other.imgWidth == imgWidth) &&
            (identical(other.imgHeight, imgHeight) ||
                other.imgHeight == imgHeight) &&
            (identical(other.imgX, imgX) || other.imgX == imgX) &&
            (identical(other.imgY, imgY) || other.imgY == imgY));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, imgUrl, imgWidth, imgHeight, imgX, imgY);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ImageSelectorCopyWith<_$_ImageSelector> get copyWith =>
      __$$_ImageSelectorCopyWithImpl<_$_ImageSelector>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ImageSelectorToJson(
      this,
    );
  }
}

abstract class _ImageSelector implements ImageSelector {
  const factory _ImageSelector(
      {final Selector imgUrl,
      final Selector imgWidth,
      final Selector imgHeight,
      final Selector imgX,
      final Selector imgY}) = _$_ImageSelector;

  factory _ImageSelector.fromJson(Map<String, dynamic> json) =
      _$_ImageSelector.fromJson;

  @override
  Selector get imgUrl;
  @override
  Selector get imgWidth;
  @override
  Selector get imgHeight;
  @override
  Selector get imgX;
  @override
  Selector get imgY;
  @override
  @JsonKey(ignore: true)
  _$$_ImageSelectorCopyWith<_$_ImageSelector> get copyWith =>
      throw _privateConstructorUsedError;
}

CommentSelector _$CommentSelectorFromJson(Map<String, dynamic> json) {
  return _CommentSelector.fromJson(json);
}

/// @nodoc
mixin _$CommentSelector {
  Selector get username => throw _privateConstructorUsedError;
  Selector get time => throw _privateConstructorUsedError;
  Selector get score => throw _privateConstructorUsedError;
  Selector get content => throw _privateConstructorUsedError;
  ImageSelector get avatar => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentSelectorCopyWith<CommentSelector> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentSelectorCopyWith<$Res> {
  factory $CommentSelectorCopyWith(
          CommentSelector value, $Res Function(CommentSelector) then) =
      _$CommentSelectorCopyWithImpl<$Res, CommentSelector>;
  @useResult
  $Res call(
      {Selector username,
      Selector time,
      Selector score,
      Selector content,
      ImageSelector avatar});

  $SelectorCopyWith<$Res> get username;
  $SelectorCopyWith<$Res> get time;
  $SelectorCopyWith<$Res> get score;
  $SelectorCopyWith<$Res> get content;
  $ImageSelectorCopyWith<$Res> get avatar;
}

/// @nodoc
class _$CommentSelectorCopyWithImpl<$Res, $Val extends CommentSelector>
    implements $CommentSelectorCopyWith<$Res> {
  _$CommentSelectorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? time = null,
    Object? score = null,
    Object? content = null,
    Object? avatar = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as Selector,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as Selector,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as Selector,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as Selector,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as ImageSelector,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get username {
    return $SelectorCopyWith<$Res>(_value.username, (value) {
      return _then(_value.copyWith(username: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get time {
    return $SelectorCopyWith<$Res>(_value.time, (value) {
      return _then(_value.copyWith(time: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get score {
    return $SelectorCopyWith<$Res>(_value.score, (value) {
      return _then(_value.copyWith(score: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get content {
    return $SelectorCopyWith<$Res>(_value.content, (value) {
      return _then(_value.copyWith(content: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageSelectorCopyWith<$Res> get avatar {
    return $ImageSelectorCopyWith<$Res>(_value.avatar, (value) {
      return _then(_value.copyWith(avatar: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CommentSelectorCopyWith<$Res>
    implements $CommentSelectorCopyWith<$Res> {
  factory _$$_CommentSelectorCopyWith(
          _$_CommentSelector value, $Res Function(_$_CommentSelector) then) =
      __$$_CommentSelectorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Selector username,
      Selector time,
      Selector score,
      Selector content,
      ImageSelector avatar});

  @override
  $SelectorCopyWith<$Res> get username;
  @override
  $SelectorCopyWith<$Res> get time;
  @override
  $SelectorCopyWith<$Res> get score;
  @override
  $SelectorCopyWith<$Res> get content;
  @override
  $ImageSelectorCopyWith<$Res> get avatar;
}

/// @nodoc
class __$$_CommentSelectorCopyWithImpl<$Res>
    extends _$CommentSelectorCopyWithImpl<$Res, _$_CommentSelector>
    implements _$$_CommentSelectorCopyWith<$Res> {
  __$$_CommentSelectorCopyWithImpl(
      _$_CommentSelector _value, $Res Function(_$_CommentSelector) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? time = null,
    Object? score = null,
    Object? content = null,
    Object? avatar = null,
  }) {
    return _then(_$_CommentSelector(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as Selector,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as Selector,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as Selector,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as Selector,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as ImageSelector,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CommentSelector implements _CommentSelector {
  const _$_CommentSelector(
      {this.username = const Selector(),
      this.time = const Selector(),
      this.score = const Selector(),
      this.content = const Selector(),
      this.avatar = const ImageSelector()});

  factory _$_CommentSelector.fromJson(Map<String, dynamic> json) =>
      _$$_CommentSelectorFromJson(json);

  @override
  @JsonKey()
  final Selector username;
  @override
  @JsonKey()
  final Selector time;
  @override
  @JsonKey()
  final Selector score;
  @override
  @JsonKey()
  final Selector content;
  @override
  @JsonKey()
  final ImageSelector avatar;

  @override
  String toString() {
    return 'CommentSelector(username: $username, time: $time, score: $score, content: $content, avatar: $avatar)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommentSelector &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, username, time, score, content, avatar);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CommentSelectorCopyWith<_$_CommentSelector> get copyWith =>
      __$$_CommentSelectorCopyWithImpl<_$_CommentSelector>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommentSelectorToJson(
      this,
    );
  }
}

abstract class _CommentSelector implements CommentSelector {
  const factory _CommentSelector(
      {final Selector username,
      final Selector time,
      final Selector score,
      final Selector content,
      final ImageSelector avatar}) = _$_CommentSelector;

  factory _CommentSelector.fromJson(Map<String, dynamic> json) =
      _$_CommentSelector.fromJson;

  @override
  Selector get username;
  @override
  Selector get time;
  @override
  Selector get score;
  @override
  Selector get content;
  @override
  ImageSelector get avatar;
  @override
  @JsonKey(ignore: true)
  _$$_CommentSelectorCopyWith<_$_CommentSelector> get copyWith =>
      throw _privateConstructorUsedError;
}

ExtraSelector _$ExtraSelectorFromJson(Map<String, dynamic> json) {
  return _ExtraSelector.fromJson(json);
}

/// @nodoc
mixin _$ExtraSelector {
  Selector get selector => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  bool get global => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExtraSelectorCopyWith<ExtraSelector> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExtraSelectorCopyWith<$Res> {
  factory $ExtraSelectorCopyWith(
          ExtraSelector value, $Res Function(ExtraSelector) then) =
      _$ExtraSelectorCopyWithImpl<$Res, ExtraSelector>;
  @useResult
  $Res call({Selector selector, String id, bool global});

  $SelectorCopyWith<$Res> get selector;
}

/// @nodoc
class _$ExtraSelectorCopyWithImpl<$Res, $Val extends ExtraSelector>
    implements $ExtraSelectorCopyWith<$Res> {
  _$ExtraSelectorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selector = null,
    Object? id = null,
    Object? global = null,
  }) {
    return _then(_value.copyWith(
      selector: null == selector
          ? _value.selector
          : selector // ignore: cast_nullable_to_non_nullable
              as Selector,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      global: null == global
          ? _value.global
          : global // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get selector {
    return $SelectorCopyWith<$Res>(_value.selector, (value) {
      return _then(_value.copyWith(selector: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ExtraSelectorCopyWith<$Res>
    implements $ExtraSelectorCopyWith<$Res> {
  factory _$$_ExtraSelectorCopyWith(
          _$_ExtraSelector value, $Res Function(_$_ExtraSelector) then) =
      __$$_ExtraSelectorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Selector selector, String id, bool global});

  @override
  $SelectorCopyWith<$Res> get selector;
}

/// @nodoc
class __$$_ExtraSelectorCopyWithImpl<$Res>
    extends _$ExtraSelectorCopyWithImpl<$Res, _$_ExtraSelector>
    implements _$$_ExtraSelectorCopyWith<$Res> {
  __$$_ExtraSelectorCopyWithImpl(
      _$_ExtraSelector _value, $Res Function(_$_ExtraSelector) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selector = null,
    Object? id = null,
    Object? global = null,
  }) {
    return _then(_$_ExtraSelector(
      selector: null == selector
          ? _value.selector
          : selector // ignore: cast_nullable_to_non_nullable
              as Selector,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      global: null == global
          ? _value.global
          : global // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ExtraSelector implements _ExtraSelector {
  const _$_ExtraSelector(
      {this.selector = const Selector(), this.id = '', this.global = false});

  factory _$_ExtraSelector.fromJson(Map<String, dynamic> json) =>
      _$$_ExtraSelectorFromJson(json);

  @override
  @JsonKey()
  final Selector selector;
  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final bool global;

  @override
  String toString() {
    return 'ExtraSelector(selector: $selector, id: $id, global: $global)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExtraSelector &&
            (identical(other.selector, selector) ||
                other.selector == selector) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.global, global) || other.global == global));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, selector, id, global);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExtraSelectorCopyWith<_$_ExtraSelector> get copyWith =>
      __$$_ExtraSelectorCopyWithImpl<_$_ExtraSelector>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExtraSelectorToJson(
      this,
    );
  }
}

abstract class _ExtraSelector implements ExtraSelector {
  const factory _ExtraSelector(
      {final Selector selector,
      final String id,
      final bool global}) = _$_ExtraSelector;

  factory _ExtraSelector.fromJson(Map<String, dynamic> json) =
      _$_ExtraSelector.fromJson;

  @override
  Selector get selector;
  @override
  String get id;
  @override
  bool get global;
  @override
  @JsonKey(ignore: true)
  _$$_ExtraSelectorCopyWith<_$_ExtraSelector> get copyWith =>
      throw _privateConstructorUsedError;
}
