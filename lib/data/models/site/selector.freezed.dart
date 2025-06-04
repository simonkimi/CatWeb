// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selector.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
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
  /// Serializes this SelectorQuery to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SelectorQuery);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SelectorQuery()';
  }
}

/// @nodoc
class $SelectorQueryCopyWith<$Res> {
  $SelectorQueryCopyWith(SelectorQuery _, $Res Function(SelectorQuery) __);
}

/// @nodoc
@JsonSerializable()
class SelectorQuerySelf extends SelectorQuery {
  const SelectorQuerySelf({final String? $type})
      : $type = $type ?? 'self',
        super._();
  factory SelectorQuerySelf.fromJson(Map<String, dynamic> json) =>
      _$SelectorQuerySelfFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  Map<String, dynamic> toJson() {
    return _$SelectorQuerySelfToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SelectorQuerySelf);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SelectorQuery.self()';
  }
}

/// @nodoc
@JsonSerializable()
class SelectorQueryCss extends SelectorQuery {
  const SelectorQueryCss({this.css = '', final String? $type})
      : $type = $type ?? 'css',
        super._();
  factory SelectorQueryCss.fromJson(Map<String, dynamic> json) =>
      _$SelectorQueryCssFromJson(json);

  @JsonKey()
  final String css;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of SelectorQuery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SelectorQueryCssCopyWith<SelectorQueryCss> get copyWith =>
      _$SelectorQueryCssCopyWithImpl<SelectorQueryCss>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SelectorQueryCssToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SelectorQueryCss &&
            (identical(other.css, css) || other.css == css));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, css);

  @override
  String toString() {
    return 'SelectorQuery.css(css: $css)';
  }
}

/// @nodoc
abstract mixin class $SelectorQueryCssCopyWith<$Res>
    implements $SelectorQueryCopyWith<$Res> {
  factory $SelectorQueryCssCopyWith(
          SelectorQueryCss value, $Res Function(SelectorQueryCss) _then) =
      _$SelectorQueryCssCopyWithImpl;
  @useResult
  $Res call({String css});
}

/// @nodoc
class _$SelectorQueryCssCopyWithImpl<$Res>
    implements $SelectorQueryCssCopyWith<$Res> {
  _$SelectorQueryCssCopyWithImpl(this._self, this._then);

  final SelectorQueryCss _self;
  final $Res Function(SelectorQueryCss) _then;

  /// Create a copy of SelectorQuery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? css = null,
  }) {
    return _then(SelectorQueryCss(
      css: null == css
          ? _self.css
          : css // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class SelectorQueryXpath extends SelectorQuery {
  const SelectorQueryXpath({this.xpath = '', final String? $type})
      : $type = $type ?? 'xpath',
        super._();
  factory SelectorQueryXpath.fromJson(Map<String, dynamic> json) =>
      _$SelectorQueryXpathFromJson(json);

  @JsonKey()
  final String xpath;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of SelectorQuery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SelectorQueryXpathCopyWith<SelectorQueryXpath> get copyWith =>
      _$SelectorQueryXpathCopyWithImpl<SelectorQueryXpath>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SelectorQueryXpathToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SelectorQueryXpath &&
            (identical(other.xpath, xpath) || other.xpath == xpath));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, xpath);

  @override
  String toString() {
    return 'SelectorQuery.xpath(xpath: $xpath)';
  }
}

/// @nodoc
abstract mixin class $SelectorQueryXpathCopyWith<$Res>
    implements $SelectorQueryCopyWith<$Res> {
  factory $SelectorQueryXpathCopyWith(
          SelectorQueryXpath value, $Res Function(SelectorQueryXpath) _then) =
      _$SelectorQueryXpathCopyWithImpl;
  @useResult
  $Res call({String xpath});
}

/// @nodoc
class _$SelectorQueryXpathCopyWithImpl<$Res>
    implements $SelectorQueryXpathCopyWith<$Res> {
  _$SelectorQueryXpathCopyWithImpl(this._self, this._then);

  final SelectorQueryXpath _self;
  final $Res Function(SelectorQueryXpath) _then;

  /// Create a copy of SelectorQuery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? xpath = null,
  }) {
    return _then(SelectorQueryXpath(
      xpath: null == xpath
          ? _self.xpath
          : xpath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class SelectorQueryJsonPath extends SelectorQuery {
  const SelectorQueryJsonPath({this.jsonPath = '', final String? $type})
      : $type = $type ?? 'jsonPath',
        super._();
  factory SelectorQueryJsonPath.fromJson(Map<String, dynamic> json) =>
      _$SelectorQueryJsonPathFromJson(json);

  @JsonKey()
  final String jsonPath;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of SelectorQuery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SelectorQueryJsonPathCopyWith<SelectorQueryJsonPath> get copyWith =>
      _$SelectorQueryJsonPathCopyWithImpl<SelectorQueryJsonPath>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SelectorQueryJsonPathToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SelectorQueryJsonPath &&
            (identical(other.jsonPath, jsonPath) ||
                other.jsonPath == jsonPath));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, jsonPath);

  @override
  String toString() {
    return 'SelectorQuery.jsonPath(jsonPath: $jsonPath)';
  }
}

/// @nodoc
abstract mixin class $SelectorQueryJsonPathCopyWith<$Res>
    implements $SelectorQueryCopyWith<$Res> {
  factory $SelectorQueryJsonPathCopyWith(SelectorQueryJsonPath value,
          $Res Function(SelectorQueryJsonPath) _then) =
      _$SelectorQueryJsonPathCopyWithImpl;
  @useResult
  $Res call({String jsonPath});
}

/// @nodoc
class _$SelectorQueryJsonPathCopyWithImpl<$Res>
    implements $SelectorQueryJsonPathCopyWith<$Res> {
  _$SelectorQueryJsonPathCopyWithImpl(this._self, this._then);

  final SelectorQueryJsonPath _self;
  final $Res Function(SelectorQueryJsonPath) _then;

  /// Create a copy of SelectorQuery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? jsonPath = null,
  }) {
    return _then(SelectorQueryJsonPath(
      jsonPath: null == jsonPath
          ? _self.jsonPath
          : jsonPath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
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
  /// Serializes this SelectorFunction to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SelectorFunction);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SelectorFunction()';
  }
}

/// @nodoc
class $SelectorFunctionCopyWith<$Res> {
  $SelectorFunctionCopyWith(
      SelectorFunction _, $Res Function(SelectorFunction) __);
}

/// @nodoc
@JsonSerializable()
class SelectorFunctionText extends SelectorFunction {
  const SelectorFunctionText({final String? $type})
      : $type = $type ?? 'text',
        super._();
  factory SelectorFunctionText.fromJson(Map<String, dynamic> json) =>
      _$SelectorFunctionTextFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  Map<String, dynamic> toJson() {
    return _$SelectorFunctionTextToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SelectorFunctionText);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SelectorFunction.text()';
  }
}

/// @nodoc
@JsonSerializable()
class SelectorFunctionAttr extends SelectorFunction {
  const SelectorFunctionAttr({this.attr = '', final String? $type})
      : $type = $type ?? 'attr',
        super._();
  factory SelectorFunctionAttr.fromJson(Map<String, dynamic> json) =>
      _$SelectorFunctionAttrFromJson(json);

  @JsonKey()
  final String attr;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of SelectorFunction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SelectorFunctionAttrCopyWith<SelectorFunctionAttr> get copyWith =>
      _$SelectorFunctionAttrCopyWithImpl<SelectorFunctionAttr>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SelectorFunctionAttrToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SelectorFunctionAttr &&
            (identical(other.attr, attr) || other.attr == attr));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, attr);

  @override
  String toString() {
    return 'SelectorFunction.attr(attr: $attr)';
  }
}

/// @nodoc
abstract mixin class $SelectorFunctionAttrCopyWith<$Res>
    implements $SelectorFunctionCopyWith<$Res> {
  factory $SelectorFunctionAttrCopyWith(SelectorFunctionAttr value,
          $Res Function(SelectorFunctionAttr) _then) =
      _$SelectorFunctionAttrCopyWithImpl;
  @useResult
  $Res call({String attr});
}

/// @nodoc
class _$SelectorFunctionAttrCopyWithImpl<$Res>
    implements $SelectorFunctionAttrCopyWith<$Res> {
  _$SelectorFunctionAttrCopyWithImpl(this._self, this._then);

  final SelectorFunctionAttr _self;
  final $Res Function(SelectorFunctionAttr) _then;

  /// Create a copy of SelectorFunction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? attr = null,
  }) {
    return _then(SelectorFunctionAttr(
      attr: null == attr
          ? _self.attr
          : attr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class SelectorFunctionRaw extends SelectorFunction {
  const SelectorFunctionRaw({final String? $type})
      : $type = $type ?? 'raw',
        super._();
  factory SelectorFunctionRaw.fromJson(Map<String, dynamic> json) =>
      _$SelectorFunctionRawFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  Map<String, dynamic> toJson() {
    return _$SelectorFunctionRawToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SelectorFunctionRaw);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SelectorFunction.raw()';
  }
}

/// @nodoc
mixin _$SelectorModel {
  String get selector;
  SelectorQuery get type;
  SelectorFunction get function;
  String get param;
  String get regex;
  String get replace;
  ScriptField get script;
  String get defaultValue;

  /// Create a copy of SelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<SelectorModel> get copyWith =>
      _$SelectorModelCopyWithImpl<SelectorModel>(
          this as SelectorModel, _$identity);

  /// Serializes this SelectorModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SelectorModel &&
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

  @override
  String toString() {
    return 'SelectorModel(selector: $selector, type: $type, function: $function, param: $param, regex: $regex, replace: $replace, script: $script, defaultValue: $defaultValue)';
  }
}

/// @nodoc
abstract mixin class $SelectorModelCopyWith<$Res> {
  factory $SelectorModelCopyWith(
          SelectorModel value, $Res Function(SelectorModel) _then) =
      _$SelectorModelCopyWithImpl;
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
class _$SelectorModelCopyWithImpl<$Res>
    implements $SelectorModelCopyWith<$Res> {
  _$SelectorModelCopyWithImpl(this._self, this._then);

  final SelectorModel _self;
  final $Res Function(SelectorModel) _then;

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
    return _then(_self.copyWith(
      selector: null == selector
          ? _self.selector
          : selector // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as SelectorQuery,
      function: null == function
          ? _self.function
          : function // ignore: cast_nullable_to_non_nullable
              as SelectorFunction,
      param: null == param
          ? _self.param
          : param // ignore: cast_nullable_to_non_nullable
              as String,
      regex: null == regex
          ? _self.regex
          : regex // ignore: cast_nullable_to_non_nullable
              as String,
      replace: null == replace
          ? _self.replace
          : replace // ignore: cast_nullable_to_non_nullable
              as String,
      script: null == script
          ? _self.script
          : script // ignore: cast_nullable_to_non_nullable
              as ScriptField,
      defaultValue: null == defaultValue
          ? _self.defaultValue
          : defaultValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of SelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorQueryCopyWith<$Res> get type {
    return $SelectorQueryCopyWith<$Res>(_self.type, (value) {
      return _then(_self.copyWith(type: value));
    });
  }

  /// Create a copy of SelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorFunctionCopyWith<$Res> get function {
    return $SelectorFunctionCopyWith<$Res>(_self.function, (value) {
      return _then(_self.copyWith(function: value));
    });
  }

  /// Create a copy of SelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ScriptFieldCopyWith<$Res> get script {
    return $ScriptFieldCopyWith<$Res>(_self.script, (value) {
      return _then(_self.copyWith(script: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _SelectorModel extends SelectorModel {
  const _SelectorModel(
      {this.selector = '',
      this.type = const SelectorQuery.css(),
      this.function = const SelectorFunction.text(),
      this.param = '',
      this.regex = '',
      this.replace = '',
      this.script = const ScriptField.output(),
      this.defaultValue = ''})
      : super._();
  factory _SelectorModel.fromJson(Map<String, dynamic> json) =>
      _$SelectorModelFromJson(json);

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

  /// Create a copy of SelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SelectorModelCopyWith<_SelectorModel> get copyWith =>
      __$SelectorModelCopyWithImpl<_SelectorModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SelectorModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SelectorModel &&
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

  @override
  String toString() {
    return 'SelectorModel(selector: $selector, type: $type, function: $function, param: $param, regex: $regex, replace: $replace, script: $script, defaultValue: $defaultValue)';
  }
}

/// @nodoc
abstract mixin class _$SelectorModelCopyWith<$Res>
    implements $SelectorModelCopyWith<$Res> {
  factory _$SelectorModelCopyWith(
          _SelectorModel value, $Res Function(_SelectorModel) _then) =
      __$SelectorModelCopyWithImpl;
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
class __$SelectorModelCopyWithImpl<$Res>
    implements _$SelectorModelCopyWith<$Res> {
  __$SelectorModelCopyWithImpl(this._self, this._then);

  final _SelectorModel _self;
  final $Res Function(_SelectorModel) _then;

  /// Create a copy of SelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_SelectorModel(
      selector: null == selector
          ? _self.selector
          : selector // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as SelectorQuery,
      function: null == function
          ? _self.function
          : function // ignore: cast_nullable_to_non_nullable
              as SelectorFunction,
      param: null == param
          ? _self.param
          : param // ignore: cast_nullable_to_non_nullable
              as String,
      regex: null == regex
          ? _self.regex
          : regex // ignore: cast_nullable_to_non_nullable
              as String,
      replace: null == replace
          ? _self.replace
          : replace // ignore: cast_nullable_to_non_nullable
              as String,
      script: null == script
          ? _self.script
          : script // ignore: cast_nullable_to_non_nullable
              as ScriptField,
      defaultValue: null == defaultValue
          ? _self.defaultValue
          : defaultValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of SelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorQueryCopyWith<$Res> get type {
    return $SelectorQueryCopyWith<$Res>(_self.type, (value) {
      return _then(_self.copyWith(type: value));
    });
  }

  /// Create a copy of SelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorFunctionCopyWith<$Res> get function {
    return $SelectorFunctionCopyWith<$Res>(_self.function, (value) {
      return _then(_self.copyWith(function: value));
    });
  }

  /// Create a copy of SelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ScriptFieldCopyWith<$Res> get script {
    return $ScriptFieldCopyWith<$Res>(_self.script, (value) {
      return _then(_self.copyWith(script: value));
    });
  }
}

/// @nodoc
mixin _$ImageSelectorModel {
  SelectorModel get url;
  SelectorModel get width;
  SelectorModel get height;
  SelectorModel get x;
  SelectorModel get y;
  SelectorModel get cacheKey;

  /// Create a copy of ImageSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ImageSelectorModelCopyWith<ImageSelectorModel> get copyWith =>
      _$ImageSelectorModelCopyWithImpl<ImageSelectorModel>(
          this as ImageSelectorModel, _$identity);

  /// Serializes this ImageSelectorModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ImageSelectorModel &&
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

  @override
  String toString() {
    return 'ImageSelectorModel(url: $url, width: $width, height: $height, x: $x, y: $y, cacheKey: $cacheKey)';
  }
}

/// @nodoc
abstract mixin class $ImageSelectorModelCopyWith<$Res> {
  factory $ImageSelectorModelCopyWith(
          ImageSelectorModel value, $Res Function(ImageSelectorModel) _then) =
      _$ImageSelectorModelCopyWithImpl;
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
class _$ImageSelectorModelCopyWithImpl<$Res>
    implements $ImageSelectorModelCopyWith<$Res> {
  _$ImageSelectorModelCopyWithImpl(this._self, this._then);

  final ImageSelectorModel _self;
  final $Res Function(ImageSelectorModel) _then;

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
    return _then(_self.copyWith(
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      width: null == width
          ? _self.width
          : width // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      height: null == height
          ? _self.height
          : height // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      x: null == x
          ? _self.x
          : x // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      y: null == y
          ? _self.y
          : y // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      cacheKey: null == cacheKey
          ? _self.cacheKey
          : cacheKey // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
    ));
  }

  /// Create a copy of ImageSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get url {
    return $SelectorModelCopyWith<$Res>(_self.url, (value) {
      return _then(_self.copyWith(url: value));
    });
  }

  /// Create a copy of ImageSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get width {
    return $SelectorModelCopyWith<$Res>(_self.width, (value) {
      return _then(_self.copyWith(width: value));
    });
  }

  /// Create a copy of ImageSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get height {
    return $SelectorModelCopyWith<$Res>(_self.height, (value) {
      return _then(_self.copyWith(height: value));
    });
  }

  /// Create a copy of ImageSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get x {
    return $SelectorModelCopyWith<$Res>(_self.x, (value) {
      return _then(_self.copyWith(x: value));
    });
  }

  /// Create a copy of ImageSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get y {
    return $SelectorModelCopyWith<$Res>(_self.y, (value) {
      return _then(_self.copyWith(y: value));
    });
  }

  /// Create a copy of ImageSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get cacheKey {
    return $SelectorModelCopyWith<$Res>(_self.cacheKey, (value) {
      return _then(_self.copyWith(cacheKey: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _ImageSelectorModel implements ImageSelectorModel {
  const _ImageSelectorModel(
      {this.url = const SelectorModel(),
      this.width = const SelectorModel(),
      this.height = const SelectorModel(),
      this.x = const SelectorModel(),
      this.y = const SelectorModel(),
      this.cacheKey = const SelectorModel()});
  factory _ImageSelectorModel.fromJson(Map<String, dynamic> json) =>
      _$ImageSelectorModelFromJson(json);

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

  /// Create a copy of ImageSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ImageSelectorModelCopyWith<_ImageSelectorModel> get copyWith =>
      __$ImageSelectorModelCopyWithImpl<_ImageSelectorModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ImageSelectorModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ImageSelectorModel &&
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

  @override
  String toString() {
    return 'ImageSelectorModel(url: $url, width: $width, height: $height, x: $x, y: $y, cacheKey: $cacheKey)';
  }
}

/// @nodoc
abstract mixin class _$ImageSelectorModelCopyWith<$Res>
    implements $ImageSelectorModelCopyWith<$Res> {
  factory _$ImageSelectorModelCopyWith(
          _ImageSelectorModel value, $Res Function(_ImageSelectorModel) _then) =
      __$ImageSelectorModelCopyWithImpl;
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
class __$ImageSelectorModelCopyWithImpl<$Res>
    implements _$ImageSelectorModelCopyWith<$Res> {
  __$ImageSelectorModelCopyWithImpl(this._self, this._then);

  final _ImageSelectorModel _self;
  final $Res Function(_ImageSelectorModel) _then;

  /// Create a copy of ImageSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? url = null,
    Object? width = null,
    Object? height = null,
    Object? x = null,
    Object? y = null,
    Object? cacheKey = null,
  }) {
    return _then(_ImageSelectorModel(
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      width: null == width
          ? _self.width
          : width // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      height: null == height
          ? _self.height
          : height // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      x: null == x
          ? _self.x
          : x // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      y: null == y
          ? _self.y
          : y // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      cacheKey: null == cacheKey
          ? _self.cacheKey
          : cacheKey // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
    ));
  }

  /// Create a copy of ImageSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get url {
    return $SelectorModelCopyWith<$Res>(_self.url, (value) {
      return _then(_self.copyWith(url: value));
    });
  }

  /// Create a copy of ImageSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get width {
    return $SelectorModelCopyWith<$Res>(_self.width, (value) {
      return _then(_self.copyWith(width: value));
    });
  }

  /// Create a copy of ImageSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get height {
    return $SelectorModelCopyWith<$Res>(_self.height, (value) {
      return _then(_self.copyWith(height: value));
    });
  }

  /// Create a copy of ImageSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get x {
    return $SelectorModelCopyWith<$Res>(_self.x, (value) {
      return _then(_self.copyWith(x: value));
    });
  }

  /// Create a copy of ImageSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get y {
    return $SelectorModelCopyWith<$Res>(_self.y, (value) {
      return _then(_self.copyWith(y: value));
    });
  }

  /// Create a copy of ImageSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get cacheKey {
    return $SelectorModelCopyWith<$Res>(_self.cacheKey, (value) {
      return _then(_self.copyWith(cacheKey: value));
    });
  }
}

/// @nodoc
mixin _$CommentSelectorModel {
  SelectorModel get username;
  SelectorModel get time;
  SelectorModel get content;
  SelectorModel get avatar;

  /// Create a copy of CommentSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CommentSelectorModelCopyWith<CommentSelectorModel> get copyWith =>
      _$CommentSelectorModelCopyWithImpl<CommentSelectorModel>(
          this as CommentSelectorModel, _$identity);

  /// Serializes this CommentSelectorModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CommentSelectorModel &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, username, time, content, avatar);

  @override
  String toString() {
    return 'CommentSelectorModel(username: $username, time: $time, content: $content, avatar: $avatar)';
  }
}

/// @nodoc
abstract mixin class $CommentSelectorModelCopyWith<$Res> {
  factory $CommentSelectorModelCopyWith(CommentSelectorModel value,
          $Res Function(CommentSelectorModel) _then) =
      _$CommentSelectorModelCopyWithImpl;
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
class _$CommentSelectorModelCopyWithImpl<$Res>
    implements $CommentSelectorModelCopyWith<$Res> {
  _$CommentSelectorModelCopyWithImpl(this._self, this._then);

  final CommentSelectorModel _self;
  final $Res Function(CommentSelectorModel) _then;

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
    return _then(_self.copyWith(
      username: null == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      avatar: null == avatar
          ? _self.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
    ));
  }

  /// Create a copy of CommentSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get username {
    return $SelectorModelCopyWith<$Res>(_self.username, (value) {
      return _then(_self.copyWith(username: value));
    });
  }

  /// Create a copy of CommentSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get time {
    return $SelectorModelCopyWith<$Res>(_self.time, (value) {
      return _then(_self.copyWith(time: value));
    });
  }

  /// Create a copy of CommentSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get content {
    return $SelectorModelCopyWith<$Res>(_self.content, (value) {
      return _then(_self.copyWith(content: value));
    });
  }

  /// Create a copy of CommentSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get avatar {
    return $SelectorModelCopyWith<$Res>(_self.avatar, (value) {
      return _then(_self.copyWith(avatar: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _CommentSelectorModel implements CommentSelectorModel {
  const _CommentSelectorModel(
      {this.username = const SelectorModel(),
      this.time = const SelectorModel(),
      this.content = const SelectorModel(),
      this.avatar = const SelectorModel()});
  factory _CommentSelectorModel.fromJson(Map<String, dynamic> json) =>
      _$CommentSelectorModelFromJson(json);

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

  /// Create a copy of CommentSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CommentSelectorModelCopyWith<_CommentSelectorModel> get copyWith =>
      __$CommentSelectorModelCopyWithImpl<_CommentSelectorModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CommentSelectorModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CommentSelectorModel &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, username, time, content, avatar);

  @override
  String toString() {
    return 'CommentSelectorModel(username: $username, time: $time, content: $content, avatar: $avatar)';
  }
}

/// @nodoc
abstract mixin class _$CommentSelectorModelCopyWith<$Res>
    implements $CommentSelectorModelCopyWith<$Res> {
  factory _$CommentSelectorModelCopyWith(_CommentSelectorModel value,
          $Res Function(_CommentSelectorModel) _then) =
      __$CommentSelectorModelCopyWithImpl;
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
class __$CommentSelectorModelCopyWithImpl<$Res>
    implements _$CommentSelectorModelCopyWith<$Res> {
  __$CommentSelectorModelCopyWithImpl(this._self, this._then);

  final _CommentSelectorModel _self;
  final $Res Function(_CommentSelectorModel) _then;

  /// Create a copy of CommentSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? username = null,
    Object? time = null,
    Object? content = null,
    Object? avatar = null,
  }) {
    return _then(_CommentSelectorModel(
      username: null == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      avatar: null == avatar
          ? _self.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
    ));
  }

  /// Create a copy of CommentSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get username {
    return $SelectorModelCopyWith<$Res>(_self.username, (value) {
      return _then(_self.copyWith(username: value));
    });
  }

  /// Create a copy of CommentSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get time {
    return $SelectorModelCopyWith<$Res>(_self.time, (value) {
      return _then(_self.copyWith(time: value));
    });
  }

  /// Create a copy of CommentSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get content {
    return $SelectorModelCopyWith<$Res>(_self.content, (value) {
      return _then(_self.copyWith(content: value));
    });
  }

  /// Create a copy of CommentSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get avatar {
    return $SelectorModelCopyWith<$Res>(_self.avatar, (value) {
      return _then(_self.copyWith(avatar: value));
    });
  }
}

/// @nodoc
mixin _$ExtraSelectorModel {
  SelectorModel get selector;
  String get id;
  bool get persistence;

  /// Create a copy of ExtraSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExtraSelectorModelCopyWith<ExtraSelectorModel> get copyWith =>
      _$ExtraSelectorModelCopyWithImpl<ExtraSelectorModel>(
          this as ExtraSelectorModel, _$identity);

  /// Serializes this ExtraSelectorModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExtraSelectorModel &&
            (identical(other.selector, selector) ||
                other.selector == selector) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.persistence, persistence) ||
                other.persistence == persistence));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, selector, id, persistence);

  @override
  String toString() {
    return 'ExtraSelectorModel(selector: $selector, id: $id, persistence: $persistence)';
  }
}

/// @nodoc
abstract mixin class $ExtraSelectorModelCopyWith<$Res> {
  factory $ExtraSelectorModelCopyWith(
          ExtraSelectorModel value, $Res Function(ExtraSelectorModel) _then) =
      _$ExtraSelectorModelCopyWithImpl;
  @useResult
  $Res call({SelectorModel selector, String id, bool persistence});

  $SelectorModelCopyWith<$Res> get selector;
}

/// @nodoc
class _$ExtraSelectorModelCopyWithImpl<$Res>
    implements $ExtraSelectorModelCopyWith<$Res> {
  _$ExtraSelectorModelCopyWithImpl(this._self, this._then);

  final ExtraSelectorModel _self;
  final $Res Function(ExtraSelectorModel) _then;

  /// Create a copy of ExtraSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selector = null,
    Object? id = null,
    Object? persistence = null,
  }) {
    return _then(_self.copyWith(
      selector: null == selector
          ? _self.selector
          : selector // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      persistence: null == persistence
          ? _self.persistence
          : persistence // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of ExtraSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get selector {
    return $SelectorModelCopyWith<$Res>(_self.selector, (value) {
      return _then(_self.copyWith(selector: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _ExtraSelectorModel implements ExtraSelectorModel {
  const _ExtraSelectorModel(
      {this.selector = const SelectorModel(),
      this.id = '',
      this.persistence = false});
  factory _ExtraSelectorModel.fromJson(Map<String, dynamic> json) =>
      _$ExtraSelectorModelFromJson(json);

  @override
  @JsonKey()
  final SelectorModel selector;
  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final bool persistence;

  /// Create a copy of ExtraSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ExtraSelectorModelCopyWith<_ExtraSelectorModel> get copyWith =>
      __$ExtraSelectorModelCopyWithImpl<_ExtraSelectorModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ExtraSelectorModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ExtraSelectorModel &&
            (identical(other.selector, selector) ||
                other.selector == selector) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.persistence, persistence) ||
                other.persistence == persistence));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, selector, id, persistence);

  @override
  String toString() {
    return 'ExtraSelectorModel(selector: $selector, id: $id, persistence: $persistence)';
  }
}

/// @nodoc
abstract mixin class _$ExtraSelectorModelCopyWith<$Res>
    implements $ExtraSelectorModelCopyWith<$Res> {
  factory _$ExtraSelectorModelCopyWith(
          _ExtraSelectorModel value, $Res Function(_ExtraSelectorModel) _then) =
      __$ExtraSelectorModelCopyWithImpl;
  @override
  @useResult
  $Res call({SelectorModel selector, String id, bool persistence});

  @override
  $SelectorModelCopyWith<$Res> get selector;
}

/// @nodoc
class __$ExtraSelectorModelCopyWithImpl<$Res>
    implements _$ExtraSelectorModelCopyWith<$Res> {
  __$ExtraSelectorModelCopyWithImpl(this._self, this._then);

  final _ExtraSelectorModel _self;
  final $Res Function(_ExtraSelectorModel) _then;

  /// Create a copy of ExtraSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? selector = null,
    Object? id = null,
    Object? persistence = null,
  }) {
    return _then(_ExtraSelectorModel(
      selector: null == selector
          ? _self.selector
          : selector // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      persistence: null == persistence
          ? _self.persistence
          : persistence // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of ExtraSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get selector {
    return $SelectorModelCopyWith<$Res>(_self.selector, (value) {
      return _then(_self.copyWith(selector: value));
    });
  }
}

/// @nodoc
mixin _$TagSelectorModel {
  SelectorModel get text;
  SelectorModel get color;
  SelectorModel get category;

  /// Create a copy of TagSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TagSelectorModelCopyWith<TagSelectorModel> get copyWith =>
      _$TagSelectorModelCopyWithImpl<TagSelectorModel>(
          this as TagSelectorModel, _$identity);

  /// Serializes this TagSelectorModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TagSelectorModel &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, text, color, category);

  @override
  String toString() {
    return 'TagSelectorModel(text: $text, color: $color, category: $category)';
  }
}

/// @nodoc
abstract mixin class $TagSelectorModelCopyWith<$Res> {
  factory $TagSelectorModelCopyWith(
          TagSelectorModel value, $Res Function(TagSelectorModel) _then) =
      _$TagSelectorModelCopyWithImpl;
  @useResult
  $Res call({SelectorModel text, SelectorModel color, SelectorModel category});

  $SelectorModelCopyWith<$Res> get text;
  $SelectorModelCopyWith<$Res> get color;
  $SelectorModelCopyWith<$Res> get category;
}

/// @nodoc
class _$TagSelectorModelCopyWithImpl<$Res>
    implements $TagSelectorModelCopyWith<$Res> {
  _$TagSelectorModelCopyWithImpl(this._self, this._then);

  final TagSelectorModel _self;
  final $Res Function(TagSelectorModel) _then;

  /// Create a copy of TagSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? color = null,
    Object? category = null,
  }) {
    return _then(_self.copyWith(
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      color: null == color
          ? _self.color
          : color // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
    ));
  }

  /// Create a copy of TagSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get text {
    return $SelectorModelCopyWith<$Res>(_self.text, (value) {
      return _then(_self.copyWith(text: value));
    });
  }

  /// Create a copy of TagSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get color {
    return $SelectorModelCopyWith<$Res>(_self.color, (value) {
      return _then(_self.copyWith(color: value));
    });
  }

  /// Create a copy of TagSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get category {
    return $SelectorModelCopyWith<$Res>(_self.category, (value) {
      return _then(_self.copyWith(category: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _TagSelectorModel implements TagSelectorModel {
  const _TagSelectorModel(
      {this.text = const SelectorModel(),
      this.color = const SelectorModel(),
      this.category = const SelectorModel()});
  factory _TagSelectorModel.fromJson(Map<String, dynamic> json) =>
      _$TagSelectorModelFromJson(json);

  @override
  @JsonKey()
  final SelectorModel text;
  @override
  @JsonKey()
  final SelectorModel color;
  @override
  @JsonKey()
  final SelectorModel category;

  /// Create a copy of TagSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TagSelectorModelCopyWith<_TagSelectorModel> get copyWith =>
      __$TagSelectorModelCopyWithImpl<_TagSelectorModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TagSelectorModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TagSelectorModel &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, text, color, category);

  @override
  String toString() {
    return 'TagSelectorModel(text: $text, color: $color, category: $category)';
  }
}

/// @nodoc
abstract mixin class _$TagSelectorModelCopyWith<$Res>
    implements $TagSelectorModelCopyWith<$Res> {
  factory _$TagSelectorModelCopyWith(
          _TagSelectorModel value, $Res Function(_TagSelectorModel) _then) =
      __$TagSelectorModelCopyWithImpl;
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
class __$TagSelectorModelCopyWithImpl<$Res>
    implements _$TagSelectorModelCopyWith<$Res> {
  __$TagSelectorModelCopyWithImpl(this._self, this._then);

  final _TagSelectorModel _self;
  final $Res Function(_TagSelectorModel) _then;

  /// Create a copy of TagSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? text = null,
    Object? color = null,
    Object? category = null,
  }) {
    return _then(_TagSelectorModel(
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      color: null == color
          ? _self.color
          : color // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
    ));
  }

  /// Create a copy of TagSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get text {
    return $SelectorModelCopyWith<$Res>(_self.text, (value) {
      return _then(_self.copyWith(text: value));
    });
  }

  /// Create a copy of TagSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get color {
    return $SelectorModelCopyWith<$Res>(_self.color, (value) {
      return _then(_self.copyWith(color: value));
    });
  }

  /// Create a copy of TagSelectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get category {
    return $SelectorModelCopyWith<$Res>(_self.category, (value) {
      return _then(_self.copyWith(category: value));
    });
  }
}

// dart format on
