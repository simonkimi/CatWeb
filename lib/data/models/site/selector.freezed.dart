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

SelectorQuery _$SelectorQueryFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'self':
      return SelectorQuerySelf.fromJson(json);
    case 'css':
      return SelectorQueryCss.fromJson(json);
    case 'xpath':
      return SelectorQueryXpath.fromJson(json);
    case 'jsonPath':
      return SelectorQueryJsonPath.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'SelectorQuery',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$SelectorQuery {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() self,
    required TResult Function(String cssSelector) css,
    required TResult Function(String xpath) xpath,
    required TResult Function(String jsonPath) jsonPath,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? self,
    TResult? Function(String cssSelector)? css,
    TResult? Function(String xpath)? xpath,
    TResult? Function(String jsonPath)? jsonPath,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? self,
    TResult Function(String cssSelector)? css,
    TResult Function(String xpath)? xpath,
    TResult Function(String jsonPath)? jsonPath,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectorQuerySelf value) self,
    required TResult Function(SelectorQueryCss value) css,
    required TResult Function(SelectorQueryXpath value) xpath,
    required TResult Function(SelectorQueryJsonPath value) jsonPath,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectorQuerySelf value)? self,
    TResult? Function(SelectorQueryCss value)? css,
    TResult? Function(SelectorQueryXpath value)? xpath,
    TResult? Function(SelectorQueryJsonPath value)? jsonPath,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectorQuerySelf value)? self,
    TResult Function(SelectorQueryCss value)? css,
    TResult Function(SelectorQueryXpath value)? xpath,
    TResult Function(SelectorQueryJsonPath value)? jsonPath,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this SelectorQuery to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectorQueryCopyWith<$Res> {
  factory $SelectorQueryCopyWith(
          SelectorQuery value, $Res Function(SelectorQuery) then) =
      _$SelectorQueryCopyWithImpl<$Res, SelectorQuery>;
}

/// @nodoc
class _$SelectorQueryCopyWithImpl<$Res, $Val extends SelectorQuery>
    implements $SelectorQueryCopyWith<$Res> {
  _$SelectorQueryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SelectorQuery
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SelectorQuerySelfImplCopyWith<$Res> {
  factory _$$SelectorQuerySelfImplCopyWith(_$SelectorQuerySelfImpl value,
          $Res Function(_$SelectorQuerySelfImpl) then) =
      __$$SelectorQuerySelfImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SelectorQuerySelfImplCopyWithImpl<$Res>
    extends _$SelectorQueryCopyWithImpl<$Res, _$SelectorQuerySelfImpl>
    implements _$$SelectorQuerySelfImplCopyWith<$Res> {
  __$$SelectorQuerySelfImplCopyWithImpl(_$SelectorQuerySelfImpl _value,
      $Res Function(_$SelectorQuerySelfImpl) _then)
      : super(_value, _then);

  /// Create a copy of SelectorQuery
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$SelectorQuerySelfImpl extends SelectorQuerySelf {
  const _$SelectorQuerySelfImpl({final String? $type})
      : $type = $type ?? 'self',
        super._();

  factory _$SelectorQuerySelfImpl.fromJson(Map<String, dynamic> json) =>
      _$$SelectorQuerySelfImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SelectorQuery.self()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SelectorQuerySelfImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() self,
    required TResult Function(String cssSelector) css,
    required TResult Function(String xpath) xpath,
    required TResult Function(String jsonPath) jsonPath,
  }) {
    return self();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? self,
    TResult? Function(String cssSelector)? css,
    TResult? Function(String xpath)? xpath,
    TResult? Function(String jsonPath)? jsonPath,
  }) {
    return self?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? self,
    TResult Function(String cssSelector)? css,
    TResult Function(String xpath)? xpath,
    TResult Function(String jsonPath)? jsonPath,
    required TResult orElse(),
  }) {
    if (self != null) {
      return self();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectorQuerySelf value) self,
    required TResult Function(SelectorQueryCss value) css,
    required TResult Function(SelectorQueryXpath value) xpath,
    required TResult Function(SelectorQueryJsonPath value) jsonPath,
  }) {
    return self(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectorQuerySelf value)? self,
    TResult? Function(SelectorQueryCss value)? css,
    TResult? Function(SelectorQueryXpath value)? xpath,
    TResult? Function(SelectorQueryJsonPath value)? jsonPath,
  }) {
    return self?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectorQuerySelf value)? self,
    TResult Function(SelectorQueryCss value)? css,
    TResult Function(SelectorQueryXpath value)? xpath,
    TResult Function(SelectorQueryJsonPath value)? jsonPath,
    required TResult orElse(),
  }) {
    if (self != null) {
      return self(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SelectorQuerySelfImplToJson(
      this,
    );
  }
}

abstract class SelectorQuerySelf extends SelectorQuery {
  const factory SelectorQuerySelf() = _$SelectorQuerySelfImpl;
  const SelectorQuerySelf._() : super._();

  factory SelectorQuerySelf.fromJson(Map<String, dynamic> json) =
      _$SelectorQuerySelfImpl.fromJson;
}

/// @nodoc
abstract class _$$SelectorQueryCssImplCopyWith<$Res> {
  factory _$$SelectorQueryCssImplCopyWith(_$SelectorQueryCssImpl value,
          $Res Function(_$SelectorQueryCssImpl) then) =
      __$$SelectorQueryCssImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String cssSelector});
}

/// @nodoc
class __$$SelectorQueryCssImplCopyWithImpl<$Res>
    extends _$SelectorQueryCopyWithImpl<$Res, _$SelectorQueryCssImpl>
    implements _$$SelectorQueryCssImplCopyWith<$Res> {
  __$$SelectorQueryCssImplCopyWithImpl(_$SelectorQueryCssImpl _value,
      $Res Function(_$SelectorQueryCssImpl) _then)
      : super(_value, _then);

  /// Create a copy of SelectorQuery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cssSelector = null,
  }) {
    return _then(_$SelectorQueryCssImpl(
      cssSelector: null == cssSelector
          ? _value.cssSelector
          : cssSelector // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SelectorQueryCssImpl extends SelectorQueryCss {
  const _$SelectorQueryCssImpl({this.cssSelector = '', final String? $type})
      : $type = $type ?? 'css',
        super._();

  factory _$SelectorQueryCssImpl.fromJson(Map<String, dynamic> json) =>
      _$$SelectorQueryCssImplFromJson(json);

  @override
  @JsonKey()
  final String cssSelector;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SelectorQuery.css(cssSelector: $cssSelector)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectorQueryCssImpl &&
            (identical(other.cssSelector, cssSelector) ||
                other.cssSelector == cssSelector));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, cssSelector);

  /// Create a copy of SelectorQuery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectorQueryCssImplCopyWith<_$SelectorQueryCssImpl> get copyWith =>
      __$$SelectorQueryCssImplCopyWithImpl<_$SelectorQueryCssImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() self,
    required TResult Function(String cssSelector) css,
    required TResult Function(String xpath) xpath,
    required TResult Function(String jsonPath) jsonPath,
  }) {
    return css(cssSelector);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? self,
    TResult? Function(String cssSelector)? css,
    TResult? Function(String xpath)? xpath,
    TResult? Function(String jsonPath)? jsonPath,
  }) {
    return css?.call(cssSelector);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? self,
    TResult Function(String cssSelector)? css,
    TResult Function(String xpath)? xpath,
    TResult Function(String jsonPath)? jsonPath,
    required TResult orElse(),
  }) {
    if (css != null) {
      return css(cssSelector);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectorQuerySelf value) self,
    required TResult Function(SelectorQueryCss value) css,
    required TResult Function(SelectorQueryXpath value) xpath,
    required TResult Function(SelectorQueryJsonPath value) jsonPath,
  }) {
    return css(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectorQuerySelf value)? self,
    TResult? Function(SelectorQueryCss value)? css,
    TResult? Function(SelectorQueryXpath value)? xpath,
    TResult? Function(SelectorQueryJsonPath value)? jsonPath,
  }) {
    return css?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectorQuerySelf value)? self,
    TResult Function(SelectorQueryCss value)? css,
    TResult Function(SelectorQueryXpath value)? xpath,
    TResult Function(SelectorQueryJsonPath value)? jsonPath,
    required TResult orElse(),
  }) {
    if (css != null) {
      return css(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SelectorQueryCssImplToJson(
      this,
    );
  }
}

abstract class SelectorQueryCss extends SelectorQuery {
  const factory SelectorQueryCss({final String cssSelector}) =
      _$SelectorQueryCssImpl;
  const SelectorQueryCss._() : super._();

  factory SelectorQueryCss.fromJson(Map<String, dynamic> json) =
      _$SelectorQueryCssImpl.fromJson;

  String get cssSelector;

  /// Create a copy of SelectorQuery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectorQueryCssImplCopyWith<_$SelectorQueryCssImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectorQueryXpathImplCopyWith<$Res> {
  factory _$$SelectorQueryXpathImplCopyWith(_$SelectorQueryXpathImpl value,
          $Res Function(_$SelectorQueryXpathImpl) then) =
      __$$SelectorQueryXpathImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String xpath});
}

/// @nodoc
class __$$SelectorQueryXpathImplCopyWithImpl<$Res>
    extends _$SelectorQueryCopyWithImpl<$Res, _$SelectorQueryXpathImpl>
    implements _$$SelectorQueryXpathImplCopyWith<$Res> {
  __$$SelectorQueryXpathImplCopyWithImpl(_$SelectorQueryXpathImpl _value,
      $Res Function(_$SelectorQueryXpathImpl) _then)
      : super(_value, _then);

  /// Create a copy of SelectorQuery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? xpath = null,
  }) {
    return _then(_$SelectorQueryXpathImpl(
      xpath: null == xpath
          ? _value.xpath
          : xpath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SelectorQueryXpathImpl extends SelectorQueryXpath {
  const _$SelectorQueryXpathImpl({this.xpath = '', final String? $type})
      : $type = $type ?? 'xpath',
        super._();

  factory _$SelectorQueryXpathImpl.fromJson(Map<String, dynamic> json) =>
      _$$SelectorQueryXpathImplFromJson(json);

  @override
  @JsonKey()
  final String xpath;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SelectorQuery.xpath(xpath: $xpath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectorQueryXpathImpl &&
            (identical(other.xpath, xpath) || other.xpath == xpath));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, xpath);

  /// Create a copy of SelectorQuery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectorQueryXpathImplCopyWith<_$SelectorQueryXpathImpl> get copyWith =>
      __$$SelectorQueryXpathImplCopyWithImpl<_$SelectorQueryXpathImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() self,
    required TResult Function(String cssSelector) css,
    required TResult Function(String xpath) xpath,
    required TResult Function(String jsonPath) jsonPath,
  }) {
    return xpath(this.xpath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? self,
    TResult? Function(String cssSelector)? css,
    TResult? Function(String xpath)? xpath,
    TResult? Function(String jsonPath)? jsonPath,
  }) {
    return xpath?.call(this.xpath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? self,
    TResult Function(String cssSelector)? css,
    TResult Function(String xpath)? xpath,
    TResult Function(String jsonPath)? jsonPath,
    required TResult orElse(),
  }) {
    if (xpath != null) {
      return xpath(this.xpath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectorQuerySelf value) self,
    required TResult Function(SelectorQueryCss value) css,
    required TResult Function(SelectorQueryXpath value) xpath,
    required TResult Function(SelectorQueryJsonPath value) jsonPath,
  }) {
    return xpath(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectorQuerySelf value)? self,
    TResult? Function(SelectorQueryCss value)? css,
    TResult? Function(SelectorQueryXpath value)? xpath,
    TResult? Function(SelectorQueryJsonPath value)? jsonPath,
  }) {
    return xpath?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectorQuerySelf value)? self,
    TResult Function(SelectorQueryCss value)? css,
    TResult Function(SelectorQueryXpath value)? xpath,
    TResult Function(SelectorQueryJsonPath value)? jsonPath,
    required TResult orElse(),
  }) {
    if (xpath != null) {
      return xpath(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SelectorQueryXpathImplToJson(
      this,
    );
  }
}

abstract class SelectorQueryXpath extends SelectorQuery {
  const factory SelectorQueryXpath({final String xpath}) =
      _$SelectorQueryXpathImpl;
  const SelectorQueryXpath._() : super._();

  factory SelectorQueryXpath.fromJson(Map<String, dynamic> json) =
      _$SelectorQueryXpathImpl.fromJson;

  String get xpath;

  /// Create a copy of SelectorQuery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectorQueryXpathImplCopyWith<_$SelectorQueryXpathImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectorQueryJsonPathImplCopyWith<$Res> {
  factory _$$SelectorQueryJsonPathImplCopyWith(
          _$SelectorQueryJsonPathImpl value,
          $Res Function(_$SelectorQueryJsonPathImpl) then) =
      __$$SelectorQueryJsonPathImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String jsonPath});
}

/// @nodoc
class __$$SelectorQueryJsonPathImplCopyWithImpl<$Res>
    extends _$SelectorQueryCopyWithImpl<$Res, _$SelectorQueryJsonPathImpl>
    implements _$$SelectorQueryJsonPathImplCopyWith<$Res> {
  __$$SelectorQueryJsonPathImplCopyWithImpl(_$SelectorQueryJsonPathImpl _value,
      $Res Function(_$SelectorQueryJsonPathImpl) _then)
      : super(_value, _then);

  /// Create a copy of SelectorQuery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jsonPath = null,
  }) {
    return _then(_$SelectorQueryJsonPathImpl(
      jsonPath: null == jsonPath
          ? _value.jsonPath
          : jsonPath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SelectorQueryJsonPathImpl extends SelectorQueryJsonPath {
  const _$SelectorQueryJsonPathImpl({this.jsonPath = '', final String? $type})
      : $type = $type ?? 'jsonPath',
        super._();

  factory _$SelectorQueryJsonPathImpl.fromJson(Map<String, dynamic> json) =>
      _$$SelectorQueryJsonPathImplFromJson(json);

  @override
  @JsonKey()
  final String jsonPath;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SelectorQuery.jsonPath(jsonPath: $jsonPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectorQueryJsonPathImpl &&
            (identical(other.jsonPath, jsonPath) ||
                other.jsonPath == jsonPath));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, jsonPath);

  /// Create a copy of SelectorQuery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectorQueryJsonPathImplCopyWith<_$SelectorQueryJsonPathImpl>
      get copyWith => __$$SelectorQueryJsonPathImplCopyWithImpl<
          _$SelectorQueryJsonPathImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() self,
    required TResult Function(String cssSelector) css,
    required TResult Function(String xpath) xpath,
    required TResult Function(String jsonPath) jsonPath,
  }) {
    return jsonPath(this.jsonPath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? self,
    TResult? Function(String cssSelector)? css,
    TResult? Function(String xpath)? xpath,
    TResult? Function(String jsonPath)? jsonPath,
  }) {
    return jsonPath?.call(this.jsonPath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? self,
    TResult Function(String cssSelector)? css,
    TResult Function(String xpath)? xpath,
    TResult Function(String jsonPath)? jsonPath,
    required TResult orElse(),
  }) {
    if (jsonPath != null) {
      return jsonPath(this.jsonPath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectorQuerySelf value) self,
    required TResult Function(SelectorQueryCss value) css,
    required TResult Function(SelectorQueryXpath value) xpath,
    required TResult Function(SelectorQueryJsonPath value) jsonPath,
  }) {
    return jsonPath(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectorQuerySelf value)? self,
    TResult? Function(SelectorQueryCss value)? css,
    TResult? Function(SelectorQueryXpath value)? xpath,
    TResult? Function(SelectorQueryJsonPath value)? jsonPath,
  }) {
    return jsonPath?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectorQuerySelf value)? self,
    TResult Function(SelectorQueryCss value)? css,
    TResult Function(SelectorQueryXpath value)? xpath,
    TResult Function(SelectorQueryJsonPath value)? jsonPath,
    required TResult orElse(),
  }) {
    if (jsonPath != null) {
      return jsonPath(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SelectorQueryJsonPathImplToJson(
      this,
    );
  }
}

abstract class SelectorQueryJsonPath extends SelectorQuery {
  const factory SelectorQueryJsonPath({final String jsonPath}) =
      _$SelectorQueryJsonPathImpl;
  const SelectorQueryJsonPath._() : super._();

  factory SelectorQueryJsonPath.fromJson(Map<String, dynamic> json) =
      _$SelectorQueryJsonPathImpl.fromJson;

  String get jsonPath;

  /// Create a copy of SelectorQuery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectorQueryJsonPathImplCopyWith<_$SelectorQueryJsonPathImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SelectorFunction _$SelectorFunctionFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'text':
      return SelectorFunctionText.fromJson(json);
    case 'attr':
      return SelectorFunctionAttr.fromJson(json);
    case 'raw':
      return SelectorFunctionRaw.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'SelectorFunction',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$SelectorFunction {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() text,
    required TResult Function(String attr) attr,
    required TResult Function() raw,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? text,
    TResult? Function(String attr)? attr,
    TResult? Function()? raw,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? text,
    TResult Function(String attr)? attr,
    TResult Function()? raw,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectorFunctionText value) text,
    required TResult Function(SelectorFunctionAttr value) attr,
    required TResult Function(SelectorFunctionRaw value) raw,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectorFunctionText value)? text,
    TResult? Function(SelectorFunctionAttr value)? attr,
    TResult? Function(SelectorFunctionRaw value)? raw,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectorFunctionText value)? text,
    TResult Function(SelectorFunctionAttr value)? attr,
    TResult Function(SelectorFunctionRaw value)? raw,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this SelectorFunction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectorFunctionCopyWith<$Res> {
  factory $SelectorFunctionCopyWith(
          SelectorFunction value, $Res Function(SelectorFunction) then) =
      _$SelectorFunctionCopyWithImpl<$Res, SelectorFunction>;
}

/// @nodoc
class _$SelectorFunctionCopyWithImpl<$Res, $Val extends SelectorFunction>
    implements $SelectorFunctionCopyWith<$Res> {
  _$SelectorFunctionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SelectorFunction
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SelectorFunctionTextImplCopyWith<$Res> {
  factory _$$SelectorFunctionTextImplCopyWith(_$SelectorFunctionTextImpl value,
          $Res Function(_$SelectorFunctionTextImpl) then) =
      __$$SelectorFunctionTextImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SelectorFunctionTextImplCopyWithImpl<$Res>
    extends _$SelectorFunctionCopyWithImpl<$Res, _$SelectorFunctionTextImpl>
    implements _$$SelectorFunctionTextImplCopyWith<$Res> {
  __$$SelectorFunctionTextImplCopyWithImpl(_$SelectorFunctionTextImpl _value,
      $Res Function(_$SelectorFunctionTextImpl) _then)
      : super(_value, _then);

  /// Create a copy of SelectorFunction
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$SelectorFunctionTextImpl extends SelectorFunctionText {
  const _$SelectorFunctionTextImpl({final String? $type})
      : $type = $type ?? 'text',
        super._();

  factory _$SelectorFunctionTextImpl.fromJson(Map<String, dynamic> json) =>
      _$$SelectorFunctionTextImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SelectorFunction.text()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectorFunctionTextImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() text,
    required TResult Function(String attr) attr,
    required TResult Function() raw,
  }) {
    return text();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? text,
    TResult? Function(String attr)? attr,
    TResult? Function()? raw,
  }) {
    return text?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? text,
    TResult Function(String attr)? attr,
    TResult Function()? raw,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectorFunctionText value) text,
    required TResult Function(SelectorFunctionAttr value) attr,
    required TResult Function(SelectorFunctionRaw value) raw,
  }) {
    return text(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectorFunctionText value)? text,
    TResult? Function(SelectorFunctionAttr value)? attr,
    TResult? Function(SelectorFunctionRaw value)? raw,
  }) {
    return text?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectorFunctionText value)? text,
    TResult Function(SelectorFunctionAttr value)? attr,
    TResult Function(SelectorFunctionRaw value)? raw,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SelectorFunctionTextImplToJson(
      this,
    );
  }
}

abstract class SelectorFunctionText extends SelectorFunction {
  const factory SelectorFunctionText() = _$SelectorFunctionTextImpl;
  const SelectorFunctionText._() : super._();

  factory SelectorFunctionText.fromJson(Map<String, dynamic> json) =
      _$SelectorFunctionTextImpl.fromJson;
}

/// @nodoc
abstract class _$$SelectorFunctionAttrImplCopyWith<$Res> {
  factory _$$SelectorFunctionAttrImplCopyWith(_$SelectorFunctionAttrImpl value,
          $Res Function(_$SelectorFunctionAttrImpl) then) =
      __$$SelectorFunctionAttrImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String attr});
}

/// @nodoc
class __$$SelectorFunctionAttrImplCopyWithImpl<$Res>
    extends _$SelectorFunctionCopyWithImpl<$Res, _$SelectorFunctionAttrImpl>
    implements _$$SelectorFunctionAttrImplCopyWith<$Res> {
  __$$SelectorFunctionAttrImplCopyWithImpl(_$SelectorFunctionAttrImpl _value,
      $Res Function(_$SelectorFunctionAttrImpl) _then)
      : super(_value, _then);

  /// Create a copy of SelectorFunction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attr = null,
  }) {
    return _then(_$SelectorFunctionAttrImpl(
      attr: null == attr
          ? _value.attr
          : attr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SelectorFunctionAttrImpl extends SelectorFunctionAttr {
  const _$SelectorFunctionAttrImpl({this.attr = '', final String? $type})
      : $type = $type ?? 'attr',
        super._();

  factory _$SelectorFunctionAttrImpl.fromJson(Map<String, dynamic> json) =>
      _$$SelectorFunctionAttrImplFromJson(json);

  @override
  @JsonKey()
  final String attr;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SelectorFunction.attr(attr: $attr)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectorFunctionAttrImpl &&
            (identical(other.attr, attr) || other.attr == attr));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, attr);

  /// Create a copy of SelectorFunction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectorFunctionAttrImplCopyWith<_$SelectorFunctionAttrImpl>
      get copyWith =>
          __$$SelectorFunctionAttrImplCopyWithImpl<_$SelectorFunctionAttrImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() text,
    required TResult Function(String attr) attr,
    required TResult Function() raw,
  }) {
    return attr(this.attr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? text,
    TResult? Function(String attr)? attr,
    TResult? Function()? raw,
  }) {
    return attr?.call(this.attr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? text,
    TResult Function(String attr)? attr,
    TResult Function()? raw,
    required TResult orElse(),
  }) {
    if (attr != null) {
      return attr(this.attr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectorFunctionText value) text,
    required TResult Function(SelectorFunctionAttr value) attr,
    required TResult Function(SelectorFunctionRaw value) raw,
  }) {
    return attr(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectorFunctionText value)? text,
    TResult? Function(SelectorFunctionAttr value)? attr,
    TResult? Function(SelectorFunctionRaw value)? raw,
  }) {
    return attr?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectorFunctionText value)? text,
    TResult Function(SelectorFunctionAttr value)? attr,
    TResult Function(SelectorFunctionRaw value)? raw,
    required TResult orElse(),
  }) {
    if (attr != null) {
      return attr(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SelectorFunctionAttrImplToJson(
      this,
    );
  }
}

abstract class SelectorFunctionAttr extends SelectorFunction {
  const factory SelectorFunctionAttr({final String attr}) =
      _$SelectorFunctionAttrImpl;
  const SelectorFunctionAttr._() : super._();

  factory SelectorFunctionAttr.fromJson(Map<String, dynamic> json) =
      _$SelectorFunctionAttrImpl.fromJson;

  String get attr;

  /// Create a copy of SelectorFunction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectorFunctionAttrImplCopyWith<_$SelectorFunctionAttrImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectorFunctionRawImplCopyWith<$Res> {
  factory _$$SelectorFunctionRawImplCopyWith(_$SelectorFunctionRawImpl value,
          $Res Function(_$SelectorFunctionRawImpl) then) =
      __$$SelectorFunctionRawImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SelectorFunctionRawImplCopyWithImpl<$Res>
    extends _$SelectorFunctionCopyWithImpl<$Res, _$SelectorFunctionRawImpl>
    implements _$$SelectorFunctionRawImplCopyWith<$Res> {
  __$$SelectorFunctionRawImplCopyWithImpl(_$SelectorFunctionRawImpl _value,
      $Res Function(_$SelectorFunctionRawImpl) _then)
      : super(_value, _then);

  /// Create a copy of SelectorFunction
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$SelectorFunctionRawImpl extends SelectorFunctionRaw {
  const _$SelectorFunctionRawImpl({final String? $type})
      : $type = $type ?? 'raw',
        super._();

  factory _$SelectorFunctionRawImpl.fromJson(Map<String, dynamic> json) =>
      _$$SelectorFunctionRawImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SelectorFunction.raw()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectorFunctionRawImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() text,
    required TResult Function(String attr) attr,
    required TResult Function() raw,
  }) {
    return raw();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? text,
    TResult? Function(String attr)? attr,
    TResult? Function()? raw,
  }) {
    return raw?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? text,
    TResult Function(String attr)? attr,
    TResult Function()? raw,
    required TResult orElse(),
  }) {
    if (raw != null) {
      return raw();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectorFunctionText value) text,
    required TResult Function(SelectorFunctionAttr value) attr,
    required TResult Function(SelectorFunctionRaw value) raw,
  }) {
    return raw(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectorFunctionText value)? text,
    TResult? Function(SelectorFunctionAttr value)? attr,
    TResult? Function(SelectorFunctionRaw value)? raw,
  }) {
    return raw?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectorFunctionText value)? text,
    TResult Function(SelectorFunctionAttr value)? attr,
    TResult Function(SelectorFunctionRaw value)? raw,
    required TResult orElse(),
  }) {
    if (raw != null) {
      return raw(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SelectorFunctionRawImplToJson(
      this,
    );
  }
}

abstract class SelectorFunctionRaw extends SelectorFunction {
  const factory SelectorFunctionRaw() = _$SelectorFunctionRawImpl;
  const SelectorFunctionRaw._() : super._();

  factory SelectorFunctionRaw.fromJson(Map<String, dynamic> json) =
      _$SelectorFunctionRawImpl.fromJson;
}

SelectorModel _$SelectorModelFromJson(Map<String, dynamic> json) {
  return _SelectorModel.fromJson(json);
}

/// @nodoc
mixin _$SelectorModel {
  String get selector => throw _privateConstructorUsedError;
  SelectorQuery get type => throw _privateConstructorUsedError;
  SelectorFunction get function => throw _privateConstructorUsedError;
  String get param => throw _privateConstructorUsedError;
  String get regex => throw _privateConstructorUsedError;
  String get replace => throw _privateConstructorUsedError;
  ScriptField get script => throw _privateConstructorUsedError;
  String get defaultValue => throw _privateConstructorUsedError;

  /// Serializes this SelectorModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      SelectorQuery type,
      SelectorFunction function,
      String param,
      String regex,
      String replace,
      ScriptField script,
      String defaultValue});

  $SelectorQueryCopyWith<$Res> get type;
  $SelectorFunctionCopyWith<$Res> get function;
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

  /// Create a copy of SelectorModel
  /// with the given fields replaced by the non-null parameter values.
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
              as SelectorQuery,
      function: null == function
          ? _value.function
          : function // ignore: cast_nullable_to_non_nullable
              as SelectorFunction,
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

  /// Create a copy of SelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorQueryCopyWith<$Res> get type {
    return $SelectorQueryCopyWith<$Res>(_value.type, (value) {
      return _then(_value.copyWith(type: value) as $Val);
    });
  }

  /// Create a copy of SelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorFunctionCopyWith<$Res> get function {
    return $SelectorFunctionCopyWith<$Res>(_value.function, (value) {
      return _then(_value.copyWith(function: value) as $Val);
    });
  }

  /// Create a copy of SelectorModel
  /// with the given fields replaced by the non-null parameter values.
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
      SelectorQuery type,
      SelectorFunction function,
      String param,
      String regex,
      String replace,
      ScriptField script,
      String defaultValue});

  @override
  $SelectorQueryCopyWith<$Res> get type;
  @override
  $SelectorFunctionCopyWith<$Res> get function;
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

  /// Create a copy of SelectorModel
  /// with the given fields replaced by the non-null parameter values.
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
              as SelectorQuery,
      function: null == function
          ? _value.function
          : function // ignore: cast_nullable_to_non_nullable
              as SelectorFunction,
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
class _$SelectorModelImpl extends _SelectorModel {
  const _$SelectorModelImpl(
      {this.selector = '',
      this.type = const SelectorQuery.css(),
      this.function = const SelectorFunction.text(),
      this.param = '',
      this.regex = '',
      this.replace = '',
      this.script = const ScriptField.output(),
      this.defaultValue = ''})
      : super._();

  factory _$SelectorModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SelectorModelImplFromJson(json);

  @override
  @JsonKey()
  final String selector;
  @override
  @JsonKey()
  final SelectorQuery type;
  @override
  @JsonKey()
  final SelectorFunction function;
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, selector, type, function, param,
      regex, replace, script, defaultValue);

  /// Create a copy of SelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

abstract class _SelectorModel extends SelectorModel {
  const factory _SelectorModel(
      {final String selector,
      final SelectorQuery type,
      final SelectorFunction function,
      final String param,
      final String regex,
      final String replace,
      final ScriptField script,
      final String defaultValue}) = _$SelectorModelImpl;
  const _SelectorModel._() : super._();

  factory _SelectorModel.fromJson(Map<String, dynamic> json) =
      _$SelectorModelImpl.fromJson;

  @override
  String get selector;
  @override
  SelectorQuery get type;
  @override
  SelectorFunction get function;
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

  /// Create a copy of SelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Serializes this ImageSelectorModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ImageSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of ImageSelectorModel
  /// with the given fields replaced by the non-null parameter values.
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

  /// Create a copy of ImageSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get url {
    return $SelectorModelCopyWith<$Res>(_value.url, (value) {
      return _then(_value.copyWith(url: value) as $Val);
    });
  }

  /// Create a copy of ImageSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get width {
    return $SelectorModelCopyWith<$Res>(_value.width, (value) {
      return _then(_value.copyWith(width: value) as $Val);
    });
  }

  /// Create a copy of ImageSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get height {
    return $SelectorModelCopyWith<$Res>(_value.height, (value) {
      return _then(_value.copyWith(height: value) as $Val);
    });
  }

  /// Create a copy of ImageSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get x {
    return $SelectorModelCopyWith<$Res>(_value.x, (value) {
      return _then(_value.copyWith(x: value) as $Val);
    });
  }

  /// Create a copy of ImageSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get y {
    return $SelectorModelCopyWith<$Res>(_value.y, (value) {
      return _then(_value.copyWith(y: value) as $Val);
    });
  }

  /// Create a copy of ImageSelectorModel
  /// with the given fields replaced by the non-null parameter values.
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

  /// Create a copy of ImageSelectorModel
  /// with the given fields replaced by the non-null parameter values.
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, url, width, height, x, y, cacheKey);

  /// Create a copy of ImageSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of ImageSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Serializes this CommentSelectorModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommentSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of CommentSelectorModel
  /// with the given fields replaced by the non-null parameter values.
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

  /// Create a copy of CommentSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get username {
    return $SelectorModelCopyWith<$Res>(_value.username, (value) {
      return _then(_value.copyWith(username: value) as $Val);
    });
  }

  /// Create a copy of CommentSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get time {
    return $SelectorModelCopyWith<$Res>(_value.time, (value) {
      return _then(_value.copyWith(time: value) as $Val);
    });
  }

  /// Create a copy of CommentSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get content {
    return $SelectorModelCopyWith<$Res>(_value.content, (value) {
      return _then(_value.copyWith(content: value) as $Val);
    });
  }

  /// Create a copy of CommentSelectorModel
  /// with the given fields replaced by the non-null parameter values.
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

  /// Create a copy of CommentSelectorModel
  /// with the given fields replaced by the non-null parameter values.
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, username, time, content, avatar);

  /// Create a copy of CommentSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of CommentSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Serializes this ExtraSelectorModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExtraSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of ExtraSelectorModel
  /// with the given fields replaced by the non-null parameter values.
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

  /// Create a copy of ExtraSelectorModel
  /// with the given fields replaced by the non-null parameter values.
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

  /// Create a copy of ExtraSelectorModel
  /// with the given fields replaced by the non-null parameter values.
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, selector, id, persistence);

  /// Create a copy of ExtraSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of ExtraSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Serializes this TagSelectorModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TagSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of TagSelectorModel
  /// with the given fields replaced by the non-null parameter values.
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

  /// Create a copy of TagSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get text {
    return $SelectorModelCopyWith<$Res>(_value.text, (value) {
      return _then(_value.copyWith(text: value) as $Val);
    });
  }

  /// Create a copy of TagSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get color {
    return $SelectorModelCopyWith<$Res>(_value.color, (value) {
      return _then(_value.copyWith(color: value) as $Val);
    });
  }

  /// Create a copy of TagSelectorModel
  /// with the given fields replaced by the non-null parameter values.
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

  /// Create a copy of TagSelectorModel
  /// with the given fields replaced by the non-null parameter values.
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, text, color, category);

  /// Create a copy of TagSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of TagSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TagSelectorModelImplCopyWith<_$TagSelectorModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
