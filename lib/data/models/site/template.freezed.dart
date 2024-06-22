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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PageTemplate _$PageTemplateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'autoComplete':
      return PageTemplateAutoComplete.fromJson(json);
    case 'gallery':
      return PageTemplateGallery.fromJson(json);
    case 'list':
      return PageTemplateList.fromJson(json);
    case 'imageViewer':
      return PageTemplateImageViewer.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'PageTemplate',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$PageTemplate {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String splitChar, int timeout, ScriptField script)
        autoComplete,
    required TResult Function(String targetReader) gallery,
    required TResult Function(
            String name,
            List<TemplateListSubPage> subPages,
            List<TemplateListFilterItem> filters,
            ScriptField script,
            String targetItem,
            String targetAutoComplete)
        list,
    required TResult Function() imageViewer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String splitChar, int timeout, ScriptField script)?
        autoComplete,
    TResult? Function(String targetReader)? gallery,
    TResult? Function(
            String name,
            List<TemplateListSubPage> subPages,
            List<TemplateListFilterItem> filters,
            ScriptField script,
            String targetItem,
            String targetAutoComplete)?
        list,
    TResult? Function()? imageViewer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String splitChar, int timeout, ScriptField script)?
        autoComplete,
    TResult Function(String targetReader)? gallery,
    TResult Function(
            String name,
            List<TemplateListSubPage> subPages,
            List<TemplateListFilterItem> filters,
            ScriptField script,
            String targetItem,
            String targetAutoComplete)?
        list,
    TResult Function()? imageViewer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PageTemplateAutoComplete value) autoComplete,
    required TResult Function(PageTemplateGallery value) gallery,
    required TResult Function(PageTemplateList value) list,
    required TResult Function(PageTemplateImageViewer value) imageViewer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PageTemplateAutoComplete value)? autoComplete,
    TResult? Function(PageTemplateGallery value)? gallery,
    TResult? Function(PageTemplateList value)? list,
    TResult? Function(PageTemplateImageViewer value)? imageViewer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PageTemplateAutoComplete value)? autoComplete,
    TResult Function(PageTemplateGallery value)? gallery,
    TResult Function(PageTemplateList value)? list,
    TResult Function(PageTemplateImageViewer value)? imageViewer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageTemplateCopyWith<$Res> {
  factory $PageTemplateCopyWith(
          PageTemplate value, $Res Function(PageTemplate) then) =
      _$PageTemplateCopyWithImpl<$Res, PageTemplate>;
}

/// @nodoc
class _$PageTemplateCopyWithImpl<$Res, $Val extends PageTemplate>
    implements $PageTemplateCopyWith<$Res> {
  _$PageTemplateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PageTemplateAutoCompleteImplCopyWith<$Res> {
  factory _$$PageTemplateAutoCompleteImplCopyWith(
          _$PageTemplateAutoCompleteImpl value,
          $Res Function(_$PageTemplateAutoCompleteImpl) then) =
      __$$PageTemplateAutoCompleteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String splitChar, int timeout, ScriptField script});

  $ScriptFieldCopyWith<$Res> get script;
}

/// @nodoc
class __$$PageTemplateAutoCompleteImplCopyWithImpl<$Res>
    extends _$PageTemplateCopyWithImpl<$Res, _$PageTemplateAutoCompleteImpl>
    implements _$$PageTemplateAutoCompleteImplCopyWith<$Res> {
  __$$PageTemplateAutoCompleteImplCopyWithImpl(
      _$PageTemplateAutoCompleteImpl _value,
      $Res Function(_$PageTemplateAutoCompleteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? splitChar = null,
    Object? timeout = null,
    Object? script = null,
  }) {
    return _then(_$PageTemplateAutoCompleteImpl(
      splitChar: null == splitChar
          ? _value.splitChar
          : splitChar // ignore: cast_nullable_to_non_nullable
              as String,
      timeout: null == timeout
          ? _value.timeout
          : timeout // ignore: cast_nullable_to_non_nullable
              as int,
      script: null == script
          ? _value.script
          : script // ignore: cast_nullable_to_non_nullable
              as ScriptField,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ScriptFieldCopyWith<$Res> get script {
    return $ScriptFieldCopyWith<$Res>(_value.script, (value) {
      return _then(_value.copyWith(script: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$PageTemplateAutoCompleteImpl extends PageTemplateAutoComplete {
  const _$PageTemplateAutoCompleteImpl(
      {this.splitChar = '',
      this.timeout = 0,
      this.script = const ScriptField.output(),
      final String? $type})
      : $type = $type ?? 'autoComplete',
        super._();

  factory _$PageTemplateAutoCompleteImpl.fromJson(Map<String, dynamic> json) =>
      _$$PageTemplateAutoCompleteImplFromJson(json);

  @override
  @JsonKey()
  final String splitChar;
  @override
  @JsonKey()
  final int timeout;
  @override
  @JsonKey()
  final ScriptField script;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PageTemplate.autoComplete(splitChar: $splitChar, timeout: $timeout, script: $script)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageTemplateAutoCompleteImpl &&
            (identical(other.splitChar, splitChar) ||
                other.splitChar == splitChar) &&
            (identical(other.timeout, timeout) || other.timeout == timeout) &&
            (identical(other.script, script) || other.script == script));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, splitChar, timeout, script);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PageTemplateAutoCompleteImplCopyWith<_$PageTemplateAutoCompleteImpl>
      get copyWith => __$$PageTemplateAutoCompleteImplCopyWithImpl<
          _$PageTemplateAutoCompleteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String splitChar, int timeout, ScriptField script)
        autoComplete,
    required TResult Function(String targetReader) gallery,
    required TResult Function(
            String name,
            List<TemplateListSubPage> subPages,
            List<TemplateListFilterItem> filters,
            ScriptField script,
            String targetItem,
            String targetAutoComplete)
        list,
    required TResult Function() imageViewer,
  }) {
    return autoComplete(splitChar, timeout, script);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String splitChar, int timeout, ScriptField script)?
        autoComplete,
    TResult? Function(String targetReader)? gallery,
    TResult? Function(
            String name,
            List<TemplateListSubPage> subPages,
            List<TemplateListFilterItem> filters,
            ScriptField script,
            String targetItem,
            String targetAutoComplete)?
        list,
    TResult? Function()? imageViewer,
  }) {
    return autoComplete?.call(splitChar, timeout, script);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String splitChar, int timeout, ScriptField script)?
        autoComplete,
    TResult Function(String targetReader)? gallery,
    TResult Function(
            String name,
            List<TemplateListSubPage> subPages,
            List<TemplateListFilterItem> filters,
            ScriptField script,
            String targetItem,
            String targetAutoComplete)?
        list,
    TResult Function()? imageViewer,
    required TResult orElse(),
  }) {
    if (autoComplete != null) {
      return autoComplete(splitChar, timeout, script);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PageTemplateAutoComplete value) autoComplete,
    required TResult Function(PageTemplateGallery value) gallery,
    required TResult Function(PageTemplateList value) list,
    required TResult Function(PageTemplateImageViewer value) imageViewer,
  }) {
    return autoComplete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PageTemplateAutoComplete value)? autoComplete,
    TResult? Function(PageTemplateGallery value)? gallery,
    TResult? Function(PageTemplateList value)? list,
    TResult? Function(PageTemplateImageViewer value)? imageViewer,
  }) {
    return autoComplete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PageTemplateAutoComplete value)? autoComplete,
    TResult Function(PageTemplateGallery value)? gallery,
    TResult Function(PageTemplateList value)? list,
    TResult Function(PageTemplateImageViewer value)? imageViewer,
    required TResult orElse(),
  }) {
    if (autoComplete != null) {
      return autoComplete(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PageTemplateAutoCompleteImplToJson(
      this,
    );
  }
}

abstract class PageTemplateAutoComplete extends PageTemplate {
  const factory PageTemplateAutoComplete(
      {final String splitChar,
      final int timeout,
      final ScriptField script}) = _$PageTemplateAutoCompleteImpl;
  const PageTemplateAutoComplete._() : super._();

  factory PageTemplateAutoComplete.fromJson(Map<String, dynamic> json) =
      _$PageTemplateAutoCompleteImpl.fromJson;

  String get splitChar;
  int get timeout;
  ScriptField get script;
  @JsonKey(ignore: true)
  _$$PageTemplateAutoCompleteImplCopyWith<_$PageTemplateAutoCompleteImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PageTemplateGalleryImplCopyWith<$Res> {
  factory _$$PageTemplateGalleryImplCopyWith(_$PageTemplateGalleryImpl value,
          $Res Function(_$PageTemplateGalleryImpl) then) =
      __$$PageTemplateGalleryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String targetReader});
}

/// @nodoc
class __$$PageTemplateGalleryImplCopyWithImpl<$Res>
    extends _$PageTemplateCopyWithImpl<$Res, _$PageTemplateGalleryImpl>
    implements _$$PageTemplateGalleryImplCopyWith<$Res> {
  __$$PageTemplateGalleryImplCopyWithImpl(_$PageTemplateGalleryImpl _value,
      $Res Function(_$PageTemplateGalleryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? targetReader = null,
  }) {
    return _then(_$PageTemplateGalleryImpl(
      targetReader: null == targetReader
          ? _value.targetReader
          : targetReader // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PageTemplateGalleryImpl extends PageTemplateGallery {
  const _$PageTemplateGalleryImpl({this.targetReader = '', final String? $type})
      : $type = $type ?? 'gallery',
        super._();

  factory _$PageTemplateGalleryImpl.fromJson(Map<String, dynamic> json) =>
      _$$PageTemplateGalleryImplFromJson(json);

  @override
  @JsonKey()
  final String targetReader;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PageTemplate.gallery(targetReader: $targetReader)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageTemplateGalleryImpl &&
            (identical(other.targetReader, targetReader) ||
                other.targetReader == targetReader));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, targetReader);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PageTemplateGalleryImplCopyWith<_$PageTemplateGalleryImpl> get copyWith =>
      __$$PageTemplateGalleryImplCopyWithImpl<_$PageTemplateGalleryImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String splitChar, int timeout, ScriptField script)
        autoComplete,
    required TResult Function(String targetReader) gallery,
    required TResult Function(
            String name,
            List<TemplateListSubPage> subPages,
            List<TemplateListFilterItem> filters,
            ScriptField script,
            String targetItem,
            String targetAutoComplete)
        list,
    required TResult Function() imageViewer,
  }) {
    return gallery(targetReader);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String splitChar, int timeout, ScriptField script)?
        autoComplete,
    TResult? Function(String targetReader)? gallery,
    TResult? Function(
            String name,
            List<TemplateListSubPage> subPages,
            List<TemplateListFilterItem> filters,
            ScriptField script,
            String targetItem,
            String targetAutoComplete)?
        list,
    TResult? Function()? imageViewer,
  }) {
    return gallery?.call(targetReader);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String splitChar, int timeout, ScriptField script)?
        autoComplete,
    TResult Function(String targetReader)? gallery,
    TResult Function(
            String name,
            List<TemplateListSubPage> subPages,
            List<TemplateListFilterItem> filters,
            ScriptField script,
            String targetItem,
            String targetAutoComplete)?
        list,
    TResult Function()? imageViewer,
    required TResult orElse(),
  }) {
    if (gallery != null) {
      return gallery(targetReader);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PageTemplateAutoComplete value) autoComplete,
    required TResult Function(PageTemplateGallery value) gallery,
    required TResult Function(PageTemplateList value) list,
    required TResult Function(PageTemplateImageViewer value) imageViewer,
  }) {
    return gallery(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PageTemplateAutoComplete value)? autoComplete,
    TResult? Function(PageTemplateGallery value)? gallery,
    TResult? Function(PageTemplateList value)? list,
    TResult? Function(PageTemplateImageViewer value)? imageViewer,
  }) {
    return gallery?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PageTemplateAutoComplete value)? autoComplete,
    TResult Function(PageTemplateGallery value)? gallery,
    TResult Function(PageTemplateList value)? list,
    TResult Function(PageTemplateImageViewer value)? imageViewer,
    required TResult orElse(),
  }) {
    if (gallery != null) {
      return gallery(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PageTemplateGalleryImplToJson(
      this,
    );
  }
}

abstract class PageTemplateGallery extends PageTemplate {
  const factory PageTemplateGallery({final String targetReader}) =
      _$PageTemplateGalleryImpl;
  const PageTemplateGallery._() : super._();

  factory PageTemplateGallery.fromJson(Map<String, dynamic> json) =
      _$PageTemplateGalleryImpl.fromJson;

  String get targetReader;
  @JsonKey(ignore: true)
  _$$PageTemplateGalleryImplCopyWith<_$PageTemplateGalleryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PageTemplateListImplCopyWith<$Res> {
  factory _$$PageTemplateListImplCopyWith(_$PageTemplateListImpl value,
          $Res Function(_$PageTemplateListImpl) then) =
      __$$PageTemplateListImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String name,
      List<TemplateListSubPage> subPages,
      List<TemplateListFilterItem> filters,
      ScriptField script,
      String targetItem,
      String targetAutoComplete});

  $ScriptFieldCopyWith<$Res> get script;
}

/// @nodoc
class __$$PageTemplateListImplCopyWithImpl<$Res>
    extends _$PageTemplateCopyWithImpl<$Res, _$PageTemplateListImpl>
    implements _$$PageTemplateListImplCopyWith<$Res> {
  __$$PageTemplateListImplCopyWithImpl(_$PageTemplateListImpl _value,
      $Res Function(_$PageTemplateListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? subPages = null,
    Object? filters = null,
    Object? script = null,
    Object? targetItem = null,
    Object? targetAutoComplete = null,
  }) {
    return _then(_$PageTemplateListImpl(
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

  @override
  @pragma('vm:prefer-inline')
  $ScriptFieldCopyWith<$Res> get script {
    return $ScriptFieldCopyWith<$Res>(_value.script, (value) {
      return _then(_value.copyWith(script: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$PageTemplateListImpl extends PageTemplateList {
  const _$PageTemplateListImpl(
      {this.name = '',
      final List<TemplateListSubPage> subPages = const [],
      final List<TemplateListFilterItem> filters = const [],
      this.script = const ScriptField.output(),
      this.targetItem = '',
      this.targetAutoComplete = '',
      final String? $type})
      : _subPages = subPages,
        _filters = filters,
        $type = $type ?? 'list',
        super._();

  factory _$PageTemplateListImpl.fromJson(Map<String, dynamic> json) =>
      _$$PageTemplateListImplFromJson(json);

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
  final String targetItem;
  @override
  @JsonKey()
  final String targetAutoComplete;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PageTemplate.list(name: $name, subPages: $subPages, filters: $filters, script: $script, targetItem: $targetItem, targetAutoComplete: $targetAutoComplete)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageTemplateListImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._subPages, _subPages) &&
            const DeepCollectionEquality().equals(other._filters, _filters) &&
            (identical(other.script, script) || other.script == script) &&
            (identical(other.targetItem, targetItem) ||
                other.targetItem == targetItem) &&
            (identical(other.targetAutoComplete, targetAutoComplete) ||
                other.targetAutoComplete == targetAutoComplete));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      const DeepCollectionEquality().hash(_subPages),
      const DeepCollectionEquality().hash(_filters),
      script,
      targetItem,
      targetAutoComplete);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PageTemplateListImplCopyWith<_$PageTemplateListImpl> get copyWith =>
      __$$PageTemplateListImplCopyWithImpl<_$PageTemplateListImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String splitChar, int timeout, ScriptField script)
        autoComplete,
    required TResult Function(String targetReader) gallery,
    required TResult Function(
            String name,
            List<TemplateListSubPage> subPages,
            List<TemplateListFilterItem> filters,
            ScriptField script,
            String targetItem,
            String targetAutoComplete)
        list,
    required TResult Function() imageViewer,
  }) {
    return list(
        name, subPages, filters, script, targetItem, targetAutoComplete);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String splitChar, int timeout, ScriptField script)?
        autoComplete,
    TResult? Function(String targetReader)? gallery,
    TResult? Function(
            String name,
            List<TemplateListSubPage> subPages,
            List<TemplateListFilterItem> filters,
            ScriptField script,
            String targetItem,
            String targetAutoComplete)?
        list,
    TResult? Function()? imageViewer,
  }) {
    return list?.call(
        name, subPages, filters, script, targetItem, targetAutoComplete);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String splitChar, int timeout, ScriptField script)?
        autoComplete,
    TResult Function(String targetReader)? gallery,
    TResult Function(
            String name,
            List<TemplateListSubPage> subPages,
            List<TemplateListFilterItem> filters,
            ScriptField script,
            String targetItem,
            String targetAutoComplete)?
        list,
    TResult Function()? imageViewer,
    required TResult orElse(),
  }) {
    if (list != null) {
      return list(
          name, subPages, filters, script, targetItem, targetAutoComplete);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PageTemplateAutoComplete value) autoComplete,
    required TResult Function(PageTemplateGallery value) gallery,
    required TResult Function(PageTemplateList value) list,
    required TResult Function(PageTemplateImageViewer value) imageViewer,
  }) {
    return list(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PageTemplateAutoComplete value)? autoComplete,
    TResult? Function(PageTemplateGallery value)? gallery,
    TResult? Function(PageTemplateList value)? list,
    TResult? Function(PageTemplateImageViewer value)? imageViewer,
  }) {
    return list?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PageTemplateAutoComplete value)? autoComplete,
    TResult Function(PageTemplateGallery value)? gallery,
    TResult Function(PageTemplateList value)? list,
    TResult Function(PageTemplateImageViewer value)? imageViewer,
    required TResult orElse(),
  }) {
    if (list != null) {
      return list(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PageTemplateListImplToJson(
      this,
    );
  }
}

abstract class PageTemplateList extends PageTemplate {
  const factory PageTemplateList(
      {final String name,
      final List<TemplateListSubPage> subPages,
      final List<TemplateListFilterItem> filters,
      final ScriptField script,
      final String targetItem,
      final String targetAutoComplete}) = _$PageTemplateListImpl;
  const PageTemplateList._() : super._();

  factory PageTemplateList.fromJson(Map<String, dynamic> json) =
      _$PageTemplateListImpl.fromJson;

  String get name;
  List<TemplateListSubPage> get subPages;
  List<TemplateListFilterItem> get filters;
  ScriptField get script;
  String get targetItem;
  String get targetAutoComplete;
  @JsonKey(ignore: true)
  _$$PageTemplateListImplCopyWith<_$PageTemplateListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PageTemplateImageViewerImplCopyWith<$Res> {
  factory _$$PageTemplateImageViewerImplCopyWith(
          _$PageTemplateImageViewerImpl value,
          $Res Function(_$PageTemplateImageViewerImpl) then) =
      __$$PageTemplateImageViewerImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PageTemplateImageViewerImplCopyWithImpl<$Res>
    extends _$PageTemplateCopyWithImpl<$Res, _$PageTemplateImageViewerImpl>
    implements _$$PageTemplateImageViewerImplCopyWith<$Res> {
  __$$PageTemplateImageViewerImplCopyWithImpl(
      _$PageTemplateImageViewerImpl _value,
      $Res Function(_$PageTemplateImageViewerImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$PageTemplateImageViewerImpl extends PageTemplateImageViewer {
  const _$PageTemplateImageViewerImpl({final String? $type})
      : $type = $type ?? 'imageViewer',
        super._();

  factory _$PageTemplateImageViewerImpl.fromJson(Map<String, dynamic> json) =>
      _$$PageTemplateImageViewerImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PageTemplate.imageViewer()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageTemplateImageViewerImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String splitChar, int timeout, ScriptField script)
        autoComplete,
    required TResult Function(String targetReader) gallery,
    required TResult Function(
            String name,
            List<TemplateListSubPage> subPages,
            List<TemplateListFilterItem> filters,
            ScriptField script,
            String targetItem,
            String targetAutoComplete)
        list,
    required TResult Function() imageViewer,
  }) {
    return imageViewer();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String splitChar, int timeout, ScriptField script)?
        autoComplete,
    TResult? Function(String targetReader)? gallery,
    TResult? Function(
            String name,
            List<TemplateListSubPage> subPages,
            List<TemplateListFilterItem> filters,
            ScriptField script,
            String targetItem,
            String targetAutoComplete)?
        list,
    TResult? Function()? imageViewer,
  }) {
    return imageViewer?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String splitChar, int timeout, ScriptField script)?
        autoComplete,
    TResult Function(String targetReader)? gallery,
    TResult Function(
            String name,
            List<TemplateListSubPage> subPages,
            List<TemplateListFilterItem> filters,
            ScriptField script,
            String targetItem,
            String targetAutoComplete)?
        list,
    TResult Function()? imageViewer,
    required TResult orElse(),
  }) {
    if (imageViewer != null) {
      return imageViewer();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PageTemplateAutoComplete value) autoComplete,
    required TResult Function(PageTemplateGallery value) gallery,
    required TResult Function(PageTemplateList value) list,
    required TResult Function(PageTemplateImageViewer value) imageViewer,
  }) {
    return imageViewer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PageTemplateAutoComplete value)? autoComplete,
    TResult? Function(PageTemplateGallery value)? gallery,
    TResult? Function(PageTemplateList value)? list,
    TResult? Function(PageTemplateImageViewer value)? imageViewer,
  }) {
    return imageViewer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PageTemplateAutoComplete value)? autoComplete,
    TResult Function(PageTemplateGallery value)? gallery,
    TResult Function(PageTemplateList value)? list,
    TResult Function(PageTemplateImageViewer value)? imageViewer,
    required TResult orElse(),
  }) {
    if (imageViewer != null) {
      return imageViewer(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PageTemplateImageViewerImplToJson(
      this,
    );
  }
}

abstract class PageTemplateImageViewer extends PageTemplate {
  const factory PageTemplateImageViewer() = _$PageTemplateImageViewerImpl;
  const PageTemplateImageViewer._() : super._();

  factory PageTemplateImageViewer.fromJson(Map<String, dynamic> json) =
      _$PageTemplateImageViewerImpl.fromJson;
}
