// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'template.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TemplateGallery _$TemplateGalleryFromJson(Map<String, dynamic> json) {
  return _TemplateGallery.fromJson(json);
}

/// @nodoc
mixin _$TemplateGallery {
  @JsonKey(fromJson: TemplateType._fromValue, toJson: TemplateType._toValue)
  TemplateType get type => throw _privateConstructorUsedError;
  String get targetReader => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TemplateGalleryCopyWith<TemplateGallery> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemplateGalleryCopyWith<$Res> {
  factory $TemplateGalleryCopyWith(
          TemplateGallery value, $Res Function(TemplateGallery) then) =
      _$TemplateGalleryCopyWithImpl<$Res, TemplateGallery>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: TemplateType._fromValue, toJson: TemplateType._toValue)
          TemplateType type,
      String targetReader});
}

/// @nodoc
class _$TemplateGalleryCopyWithImpl<$Res, $Val extends TemplateGallery>
    implements $TemplateGalleryCopyWith<$Res> {
  _$TemplateGalleryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? targetReader = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TemplateType,
      targetReader: null == targetReader
          ? _value.targetReader
          : targetReader // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TemplateGalleryCopyWith<$Res>
    implements $TemplateGalleryCopyWith<$Res> {
  factory _$$_TemplateGalleryCopyWith(
          _$_TemplateGallery value, $Res Function(_$_TemplateGallery) then) =
      __$$_TemplateGalleryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: TemplateType._fromValue, toJson: TemplateType._toValue)
          TemplateType type,
      String targetReader});
}

/// @nodoc
class __$$_TemplateGalleryCopyWithImpl<$Res>
    extends _$TemplateGalleryCopyWithImpl<$Res, _$_TemplateGallery>
    implements _$$_TemplateGalleryCopyWith<$Res> {
  __$$_TemplateGalleryCopyWithImpl(
      _$_TemplateGallery _value, $Res Function(_$_TemplateGallery) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? targetReader = null,
  }) {
    return _then(_$_TemplateGallery(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TemplateType,
      targetReader: null == targetReader
          ? _value.targetReader
          : targetReader // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TemplateGallery implements _TemplateGallery {
  const _$_TemplateGallery(
      {@JsonKey(fromJson: TemplateType._fromValue, toJson: TemplateType._toValue)
          this.type = TemplateType.gallery,
      this.targetReader = ''})
      : assert(type == TemplateType.gallery, 'type must be gallery');

  factory _$_TemplateGallery.fromJson(Map<String, dynamic> json) =>
      _$$_TemplateGalleryFromJson(json);

  @override
  @JsonKey(fromJson: TemplateType._fromValue, toJson: TemplateType._toValue)
  final TemplateType type;
  @override
  @JsonKey()
  final String targetReader;

  @override
  String toString() {
    return 'TemplateGallery(type: $type, targetReader: $targetReader)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TemplateGallery &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.targetReader, targetReader) ||
                other.targetReader == targetReader));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, targetReader);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TemplateGalleryCopyWith<_$_TemplateGallery> get copyWith =>
      __$$_TemplateGalleryCopyWithImpl<_$_TemplateGallery>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TemplateGalleryToJson(
      this,
    );
  }
}

abstract class _TemplateGallery implements TemplateGallery {
  const factory _TemplateGallery(
      {@JsonKey(fromJson: TemplateType._fromValue, toJson: TemplateType._toValue)
          final TemplateType type,
      final String targetReader}) = _$_TemplateGallery;

  factory _TemplateGallery.fromJson(Map<String, dynamic> json) =
      _$_TemplateGallery.fromJson;

  @override
  @JsonKey(fromJson: TemplateType._fromValue, toJson: TemplateType._toValue)
  TemplateType get type;
  @override
  String get targetReader;
  @override
  @JsonKey(ignore: true)
  _$$_TemplateGalleryCopyWith<_$_TemplateGallery> get copyWith =>
      throw _privateConstructorUsedError;
}

TemplateListSubPage _$TemplateListSubPageFromJson(Map<String, dynamic> json) {
  return _TemplateListSubPage.fromJson(json);
}

/// @nodoc
mixin _$TemplateListSubPage {
  String get name => throw _privateConstructorUsedError;
  String get key => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
abstract class _$$_TemplateListSubPageCopyWith<$Res>
    implements $TemplateListSubPageCopyWith<$Res> {
  factory _$$_TemplateListSubPageCopyWith(_$_TemplateListSubPage value,
          $Res Function(_$_TemplateListSubPage) then) =
      __$$_TemplateListSubPageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String key, String value});
}

/// @nodoc
class __$$_TemplateListSubPageCopyWithImpl<$Res>
    extends _$TemplateListSubPageCopyWithImpl<$Res, _$_TemplateListSubPage>
    implements _$$_TemplateListSubPageCopyWith<$Res> {
  __$$_TemplateListSubPageCopyWithImpl(_$_TemplateListSubPage _value,
      $Res Function(_$_TemplateListSubPage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? key = null,
    Object? value = null,
  }) {
    return _then(_$_TemplateListSubPage(
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
class _$_TemplateListSubPage implements _TemplateListSubPage {
  const _$_TemplateListSubPage(
      {this.name = '', this.key = '', this.value = ''});

  factory _$_TemplateListSubPage.fromJson(Map<String, dynamic> json) =>
      _$$_TemplateListSubPageFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TemplateListSubPage &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, key, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TemplateListSubPageCopyWith<_$_TemplateListSubPage> get copyWith =>
      __$$_TemplateListSubPageCopyWithImpl<_$_TemplateListSubPage>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TemplateListSubPageToJson(
      this,
    );
  }
}

abstract class _TemplateListSubPage implements TemplateListSubPage {
  const factory _TemplateListSubPage(
      {final String name,
      final String key,
      final String value}) = _$_TemplateListSubPage;

  factory _TemplateListSubPage.fromJson(Map<String, dynamic> json) =
      _$_TemplateListSubPage.fromJson;

  @override
  String get name;
  @override
  String get key;
  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$_TemplateListSubPageCopyWith<_$_TemplateListSubPage> get copyWith =>
      throw _privateConstructorUsedError;
}

TemplateListFilterItem _$TemplateListFilterItemFromJson(
    Map<String, dynamic> json) {
  return _TemplateListFilterItem.fromJson(json);
}

/// @nodoc
mixin _$TemplateListFilterItem {
  String get name => throw _privateConstructorUsedError;
  String get key => throw _privateConstructorUsedError;
  FilterType get type => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  ColorField get color => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TemplateListFilterItemCopyWith<TemplateListFilterItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemplateListFilterItemCopyWith<$Res> {
  factory $TemplateListFilterItemCopyWith(TemplateListFilterItem value,
          $Res Function(TemplateListFilterItem) then) =
      _$TemplateListFilterItemCopyWithImpl<$Res, TemplateListFilterItem>;
  @useResult
  $Res call(
      {String name,
      String key,
      FilterType type,
      String value,
      ColorField color});

  $ColorFieldCopyWith<$Res> get color;
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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? key = null,
    Object? type = null,
    Object? value = null,
    Object? color = null,
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FilterType,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as ColorField,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ColorFieldCopyWith<$Res> get color {
    return $ColorFieldCopyWith<$Res>(_value.color, (value) {
      return _then(_value.copyWith(color: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TemplateListFilterItemCopyWith<$Res>
    implements $TemplateListFilterItemCopyWith<$Res> {
  factory _$$_TemplateListFilterItemCopyWith(_$_TemplateListFilterItem value,
          $Res Function(_$_TemplateListFilterItem) then) =
      __$$_TemplateListFilterItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String key,
      FilterType type,
      String value,
      ColorField color});

  @override
  $ColorFieldCopyWith<$Res> get color;
}

/// @nodoc
class __$$_TemplateListFilterItemCopyWithImpl<$Res>
    extends _$TemplateListFilterItemCopyWithImpl<$Res,
        _$_TemplateListFilterItem>
    implements _$$_TemplateListFilterItemCopyWith<$Res> {
  __$$_TemplateListFilterItemCopyWithImpl(_$_TemplateListFilterItem _value,
      $Res Function(_$_TemplateListFilterItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? key = null,
    Object? type = null,
    Object? value = null,
    Object? color = null,
  }) {
    return _then(_$_TemplateListFilterItem(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FilterType,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as ColorField,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TemplateListFilterItem implements _TemplateListFilterItem {
  const _$_TemplateListFilterItem(
      {this.name = '',
      this.key = '',
      this.type = FilterType.string,
      this.value = '',
      this.color = const ColorField()});

  factory _$_TemplateListFilterItem.fromJson(Map<String, dynamic> json) =>
      _$$_TemplateListFilterItemFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String key;
  @override
  @JsonKey()
  final FilterType type;
  @override
  @JsonKey()
  final String value;
  @override
  @JsonKey()
  final ColorField color;

  @override
  String toString() {
    return 'TemplateListFilterItem(name: $name, key: $key, type: $type, value: $value, color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TemplateListFilterItem &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, key, type, value, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TemplateListFilterItemCopyWith<_$_TemplateListFilterItem> get copyWith =>
      __$$_TemplateListFilterItemCopyWithImpl<_$_TemplateListFilterItem>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TemplateListFilterItemToJson(
      this,
    );
  }
}

abstract class _TemplateListFilterItem implements TemplateListFilterItem {
  const factory _TemplateListFilterItem(
      {final String name,
      final String key,
      final FilterType type,
      final String value,
      final ColorField color}) = _$_TemplateListFilterItem;

  factory _TemplateListFilterItem.fromJson(Map<String, dynamic> json) =
      _$_TemplateListFilterItem.fromJson;

  @override
  String get name;
  @override
  String get key;
  @override
  FilterType get type;
  @override
  String get value;
  @override
  ColorField get color;
  @override
  @JsonKey(ignore: true)
  _$$_TemplateListFilterItemCopyWith<_$_TemplateListFilterItem> get copyWith =>
      throw _privateConstructorUsedError;
}

TemplateList _$TemplateListFromJson(Map<String, dynamic> json) {
  return _TemplateList.fromJson(json);
}

/// @nodoc
mixin _$TemplateList {
  @JsonKey(fromJson: TemplateType._fromValue, toJson: TemplateType._toValue)
  TemplateType get type => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<TemplateListSubPage> get subPages => throw _privateConstructorUsedError;
  List<TemplateListFilterItem> get filters =>
      throw _privateConstructorUsedError;
  ScriptField get script => throw _privateConstructorUsedError;
  bool get disableUnchanged => throw _privateConstructorUsedError;
  String get targetItem => throw _privateConstructorUsedError;
  String get targetAutoComplete => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TemplateListCopyWith<TemplateList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemplateListCopyWith<$Res> {
  factory $TemplateListCopyWith(
          TemplateList value, $Res Function(TemplateList) then) =
      _$TemplateListCopyWithImpl<$Res, TemplateList>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: TemplateType._fromValue, toJson: TemplateType._toValue)
          TemplateType type,
      String name,
      List<TemplateListSubPage> subPages,
      List<TemplateListFilterItem> filters,
      ScriptField script,
      bool disableUnchanged,
      String targetItem,
      String targetAutoComplete});

  $ScriptFieldCopyWith<$Res> get script;
}

/// @nodoc
class _$TemplateListCopyWithImpl<$Res, $Val extends TemplateList>
    implements $TemplateListCopyWith<$Res> {
  _$TemplateListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? name = null,
    Object? subPages = null,
    Object? filters = null,
    Object? script = null,
    Object? disableUnchanged = null,
    Object? targetItem = null,
    Object? targetAutoComplete = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TemplateType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      subPages: null == subPages
          ? _value.subPages
          : subPages // ignore: cast_nullable_to_non_nullable
              as List<TemplateListSubPage>,
      filters: null == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<TemplateListFilterItem>,
      script: null == script
          ? _value.script
          : script // ignore: cast_nullable_to_non_nullable
              as ScriptField,
      disableUnchanged: null == disableUnchanged
          ? _value.disableUnchanged
          : disableUnchanged // ignore: cast_nullable_to_non_nullable
              as bool,
      targetItem: null == targetItem
          ? _value.targetItem
          : targetItem // ignore: cast_nullable_to_non_nullable
              as String,
      targetAutoComplete: null == targetAutoComplete
          ? _value.targetAutoComplete
          : targetAutoComplete // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_TemplateListCopyWith<$Res>
    implements $TemplateListCopyWith<$Res> {
  factory _$$_TemplateListCopyWith(
          _$_TemplateList value, $Res Function(_$_TemplateList) then) =
      __$$_TemplateListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: TemplateType._fromValue, toJson: TemplateType._toValue)
          TemplateType type,
      String name,
      List<TemplateListSubPage> subPages,
      List<TemplateListFilterItem> filters,
      ScriptField script,
      bool disableUnchanged,
      String targetItem,
      String targetAutoComplete});

  @override
  $ScriptFieldCopyWith<$Res> get script;
}

/// @nodoc
class __$$_TemplateListCopyWithImpl<$Res>
    extends _$TemplateListCopyWithImpl<$Res, _$_TemplateList>
    implements _$$_TemplateListCopyWith<$Res> {
  __$$_TemplateListCopyWithImpl(
      _$_TemplateList _value, $Res Function(_$_TemplateList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? name = null,
    Object? subPages = null,
    Object? filters = null,
    Object? script = null,
    Object? disableUnchanged = null,
    Object? targetItem = null,
    Object? targetAutoComplete = null,
  }) {
    return _then(_$_TemplateList(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TemplateType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      subPages: null == subPages
          ? _value._subPages
          : subPages // ignore: cast_nullable_to_non_nullable
              as List<TemplateListSubPage>,
      filters: null == filters
          ? _value._filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<TemplateListFilterItem>,
      script: null == script
          ? _value.script
          : script // ignore: cast_nullable_to_non_nullable
              as ScriptField,
      disableUnchanged: null == disableUnchanged
          ? _value.disableUnchanged
          : disableUnchanged // ignore: cast_nullable_to_non_nullable
              as bool,
      targetItem: null == targetItem
          ? _value.targetItem
          : targetItem // ignore: cast_nullable_to_non_nullable
              as String,
      targetAutoComplete: null == targetAutoComplete
          ? _value.targetAutoComplete
          : targetAutoComplete // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TemplateList implements _TemplateList {
  const _$_TemplateList(
      {@JsonKey(fromJson: TemplateType._fromValue, toJson: TemplateType._toValue)
          this.type = TemplateType.imageList,
      this.name = '',
      final List<TemplateListSubPage> subPages = const [],
      final List<TemplateListFilterItem> filters = const [],
      this.script = const ScriptField(),
      this.disableUnchanged = false,
      this.targetItem = '',
      this.targetAutoComplete = ''})
      : assert(type == TemplateType.imageList, 'type must be imageList'),
        _subPages = subPages,
        _filters = filters;

  factory _$_TemplateList.fromJson(Map<String, dynamic> json) =>
      _$$_TemplateListFromJson(json);

  @override
  @JsonKey(fromJson: TemplateType._fromValue, toJson: TemplateType._toValue)
  final TemplateType type;
  @override
  @JsonKey()
  final String name;
  final List<TemplateListSubPage> _subPages;
  @override
  @JsonKey()
  List<TemplateListSubPage> get subPages {
    if (_subPages is EqualUnmodifiableListView) return _subPages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subPages);
  }

  final List<TemplateListFilterItem> _filters;
  @override
  @JsonKey()
  List<TemplateListFilterItem> get filters {
    if (_filters is EqualUnmodifiableListView) return _filters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filters);
  }

  @override
  @JsonKey()
  final ScriptField script;
  @override
  @JsonKey()
  final bool disableUnchanged;
  @override
  @JsonKey()
  final String targetItem;
  @override
  @JsonKey()
  final String targetAutoComplete;

  @override
  String toString() {
    return 'TemplateList(type: $type, name: $name, subPages: $subPages, filters: $filters, script: $script, disableUnchanged: $disableUnchanged, targetItem: $targetItem, targetAutoComplete: $targetAutoComplete)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TemplateList &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._subPages, _subPages) &&
            const DeepCollectionEquality().equals(other._filters, _filters) &&
            (identical(other.script, script) || other.script == script) &&
            (identical(other.disableUnchanged, disableUnchanged) ||
                other.disableUnchanged == disableUnchanged) &&
            (identical(other.targetItem, targetItem) ||
                other.targetItem == targetItem) &&
            (identical(other.targetAutoComplete, targetAutoComplete) ||
                other.targetAutoComplete == targetAutoComplete));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      name,
      const DeepCollectionEquality().hash(_subPages),
      const DeepCollectionEquality().hash(_filters),
      script,
      disableUnchanged,
      targetItem,
      targetAutoComplete);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TemplateListCopyWith<_$_TemplateList> get copyWith =>
      __$$_TemplateListCopyWithImpl<_$_TemplateList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TemplateListToJson(
      this,
    );
  }
}

abstract class _TemplateList implements TemplateList {
  const factory _TemplateList(
      {@JsonKey(fromJson: TemplateType._fromValue, toJson: TemplateType._toValue)
          final TemplateType type,
      final String name,
      final List<TemplateListSubPage> subPages,
      final List<TemplateListFilterItem> filters,
      final ScriptField script,
      final bool disableUnchanged,
      final String targetItem,
      final String targetAutoComplete}) = _$_TemplateList;

  factory _TemplateList.fromJson(Map<String, dynamic> json) =
      _$_TemplateList.fromJson;

  @override
  @JsonKey(fromJson: TemplateType._fromValue, toJson: TemplateType._toValue)
  TemplateType get type;
  @override
  String get name;
  @override
  List<TemplateListSubPage> get subPages;
  @override
  List<TemplateListFilterItem> get filters;
  @override
  ScriptField get script;
  @override
  bool get disableUnchanged;
  @override
  String get targetItem;
  @override
  String get targetAutoComplete;
  @override
  @JsonKey(ignore: true)
  _$$_TemplateListCopyWith<_$_TemplateList> get copyWith =>
      throw _privateConstructorUsedError;
}

TemplateAutoComplete _$TemplateAutoCompleteFromJson(Map<String, dynamic> json) {
  return _TemplateAutoComplete.fromJson(json);
}

/// @nodoc
mixin _$TemplateAutoComplete {
  @JsonKey(fromJson: TemplateType._fromValue, toJson: TemplateType._toValue)
  TemplateType get type => throw _privateConstructorUsedError;
  String? get splitChar => throw _privateConstructorUsedError;
  int? get timeout => throw _privateConstructorUsedError;
  ScriptField? get script => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TemplateAutoCompleteCopyWith<TemplateAutoComplete> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemplateAutoCompleteCopyWith<$Res> {
  factory $TemplateAutoCompleteCopyWith(TemplateAutoComplete value,
          $Res Function(TemplateAutoComplete) then) =
      _$TemplateAutoCompleteCopyWithImpl<$Res, TemplateAutoComplete>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: TemplateType._fromValue, toJson: TemplateType._toValue)
          TemplateType type,
      String? splitChar,
      int? timeout,
      ScriptField? script});

  $ScriptFieldCopyWith<$Res>? get script;
}

/// @nodoc
class _$TemplateAutoCompleteCopyWithImpl<$Res,
        $Val extends TemplateAutoComplete>
    implements $TemplateAutoCompleteCopyWith<$Res> {
  _$TemplateAutoCompleteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? splitChar = freezed,
    Object? timeout = freezed,
    Object? script = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TemplateType,
      splitChar: freezed == splitChar
          ? _value.splitChar
          : splitChar // ignore: cast_nullable_to_non_nullable
              as String?,
      timeout: freezed == timeout
          ? _value.timeout
          : timeout // ignore: cast_nullable_to_non_nullable
              as int?,
      script: freezed == script
          ? _value.script
          : script // ignore: cast_nullable_to_non_nullable
              as ScriptField?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ScriptFieldCopyWith<$Res>? get script {
    if (_value.script == null) {
      return null;
    }

    return $ScriptFieldCopyWith<$Res>(_value.script!, (value) {
      return _then(_value.copyWith(script: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TemplateAutoCompleteCopyWith<$Res>
    implements $TemplateAutoCompleteCopyWith<$Res> {
  factory _$$_TemplateAutoCompleteCopyWith(_$_TemplateAutoComplete value,
          $Res Function(_$_TemplateAutoComplete) then) =
      __$$_TemplateAutoCompleteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: TemplateType._fromValue, toJson: TemplateType._toValue)
          TemplateType type,
      String? splitChar,
      int? timeout,
      ScriptField? script});

  @override
  $ScriptFieldCopyWith<$Res>? get script;
}

/// @nodoc
class __$$_TemplateAutoCompleteCopyWithImpl<$Res>
    extends _$TemplateAutoCompleteCopyWithImpl<$Res, _$_TemplateAutoComplete>
    implements _$$_TemplateAutoCompleteCopyWith<$Res> {
  __$$_TemplateAutoCompleteCopyWithImpl(_$_TemplateAutoComplete _value,
      $Res Function(_$_TemplateAutoComplete) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? splitChar = freezed,
    Object? timeout = freezed,
    Object? script = freezed,
  }) {
    return _then(_$_TemplateAutoComplete(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TemplateType,
      splitChar: freezed == splitChar
          ? _value.splitChar
          : splitChar // ignore: cast_nullable_to_non_nullable
              as String?,
      timeout: freezed == timeout
          ? _value.timeout
          : timeout // ignore: cast_nullable_to_non_nullable
              as int?,
      script: freezed == script
          ? _value.script
          : script // ignore: cast_nullable_to_non_nullable
              as ScriptField?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TemplateAutoComplete implements _TemplateAutoComplete {
  const _$_TemplateAutoComplete(
      {@JsonKey(fromJson: TemplateType._fromValue, toJson: TemplateType._toValue)
          this.type = TemplateType.autoComplete,
      this.splitChar = ' ',
      this.timeout = 200,
      this.script})
      : assert(type == TemplateType.autoComplete, 'type must be autoComplete');

  factory _$_TemplateAutoComplete.fromJson(Map<String, dynamic> json) =>
      _$$_TemplateAutoCompleteFromJson(json);

  @override
  @JsonKey(fromJson: TemplateType._fromValue, toJson: TemplateType._toValue)
  final TemplateType type;
  @override
  @JsonKey()
  final String? splitChar;
  @override
  @JsonKey()
  final int? timeout;
  @override
  final ScriptField? script;

  @override
  String toString() {
    return 'TemplateAutoComplete(type: $type, splitChar: $splitChar, timeout: $timeout, script: $script)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TemplateAutoComplete &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.splitChar, splitChar) ||
                other.splitChar == splitChar) &&
            (identical(other.timeout, timeout) || other.timeout == timeout) &&
            (identical(other.script, script) || other.script == script));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, type, splitChar, timeout, script);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TemplateAutoCompleteCopyWith<_$_TemplateAutoComplete> get copyWith =>
      __$$_TemplateAutoCompleteCopyWithImpl<_$_TemplateAutoComplete>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TemplateAutoCompleteToJson(
      this,
    );
  }
}

abstract class _TemplateAutoComplete implements TemplateAutoComplete {
  const factory _TemplateAutoComplete(
      {@JsonKey(fromJson: TemplateType._fromValue, toJson: TemplateType._toValue)
          final TemplateType type,
      final String? splitChar,
      final int? timeout,
      final ScriptField? script}) = _$_TemplateAutoComplete;

  factory _TemplateAutoComplete.fromJson(Map<String, dynamic> json) =
      _$_TemplateAutoComplete.fromJson;

  @override
  @JsonKey(fromJson: TemplateType._fromValue, toJson: TemplateType._toValue)
  TemplateType get type;
  @override
  String? get splitChar;
  @override
  int? get timeout;
  @override
  ScriptField? get script;
  @override
  @JsonKey(ignore: true)
  _$$_TemplateAutoCompleteCopyWith<_$_TemplateAutoComplete> get copyWith =>
      throw _privateConstructorUsedError;
}
