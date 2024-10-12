// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subpage.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TemplateListSubPage _$TemplateListSubPageFromJson(Map<String, dynamic> json) {
  return _TemplateListSubPage.fromJson(json);
}

/// @nodoc
mixin _$TemplateListSubPage {
  String get name => throw _privateConstructorUsedError;
  String get key => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  /// Serializes this TemplateListSubPage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TemplateListSubPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TemplateListSubPageCopyWith<TemplateListSubPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemplateListSubPageCopyWith<$Res> {
  factory $TemplateListSubPageCopyWith(
          TemplateListSubPage value, $Res Function(TemplateListSubPage) then) =
      _$TemplateListSubPageCopyWithImpl<$Res, TemplateListSubPage>;
  @useResult
  $Res call({String name, String key, String value});
}

/// @nodoc
class _$TemplateListSubPageCopyWithImpl<$Res, $Val extends TemplateListSubPage>
    implements $TemplateListSubPageCopyWith<$Res> {
  _$TemplateListSubPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TemplateListSubPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? key = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TemplateListSubPageImplCopyWith<$Res>
    implements $TemplateListSubPageCopyWith<$Res> {
  factory _$$TemplateListSubPageImplCopyWith(_$TemplateListSubPageImpl value,
          $Res Function(_$TemplateListSubPageImpl) then) =
      __$$TemplateListSubPageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String key, String value});
}

/// @nodoc
class __$$TemplateListSubPageImplCopyWithImpl<$Res>
    extends _$TemplateListSubPageCopyWithImpl<$Res, _$TemplateListSubPageImpl>
    implements _$$TemplateListSubPageImplCopyWith<$Res> {
  __$$TemplateListSubPageImplCopyWithImpl(_$TemplateListSubPageImpl _value,
      $Res Function(_$TemplateListSubPageImpl) _then)
      : super(_value, _then);

  /// Create a copy of TemplateListSubPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? key = null,
    Object? value = null,
  }) {
    return _then(_$TemplateListSubPageImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
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
class _$TemplateListSubPageImpl implements _TemplateListSubPage {
  const _$TemplateListSubPageImpl(
      {this.name = '', this.key = '', this.value = ''});

  factory _$TemplateListSubPageImpl.fromJson(Map<String, dynamic> json) =>
      _$$TemplateListSubPageImplFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String key;
  @override
  @JsonKey()
  final String value;

  @override
  String toString() {
    return 'TemplateListSubPage(name: $name, key: $key, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TemplateListSubPageImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, key, value);

  /// Create a copy of TemplateListSubPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TemplateListSubPageImplCopyWith<_$TemplateListSubPageImpl> get copyWith =>
      __$$TemplateListSubPageImplCopyWithImpl<_$TemplateListSubPageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TemplateListSubPageImplToJson(
      this,
    );
  }
}

abstract class _TemplateListSubPage implements TemplateListSubPage {
  const factory _TemplateListSubPage(
      {final String name,
      final String key,
      final String value}) = _$TemplateListSubPageImpl;

  factory _TemplateListSubPage.fromJson(Map<String, dynamic> json) =
      _$TemplateListSubPageImpl.fromJson;

  @override
  String get name;
  @override
  String get key;
  @override
  String get value;

  /// Create a copy of TemplateListSubPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TemplateListSubPageImplCopyWith<_$TemplateListSubPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TemplateListFilter _$TemplateListFilterFromJson(Map<String, dynamic> json) {
  return _TemplateListFilter.fromJson(json);
}

/// @nodoc
mixin _$TemplateListFilter {
  List<TemplateListFilterItem> get items => throw _privateConstructorUsedError;
  ScriptField get script => throw _privateConstructorUsedError;

  /// Serializes this TemplateListFilter to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TemplateListFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TemplateListFilterCopyWith<TemplateListFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemplateListFilterCopyWith<$Res> {
  factory $TemplateListFilterCopyWith(
          TemplateListFilter value, $Res Function(TemplateListFilter) then) =
      _$TemplateListFilterCopyWithImpl<$Res, TemplateListFilter>;
  @useResult
  $Res call({List<TemplateListFilterItem> items, ScriptField script});

  $ScriptFieldCopyWith<$Res> get script;
}

/// @nodoc
class _$TemplateListFilterCopyWithImpl<$Res, $Val extends TemplateListFilter>
    implements $TemplateListFilterCopyWith<$Res> {
  _$TemplateListFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TemplateListFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? script = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<TemplateListFilterItem>,
      script: null == script
          ? _value.script
          : script // ignore: cast_nullable_to_non_nullable
              as ScriptField,
    ) as $Val);
  }

  /// Create a copy of TemplateListFilter
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
abstract class _$$TemplateListFilterImplCopyWith<$Res>
    implements $TemplateListFilterCopyWith<$Res> {
  factory _$$TemplateListFilterImplCopyWith(_$TemplateListFilterImpl value,
          $Res Function(_$TemplateListFilterImpl) then) =
      __$$TemplateListFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TemplateListFilterItem> items, ScriptField script});

  @override
  $ScriptFieldCopyWith<$Res> get script;
}

/// @nodoc
class __$$TemplateListFilterImplCopyWithImpl<$Res>
    extends _$TemplateListFilterCopyWithImpl<$Res, _$TemplateListFilterImpl>
    implements _$$TemplateListFilterImplCopyWith<$Res> {
  __$$TemplateListFilterImplCopyWithImpl(_$TemplateListFilterImpl _value,
      $Res Function(_$TemplateListFilterImpl) _then)
      : super(_value, _then);

  /// Create a copy of TemplateListFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? script = null,
  }) {
    return _then(_$TemplateListFilterImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<TemplateListFilterItem>,
      script: null == script
          ? _value.script
          : script // ignore: cast_nullable_to_non_nullable
              as ScriptField,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TemplateListFilterImpl extends _TemplateListFilter {
  const _$TemplateListFilterImpl(
      {final List<TemplateListFilterItem> items = const [],
      this.script = const ScriptField.output()})
      : _items = items,
        super._();

  factory _$TemplateListFilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$TemplateListFilterImplFromJson(json);

  final List<TemplateListFilterItem> _items;
  @override
  @JsonKey()
  List<TemplateListFilterItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final ScriptField script;

  @override
  String toString() {
    return 'TemplateListFilter(items: $items, script: $script)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TemplateListFilterImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.script, script) || other.script == script));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_items), script);

  /// Create a copy of TemplateListFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TemplateListFilterImplCopyWith<_$TemplateListFilterImpl> get copyWith =>
      __$$TemplateListFilterImplCopyWithImpl<_$TemplateListFilterImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TemplateListFilterImplToJson(
      this,
    );
  }
}

abstract class _TemplateListFilter extends TemplateListFilter {
  const factory _TemplateListFilter(
      {final List<TemplateListFilterItem> items,
      final ScriptField script}) = _$TemplateListFilterImpl;
  const _TemplateListFilter._() : super._();

  factory _TemplateListFilter.fromJson(Map<String, dynamic> json) =
      _$TemplateListFilterImpl.fromJson;

  @override
  List<TemplateListFilterItem> get items;
  @override
  ScriptField get script;

  /// Create a copy of TemplateListFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TemplateListFilterImplCopyWith<_$TemplateListFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TemplateListFilterItem _$TemplateListFilterItemFromJson(
    Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'string':
      return TemplateListFilterItemString.fromJson(json);
    case 'int':
      return TemplateListFilterItemNumber.fromJson(json);
    case 'float':
      return TemplateListFilterItemFloat.fromJson(json);
    case 'bool':
      return TemplateListFilterItemBool.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json,
          'runtimeType',
          'TemplateListFilterItem',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$TemplateListFilterItem {
  String get name => throw _privateConstructorUsedError;
  String get key => throw _privateConstructorUsedError;
  Object get value => throw _privateConstructorUsedError;
  Object get defaultValue => throw _privateConstructorUsedError;
  bool get disabledUnchanged => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, String key, String value,
            String defaultValue, bool disabledUnchanged)
        string,
    required TResult Function(String name, String key, int value,
            int defaultValue, bool disabledUnchanged)
        int,
    required TResult Function(String name, String key, double value,
            double defaultValue, bool disabledUnchanged)
        float,
    required TResult Function(String name, String key, bool value,
            bool defaultValue, bool disabledUnchanged)
        bool,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name, String key, String value,
            String defaultValue, bool disabledUnchanged)?
        string,
    TResult? Function(String name, String key, int value, int defaultValue,
            bool disabledUnchanged)?
        int,
    TResult? Function(String name, String key, double value,
            double defaultValue, bool disabledUnchanged)?
        float,
    TResult? Function(String name, String key, bool value, bool defaultValue,
            bool disabledUnchanged)?
        bool,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, String key, String value, String defaultValue,
            bool disabledUnchanged)?
        string,
    TResult Function(String name, String key, int value, int defaultValue,
            bool disabledUnchanged)?
        int,
    TResult Function(String name, String key, double value, double defaultValue,
            bool disabledUnchanged)?
        float,
    TResult Function(String name, String key, bool value, bool defaultValue,
            bool disabledUnchanged)?
        bool,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TemplateListFilterItemString value) string,
    required TResult Function(TemplateListFilterItemNumber value) int,
    required TResult Function(TemplateListFilterItemFloat value) float,
    required TResult Function(TemplateListFilterItemBool value) bool,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TemplateListFilterItemString value)? string,
    TResult? Function(TemplateListFilterItemNumber value)? int,
    TResult? Function(TemplateListFilterItemFloat value)? float,
    TResult? Function(TemplateListFilterItemBool value)? bool,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TemplateListFilterItemString value)? string,
    TResult Function(TemplateListFilterItemNumber value)? int,
    TResult Function(TemplateListFilterItemFloat value)? float,
    TResult Function(TemplateListFilterItemBool value)? bool,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this TemplateListFilterItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TemplateListFilterItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TemplateListFilterItemCopyWith<TemplateListFilterItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemplateListFilterItemCopyWith<$Res> {
  factory $TemplateListFilterItemCopyWith(TemplateListFilterItem value,
          $Res Function(TemplateListFilterItem) then) =
      _$TemplateListFilterItemCopyWithImpl<$Res, TemplateListFilterItem>;
  @useResult
  $Res call({String name, String key, bool disabledUnchanged});
}

/// @nodoc
class _$TemplateListFilterItemCopyWithImpl<$Res,
        $Val extends TemplateListFilterItem>
    implements $TemplateListFilterItemCopyWith<$Res> {
  _$TemplateListFilterItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TemplateListFilterItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? key = null,
    Object? disabledUnchanged = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      disabledUnchanged: null == disabledUnchanged
          ? _value.disabledUnchanged
          : disabledUnchanged // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TemplateListFilterItemStringImplCopyWith<$Res>
    implements $TemplateListFilterItemCopyWith<$Res> {
  factory _$$TemplateListFilterItemStringImplCopyWith(
          _$TemplateListFilterItemStringImpl value,
          $Res Function(_$TemplateListFilterItemStringImpl) then) =
      __$$TemplateListFilterItemStringImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String key,
      String value,
      String defaultValue,
      bool disabledUnchanged});
}

/// @nodoc
class __$$TemplateListFilterItemStringImplCopyWithImpl<$Res>
    extends _$TemplateListFilterItemCopyWithImpl<$Res,
        _$TemplateListFilterItemStringImpl>
    implements _$$TemplateListFilterItemStringImplCopyWith<$Res> {
  __$$TemplateListFilterItemStringImplCopyWithImpl(
      _$TemplateListFilterItemStringImpl _value,
      $Res Function(_$TemplateListFilterItemStringImpl) _then)
      : super(_value, _then);

  /// Create a copy of TemplateListFilterItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? key = null,
    Object? value = null,
    Object? defaultValue = null,
    Object? disabledUnchanged = null,
  }) {
    return _then(_$TemplateListFilterItemStringImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      defaultValue: null == defaultValue
          ? _value.defaultValue
          : defaultValue // ignore: cast_nullable_to_non_nullable
              as String,
      disabledUnchanged: null == disabledUnchanged
          ? _value.disabledUnchanged
          : disabledUnchanged // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TemplateListFilterItemStringImpl extends TemplateListFilterItemString {
  const _$TemplateListFilterItemStringImpl(
      {this.name = '',
      this.key = '',
      this.value = '',
      this.defaultValue = '',
      this.disabledUnchanged = false,
      final String? $type})
      : $type = $type ?? 'string',
        super._();

  factory _$TemplateListFilterItemStringImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$TemplateListFilterItemStringImplFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String key;
  @override
  @JsonKey()
  final String value;
  @override
  @JsonKey()
  final String defaultValue;
  @override
  @JsonKey()
  final bool disabledUnchanged;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'TemplateListFilterItem.string(name: $name, key: $key, value: $value, defaultValue: $defaultValue, disabledUnchanged: $disabledUnchanged)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TemplateListFilterItemStringImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.defaultValue, defaultValue) ||
                other.defaultValue == defaultValue) &&
            (identical(other.disabledUnchanged, disabledUnchanged) ||
                other.disabledUnchanged == disabledUnchanged));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, key, value, defaultValue, disabledUnchanged);

  /// Create a copy of TemplateListFilterItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TemplateListFilterItemStringImplCopyWith<
          _$TemplateListFilterItemStringImpl>
      get copyWith => __$$TemplateListFilterItemStringImplCopyWithImpl<
          _$TemplateListFilterItemStringImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, String key, String value,
            String defaultValue, bool disabledUnchanged)
        string,
    required TResult Function(String name, String key, int value,
            int defaultValue, bool disabledUnchanged)
        int,
    required TResult Function(String name, String key, double value,
            double defaultValue, bool disabledUnchanged)
        float,
    required TResult Function(String name, String key, bool value,
            bool defaultValue, bool disabledUnchanged)
        bool,
  }) {
    return string(name, key, value, defaultValue, disabledUnchanged);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name, String key, String value,
            String defaultValue, bool disabledUnchanged)?
        string,
    TResult? Function(String name, String key, int value, int defaultValue,
            bool disabledUnchanged)?
        int,
    TResult? Function(String name, String key, double value,
            double defaultValue, bool disabledUnchanged)?
        float,
    TResult? Function(String name, String key, bool value, bool defaultValue,
            bool disabledUnchanged)?
        bool,
  }) {
    return string?.call(name, key, value, defaultValue, disabledUnchanged);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, String key, String value, String defaultValue,
            bool disabledUnchanged)?
        string,
    TResult Function(String name, String key, int value, int defaultValue,
            bool disabledUnchanged)?
        int,
    TResult Function(String name, String key, double value, double defaultValue,
            bool disabledUnchanged)?
        float,
    TResult Function(String name, String key, bool value, bool defaultValue,
            bool disabledUnchanged)?
        bool,
    required TResult orElse(),
  }) {
    if (string != null) {
      return string(name, key, value, defaultValue, disabledUnchanged);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TemplateListFilterItemString value) string,
    required TResult Function(TemplateListFilterItemNumber value) int,
    required TResult Function(TemplateListFilterItemFloat value) float,
    required TResult Function(TemplateListFilterItemBool value) bool,
  }) {
    return string(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TemplateListFilterItemString value)? string,
    TResult? Function(TemplateListFilterItemNumber value)? int,
    TResult? Function(TemplateListFilterItemFloat value)? float,
    TResult? Function(TemplateListFilterItemBool value)? bool,
  }) {
    return string?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TemplateListFilterItemString value)? string,
    TResult Function(TemplateListFilterItemNumber value)? int,
    TResult Function(TemplateListFilterItemFloat value)? float,
    TResult Function(TemplateListFilterItemBool value)? bool,
    required TResult orElse(),
  }) {
    if (string != null) {
      return string(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TemplateListFilterItemStringImplToJson(
      this,
    );
  }
}

abstract class TemplateListFilterItemString extends TemplateListFilterItem {
  const factory TemplateListFilterItemString(
      {final String name,
      final String key,
      final String value,
      final String defaultValue,
      final bool disabledUnchanged}) = _$TemplateListFilterItemStringImpl;
  const TemplateListFilterItemString._() : super._();

  factory TemplateListFilterItemString.fromJson(Map<String, dynamic> json) =
      _$TemplateListFilterItemStringImpl.fromJson;

  @override
  String get name;
  @override
  String get key;
  @override
  String get value;
  @override
  String get defaultValue;
  @override
  bool get disabledUnchanged;

  /// Create a copy of TemplateListFilterItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TemplateListFilterItemStringImplCopyWith<
          _$TemplateListFilterItemStringImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TemplateListFilterItemNumberImplCopyWith<$Res>
    implements $TemplateListFilterItemCopyWith<$Res> {
  factory _$$TemplateListFilterItemNumberImplCopyWith(
          _$TemplateListFilterItemNumberImpl value,
          $Res Function(_$TemplateListFilterItemNumberImpl) then) =
      __$$TemplateListFilterItemNumberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String key,
      int value,
      int defaultValue,
      bool disabledUnchanged});
}

/// @nodoc
class __$$TemplateListFilterItemNumberImplCopyWithImpl<$Res>
    extends _$TemplateListFilterItemCopyWithImpl<$Res,
        _$TemplateListFilterItemNumberImpl>
    implements _$$TemplateListFilterItemNumberImplCopyWith<$Res> {
  __$$TemplateListFilterItemNumberImplCopyWithImpl(
      _$TemplateListFilterItemNumberImpl _value,
      $Res Function(_$TemplateListFilterItemNumberImpl) _then)
      : super(_value, _then);

  /// Create a copy of TemplateListFilterItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? key = null,
    Object? value = null,
    Object? defaultValue = null,
    Object? disabledUnchanged = null,
  }) {
    return _then(_$TemplateListFilterItemNumberImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      defaultValue: null == defaultValue
          ? _value.defaultValue
          : defaultValue // ignore: cast_nullable_to_non_nullable
              as int,
      disabledUnchanged: null == disabledUnchanged
          ? _value.disabledUnchanged
          : disabledUnchanged // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TemplateListFilterItemNumberImpl extends TemplateListFilterItemNumber {
  const _$TemplateListFilterItemNumberImpl(
      {this.name = '',
      this.key = '',
      this.value = 0,
      this.defaultValue = 0,
      this.disabledUnchanged = false,
      final String? $type})
      : $type = $type ?? 'int',
        super._();

  factory _$TemplateListFilterItemNumberImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$TemplateListFilterItemNumberImplFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String key;
  @override
  @JsonKey()
  final int value;
  @override
  @JsonKey()
  final int defaultValue;
  @override
  @JsonKey()
  final bool disabledUnchanged;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'TemplateListFilterItem.int(name: $name, key: $key, value: $value, defaultValue: $defaultValue, disabledUnchanged: $disabledUnchanged)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TemplateListFilterItemNumberImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.defaultValue, defaultValue) ||
                other.defaultValue == defaultValue) &&
            (identical(other.disabledUnchanged, disabledUnchanged) ||
                other.disabledUnchanged == disabledUnchanged));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, key, value, defaultValue, disabledUnchanged);

  /// Create a copy of TemplateListFilterItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TemplateListFilterItemNumberImplCopyWith<
          _$TemplateListFilterItemNumberImpl>
      get copyWith => __$$TemplateListFilterItemNumberImplCopyWithImpl<
          _$TemplateListFilterItemNumberImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, String key, String value,
            String defaultValue, bool disabledUnchanged)
        string,
    required TResult Function(String name, String key, int value,
            int defaultValue, bool disabledUnchanged)
        int,
    required TResult Function(String name, String key, double value,
            double defaultValue, bool disabledUnchanged)
        float,
    required TResult Function(String name, String key, bool value,
            bool defaultValue, bool disabledUnchanged)
        bool,
  }) {
    return int(name, key, value, defaultValue, disabledUnchanged);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name, String key, String value,
            String defaultValue, bool disabledUnchanged)?
        string,
    TResult? Function(String name, String key, int value, int defaultValue,
            bool disabledUnchanged)?
        int,
    TResult? Function(String name, String key, double value,
            double defaultValue, bool disabledUnchanged)?
        float,
    TResult? Function(String name, String key, bool value, bool defaultValue,
            bool disabledUnchanged)?
        bool,
  }) {
    return int?.call(name, key, value, defaultValue, disabledUnchanged);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, String key, String value, String defaultValue,
            bool disabledUnchanged)?
        string,
    TResult Function(String name, String key, int value, int defaultValue,
            bool disabledUnchanged)?
        int,
    TResult Function(String name, String key, double value, double defaultValue,
            bool disabledUnchanged)?
        float,
    TResult Function(String name, String key, bool value, bool defaultValue,
            bool disabledUnchanged)?
        bool,
    required TResult orElse(),
  }) {
    if (int != null) {
      return int(name, key, value, defaultValue, disabledUnchanged);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TemplateListFilterItemString value) string,
    required TResult Function(TemplateListFilterItemNumber value) int,
    required TResult Function(TemplateListFilterItemFloat value) float,
    required TResult Function(TemplateListFilterItemBool value) bool,
  }) {
    return int(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TemplateListFilterItemString value)? string,
    TResult? Function(TemplateListFilterItemNumber value)? int,
    TResult? Function(TemplateListFilterItemFloat value)? float,
    TResult? Function(TemplateListFilterItemBool value)? bool,
  }) {
    return int?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TemplateListFilterItemString value)? string,
    TResult Function(TemplateListFilterItemNumber value)? int,
    TResult Function(TemplateListFilterItemFloat value)? float,
    TResult Function(TemplateListFilterItemBool value)? bool,
    required TResult orElse(),
  }) {
    if (int != null) {
      return int(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TemplateListFilterItemNumberImplToJson(
      this,
    );
  }
}

abstract class TemplateListFilterItemNumber extends TemplateListFilterItem {
  const factory TemplateListFilterItemNumber(
      {final String name,
      final String key,
      final int value,
      final int defaultValue,
      final bool disabledUnchanged}) = _$TemplateListFilterItemNumberImpl;
  const TemplateListFilterItemNumber._() : super._();

  factory TemplateListFilterItemNumber.fromJson(Map<String, dynamic> json) =
      _$TemplateListFilterItemNumberImpl.fromJson;

  @override
  String get name;
  @override
  String get key;
  @override
  int get value;
  @override
  int get defaultValue;
  @override
  bool get disabledUnchanged;

  /// Create a copy of TemplateListFilterItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TemplateListFilterItemNumberImplCopyWith<
          _$TemplateListFilterItemNumberImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TemplateListFilterItemFloatImplCopyWith<$Res>
    implements $TemplateListFilterItemCopyWith<$Res> {
  factory _$$TemplateListFilterItemFloatImplCopyWith(
          _$TemplateListFilterItemFloatImpl value,
          $Res Function(_$TemplateListFilterItemFloatImpl) then) =
      __$$TemplateListFilterItemFloatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String key,
      double value,
      double defaultValue,
      bool disabledUnchanged});
}

/// @nodoc
class __$$TemplateListFilterItemFloatImplCopyWithImpl<$Res>
    extends _$TemplateListFilterItemCopyWithImpl<$Res,
        _$TemplateListFilterItemFloatImpl>
    implements _$$TemplateListFilterItemFloatImplCopyWith<$Res> {
  __$$TemplateListFilterItemFloatImplCopyWithImpl(
      _$TemplateListFilterItemFloatImpl _value,
      $Res Function(_$TemplateListFilterItemFloatImpl) _then)
      : super(_value, _then);

  /// Create a copy of TemplateListFilterItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? key = null,
    Object? value = null,
    Object? defaultValue = null,
    Object? disabledUnchanged = null,
  }) {
    return _then(_$TemplateListFilterItemFloatImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      defaultValue: null == defaultValue
          ? _value.defaultValue
          : defaultValue // ignore: cast_nullable_to_non_nullable
              as double,
      disabledUnchanged: null == disabledUnchanged
          ? _value.disabledUnchanged
          : disabledUnchanged // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TemplateListFilterItemFloatImpl extends TemplateListFilterItemFloat {
  const _$TemplateListFilterItemFloatImpl(
      {this.name = '',
      this.key = '',
      this.value = 0.0,
      this.defaultValue = 0.0,
      this.disabledUnchanged = false,
      final String? $type})
      : $type = $type ?? 'float',
        super._();

  factory _$TemplateListFilterItemFloatImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$TemplateListFilterItemFloatImplFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String key;
  @override
  @JsonKey()
  final double value;
  @override
  @JsonKey()
  final double defaultValue;
  @override
  @JsonKey()
  final bool disabledUnchanged;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'TemplateListFilterItem.float(name: $name, key: $key, value: $value, defaultValue: $defaultValue, disabledUnchanged: $disabledUnchanged)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TemplateListFilterItemFloatImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.defaultValue, defaultValue) ||
                other.defaultValue == defaultValue) &&
            (identical(other.disabledUnchanged, disabledUnchanged) ||
                other.disabledUnchanged == disabledUnchanged));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, key, value, defaultValue, disabledUnchanged);

  /// Create a copy of TemplateListFilterItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TemplateListFilterItemFloatImplCopyWith<_$TemplateListFilterItemFloatImpl>
      get copyWith => __$$TemplateListFilterItemFloatImplCopyWithImpl<
          _$TemplateListFilterItemFloatImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, String key, String value,
            String defaultValue, bool disabledUnchanged)
        string,
    required TResult Function(String name, String key, int value,
            int defaultValue, bool disabledUnchanged)
        int,
    required TResult Function(String name, String key, double value,
            double defaultValue, bool disabledUnchanged)
        float,
    required TResult Function(String name, String key, bool value,
            bool defaultValue, bool disabledUnchanged)
        bool,
  }) {
    return float(name, key, value, defaultValue, disabledUnchanged);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name, String key, String value,
            String defaultValue, bool disabledUnchanged)?
        string,
    TResult? Function(String name, String key, int value, int defaultValue,
            bool disabledUnchanged)?
        int,
    TResult? Function(String name, String key, double value,
            double defaultValue, bool disabledUnchanged)?
        float,
    TResult? Function(String name, String key, bool value, bool defaultValue,
            bool disabledUnchanged)?
        bool,
  }) {
    return float?.call(name, key, value, defaultValue, disabledUnchanged);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, String key, String value, String defaultValue,
            bool disabledUnchanged)?
        string,
    TResult Function(String name, String key, int value, int defaultValue,
            bool disabledUnchanged)?
        int,
    TResult Function(String name, String key, double value, double defaultValue,
            bool disabledUnchanged)?
        float,
    TResult Function(String name, String key, bool value, bool defaultValue,
            bool disabledUnchanged)?
        bool,
    required TResult orElse(),
  }) {
    if (float != null) {
      return float(name, key, value, defaultValue, disabledUnchanged);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TemplateListFilterItemString value) string,
    required TResult Function(TemplateListFilterItemNumber value) int,
    required TResult Function(TemplateListFilterItemFloat value) float,
    required TResult Function(TemplateListFilterItemBool value) bool,
  }) {
    return float(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TemplateListFilterItemString value)? string,
    TResult? Function(TemplateListFilterItemNumber value)? int,
    TResult? Function(TemplateListFilterItemFloat value)? float,
    TResult? Function(TemplateListFilterItemBool value)? bool,
  }) {
    return float?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TemplateListFilterItemString value)? string,
    TResult Function(TemplateListFilterItemNumber value)? int,
    TResult Function(TemplateListFilterItemFloat value)? float,
    TResult Function(TemplateListFilterItemBool value)? bool,
    required TResult orElse(),
  }) {
    if (float != null) {
      return float(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TemplateListFilterItemFloatImplToJson(
      this,
    );
  }
}

abstract class TemplateListFilterItemFloat extends TemplateListFilterItem {
  const factory TemplateListFilterItemFloat(
      {final String name,
      final String key,
      final double value,
      final double defaultValue,
      final bool disabledUnchanged}) = _$TemplateListFilterItemFloatImpl;
  const TemplateListFilterItemFloat._() : super._();

  factory TemplateListFilterItemFloat.fromJson(Map<String, dynamic> json) =
      _$TemplateListFilterItemFloatImpl.fromJson;

  @override
  String get name;
  @override
  String get key;
  @override
  double get value;
  @override
  double get defaultValue;
  @override
  bool get disabledUnchanged;

  /// Create a copy of TemplateListFilterItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TemplateListFilterItemFloatImplCopyWith<_$TemplateListFilterItemFloatImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TemplateListFilterItemBoolImplCopyWith<$Res>
    implements $TemplateListFilterItemCopyWith<$Res> {
  factory _$$TemplateListFilterItemBoolImplCopyWith(
          _$TemplateListFilterItemBoolImpl value,
          $Res Function(_$TemplateListFilterItemBoolImpl) then) =
      __$$TemplateListFilterItemBoolImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String key,
      bool value,
      bool defaultValue,
      bool disabledUnchanged});
}

/// @nodoc
class __$$TemplateListFilterItemBoolImplCopyWithImpl<$Res>
    extends _$TemplateListFilterItemCopyWithImpl<$Res,
        _$TemplateListFilterItemBoolImpl>
    implements _$$TemplateListFilterItemBoolImplCopyWith<$Res> {
  __$$TemplateListFilterItemBoolImplCopyWithImpl(
      _$TemplateListFilterItemBoolImpl _value,
      $Res Function(_$TemplateListFilterItemBoolImpl) _then)
      : super(_value, _then);

  /// Create a copy of TemplateListFilterItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? key = null,
    Object? value = null,
    Object? defaultValue = null,
    Object? disabledUnchanged = null,
  }) {
    return _then(_$TemplateListFilterItemBoolImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
      defaultValue: null == defaultValue
          ? _value.defaultValue
          : defaultValue // ignore: cast_nullable_to_non_nullable
              as bool,
      disabledUnchanged: null == disabledUnchanged
          ? _value.disabledUnchanged
          : disabledUnchanged // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TemplateListFilterItemBoolImpl extends TemplateListFilterItemBool {
  const _$TemplateListFilterItemBoolImpl(
      {this.name = '',
      this.key = '',
      this.value = false,
      this.defaultValue = false,
      this.disabledUnchanged = false,
      final String? $type})
      : $type = $type ?? 'bool',
        super._();

  factory _$TemplateListFilterItemBoolImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$TemplateListFilterItemBoolImplFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String key;
  @override
  @JsonKey()
  final bool value;
  @override
  @JsonKey()
  final bool defaultValue;
  @override
  @JsonKey()
  final bool disabledUnchanged;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'TemplateListFilterItem.bool(name: $name, key: $key, value: $value, defaultValue: $defaultValue, disabledUnchanged: $disabledUnchanged)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TemplateListFilterItemBoolImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.defaultValue, defaultValue) ||
                other.defaultValue == defaultValue) &&
            (identical(other.disabledUnchanged, disabledUnchanged) ||
                other.disabledUnchanged == disabledUnchanged));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, key, value, defaultValue, disabledUnchanged);

  /// Create a copy of TemplateListFilterItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TemplateListFilterItemBoolImplCopyWith<_$TemplateListFilterItemBoolImpl>
      get copyWith => __$$TemplateListFilterItemBoolImplCopyWithImpl<
          _$TemplateListFilterItemBoolImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, String key, String value,
            String defaultValue, bool disabledUnchanged)
        string,
    required TResult Function(String name, String key, int value,
            int defaultValue, bool disabledUnchanged)
        int,
    required TResult Function(String name, String key, double value,
            double defaultValue, bool disabledUnchanged)
        float,
    required TResult Function(String name, String key, bool value,
            bool defaultValue, bool disabledUnchanged)
        bool,
  }) {
    return bool(name, key, value, defaultValue, disabledUnchanged);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name, String key, String value,
            String defaultValue, bool disabledUnchanged)?
        string,
    TResult? Function(String name, String key, int value, int defaultValue,
            bool disabledUnchanged)?
        int,
    TResult? Function(String name, String key, double value,
            double defaultValue, bool disabledUnchanged)?
        float,
    TResult? Function(String name, String key, bool value, bool defaultValue,
            bool disabledUnchanged)?
        bool,
  }) {
    return bool?.call(name, key, value, defaultValue, disabledUnchanged);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, String key, String value, String defaultValue,
            bool disabledUnchanged)?
        string,
    TResult Function(String name, String key, int value, int defaultValue,
            bool disabledUnchanged)?
        int,
    TResult Function(String name, String key, double value, double defaultValue,
            bool disabledUnchanged)?
        float,
    TResult Function(String name, String key, bool value, bool defaultValue,
            bool disabledUnchanged)?
        bool,
    required TResult orElse(),
  }) {
    if (bool != null) {
      return bool(name, key, value, defaultValue, disabledUnchanged);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TemplateListFilterItemString value) string,
    required TResult Function(TemplateListFilterItemNumber value) int,
    required TResult Function(TemplateListFilterItemFloat value) float,
    required TResult Function(TemplateListFilterItemBool value) bool,
  }) {
    return bool(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TemplateListFilterItemString value)? string,
    TResult? Function(TemplateListFilterItemNumber value)? int,
    TResult? Function(TemplateListFilterItemFloat value)? float,
    TResult? Function(TemplateListFilterItemBool value)? bool,
  }) {
    return bool?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TemplateListFilterItemString value)? string,
    TResult Function(TemplateListFilterItemNumber value)? int,
    TResult Function(TemplateListFilterItemFloat value)? float,
    TResult Function(TemplateListFilterItemBool value)? bool,
    required TResult orElse(),
  }) {
    if (bool != null) {
      return bool(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TemplateListFilterItemBoolImplToJson(
      this,
    );
  }
}

abstract class TemplateListFilterItemBool extends TemplateListFilterItem {
  const factory TemplateListFilterItemBool(
      {final String name,
      final String key,
      final bool value,
      final bool defaultValue,
      final bool disabledUnchanged}) = _$TemplateListFilterItemBoolImpl;
  const TemplateListFilterItemBool._() : super._();

  factory TemplateListFilterItemBool.fromJson(Map<String, dynamic> json) =
      _$TemplateListFilterItemBoolImpl.fromJson;

  @override
  String get name;
  @override
  String get key;
  @override
  bool get value;
  @override
  bool get defaultValue;
  @override
  bool get disabledUnchanged;

  /// Create a copy of TemplateListFilterItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TemplateListFilterItemBoolImplCopyWith<_$TemplateListFilterItemBoolImpl>
      get copyWith => throw _privateConstructorUsedError;
}
