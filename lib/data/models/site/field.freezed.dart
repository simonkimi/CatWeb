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
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() output,
    required TResult Function(Map<String, String> replace) replace,
    required TResult Function(String script) js,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? output,
    TResult? Function(Map<String, String> replace)? replace,
    TResult? Function(String script)? js,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? output,
    TResult Function(Map<String, String> replace)? replace,
    TResult Function(String script)? js,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScriptFieldOutput value) output,
    required TResult Function(ScriptFieldReplace value) replace,
    required TResult Function(ScriptFieldJs value) js,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScriptFieldOutput value)? output,
    TResult? Function(ScriptFieldReplace value)? replace,
    TResult? Function(ScriptFieldJs value)? js,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScriptFieldOutput value)? output,
    TResult Function(ScriptFieldReplace value)? replace,
    TResult Function(ScriptFieldJs value)? js,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScriptFieldCopyWith<$Res> {
  factory $ScriptFieldCopyWith(
          ScriptField value, $Res Function(ScriptField) then) =
      _$ScriptFieldCopyWithImpl<$Res, ScriptField>;
}

/// @nodoc
class _$ScriptFieldCopyWithImpl<$Res, $Val extends ScriptField>
    implements $ScriptFieldCopyWith<$Res> {
  _$ScriptFieldCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ScriptFieldOutputImplCopyWith<$Res> {
  factory _$$ScriptFieldOutputImplCopyWith(_$ScriptFieldOutputImpl value,
          $Res Function(_$ScriptFieldOutputImpl) then) =
      __$$ScriptFieldOutputImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ScriptFieldOutputImplCopyWithImpl<$Res>
    extends _$ScriptFieldCopyWithImpl<$Res, _$ScriptFieldOutputImpl>
    implements _$$ScriptFieldOutputImplCopyWith<$Res> {
  __$$ScriptFieldOutputImplCopyWithImpl(_$ScriptFieldOutputImpl _value,
      $Res Function(_$ScriptFieldOutputImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$ScriptFieldOutputImpl implements ScriptFieldOutput {
  const _$ScriptFieldOutputImpl({final String? $type})
      : $type = $type ?? 'output';

  factory _$ScriptFieldOutputImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScriptFieldOutputImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ScriptField.output()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ScriptFieldOutputImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() output,
    required TResult Function(Map<String, String> replace) replace,
    required TResult Function(String script) js,
  }) {
    return output();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? output,
    TResult? Function(Map<String, String> replace)? replace,
    TResult? Function(String script)? js,
  }) {
    return output?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? output,
    TResult Function(Map<String, String> replace)? replace,
    TResult Function(String script)? js,
    required TResult orElse(),
  }) {
    if (output != null) {
      return output();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScriptFieldOutput value) output,
    required TResult Function(ScriptFieldReplace value) replace,
    required TResult Function(ScriptFieldJs value) js,
  }) {
    return output(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScriptFieldOutput value)? output,
    TResult? Function(ScriptFieldReplace value)? replace,
    TResult? Function(ScriptFieldJs value)? js,
  }) {
    return output?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScriptFieldOutput value)? output,
    TResult Function(ScriptFieldReplace value)? replace,
    TResult Function(ScriptFieldJs value)? js,
    required TResult orElse(),
  }) {
    if (output != null) {
      return output(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ScriptFieldOutputImplToJson(
      this,
    );
  }
}

abstract class ScriptFieldOutput implements ScriptField {
  const factory ScriptFieldOutput() = _$ScriptFieldOutputImpl;

  factory ScriptFieldOutput.fromJson(Map<String, dynamic> json) =
      _$ScriptFieldOutputImpl.fromJson;
}

/// @nodoc
abstract class _$$ScriptFieldReplaceImplCopyWith<$Res> {
  factory _$$ScriptFieldReplaceImplCopyWith(_$ScriptFieldReplaceImpl value,
          $Res Function(_$ScriptFieldReplaceImpl) then) =
      __$$ScriptFieldReplaceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, String> replace});
}

/// @nodoc
class __$$ScriptFieldReplaceImplCopyWithImpl<$Res>
    extends _$ScriptFieldCopyWithImpl<$Res, _$ScriptFieldReplaceImpl>
    implements _$$ScriptFieldReplaceImplCopyWith<$Res> {
  __$$ScriptFieldReplaceImplCopyWithImpl(_$ScriptFieldReplaceImpl _value,
      $Res Function(_$ScriptFieldReplaceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? replace = null,
  }) {
    return _then(_$ScriptFieldReplaceImpl(
      replace: null == replace
          ? _value._replace
          : replace // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScriptFieldReplaceImpl implements ScriptFieldReplace {
  const _$ScriptFieldReplaceImpl(
      {final Map<String, String> replace = const {}, final String? $type})
      : _replace = replace,
        $type = $type ?? 'replace';

  factory _$ScriptFieldReplaceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScriptFieldReplaceImplFromJson(json);

  final Map<String, String> _replace;
  @override
  @JsonKey()
  Map<String, String> get replace {
    if (_replace is EqualUnmodifiableMapView) return _replace;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_replace);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ScriptField.replace(replace: $replace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScriptFieldReplaceImpl &&
            const DeepCollectionEquality().equals(other._replace, _replace));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_replace));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScriptFieldReplaceImplCopyWith<_$ScriptFieldReplaceImpl> get copyWith =>
      __$$ScriptFieldReplaceImplCopyWithImpl<_$ScriptFieldReplaceImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() output,
    required TResult Function(Map<String, String> replace) replace,
    required TResult Function(String script) js,
  }) {
    return replace(this.replace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? output,
    TResult? Function(Map<String, String> replace)? replace,
    TResult? Function(String script)? js,
  }) {
    return replace?.call(this.replace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? output,
    TResult Function(Map<String, String> replace)? replace,
    TResult Function(String script)? js,
    required TResult orElse(),
  }) {
    if (replace != null) {
      return replace(this.replace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScriptFieldOutput value) output,
    required TResult Function(ScriptFieldReplace value) replace,
    required TResult Function(ScriptFieldJs value) js,
  }) {
    return replace(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScriptFieldOutput value)? output,
    TResult? Function(ScriptFieldReplace value)? replace,
    TResult? Function(ScriptFieldJs value)? js,
  }) {
    return replace?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScriptFieldOutput value)? output,
    TResult Function(ScriptFieldReplace value)? replace,
    TResult Function(ScriptFieldJs value)? js,
    required TResult orElse(),
  }) {
    if (replace != null) {
      return replace(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ScriptFieldReplaceImplToJson(
      this,
    );
  }
}

abstract class ScriptFieldReplace implements ScriptField {
  const factory ScriptFieldReplace({final Map<String, String> replace}) =
      _$ScriptFieldReplaceImpl;

  factory ScriptFieldReplace.fromJson(Map<String, dynamic> json) =
      _$ScriptFieldReplaceImpl.fromJson;

  Map<String, String> get replace;
  @JsonKey(ignore: true)
  _$$ScriptFieldReplaceImplCopyWith<_$ScriptFieldReplaceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ScriptFieldJsImplCopyWith<$Res> {
  factory _$$ScriptFieldJsImplCopyWith(
          _$ScriptFieldJsImpl value, $Res Function(_$ScriptFieldJsImpl) then) =
      __$$ScriptFieldJsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String script});
}

/// @nodoc
class __$$ScriptFieldJsImplCopyWithImpl<$Res>
    extends _$ScriptFieldCopyWithImpl<$Res, _$ScriptFieldJsImpl>
    implements _$$ScriptFieldJsImplCopyWith<$Res> {
  __$$ScriptFieldJsImplCopyWithImpl(
      _$ScriptFieldJsImpl _value, $Res Function(_$ScriptFieldJsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? script = null,
  }) {
    return _then(_$ScriptFieldJsImpl(
      script: null == script
          ? _value.script
          : script // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScriptFieldJsImpl implements ScriptFieldJs {
  const _$ScriptFieldJsImpl({this.script = '', final String? $type})
      : $type = $type ?? 'js';

  factory _$ScriptFieldJsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScriptFieldJsImplFromJson(json);

  @override
  @JsonKey()
  final String script;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ScriptField.js(script: $script)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScriptFieldJsImpl &&
            (identical(other.script, script) || other.script == script));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, script);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScriptFieldJsImplCopyWith<_$ScriptFieldJsImpl> get copyWith =>
      __$$ScriptFieldJsImplCopyWithImpl<_$ScriptFieldJsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() output,
    required TResult Function(Map<String, String> replace) replace,
    required TResult Function(String script) js,
  }) {
    return js(script);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? output,
    TResult? Function(Map<String, String> replace)? replace,
    TResult? Function(String script)? js,
  }) {
    return js?.call(script);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? output,
    TResult Function(Map<String, String> replace)? replace,
    TResult Function(String script)? js,
    required TResult orElse(),
  }) {
    if (js != null) {
      return js(script);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScriptFieldOutput value) output,
    required TResult Function(ScriptFieldReplace value) replace,
    required TResult Function(ScriptFieldJs value) js,
  }) {
    return js(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScriptFieldOutput value)? output,
    TResult? Function(ScriptFieldReplace value)? replace,
    TResult? Function(ScriptFieldJs value)? js,
  }) {
    return js?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScriptFieldOutput value)? output,
    TResult Function(ScriptFieldReplace value)? replace,
    TResult Function(ScriptFieldJs value)? js,
    required TResult orElse(),
  }) {
    if (js != null) {
      return js(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ScriptFieldJsImplToJson(
      this,
    );
  }
}

abstract class ScriptFieldJs implements ScriptField {
  const factory ScriptFieldJs({final String script}) = _$ScriptFieldJsImpl;

  factory ScriptFieldJs.fromJson(Map<String, dynamic> json) =
      _$ScriptFieldJsImpl.fromJson;

  String get script;
  @JsonKey(ignore: true)
  _$$ScriptFieldJsImplCopyWith<_$ScriptFieldJsImpl> get copyWith =>
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
