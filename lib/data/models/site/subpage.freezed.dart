// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subpage.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TemplateListSubPage {
  String get name;
  String get key;
  String get value;

  /// Create a copy of TemplateListSubPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TemplateListSubPageCopyWith<TemplateListSubPage> get copyWith =>
      _$TemplateListSubPageCopyWithImpl<TemplateListSubPage>(
          this as TemplateListSubPage, _$identity);

  /// Serializes this TemplateListSubPage to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TemplateListSubPage &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, key, value);

  @override
  String toString() {
    return 'TemplateListSubPage(name: $name, key: $key, value: $value)';
  }
}

/// @nodoc
abstract mixin class $TemplateListSubPageCopyWith<$Res> {
  factory $TemplateListSubPageCopyWith(
          TemplateListSubPage value, $Res Function(TemplateListSubPage) _then) =
      _$TemplateListSubPageCopyWithImpl;
  @useResult
  $Res call({String name, String key, String value});
}

/// @nodoc
class _$TemplateListSubPageCopyWithImpl<$Res>
    implements $TemplateListSubPageCopyWith<$Res> {
  _$TemplateListSubPageCopyWithImpl(this._self, this._then);

  final TemplateListSubPage _self;
  final $Res Function(TemplateListSubPage) _then;

  /// Create a copy of TemplateListSubPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? key = null,
    Object? value = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _self.key
          : key // ignore: cast_nullable_to_non_nullable
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
class _TemplateListSubPage implements TemplateListSubPage {
  const _TemplateListSubPage({this.name = '', this.key = '', this.value = ''});
  factory _TemplateListSubPage.fromJson(Map<String, dynamic> json) =>
      _$TemplateListSubPageFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String key;
  @override
  @JsonKey()
  final String value;

  /// Create a copy of TemplateListSubPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TemplateListSubPageCopyWith<_TemplateListSubPage> get copyWith =>
      __$TemplateListSubPageCopyWithImpl<_TemplateListSubPage>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TemplateListSubPageToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TemplateListSubPage &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, key, value);

  @override
  String toString() {
    return 'TemplateListSubPage(name: $name, key: $key, value: $value)';
  }
}

/// @nodoc
abstract mixin class _$TemplateListSubPageCopyWith<$Res>
    implements $TemplateListSubPageCopyWith<$Res> {
  factory _$TemplateListSubPageCopyWith(_TemplateListSubPage value,
          $Res Function(_TemplateListSubPage) _then) =
      __$TemplateListSubPageCopyWithImpl;
  @override
  @useResult
  $Res call({String name, String key, String value});
}

/// @nodoc
class __$TemplateListSubPageCopyWithImpl<$Res>
    implements _$TemplateListSubPageCopyWith<$Res> {
  __$TemplateListSubPageCopyWithImpl(this._self, this._then);

  final _TemplateListSubPage _self;
  final $Res Function(_TemplateListSubPage) _then;

  /// Create a copy of TemplateListSubPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? key = null,
    Object? value = null,
  }) {
    return _then(_TemplateListSubPage(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _self.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$TemplateListFilter {
  List<TemplateListFilterItem> get items;
  ScriptField get script;

  /// Create a copy of TemplateListFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TemplateListFilterCopyWith<TemplateListFilter> get copyWith =>
      _$TemplateListFilterCopyWithImpl<TemplateListFilter>(
          this as TemplateListFilter, _$identity);

  /// Serializes this TemplateListFilter to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TemplateListFilter &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.script, script) || other.script == script));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(items), script);

  @override
  String toString() {
    return 'TemplateListFilter(items: $items, script: $script)';
  }
}

/// @nodoc
abstract mixin class $TemplateListFilterCopyWith<$Res> {
  factory $TemplateListFilterCopyWith(
          TemplateListFilter value, $Res Function(TemplateListFilter) _then) =
      _$TemplateListFilterCopyWithImpl;
  @useResult
  $Res call({List<TemplateListFilterItem> items, ScriptField script});

  $ScriptFieldCopyWith<$Res> get script;
}

/// @nodoc
class _$TemplateListFilterCopyWithImpl<$Res>
    implements $TemplateListFilterCopyWith<$Res> {
  _$TemplateListFilterCopyWithImpl(this._self, this._then);

  final TemplateListFilter _self;
  final $Res Function(TemplateListFilter) _then;

  /// Create a copy of TemplateListFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? script = null,
  }) {
    return _then(_self.copyWith(
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<TemplateListFilterItem>,
      script: null == script
          ? _self.script
          : script // ignore: cast_nullable_to_non_nullable
              as ScriptField,
    ));
  }

  /// Create a copy of TemplateListFilter
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
class _TemplateListFilter extends TemplateListFilter {
  const _TemplateListFilter(
      {final List<TemplateListFilterItem> items = const [],
      this.script = const ScriptField.output()})
      : _items = items,
        super._();
  factory _TemplateListFilter.fromJson(Map<String, dynamic> json) =>
      _$TemplateListFilterFromJson(json);

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

  /// Create a copy of TemplateListFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TemplateListFilterCopyWith<_TemplateListFilter> get copyWith =>
      __$TemplateListFilterCopyWithImpl<_TemplateListFilter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TemplateListFilterToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TemplateListFilter &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.script, script) || other.script == script));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_items), script);

  @override
  String toString() {
    return 'TemplateListFilter(items: $items, script: $script)';
  }
}

/// @nodoc
abstract mixin class _$TemplateListFilterCopyWith<$Res>
    implements $TemplateListFilterCopyWith<$Res> {
  factory _$TemplateListFilterCopyWith(
          _TemplateListFilter value, $Res Function(_TemplateListFilter) _then) =
      __$TemplateListFilterCopyWithImpl;
  @override
  @useResult
  $Res call({List<TemplateListFilterItem> items, ScriptField script});

  @override
  $ScriptFieldCopyWith<$Res> get script;
}

/// @nodoc
class __$TemplateListFilterCopyWithImpl<$Res>
    implements _$TemplateListFilterCopyWith<$Res> {
  __$TemplateListFilterCopyWithImpl(this._self, this._then);

  final _TemplateListFilter _self;
  final $Res Function(_TemplateListFilter) _then;

  /// Create a copy of TemplateListFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? items = null,
    Object? script = null,
  }) {
    return _then(_TemplateListFilter(
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<TemplateListFilterItem>,
      script: null == script
          ? _self.script
          : script // ignore: cast_nullable_to_non_nullable
              as ScriptField,
    ));
  }

  /// Create a copy of TemplateListFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ScriptFieldCopyWith<$Res> get script {
    return $ScriptFieldCopyWith<$Res>(_self.script, (value) {
      return _then(_self.copyWith(script: value));
    });
  }
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
  String get name;
  String get key;
  Object get value;
  Object get defaultValue;
  bool get disabledUnchanged;

  /// Create a copy of TemplateListFilterItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TemplateListFilterItemCopyWith<TemplateListFilterItem> get copyWith =>
      _$TemplateListFilterItemCopyWithImpl<TemplateListFilterItem>(
          this as TemplateListFilterItem, _$identity);

  /// Serializes this TemplateListFilterItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TemplateListFilterItem &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.key, key) || other.key == key) &&
            const DeepCollectionEquality().equals(other.value, value) &&
            const DeepCollectionEquality()
                .equals(other.defaultValue, defaultValue) &&
            (identical(other.disabledUnchanged, disabledUnchanged) ||
                other.disabledUnchanged == disabledUnchanged));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      key,
      const DeepCollectionEquality().hash(value),
      const DeepCollectionEquality().hash(defaultValue),
      disabledUnchanged);

  @override
  String toString() {
    return 'TemplateListFilterItem(name: $name, key: $key, value: $value, defaultValue: $defaultValue, disabledUnchanged: $disabledUnchanged)';
  }
}

/// @nodoc
abstract mixin class $TemplateListFilterItemCopyWith<$Res> {
  factory $TemplateListFilterItemCopyWith(TemplateListFilterItem value,
          $Res Function(TemplateListFilterItem) _then) =
      _$TemplateListFilterItemCopyWithImpl;
  @useResult
  $Res call({String name, String key, bool disabledUnchanged});
}

/// @nodoc
class _$TemplateListFilterItemCopyWithImpl<$Res>
    implements $TemplateListFilterItemCopyWith<$Res> {
  _$TemplateListFilterItemCopyWithImpl(this._self, this._then);

  final TemplateListFilterItem _self;
  final $Res Function(TemplateListFilterItem) _then;

  /// Create a copy of TemplateListFilterItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? key = null,
    Object? disabledUnchanged = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _self.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      disabledUnchanged: null == disabledUnchanged
          ? _self.disabledUnchanged
          : disabledUnchanged // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class TemplateListFilterItemString extends TemplateListFilterItem {
  const TemplateListFilterItemString(
      {this.name = '',
      this.key = '',
      this.value = '',
      this.defaultValue = '',
      this.disabledUnchanged = false,
      final String? $type})
      : $type = $type ?? 'string',
        super._();
  factory TemplateListFilterItemString.fromJson(Map<String, dynamic> json) =>
      _$TemplateListFilterItemStringFromJson(json);

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

  /// Create a copy of TemplateListFilterItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TemplateListFilterItemStringCopyWith<TemplateListFilterItemString>
      get copyWith => _$TemplateListFilterItemStringCopyWithImpl<
          TemplateListFilterItemString>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TemplateListFilterItemStringToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TemplateListFilterItemString &&
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

  @override
  String toString() {
    return 'TemplateListFilterItem.string(name: $name, key: $key, value: $value, defaultValue: $defaultValue, disabledUnchanged: $disabledUnchanged)';
  }
}

/// @nodoc
abstract mixin class $TemplateListFilterItemStringCopyWith<$Res>
    implements $TemplateListFilterItemCopyWith<$Res> {
  factory $TemplateListFilterItemStringCopyWith(
          TemplateListFilterItemString value,
          $Res Function(TemplateListFilterItemString) _then) =
      _$TemplateListFilterItemStringCopyWithImpl;
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
class _$TemplateListFilterItemStringCopyWithImpl<$Res>
    implements $TemplateListFilterItemStringCopyWith<$Res> {
  _$TemplateListFilterItemStringCopyWithImpl(this._self, this._then);

  final TemplateListFilterItemString _self;
  final $Res Function(TemplateListFilterItemString) _then;

  /// Create a copy of TemplateListFilterItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? key = null,
    Object? value = null,
    Object? defaultValue = null,
    Object? disabledUnchanged = null,
  }) {
    return _then(TemplateListFilterItemString(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _self.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      defaultValue: null == defaultValue
          ? _self.defaultValue
          : defaultValue // ignore: cast_nullable_to_non_nullable
              as String,
      disabledUnchanged: null == disabledUnchanged
          ? _self.disabledUnchanged
          : disabledUnchanged // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class TemplateListFilterItemNumber extends TemplateListFilterItem {
  const TemplateListFilterItemNumber(
      {this.name = '',
      this.key = '',
      this.value = 0,
      this.defaultValue = 0,
      this.disabledUnchanged = false,
      final String? $type})
      : $type = $type ?? 'int',
        super._();
  factory TemplateListFilterItemNumber.fromJson(Map<String, dynamic> json) =>
      _$TemplateListFilterItemNumberFromJson(json);

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

  /// Create a copy of TemplateListFilterItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TemplateListFilterItemNumberCopyWith<TemplateListFilterItemNumber>
      get copyWith => _$TemplateListFilterItemNumberCopyWithImpl<
          TemplateListFilterItemNumber>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TemplateListFilterItemNumberToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TemplateListFilterItemNumber &&
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

  @override
  String toString() {
    return 'TemplateListFilterItem.int(name: $name, key: $key, value: $value, defaultValue: $defaultValue, disabledUnchanged: $disabledUnchanged)';
  }
}

/// @nodoc
abstract mixin class $TemplateListFilterItemNumberCopyWith<$Res>
    implements $TemplateListFilterItemCopyWith<$Res> {
  factory $TemplateListFilterItemNumberCopyWith(
          TemplateListFilterItemNumber value,
          $Res Function(TemplateListFilterItemNumber) _then) =
      _$TemplateListFilterItemNumberCopyWithImpl;
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
class _$TemplateListFilterItemNumberCopyWithImpl<$Res>
    implements $TemplateListFilterItemNumberCopyWith<$Res> {
  _$TemplateListFilterItemNumberCopyWithImpl(this._self, this._then);

  final TemplateListFilterItemNumber _self;
  final $Res Function(TemplateListFilterItemNumber) _then;

  /// Create a copy of TemplateListFilterItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? key = null,
    Object? value = null,
    Object? defaultValue = null,
    Object? disabledUnchanged = null,
  }) {
    return _then(TemplateListFilterItemNumber(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _self.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      defaultValue: null == defaultValue
          ? _self.defaultValue
          : defaultValue // ignore: cast_nullable_to_non_nullable
              as int,
      disabledUnchanged: null == disabledUnchanged
          ? _self.disabledUnchanged
          : disabledUnchanged // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class TemplateListFilterItemFloat extends TemplateListFilterItem {
  const TemplateListFilterItemFloat(
      {this.name = '',
      this.key = '',
      this.value = 0.0,
      this.defaultValue = 0.0,
      this.disabledUnchanged = false,
      final String? $type})
      : $type = $type ?? 'float',
        super._();
  factory TemplateListFilterItemFloat.fromJson(Map<String, dynamic> json) =>
      _$TemplateListFilterItemFloatFromJson(json);

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

  /// Create a copy of TemplateListFilterItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TemplateListFilterItemFloatCopyWith<TemplateListFilterItemFloat>
      get copyWith => _$TemplateListFilterItemFloatCopyWithImpl<
          TemplateListFilterItemFloat>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TemplateListFilterItemFloatToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TemplateListFilterItemFloat &&
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

  @override
  String toString() {
    return 'TemplateListFilterItem.float(name: $name, key: $key, value: $value, defaultValue: $defaultValue, disabledUnchanged: $disabledUnchanged)';
  }
}

/// @nodoc
abstract mixin class $TemplateListFilterItemFloatCopyWith<$Res>
    implements $TemplateListFilterItemCopyWith<$Res> {
  factory $TemplateListFilterItemFloatCopyWith(
          TemplateListFilterItemFloat value,
          $Res Function(TemplateListFilterItemFloat) _then) =
      _$TemplateListFilterItemFloatCopyWithImpl;
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
class _$TemplateListFilterItemFloatCopyWithImpl<$Res>
    implements $TemplateListFilterItemFloatCopyWith<$Res> {
  _$TemplateListFilterItemFloatCopyWithImpl(this._self, this._then);

  final TemplateListFilterItemFloat _self;
  final $Res Function(TemplateListFilterItemFloat) _then;

  /// Create a copy of TemplateListFilterItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? key = null,
    Object? value = null,
    Object? defaultValue = null,
    Object? disabledUnchanged = null,
  }) {
    return _then(TemplateListFilterItemFloat(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _self.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      defaultValue: null == defaultValue
          ? _self.defaultValue
          : defaultValue // ignore: cast_nullable_to_non_nullable
              as double,
      disabledUnchanged: null == disabledUnchanged
          ? _self.disabledUnchanged
          : disabledUnchanged // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class TemplateListFilterItemBool extends TemplateListFilterItem {
  const TemplateListFilterItemBool(
      {this.name = '',
      this.key = '',
      this.value = false,
      this.defaultValue = false,
      this.disabledUnchanged = false,
      final String? $type})
      : $type = $type ?? 'bool',
        super._();
  factory TemplateListFilterItemBool.fromJson(Map<String, dynamic> json) =>
      _$TemplateListFilterItemBoolFromJson(json);

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

  /// Create a copy of TemplateListFilterItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TemplateListFilterItemBoolCopyWith<TemplateListFilterItemBool>
      get copyWith =>
          _$TemplateListFilterItemBoolCopyWithImpl<TemplateListFilterItemBool>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TemplateListFilterItemBoolToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TemplateListFilterItemBool &&
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

  @override
  String toString() {
    return 'TemplateListFilterItem.bool(name: $name, key: $key, value: $value, defaultValue: $defaultValue, disabledUnchanged: $disabledUnchanged)';
  }
}

/// @nodoc
abstract mixin class $TemplateListFilterItemBoolCopyWith<$Res>
    implements $TemplateListFilterItemCopyWith<$Res> {
  factory $TemplateListFilterItemBoolCopyWith(TemplateListFilterItemBool value,
          $Res Function(TemplateListFilterItemBool) _then) =
      _$TemplateListFilterItemBoolCopyWithImpl;
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
class _$TemplateListFilterItemBoolCopyWithImpl<$Res>
    implements $TemplateListFilterItemBoolCopyWith<$Res> {
  _$TemplateListFilterItemBoolCopyWithImpl(this._self, this._then);

  final TemplateListFilterItemBool _self;
  final $Res Function(TemplateListFilterItemBool) _then;

  /// Create a copy of TemplateListFilterItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? key = null,
    Object? value = null,
    Object? defaultValue = null,
    Object? disabledUnchanged = null,
  }) {
    return _then(TemplateListFilterItemBool(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _self.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
      defaultValue: null == defaultValue
          ? _self.defaultValue
          : defaultValue // ignore: cast_nullable_to_non_nullable
              as bool,
      disabledUnchanged: null == disabledUnchanged
          ? _self.disabledUnchanged
          : disabledUnchanged // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
