// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'field.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RegField {
  String get reg;
  String get value;

  /// Create a copy of RegField
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RegFieldCopyWith<RegField> get copyWith =>
      _$RegFieldCopyWithImpl<RegField>(this as RegField, _$identity);

  /// Serializes this RegField to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RegField &&
            (identical(other.reg, reg) || other.reg == reg) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, reg, value);

  @override
  String toString() {
    return 'RegField(reg: $reg, value: $value)';
  }
}

/// @nodoc
abstract mixin class $RegFieldCopyWith<$Res> {
  factory $RegFieldCopyWith(RegField value, $Res Function(RegField) _then) =
      _$RegFieldCopyWithImpl;
  @useResult
  $Res call({String reg, String value});
}

/// @nodoc
class _$RegFieldCopyWithImpl<$Res> implements $RegFieldCopyWith<$Res> {
  _$RegFieldCopyWithImpl(this._self, this._then);

  final RegField _self;
  final $Res Function(RegField) _then;

  /// Create a copy of RegField
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reg = null,
    Object? value = null,
  }) {
    return _then(_self.copyWith(
      reg: null == reg
          ? _self.reg
          : reg // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _RegField implements RegField {
  const _RegField({this.reg = '', this.value = ''});
  factory _RegField.fromJson(Map<String, dynamic> json) =>
      _$RegFieldFromJson(json);

  @override
  @JsonKey()
  final String reg;
  @override
  @JsonKey()
  final String value;

  /// Create a copy of RegField
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RegFieldCopyWith<_RegField> get copyWith =>
      __$RegFieldCopyWithImpl<_RegField>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RegFieldToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RegField &&
            (identical(other.reg, reg) || other.reg == reg) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, reg, value);

  @override
  String toString() {
    return 'RegField(reg: $reg, value: $value)';
  }
}

/// @nodoc
abstract mixin class _$RegFieldCopyWith<$Res>
    implements $RegFieldCopyWith<$Res> {
  factory _$RegFieldCopyWith(_RegField value, $Res Function(_RegField) _then) =
      __$RegFieldCopyWithImpl;
  @override
  @useResult
  $Res call({String reg, String value});
}

/// @nodoc
class __$RegFieldCopyWithImpl<$Res> implements _$RegFieldCopyWith<$Res> {
  __$RegFieldCopyWithImpl(this._self, this._then);

  final _RegField _self;
  final $Res Function(_RegField) _then;

  /// Create a copy of RegField
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? reg = null,
    Object? value = null,
  }) {
    return _then(_RegField(
      reg: null == reg
          ? _self.reg
          : reg // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

ScriptField _$ScriptFieldFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'output':
      return ScriptFieldOutput.fromJson(json);
    case 'replace':
      return ScriptFieldReplace.fromJson(json);
    case 'js':
      return ScriptFieldJs.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'ScriptField',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$ScriptField {
  /// Serializes this ScriptField to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ScriptField);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ScriptField()';
  }
}

/// @nodoc
class $ScriptFieldCopyWith<$Res> {
  $ScriptFieldCopyWith(ScriptField _, $Res Function(ScriptField) __);
}

/// @nodoc
@JsonSerializable()
class ScriptFieldOutput extends ScriptField {
  const ScriptFieldOutput({final String? $type})
      : $type = $type ?? 'output',
        super._();
  factory ScriptFieldOutput.fromJson(Map<String, dynamic> json) =>
      _$ScriptFieldOutputFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  Map<String, dynamic> toJson() {
    return _$ScriptFieldOutputToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ScriptFieldOutput);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ScriptField.output()';
  }
}

/// @nodoc
@JsonSerializable()
class ScriptFieldReplace extends ScriptField {
  const ScriptFieldReplace(
      {final Map<String, String> replace = const {}, final String? $type})
      : _replace = replace,
        $type = $type ?? 'replace',
        super._();
  factory ScriptFieldReplace.fromJson(Map<String, dynamic> json) =>
      _$ScriptFieldReplaceFromJson(json);

  final Map<String, String> _replace;
  @JsonKey()
  Map<String, String> get replace {
    if (_replace is EqualUnmodifiableMapView) return _replace;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_replace);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of ScriptField
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ScriptFieldReplaceCopyWith<ScriptFieldReplace> get copyWith =>
      _$ScriptFieldReplaceCopyWithImpl<ScriptFieldReplace>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ScriptFieldReplaceToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ScriptFieldReplace &&
            const DeepCollectionEquality().equals(other._replace, _replace));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_replace));

  @override
  String toString() {
    return 'ScriptField.replace(replace: $replace)';
  }
}

/// @nodoc
abstract mixin class $ScriptFieldReplaceCopyWith<$Res>
    implements $ScriptFieldCopyWith<$Res> {
  factory $ScriptFieldReplaceCopyWith(
          ScriptFieldReplace value, $Res Function(ScriptFieldReplace) _then) =
      _$ScriptFieldReplaceCopyWithImpl;
  @useResult
  $Res call({Map<String, String> replace});
}

/// @nodoc
class _$ScriptFieldReplaceCopyWithImpl<$Res>
    implements $ScriptFieldReplaceCopyWith<$Res> {
  _$ScriptFieldReplaceCopyWithImpl(this._self, this._then);

  final ScriptFieldReplace _self;
  final $Res Function(ScriptFieldReplace) _then;

  /// Create a copy of ScriptField
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? replace = null,
  }) {
    return _then(ScriptFieldReplace(
      replace: null == replace
          ? _self._replace
          : replace // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class ScriptFieldJs extends ScriptField {
  const ScriptFieldJs({this.script = '', final String? $type})
      : $type = $type ?? 'js',
        super._();
  factory ScriptFieldJs.fromJson(Map<String, dynamic> json) =>
      _$ScriptFieldJsFromJson(json);

  @JsonKey()
  final String script;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of ScriptField
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ScriptFieldJsCopyWith<ScriptFieldJs> get copyWith =>
      _$ScriptFieldJsCopyWithImpl<ScriptFieldJs>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ScriptFieldJsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ScriptFieldJs &&
            (identical(other.script, script) || other.script == script));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, script);

  @override
  String toString() {
    return 'ScriptField.js(script: $script)';
  }
}

/// @nodoc
abstract mixin class $ScriptFieldJsCopyWith<$Res>
    implements $ScriptFieldCopyWith<$Res> {
  factory $ScriptFieldJsCopyWith(
          ScriptFieldJs value, $Res Function(ScriptFieldJs) _then) =
      _$ScriptFieldJsCopyWithImpl;
  @useResult
  $Res call({String script});
}

/// @nodoc
class _$ScriptFieldJsCopyWithImpl<$Res>
    implements $ScriptFieldJsCopyWith<$Res> {
  _$ScriptFieldJsCopyWithImpl(this._self, this._then);

  final ScriptFieldJs _self;
  final $Res Function(ScriptFieldJs) _then;

  /// Create a copy of ScriptField
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? script = null,
  }) {
    return _then(ScriptFieldJs(
      script: null == script
          ? _self.script
          : script // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$ColorField {
  int get a;
  int get r;
  int get g;
  int get b;

  /// Create a copy of ColorField
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ColorFieldCopyWith<ColorField> get copyWith =>
      _$ColorFieldCopyWithImpl<ColorField>(this as ColorField, _$identity);

  /// Serializes this ColorField to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ColorField &&
            (identical(other.a, a) || other.a == a) &&
            (identical(other.r, r) || other.r == r) &&
            (identical(other.g, g) || other.g == g) &&
            (identical(other.b, b) || other.b == b));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, a, r, g, b);

  @override
  String toString() {
    return 'ColorField(a: $a, r: $r, g: $g, b: $b)';
  }
}

/// @nodoc
abstract mixin class $ColorFieldCopyWith<$Res> {
  factory $ColorFieldCopyWith(
          ColorField value, $Res Function(ColorField) _then) =
      _$ColorFieldCopyWithImpl;
  @useResult
  $Res call({int a, int r, int g, int b});
}

/// @nodoc
class _$ColorFieldCopyWithImpl<$Res> implements $ColorFieldCopyWith<$Res> {
  _$ColorFieldCopyWithImpl(this._self, this._then);

  final ColorField _self;
  final $Res Function(ColorField) _then;

  /// Create a copy of ColorField
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? a = null,
    Object? r = null,
    Object? g = null,
    Object? b = null,
  }) {
    return _then(_self.copyWith(
      a: null == a
          ? _self.a
          : a // ignore: cast_nullable_to_non_nullable
              as int,
      r: null == r
          ? _self.r
          : r // ignore: cast_nullable_to_non_nullable
              as int,
      g: null == g
          ? _self.g
          : g // ignore: cast_nullable_to_non_nullable
              as int,
      b: null == b
          ? _self.b
          : b // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ColorField implements ColorField {
  const _ColorField({this.a = 0, this.r = 0, this.g = 0, this.b = 0});
  factory _ColorField.fromJson(Map<String, dynamic> json) =>
      _$ColorFieldFromJson(json);

  @override
  @JsonKey()
  final int a;
  @override
  @JsonKey()
  final int r;
  @override
  @JsonKey()
  final int g;
  @override
  @JsonKey()
  final int b;

  /// Create a copy of ColorField
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ColorFieldCopyWith<_ColorField> get copyWith =>
      __$ColorFieldCopyWithImpl<_ColorField>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ColorFieldToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ColorField &&
            (identical(other.a, a) || other.a == a) &&
            (identical(other.r, r) || other.r == r) &&
            (identical(other.g, g) || other.g == g) &&
            (identical(other.b, b) || other.b == b));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, a, r, g, b);

  @override
  String toString() {
    return 'ColorField(a: $a, r: $r, g: $g, b: $b)';
  }
}

/// @nodoc
abstract mixin class _$ColorFieldCopyWith<$Res>
    implements $ColorFieldCopyWith<$Res> {
  factory _$ColorFieldCopyWith(
          _ColorField value, $Res Function(_ColorField) _then) =
      __$ColorFieldCopyWithImpl;
  @override
  @useResult
  $Res call({int a, int r, int g, int b});
}

/// @nodoc
class __$ColorFieldCopyWithImpl<$Res> implements _$ColorFieldCopyWith<$Res> {
  __$ColorFieldCopyWithImpl(this._self, this._then);

  final _ColorField _self;
  final $Res Function(_ColorField) _then;

  /// Create a copy of ColorField
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? a = null,
    Object? r = null,
    Object? g = null,
    Object? b = null,
  }) {
    return _then(_ColorField(
      a: null == a
          ? _self.a
          : a // ignore: cast_nullable_to_non_nullable
              as int,
      r: null == r
          ? _self.r
          : r // ignore: cast_nullable_to_non_nullable
              as int,
      g: null == g
          ? _self.g
          : g // ignore: cast_nullable_to_non_nullable
              as int,
      b: null == b
          ? _self.b
          : b // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
