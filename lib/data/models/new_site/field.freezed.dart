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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RegField _$RegFieldFromJson(Map<String, dynamic> json) {
  return _RegField.fromJson(json);
}

/// @nodoc
mixin _$RegField {
  String get reg => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

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
  $Res call({String reg, String value});
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
    Object? reg = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      reg: null == reg
          ? _value.reg
          : reg // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegFieldImplCopyWith<$Res>
    implements $RegFieldCopyWith<$Res> {
  factory _$$RegFieldImplCopyWith(
          _$RegFieldImpl value, $Res Function(_$RegFieldImpl) then) =
      __$$RegFieldImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String reg, String value});
}

/// @nodoc
class __$$RegFieldImplCopyWithImpl<$Res>
    extends _$RegFieldCopyWithImpl<$Res, _$RegFieldImpl>
    implements _$$RegFieldImplCopyWith<$Res> {
  __$$RegFieldImplCopyWithImpl(
      _$RegFieldImpl _value, $Res Function(_$RegFieldImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reg = null,
    Object? value = null,
  }) {
    return _then(_$RegFieldImpl(
      reg: null == reg
          ? _value.reg
          : reg // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegFieldImpl implements _RegField {
  const _$RegFieldImpl({this.reg = '', this.value = ''});

  factory _$RegFieldImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegFieldImplFromJson(json);

  @override
  @JsonKey()
  final String reg;
  @override
  @JsonKey()
  final String value;

  @override
  String toString() {
    return 'RegField(reg: $reg, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegFieldImpl &&
            (identical(other.reg, reg) || other.reg == reg) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, reg, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegFieldImplCopyWith<_$RegFieldImpl> get copyWith =>
      __$$RegFieldImplCopyWithImpl<_$RegFieldImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegFieldImplToJson(
      this,
    );
  }
}

abstract class _RegField implements RegField {
  const factory _RegField({final String reg, final String value}) =
      _$RegFieldImpl;

  factory _RegField.fromJson(Map<String, dynamic> json) =
      _$RegFieldImpl.fromJson;

  @override
  String get reg;
  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$RegFieldImplCopyWith<_$RegFieldImpl> get copyWith =>
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
abstract class _$$ScriptFieldImplCopyWith<$Res>
    implements $ScriptFieldCopyWith<$Res> {
  factory _$$ScriptFieldImplCopyWith(
          _$ScriptFieldImpl value, $Res Function(_$ScriptFieldImpl) then) =
      __$$ScriptFieldImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String script, ScriptFieldType type});
}

/// @nodoc
class __$$ScriptFieldImplCopyWithImpl<$Res>
    extends _$ScriptFieldCopyWithImpl<$Res, _$ScriptFieldImpl>
    implements _$$ScriptFieldImplCopyWith<$Res> {
  __$$ScriptFieldImplCopyWithImpl(
      _$ScriptFieldImpl _value, $Res Function(_$ScriptFieldImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? script = null,
    Object? type = null,
  }) {
    return _then(_$ScriptFieldImpl(
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
class _$ScriptFieldImpl implements _ScriptField {
  const _$ScriptFieldImpl(
      {this.script = '', this.type = ScriptFieldType.output});

  factory _$ScriptFieldImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScriptFieldImplFromJson(json);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScriptFieldImpl &&
            (identical(other.script, script) || other.script == script) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, script, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScriptFieldImplCopyWith<_$ScriptFieldImpl> get copyWith =>
      __$$ScriptFieldImplCopyWithImpl<_$ScriptFieldImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScriptFieldImplToJson(
      this,
    );
  }
}

abstract class _ScriptField implements ScriptField {
  const factory _ScriptField(
      {final String script, final ScriptFieldType type}) = _$ScriptFieldImpl;

  factory _ScriptField.fromJson(Map<String, dynamic> json) =
      _$ScriptFieldImpl.fromJson;

  @override
  String get script;
  @override
  ScriptFieldType get type;
  @override
  @JsonKey(ignore: true)
  _$$ScriptFieldImplCopyWith<_$ScriptFieldImpl> get copyWith =>
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
abstract class _$$ColorFieldImplCopyWith<$Res>
    implements $ColorFieldCopyWith<$Res> {
  factory _$$ColorFieldImplCopyWith(
          _$ColorFieldImpl value, $Res Function(_$ColorFieldImpl) then) =
      __$$ColorFieldImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int a, int r, int g, int b});
}

/// @nodoc
class __$$ColorFieldImplCopyWithImpl<$Res>
    extends _$ColorFieldCopyWithImpl<$Res, _$ColorFieldImpl>
    implements _$$ColorFieldImplCopyWith<$Res> {
  __$$ColorFieldImplCopyWithImpl(
      _$ColorFieldImpl _value, $Res Function(_$ColorFieldImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? a = null,
    Object? r = null,
    Object? g = null,
    Object? b = null,
  }) {
    return _then(_$ColorFieldImpl(
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
class _$ColorFieldImpl implements _ColorField {
  const _$ColorFieldImpl({this.a = 0, this.r = 0, this.g = 0, this.b = 0});

  factory _$ColorFieldImpl.fromJson(Map<String, dynamic> json) =>
      _$$ColorFieldImplFromJson(json);

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

  @override
  String toString() {
    return 'ColorField(a: $a, r: $r, g: $g, b: $b)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ColorFieldImpl &&
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
  _$$ColorFieldImplCopyWith<_$ColorFieldImpl> get copyWith =>
      __$$ColorFieldImplCopyWithImpl<_$ColorFieldImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ColorFieldImplToJson(
      this,
    );
  }
}

abstract class _ColorField implements ColorField {
  const factory _ColorField(
      {final int a, final int r, final int g, final int b}) = _$ColorFieldImpl;

  factory _ColorField.fromJson(Map<String, dynamic> json) =
      _$ColorFieldImpl.fromJson;

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
  _$$ColorFieldImplCopyWith<_$ColorFieldImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
