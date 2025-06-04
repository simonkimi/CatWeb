// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'template.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
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
  /// Serializes this PageTemplate to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PageTemplate);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PageTemplate()';
  }
}

/// @nodoc
class $PageTemplateCopyWith<$Res> {
  $PageTemplateCopyWith(PageTemplate _, $Res Function(PageTemplate) __);
}

/// @nodoc
@JsonSerializable()
class PageTemplateAutoComplete extends PageTemplate {
  const PageTemplateAutoComplete(
      {this.splitChar = '',
      this.timeout = 0,
      this.script = const ScriptField.output(),
      final String? $type})
      : $type = $type ?? 'autoComplete',
        super._();
  factory PageTemplateAutoComplete.fromJson(Map<String, dynamic> json) =>
      _$PageTemplateAutoCompleteFromJson(json);

  @JsonKey()
  final String splitChar;
  @JsonKey()
  final int timeout;
  @JsonKey()
  final ScriptField script;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of PageTemplate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PageTemplateAutoCompleteCopyWith<PageTemplateAutoComplete> get copyWith =>
      _$PageTemplateAutoCompleteCopyWithImpl<PageTemplateAutoComplete>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PageTemplateAutoCompleteToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PageTemplateAutoComplete &&
            (identical(other.splitChar, splitChar) ||
                other.splitChar == splitChar) &&
            (identical(other.timeout, timeout) || other.timeout == timeout) &&
            (identical(other.script, script) || other.script == script));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, splitChar, timeout, script);

  @override
  String toString() {
    return 'PageTemplate.autoComplete(splitChar: $splitChar, timeout: $timeout, script: $script)';
  }
}

/// @nodoc
abstract mixin class $PageTemplateAutoCompleteCopyWith<$Res>
    implements $PageTemplateCopyWith<$Res> {
  factory $PageTemplateAutoCompleteCopyWith(PageTemplateAutoComplete value,
          $Res Function(PageTemplateAutoComplete) _then) =
      _$PageTemplateAutoCompleteCopyWithImpl;
  @useResult
  $Res call({String splitChar, int timeout, ScriptField script});

  $ScriptFieldCopyWith<$Res> get script;
}

/// @nodoc
class _$PageTemplateAutoCompleteCopyWithImpl<$Res>
    implements $PageTemplateAutoCompleteCopyWith<$Res> {
  _$PageTemplateAutoCompleteCopyWithImpl(this._self, this._then);

  final PageTemplateAutoComplete _self;
  final $Res Function(PageTemplateAutoComplete) _then;

  /// Create a copy of PageTemplate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? splitChar = null,
    Object? timeout = null,
    Object? script = null,
  }) {
    return _then(PageTemplateAutoComplete(
      splitChar: null == splitChar
          ? _self.splitChar
          : splitChar // ignore: cast_nullable_to_non_nullable
              as String,
      timeout: null == timeout
          ? _self.timeout
          : timeout // ignore: cast_nullable_to_non_nullable
              as int,
      script: null == script
          ? _self.script
          : script // ignore: cast_nullable_to_non_nullable
              as ScriptField,
    ));
  }

  /// Create a copy of PageTemplate
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
class PageTemplateGallery extends PageTemplate {
  const PageTemplateGallery({this.targetReader = '', final String? $type})
      : $type = $type ?? 'gallery',
        super._();
  factory PageTemplateGallery.fromJson(Map<String, dynamic> json) =>
      _$PageTemplateGalleryFromJson(json);

  @JsonKey()
  final String targetReader;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of PageTemplate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PageTemplateGalleryCopyWith<PageTemplateGallery> get copyWith =>
      _$PageTemplateGalleryCopyWithImpl<PageTemplateGallery>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PageTemplateGalleryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PageTemplateGallery &&
            (identical(other.targetReader, targetReader) ||
                other.targetReader == targetReader));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, targetReader);

  @override
  String toString() {
    return 'PageTemplate.gallery(targetReader: $targetReader)';
  }
}

/// @nodoc
abstract mixin class $PageTemplateGalleryCopyWith<$Res>
    implements $PageTemplateCopyWith<$Res> {
  factory $PageTemplateGalleryCopyWith(
          PageTemplateGallery value, $Res Function(PageTemplateGallery) _then) =
      _$PageTemplateGalleryCopyWithImpl;
  @useResult
  $Res call({String targetReader});
}

/// @nodoc
class _$PageTemplateGalleryCopyWithImpl<$Res>
    implements $PageTemplateGalleryCopyWith<$Res> {
  _$PageTemplateGalleryCopyWithImpl(this._self, this._then);

  final PageTemplateGallery _self;
  final $Res Function(PageTemplateGallery) _then;

  /// Create a copy of PageTemplate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? targetReader = null,
  }) {
    return _then(PageTemplateGallery(
      targetReader: null == targetReader
          ? _self.targetReader
          : targetReader // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class PageTemplateList extends PageTemplate {
  const PageTemplateList(
      {this.name = '',
      final List<TemplateListSubPage> subPages = const [],
      this.filter = const TemplateListFilter(),
      this.targetItem = '',
      this.targetAutoComplete = '',
      final String? $type})
      : _subPages = subPages,
        $type = $type ?? 'list',
        super._();
  factory PageTemplateList.fromJson(Map<String, dynamic> json) =>
      _$PageTemplateListFromJson(json);

  @JsonKey()
  final String name;
  final List<TemplateListSubPage> _subPages;
  @JsonKey()
  List<TemplateListSubPage> get subPages {
    if (_subPages is EqualUnmodifiableListView) return _subPages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subPages);
  }

  @JsonKey()
  final TemplateListFilter filter;
  @JsonKey()
  final String targetItem;
  @JsonKey()
  final String targetAutoComplete;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of PageTemplate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PageTemplateListCopyWith<PageTemplateList> get copyWith =>
      _$PageTemplateListCopyWithImpl<PageTemplateList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PageTemplateListToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PageTemplateList &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._subPages, _subPages) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.targetItem, targetItem) ||
                other.targetItem == targetItem) &&
            (identical(other.targetAutoComplete, targetAutoComplete) ||
                other.targetAutoComplete == targetAutoComplete));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      const DeepCollectionEquality().hash(_subPages),
      filter,
      targetItem,
      targetAutoComplete);

  @override
  String toString() {
    return 'PageTemplate.list(name: $name, subPages: $subPages, filter: $filter, targetItem: $targetItem, targetAutoComplete: $targetAutoComplete)';
  }
}

/// @nodoc
abstract mixin class $PageTemplateListCopyWith<$Res>
    implements $PageTemplateCopyWith<$Res> {
  factory $PageTemplateListCopyWith(
          PageTemplateList value, $Res Function(PageTemplateList) _then) =
      _$PageTemplateListCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      List<TemplateListSubPage> subPages,
      TemplateListFilter filter,
      String targetItem,
      String targetAutoComplete});

  $TemplateListFilterCopyWith<$Res> get filter;
}

/// @nodoc
class _$PageTemplateListCopyWithImpl<$Res>
    implements $PageTemplateListCopyWith<$Res> {
  _$PageTemplateListCopyWithImpl(this._self, this._then);

  final PageTemplateList _self;
  final $Res Function(PageTemplateList) _then;

  /// Create a copy of PageTemplate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? subPages = null,
    Object? filter = null,
    Object? targetItem = null,
    Object? targetAutoComplete = null,
  }) {
    return _then(PageTemplateList(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      subPages: null == subPages
          ? _self._subPages
          : subPages // ignore: cast_nullable_to_non_nullable
              as List<TemplateListSubPage>,
      filter: null == filter
          ? _self.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as TemplateListFilter,
      targetItem: null == targetItem
          ? _self.targetItem
          : targetItem // ignore: cast_nullable_to_non_nullable
              as String,
      targetAutoComplete: null == targetAutoComplete
          ? _self.targetAutoComplete
          : targetAutoComplete // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of PageTemplate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TemplateListFilterCopyWith<$Res> get filter {
    return $TemplateListFilterCopyWith<$Res>(_self.filter, (value) {
      return _then(_self.copyWith(filter: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class PageTemplateImageViewer extends PageTemplate {
  const PageTemplateImageViewer({final String? $type})
      : $type = $type ?? 'imageViewer',
        super._();
  factory PageTemplateImageViewer.fromJson(Map<String, dynamic> json) =>
      _$PageTemplateImageViewerFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  Map<String, dynamic> toJson() {
    return _$PageTemplateImageViewerToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PageTemplateImageViewer);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PageTemplate.imageViewer()';
  }
}

// dart format on
