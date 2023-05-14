// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'field.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RegField _$RegFieldFromJson(Map<String, dynamic> json) {
  return _RegField.fromJson(json);
}

/// @nodoc
mixin _$RegField {
  String? get reg => throw _privateConstructorUsedError;
  String? get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegFieldCopyWith<RegField> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegFieldCopyWith<$Res> {
  factory $RegFieldCopyWith(RegField value, $Res Function(RegField) then) =
      _$RegFieldCopyWithImpl<$Res, RegField>;
  @useResult
  $Res call({String? reg, String? value});
}

/// @nodoc
class _$RegFieldCopyWithImpl<$Res, $Val extends RegField>
    implements $RegFieldCopyWith<$Res> {
  _$RegFieldCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reg = freezed,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      reg: freezed == reg
          ? _value.reg
          : reg // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RegFieldCopyWith<$Res> implements $RegFieldCopyWith<$Res> {
  factory _$$_RegFieldCopyWith(
          _$_RegField value, $Res Function(_$_RegField) then) =
      __$$_RegFieldCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? reg, String? value});
}

/// @nodoc
class __$$_RegFieldCopyWithImpl<$Res>
    extends _$RegFieldCopyWithImpl<$Res, _$_RegField>
    implements _$$_RegFieldCopyWith<$Res> {
  __$$_RegFieldCopyWithImpl(
      _$_RegField _value, $Res Function(_$_RegField) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reg = freezed,
    Object? value = freezed,
  }) {
    return _then(_$_RegField(
      reg: freezed == reg
          ? _value.reg
          : reg // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RegField implements _RegField {
  const _$_RegField({this.reg = '', this.value = ''});

  factory _$_RegField.fromJson(Map<String, dynamic> json) =>
      _$$_RegFieldFromJson(json);

  @override
  @JsonKey()
  final String? reg;
  @override
  @JsonKey()
  final String? value;

  @override
  String toString() {
    return 'RegField(reg: $reg, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegField &&
            (identical(other.reg, reg) || other.reg == reg) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, reg, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegFieldCopyWith<_$_RegField> get copyWith =>
      __$$_RegFieldCopyWithImpl<_$_RegField>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RegFieldToJson(
      this,
    );
  }
}

abstract class _RegField implements RegField {
  const factory _RegField({final String? reg, final String? value}) =
      _$_RegField;

  factory _RegField.fromJson(Map<String, dynamic> json) = _$_RegField.fromJson;

  @override
  String? get reg;
  @override
  String? get value;
  @override
  @JsonKey(ignore: true)
  _$$_RegFieldCopyWith<_$_RegField> get copyWith =>
      throw _privateConstructorUsedError;
}

ColorField _$ColorFieldFromJson(Map<String, dynamic> json) {
  return _ColorField.fromJson(json);
}

/// @nodoc
mixin _$ColorField {
  int get a => throw _privateConstructorUsedError;
  int get r => throw _privateConstructorUsedError;
  int get g => throw _privateConstructorUsedError;
  int get b => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ColorFieldCopyWith<ColorField> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColorFieldCopyWith<$Res> {
  factory $ColorFieldCopyWith(
          ColorField value, $Res Function(ColorField) then) =
      _$ColorFieldCopyWithImpl<$Res, ColorField>;
  @useResult
  $Res call({int a, int r, int g, int b});
}

/// @nodoc
class _$ColorFieldCopyWithImpl<$Res, $Val extends ColorField>
    implements $ColorFieldCopyWith<$Res> {
  _$ColorFieldCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? a = null,
    Object? r = null,
    Object? g = null,
    Object? b = null,
  }) {
    return _then(_value.copyWith(
      a: null == a
          ? _value.a
          : a // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$_ColorFieldCopyWith<$Res>
    implements $ColorFieldCopyWith<$Res> {
  factory _$$_ColorFieldCopyWith(
          _$_ColorField value, $Res Function(_$_ColorField) then) =
      __$$_ColorFieldCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int a, int r, int g, int b});
}

/// @nodoc
class __$$_ColorFieldCopyWithImpl<$Res>
    extends _$ColorFieldCopyWithImpl<$Res, _$_ColorField>
    implements _$$_ColorFieldCopyWith<$Res> {
  __$$_ColorFieldCopyWithImpl(
      _$_ColorField _value, $Res Function(_$_ColorField) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? a = null,
    Object? r = null,
    Object? g = null,
    Object? b = null,
  }) {
    return _then(_$_ColorField(
      a: null == a
          ? _value.a
          : a // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$_ColorField implements _ColorField {
  const _$_ColorField(
      {required this.a, required this.r, required this.g, required this.b});

  factory _$_ColorField.fromJson(Map<String, dynamic> json) =>
      _$$_ColorFieldFromJson(json);

  @override
  final int a;
  @override
  final int r;
  @override
  final int g;
  @override
  final int b;

  @override
  String toString() {
    return 'ColorField(a: $a, r: $r, g: $g, b: $b)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ColorField &&
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
  _$$_ColorFieldCopyWith<_$_ColorField> get copyWith =>
      __$$_ColorFieldCopyWithImpl<_$_ColorField>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ColorFieldToJson(
      this,
    );
  }
}

abstract class _ColorField implements ColorField {
  const factory _ColorField(
      {required final int a,
      required final int r,
      required final int g,
      required final int b}) = _$_ColorField;

  factory _ColorField.fromJson(Map<String, dynamic> json) =
      _$_ColorField.fromJson;

  @override
  int get a;
  @override
  int get r;
  @override
  int get g;
  @override
  int get b;
  @override
  @JsonKey(ignore: true)
  _$$_ColorFieldCopyWith<_$_ColorField> get copyWith =>
      throw _privateConstructorUsedError;
}

ScriptField _$ScriptFieldFromJson(Map<String, dynamic> json) {
  return _ScriptField.fromJson(json);
}

/// @nodoc
mixin _$ScriptField {
  String get script => throw _privateConstructorUsedError;
  ScriptFieldType get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScriptFieldCopyWith<ScriptField> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScriptFieldCopyWith<$Res> {
  factory $ScriptFieldCopyWith(
          ScriptField value, $Res Function(ScriptField) then) =
      _$ScriptFieldCopyWithImpl<$Res, ScriptField>;
  @useResult
  $Res call({String script, ScriptFieldType type});
}

/// @nodoc
class _$ScriptFieldCopyWithImpl<$Res, $Val extends ScriptField>
    implements $ScriptFieldCopyWith<$Res> {
  _$ScriptFieldCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? script = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      script: null == script
          ? _value.script
          : script // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ScriptFieldType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ScriptFieldCopyWith<$Res>
    implements $ScriptFieldCopyWith<$Res> {
  factory _$$_ScriptFieldCopyWith(
          _$_ScriptField value, $Res Function(_$_ScriptField) then) =
      __$$_ScriptFieldCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String script, ScriptFieldType type});
}

/// @nodoc
class __$$_ScriptFieldCopyWithImpl<$Res>
    extends _$ScriptFieldCopyWithImpl<$Res, _$_ScriptField>
    implements _$$_ScriptFieldCopyWith<$Res> {
  __$$_ScriptFieldCopyWithImpl(
      _$_ScriptField _value, $Res Function(_$_ScriptField) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? script = null,
    Object? type = null,
  }) {
    return _then(_$_ScriptField(
      script: null == script
          ? _value.script
          : script // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ScriptFieldType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ScriptField implements _ScriptField {
  const _$_ScriptField({this.script = '', this.type = ScriptFieldType.output});

  factory _$_ScriptField.fromJson(Map<String, dynamic> json) =>
      _$$_ScriptFieldFromJson(json);

  @override
  @JsonKey()
  final String script;
  @override
  @JsonKey()
  final ScriptFieldType type;

  @override
  String toString() {
    return 'ScriptField(script: $script, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScriptField &&
            (identical(other.script, script) || other.script == script) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, script, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScriptFieldCopyWith<_$_ScriptField> get copyWith =>
      __$$_ScriptFieldCopyWithImpl<_$_ScriptField>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScriptFieldToJson(
      this,
    );
  }
}

abstract class _ScriptField implements ScriptField {
  const factory _ScriptField(
      {final String script, final ScriptFieldType type}) = _$_ScriptField;

  factory _ScriptField.fromJson(Map<String, dynamic> json) =
      _$_ScriptField.fromJson;

  @override
  String get script;
  @override
  ScriptFieldType get type;
  @override
  @JsonKey(ignore: true)
  _$$_ScriptFieldCopyWith<_$_ScriptField> get copyWith =>
      throw _privateConstructorUsedError;
}
