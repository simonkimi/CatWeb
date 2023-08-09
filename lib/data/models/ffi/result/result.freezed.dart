// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DetailPreviewItem _$DetailPreviewItemFromJson(Map<String, dynamic> json) {
  return _PreviewItem.fromJson(json);
}

/// @nodoc
mixin _$DetailPreviewItem {
  ImageResult? get previewImage => throw _privateConstructorUsedError;
  String? get target => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailPreviewItemCopyWith<DetailPreviewItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailPreviewItemCopyWith<$Res> {
  factory $DetailPreviewItemCopyWith(
          DetailPreviewItem value, $Res Function(DetailPreviewItem) then) =
      _$DetailPreviewItemCopyWithImpl<$Res, DetailPreviewItem>;
  @useResult
  $Res call({ImageResult? previewImage, String? target});

  $ImageResultCopyWith<$Res>? get previewImage;
}

/// @nodoc
class _$DetailPreviewItemCopyWithImpl<$Res, $Val extends DetailPreviewItem>
    implements $DetailPreviewItemCopyWith<$Res> {
  _$DetailPreviewItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? previewImage = freezed,
    Object? target = freezed,
  }) {
    return _then(_value.copyWith(
      previewImage: freezed == previewImage
          ? _value.previewImage
          : previewImage // ignore: cast_nullable_to_non_nullable
              as ImageResult?,
      target: freezed == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageResultCopyWith<$Res>? get previewImage {
    if (_value.previewImage == null) {
      return null;
    }

    return $ImageResultCopyWith<$Res>(_value.previewImage!, (value) {
      return _then(_value.copyWith(previewImage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PreviewItemCopyWith<$Res>
    implements $DetailPreviewItemCopyWith<$Res> {
  factory _$$_PreviewItemCopyWith(
          _$_PreviewItem value, $Res Function(_$_PreviewItem) then) =
      __$$_PreviewItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ImageResult? previewImage, String? target});

  @override
  $ImageResultCopyWith<$Res>? get previewImage;
}

/// @nodoc
class __$$_PreviewItemCopyWithImpl<$Res>
    extends _$DetailPreviewItemCopyWithImpl<$Res, _$_PreviewItem>
    implements _$$_PreviewItemCopyWith<$Res> {
  __$$_PreviewItemCopyWithImpl(
      _$_PreviewItem _value, $Res Function(_$_PreviewItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? previewImage = freezed,
    Object? target = freezed,
  }) {
    return _then(_$_PreviewItem(
      previewImage: freezed == previewImage
          ? _value.previewImage
          : previewImage // ignore: cast_nullable_to_non_nullable
              as ImageResult?,
      target: freezed == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PreviewItem with DiagnosticableTreeMixin implements _PreviewItem {
  const _$_PreviewItem({this.previewImage, this.target});

  factory _$_PreviewItem.fromJson(Map<String, dynamic> json) =>
      _$$_PreviewItemFromJson(json);

  @override
  final ImageResult? previewImage;
  @override
  final String? target;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DetailPreviewItem(previewImage: $previewImage, target: $target)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DetailPreviewItem'))
      ..add(DiagnosticsProperty('previewImage', previewImage))
      ..add(DiagnosticsProperty('target', target));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PreviewItem &&
            (identical(other.previewImage, previewImage) ||
                other.previewImage == previewImage) &&
            (identical(other.target, target) || other.target == target));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, previewImage, target);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PreviewItemCopyWith<_$_PreviewItem> get copyWith =>
      __$$_PreviewItemCopyWithImpl<_$_PreviewItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PreviewItemToJson(
      this,
    );
  }
}

abstract class _PreviewItem implements DetailPreviewItem {
  const factory _PreviewItem(
      {final ImageResult? previewImage, final String? target}) = _$_PreviewItem;

  factory _PreviewItem.fromJson(Map<String, dynamic> json) =
      _$_PreviewItem.fromJson;

  @override
  ImageResult? get previewImage;
  @override
  String? get target;
  @override
  @JsonKey(ignore: true)
  _$$_PreviewItemCopyWith<_$_PreviewItem> get copyWith =>
      throw _privateConstructorUsedError;
}

DetailParserResult _$DetailParserResultFromJson(Map<String, dynamic> json) {
  return _DetailParserResult.fromJson(json);
}

/// @nodoc
mixin _$DetailParserResult {
  String? get title => throw _privateConstructorUsedError;
  String? get subtitle => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;
  int? get imageCount => throw _privateConstructorUsedError;
  String? get uploadTime => throw _privateConstructorUsedError;
  int? get countPrePage => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  double? get star => throw _privateConstructorUsedError;
  List<DetailPreviewItem>? get previews => throw _privateConstructorUsedError;
  ImageResult? get coverImage => throw _privateConstructorUsedError;
  List<TagResult>? get badges => throw _privateConstructorUsedError;
  List<TagResult>? get tags => throw _privateConstructorUsedError;
  List<CommentResult>? get comments => throw _privateConstructorUsedError;
  String? get nextPage => throw _privateConstructorUsedError;
  bool? get isSuccess => throw _privateConstructorUsedError;
  String? get failMessage => throw _privateConstructorUsedError;
  List<EnvResult> get env => throw _privateConstructorUsedError;
  List<ParserError> get errors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailParserResultCopyWith<DetailParserResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailParserResultCopyWith<$Res> {
  factory $DetailParserResultCopyWith(
          DetailParserResult value, $Res Function(DetailParserResult) then) =
      _$DetailParserResultCopyWithImpl<$Res, DetailParserResult>;
  @useResult
  $Res call(
      {String? title,
      String? subtitle,
      String? language,
      int? imageCount,
      String? uploadTime,
      int? countPrePage,
      String? description,
      double? star,
      List<DetailPreviewItem>? previews,
      ImageResult? coverImage,
      List<TagResult>? badges,
      List<TagResult>? tags,
      List<CommentResult>? comments,
      String? nextPage,
      bool? isSuccess,
      String? failMessage,
      List<EnvResult> env,
      List<ParserError> errors});

  $ImageResultCopyWith<$Res>? get coverImage;
}

/// @nodoc
class _$DetailParserResultCopyWithImpl<$Res, $Val extends DetailParserResult>
    implements $DetailParserResultCopyWith<$Res> {
  _$DetailParserResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? subtitle = freezed,
    Object? language = freezed,
    Object? imageCount = freezed,
    Object? uploadTime = freezed,
    Object? countPrePage = freezed,
    Object? description = freezed,
    Object? star = freezed,
    Object? previews = freezed,
    Object? coverImage = freezed,
    Object? badges = freezed,
    Object? tags = freezed,
    Object? comments = freezed,
    Object? nextPage = freezed,
    Object? isSuccess = freezed,
    Object? failMessage = freezed,
    Object? env = null,
    Object? errors = null,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      imageCount: freezed == imageCount
          ? _value.imageCount
          : imageCount // ignore: cast_nullable_to_non_nullable
              as int?,
      uploadTime: freezed == uploadTime
          ? _value.uploadTime
          : uploadTime // ignore: cast_nullable_to_non_nullable
              as String?,
      countPrePage: freezed == countPrePage
          ? _value.countPrePage
          : countPrePage // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      star: freezed == star
          ? _value.star
          : star // ignore: cast_nullable_to_non_nullable
              as double?,
      previews: freezed == previews
          ? _value.previews
          : previews // ignore: cast_nullable_to_non_nullable
              as List<DetailPreviewItem>?,
      coverImage: freezed == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as ImageResult?,
      badges: freezed == badges
          ? _value.badges
          : badges // ignore: cast_nullable_to_non_nullable
              as List<TagResult>?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagResult>?,
      comments: freezed == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentResult>?,
      nextPage: freezed == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as String?,
      isSuccess: freezed == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      failMessage: freezed == failMessage
          ? _value.failMessage
          : failMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      env: null == env
          ? _value.env
          : env // ignore: cast_nullable_to_non_nullable
              as List<EnvResult>,
      errors: null == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<ParserError>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageResultCopyWith<$Res>? get coverImage {
    if (_value.coverImage == null) {
      return null;
    }

    return $ImageResultCopyWith<$Res>(_value.coverImage!, (value) {
      return _then(_value.copyWith(coverImage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DetailParserResultCopyWith<$Res>
    implements $DetailParserResultCopyWith<$Res> {
  factory _$$_DetailParserResultCopyWith(_$_DetailParserResult value,
          $Res Function(_$_DetailParserResult) then) =
      __$$_DetailParserResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? title,
      String? subtitle,
      String? language,
      int? imageCount,
      String? uploadTime,
      int? countPrePage,
      String? description,
      double? star,
      List<DetailPreviewItem>? previews,
      ImageResult? coverImage,
      List<TagResult>? badges,
      List<TagResult>? tags,
      List<CommentResult>? comments,
      String? nextPage,
      bool? isSuccess,
      String? failMessage,
      List<EnvResult> env,
      List<ParserError> errors});

  @override
  $ImageResultCopyWith<$Res>? get coverImage;
}

/// @nodoc
class __$$_DetailParserResultCopyWithImpl<$Res>
    extends _$DetailParserResultCopyWithImpl<$Res, _$_DetailParserResult>
    implements _$$_DetailParserResultCopyWith<$Res> {
  __$$_DetailParserResultCopyWithImpl(
      _$_DetailParserResult _value, $Res Function(_$_DetailParserResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? subtitle = freezed,
    Object? language = freezed,
    Object? imageCount = freezed,
    Object? uploadTime = freezed,
    Object? countPrePage = freezed,
    Object? description = freezed,
    Object? star = freezed,
    Object? previews = freezed,
    Object? coverImage = freezed,
    Object? badges = freezed,
    Object? tags = freezed,
    Object? comments = freezed,
    Object? nextPage = freezed,
    Object? isSuccess = freezed,
    Object? failMessage = freezed,
    Object? env = null,
    Object? errors = null,
  }) {
    return _then(_$_DetailParserResult(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      imageCount: freezed == imageCount
          ? _value.imageCount
          : imageCount // ignore: cast_nullable_to_non_nullable
              as int?,
      uploadTime: freezed == uploadTime
          ? _value.uploadTime
          : uploadTime // ignore: cast_nullable_to_non_nullable
              as String?,
      countPrePage: freezed == countPrePage
          ? _value.countPrePage
          : countPrePage // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      star: freezed == star
          ? _value.star
          : star // ignore: cast_nullable_to_non_nullable
              as double?,
      previews: freezed == previews
          ? _value._previews
          : previews // ignore: cast_nullable_to_non_nullable
              as List<DetailPreviewItem>?,
      coverImage: freezed == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as ImageResult?,
      badges: freezed == badges
          ? _value._badges
          : badges // ignore: cast_nullable_to_non_nullable
              as List<TagResult>?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagResult>?,
      comments: freezed == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentResult>?,
      nextPage: freezed == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as String?,
      isSuccess: freezed == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      failMessage: freezed == failMessage
          ? _value.failMessage
          : failMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      env: null == env
          ? _value._env
          : env // ignore: cast_nullable_to_non_nullable
              as List<EnvResult>,
      errors: null == errors
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<ParserError>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DetailParserResult
    with DiagnosticableTreeMixin
    implements _DetailParserResult {
  const _$_DetailParserResult(
      {this.title,
      this.subtitle,
      this.language,
      this.imageCount,
      this.uploadTime,
      this.countPrePage,
      this.description,
      this.star,
      final List<DetailPreviewItem>? previews,
      this.coverImage,
      final List<TagResult>? badges,
      final List<TagResult>? tags,
      final List<CommentResult>? comments,
      this.nextPage,
      this.isSuccess,
      this.failMessage,
      required final List<EnvResult> env,
      required final List<ParserError> errors})
      : _previews = previews,
        _badges = badges,
        _tags = tags,
        _comments = comments,
        _env = env,
        _errors = errors;

  factory _$_DetailParserResult.fromJson(Map<String, dynamic> json) =>
      _$$_DetailParserResultFromJson(json);

  @override
  final String? title;
  @override
  final String? subtitle;
  @override
  final String? language;
  @override
  final int? imageCount;
  @override
  final String? uploadTime;
  @override
  final int? countPrePage;
  @override
  final String? description;
  @override
  final double? star;
  final List<DetailPreviewItem>? _previews;
  @override
  List<DetailPreviewItem>? get previews {
    final value = _previews;
    if (value == null) return null;
    if (_previews is EqualUnmodifiableListView) return _previews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final ImageResult? coverImage;
  final List<TagResult>? _badges;
  @override
  List<TagResult>? get badges {
    final value = _badges;
    if (value == null) return null;
    if (_badges is EqualUnmodifiableListView) return _badges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<TagResult>? _tags;
  @override
  List<TagResult>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<CommentResult>? _comments;
  @override
  List<CommentResult>? get comments {
    final value = _comments;
    if (value == null) return null;
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? nextPage;
  @override
  final bool? isSuccess;
  @override
  final String? failMessage;
  final List<EnvResult> _env;
  @override
  List<EnvResult> get env {
    if (_env is EqualUnmodifiableListView) return _env;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_env);
  }

  final List<ParserError> _errors;
  @override
  List<ParserError> get errors {
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_errors);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DetailParserResult(title: $title, subtitle: $subtitle, language: $language, imageCount: $imageCount, uploadTime: $uploadTime, countPrePage: $countPrePage, description: $description, star: $star, previews: $previews, coverImage: $coverImage, badges: $badges, tags: $tags, comments: $comments, nextPage: $nextPage, isSuccess: $isSuccess, failMessage: $failMessage, env: $env, errors: $errors)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DetailParserResult'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('subtitle', subtitle))
      ..add(DiagnosticsProperty('language', language))
      ..add(DiagnosticsProperty('imageCount', imageCount))
      ..add(DiagnosticsProperty('uploadTime', uploadTime))
      ..add(DiagnosticsProperty('countPrePage', countPrePage))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('star', star))
      ..add(DiagnosticsProperty('previews', previews))
      ..add(DiagnosticsProperty('coverImage', coverImage))
      ..add(DiagnosticsProperty('badges', badges))
      ..add(DiagnosticsProperty('tags', tags))
      ..add(DiagnosticsProperty('comments', comments))
      ..add(DiagnosticsProperty('nextPage', nextPage))
      ..add(DiagnosticsProperty('isSuccess', isSuccess))
      ..add(DiagnosticsProperty('failMessage', failMessage))
      ..add(DiagnosticsProperty('env', env))
      ..add(DiagnosticsProperty('errors', errors));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DetailParserResult &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.imageCount, imageCount) ||
                other.imageCount == imageCount) &&
            (identical(other.uploadTime, uploadTime) ||
                other.uploadTime == uploadTime) &&
            (identical(other.countPrePage, countPrePage) ||
                other.countPrePage == countPrePage) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.star, star) || other.star == star) &&
            const DeepCollectionEquality().equals(other._previews, _previews) &&
            (identical(other.coverImage, coverImage) ||
                other.coverImage == coverImage) &&
            const DeepCollectionEquality().equals(other._badges, _badges) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(other._comments, _comments) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.failMessage, failMessage) ||
                other.failMessage == failMessage) &&
            const DeepCollectionEquality().equals(other._env, _env) &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      subtitle,
      language,
      imageCount,
      uploadTime,
      countPrePage,
      description,
      star,
      const DeepCollectionEquality().hash(_previews),
      coverImage,
      const DeepCollectionEquality().hash(_badges),
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_comments),
      nextPage,
      isSuccess,
      failMessage,
      const DeepCollectionEquality().hash(_env),
      const DeepCollectionEquality().hash(_errors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DetailParserResultCopyWith<_$_DetailParserResult> get copyWith =>
      __$$_DetailParserResultCopyWithImpl<_$_DetailParserResult>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DetailParserResultToJson(
      this,
    );
  }
}

abstract class _DetailParserResult implements DetailParserResult {
  const factory _DetailParserResult(
      {final String? title,
      final String? subtitle,
      final String? language,
      final int? imageCount,
      final String? uploadTime,
      final int? countPrePage,
      final String? description,
      final double? star,
      final List<DetailPreviewItem>? previews,
      final ImageResult? coverImage,
      final List<TagResult>? badges,
      final List<TagResult>? tags,
      final List<CommentResult>? comments,
      final String? nextPage,
      final bool? isSuccess,
      final String? failMessage,
      required final List<EnvResult> env,
      required final List<ParserError> errors}) = _$_DetailParserResult;

  factory _DetailParserResult.fromJson(Map<String, dynamic> json) =
      _$_DetailParserResult.fromJson;

  @override
  String? get title;
  @override
  String? get subtitle;
  @override
  String? get language;
  @override
  int? get imageCount;
  @override
  String? get uploadTime;
  @override
  int? get countPrePage;
  @override
  String? get description;
  @override
  double? get star;
  @override
  List<DetailPreviewItem>? get previews;
  @override
  ImageResult? get coverImage;
  @override
  List<TagResult>? get badges;
  @override
  List<TagResult>? get tags;
  @override
  List<CommentResult>? get comments;
  @override
  String? get nextPage;
  @override
  bool? get isSuccess;
  @override
  String? get failMessage;
  @override
  List<EnvResult> get env;
  @override
  List<ParserError> get errors;
  @override
  @JsonKey(ignore: true)
  _$$_DetailParserResultCopyWith<_$_DetailParserResult> get copyWith =>
      throw _privateConstructorUsedError;
}

AutoCompleteResultItem _$AutoCompleteResultItemFromJson(
    Map<String, dynamic> json) {
  return _AutoCompleteResultItem.fromJson(json);
}

/// @nodoc
mixin _$AutoCompleteResultItem {
  String? get title => throw _privateConstructorUsedError;
  String? get subtitle => throw _privateConstructorUsedError;
  String? get complete => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AutoCompleteResultItemCopyWith<AutoCompleteResultItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AutoCompleteResultItemCopyWith<$Res> {
  factory $AutoCompleteResultItemCopyWith(AutoCompleteResultItem value,
          $Res Function(AutoCompleteResultItem) then) =
      _$AutoCompleteResultItemCopyWithImpl<$Res, AutoCompleteResultItem>;
  @useResult
  $Res call({String? title, String? subtitle, String? complete});
}

/// @nodoc
class _$AutoCompleteResultItemCopyWithImpl<$Res,
        $Val extends AutoCompleteResultItem>
    implements $AutoCompleteResultItemCopyWith<$Res> {
  _$AutoCompleteResultItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? subtitle = freezed,
    Object? complete = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      complete: freezed == complete
          ? _value.complete
          : complete // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AutoCompleteResultItemCopyWith<$Res>
    implements $AutoCompleteResultItemCopyWith<$Res> {
  factory _$$_AutoCompleteResultItemCopyWith(_$_AutoCompleteResultItem value,
          $Res Function(_$_AutoCompleteResultItem) then) =
      __$$_AutoCompleteResultItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? title, String? subtitle, String? complete});
}

/// @nodoc
class __$$_AutoCompleteResultItemCopyWithImpl<$Res>
    extends _$AutoCompleteResultItemCopyWithImpl<$Res,
        _$_AutoCompleteResultItem>
    implements _$$_AutoCompleteResultItemCopyWith<$Res> {
  __$$_AutoCompleteResultItemCopyWithImpl(_$_AutoCompleteResultItem _value,
      $Res Function(_$_AutoCompleteResultItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? subtitle = freezed,
    Object? complete = freezed,
  }) {
    return _then(_$_AutoCompleteResultItem(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      complete: freezed == complete
          ? _value.complete
          : complete // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AutoCompleteResultItem
    with DiagnosticableTreeMixin
    implements _AutoCompleteResultItem {
  const _$_AutoCompleteResultItem({this.title, this.subtitle, this.complete});

  factory _$_AutoCompleteResultItem.fromJson(Map<String, dynamic> json) =>
      _$$_AutoCompleteResultItemFromJson(json);

  @override
  final String? title;
  @override
  final String? subtitle;
  @override
  final String? complete;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AutoCompleteResultItem(title: $title, subtitle: $subtitle, complete: $complete)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AutoCompleteResultItem'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('subtitle', subtitle))
      ..add(DiagnosticsProperty('complete', complete));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AutoCompleteResultItem &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.complete, complete) ||
                other.complete == complete));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, subtitle, complete);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AutoCompleteResultItemCopyWith<_$_AutoCompleteResultItem> get copyWith =>
      __$$_AutoCompleteResultItemCopyWithImpl<_$_AutoCompleteResultItem>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AutoCompleteResultItemToJson(
      this,
    );
  }
}

abstract class _AutoCompleteResultItem implements AutoCompleteResultItem {
  const factory _AutoCompleteResultItem(
      {final String? title,
      final String? subtitle,
      final String? complete}) = _$_AutoCompleteResultItem;

  factory _AutoCompleteResultItem.fromJson(Map<String, dynamic> json) =
      _$_AutoCompleteResultItem.fromJson;

  @override
  String? get title;
  @override
  String? get subtitle;
  @override
  String? get complete;
  @override
  @JsonKey(ignore: true)
  _$$_AutoCompleteResultItemCopyWith<_$_AutoCompleteResultItem> get copyWith =>
      throw _privateConstructorUsedError;
}

AutoCompleteResult _$AutoCompleteResultFromJson(Map<String, dynamic> json) {
  return _AutoCompleteResult.fromJson(json);
}

/// @nodoc
mixin _$AutoCompleteResult {
  List<AutoCompleteResultItem>? get items => throw _privateConstructorUsedError;
  bool? get isSuccess => throw _privateConstructorUsedError;
  String? get failMessage => throw _privateConstructorUsedError;
  List<EnvResult> get env => throw _privateConstructorUsedError;
  List<ParserError> get errors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AutoCompleteResultCopyWith<AutoCompleteResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AutoCompleteResultCopyWith<$Res> {
  factory $AutoCompleteResultCopyWith(
          AutoCompleteResult value, $Res Function(AutoCompleteResult) then) =
      _$AutoCompleteResultCopyWithImpl<$Res, AutoCompleteResult>;
  @useResult
  $Res call(
      {List<AutoCompleteResultItem>? items,
      bool? isSuccess,
      String? failMessage,
      List<EnvResult> env,
      List<ParserError> errors});
}

/// @nodoc
class _$AutoCompleteResultCopyWithImpl<$Res, $Val extends AutoCompleteResult>
    implements $AutoCompleteResultCopyWith<$Res> {
  _$AutoCompleteResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = freezed,
    Object? isSuccess = freezed,
    Object? failMessage = freezed,
    Object? env = null,
    Object? errors = null,
  }) {
    return _then(_value.copyWith(
      items: freezed == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<AutoCompleteResultItem>?,
      isSuccess: freezed == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      failMessage: freezed == failMessage
          ? _value.failMessage
          : failMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      env: null == env
          ? _value.env
          : env // ignore: cast_nullable_to_non_nullable
              as List<EnvResult>,
      errors: null == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<ParserError>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AutoCompleteResultCopyWith<$Res>
    implements $AutoCompleteResultCopyWith<$Res> {
  factory _$$_AutoCompleteResultCopyWith(_$_AutoCompleteResult value,
          $Res Function(_$_AutoCompleteResult) then) =
      __$$_AutoCompleteResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<AutoCompleteResultItem>? items,
      bool? isSuccess,
      String? failMessage,
      List<EnvResult> env,
      List<ParserError> errors});
}

/// @nodoc
class __$$_AutoCompleteResultCopyWithImpl<$Res>
    extends _$AutoCompleteResultCopyWithImpl<$Res, _$_AutoCompleteResult>
    implements _$$_AutoCompleteResultCopyWith<$Res> {
  __$$_AutoCompleteResultCopyWithImpl(
      _$_AutoCompleteResult _value, $Res Function(_$_AutoCompleteResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = freezed,
    Object? isSuccess = freezed,
    Object? failMessage = freezed,
    Object? env = null,
    Object? errors = null,
  }) {
    return _then(_$_AutoCompleteResult(
      items: freezed == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<AutoCompleteResultItem>?,
      isSuccess: freezed == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      failMessage: freezed == failMessage
          ? _value.failMessage
          : failMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      env: null == env
          ? _value._env
          : env // ignore: cast_nullable_to_non_nullable
              as List<EnvResult>,
      errors: null == errors
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<ParserError>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AutoCompleteResult
    with DiagnosticableTreeMixin
    implements _AutoCompleteResult {
  const _$_AutoCompleteResult(
      {final List<AutoCompleteResultItem>? items,
      this.isSuccess,
      this.failMessage,
      required final List<EnvResult> env,
      required final List<ParserError> errors})
      : _items = items,
        _env = env,
        _errors = errors;

  factory _$_AutoCompleteResult.fromJson(Map<String, dynamic> json) =>
      _$$_AutoCompleteResultFromJson(json);

  final List<AutoCompleteResultItem>? _items;
  @override
  List<AutoCompleteResultItem>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? isSuccess;
  @override
  final String? failMessage;
  final List<EnvResult> _env;
  @override
  List<EnvResult> get env {
    if (_env is EqualUnmodifiableListView) return _env;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_env);
  }

  final List<ParserError> _errors;
  @override
  List<ParserError> get errors {
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_errors);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AutoCompleteResult(items: $items, isSuccess: $isSuccess, failMessage: $failMessage, env: $env, errors: $errors)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AutoCompleteResult'))
      ..add(DiagnosticsProperty('items', items))
      ..add(DiagnosticsProperty('isSuccess', isSuccess))
      ..add(DiagnosticsProperty('failMessage', failMessage))
      ..add(DiagnosticsProperty('env', env))
      ..add(DiagnosticsProperty('errors', errors));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AutoCompleteResult &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.failMessage, failMessage) ||
                other.failMessage == failMessage) &&
            const DeepCollectionEquality().equals(other._env, _env) &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      isSuccess,
      failMessage,
      const DeepCollectionEquality().hash(_env),
      const DeepCollectionEquality().hash(_errors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AutoCompleteResultCopyWith<_$_AutoCompleteResult> get copyWith =>
      __$$_AutoCompleteResultCopyWithImpl<_$_AutoCompleteResult>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AutoCompleteResultToJson(
      this,
    );
  }
}

abstract class _AutoCompleteResult implements AutoCompleteResult {
  const factory _AutoCompleteResult(
      {final List<AutoCompleteResultItem>? items,
      final bool? isSuccess,
      final String? failMessage,
      required final List<EnvResult> env,
      required final List<ParserError> errors}) = _$_AutoCompleteResult;

  factory _AutoCompleteResult.fromJson(Map<String, dynamic> json) =
      _$_AutoCompleteResult.fromJson;

  @override
  List<AutoCompleteResultItem>? get items;
  @override
  bool? get isSuccess;
  @override
  String? get failMessage;
  @override
  List<EnvResult> get env;
  @override
  List<ParserError> get errors;
  @override
  @JsonKey(ignore: true)
  _$$_AutoCompleteResultCopyWith<_$_AutoCompleteResult> get copyWith =>
      throw _privateConstructorUsedError;
}

ImageReaderResult _$ImageReaderResultFromJson(Map<String, dynamic> json) {
  return _ImageReaderResult.fromJson(json);
}

/// @nodoc
mixin _$ImageReaderResult {
  ImageResult? get image => throw _privateConstructorUsedError;
  ImageResult? get largerImage => throw _privateConstructorUsedError;
  ImageResult? get rawImage => throw _privateConstructorUsedError;
  String? get uploadTime => throw _privateConstructorUsedError;
  String? get source => throw _privateConstructorUsedError;
  String? get rating => throw _privateConstructorUsedError;
  double? get score => throw _privateConstructorUsedError;
  List<TagResult>? get badges => throw _privateConstructorUsedError;
  List<TagResult>? get tags => throw _privateConstructorUsedError;
  List<CommentResult>? get comments => throw _privateConstructorUsedError;
  bool? get isSuccess => throw _privateConstructorUsedError;
  String? get failMessage => throw _privateConstructorUsedError;
  List<EnvResult> get env => throw _privateConstructorUsedError;
  List<ParserError> get errors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageReaderResultCopyWith<ImageReaderResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageReaderResultCopyWith<$Res> {
  factory $ImageReaderResultCopyWith(
          ImageReaderResult value, $Res Function(ImageReaderResult) then) =
      _$ImageReaderResultCopyWithImpl<$Res, ImageReaderResult>;
  @useResult
  $Res call(
      {ImageResult? image,
      ImageResult? largerImage,
      ImageResult? rawImage,
      String? uploadTime,
      String? source,
      String? rating,
      double? score,
      List<TagResult>? badges,
      List<TagResult>? tags,
      List<CommentResult>? comments,
      bool? isSuccess,
      String? failMessage,
      List<EnvResult> env,
      List<ParserError> errors});

  $ImageResultCopyWith<$Res>? get image;
  $ImageResultCopyWith<$Res>? get largerImage;
  $ImageResultCopyWith<$Res>? get rawImage;
}

/// @nodoc
class _$ImageReaderResultCopyWithImpl<$Res, $Val extends ImageReaderResult>
    implements $ImageReaderResultCopyWith<$Res> {
  _$ImageReaderResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = freezed,
    Object? largerImage = freezed,
    Object? rawImage = freezed,
    Object? uploadTime = freezed,
    Object? source = freezed,
    Object? rating = freezed,
    Object? score = freezed,
    Object? badges = freezed,
    Object? tags = freezed,
    Object? comments = freezed,
    Object? isSuccess = freezed,
    Object? failMessage = freezed,
    Object? env = null,
    Object? errors = null,
  }) {
    return _then(_value.copyWith(
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as ImageResult?,
      largerImage: freezed == largerImage
          ? _value.largerImage
          : largerImage // ignore: cast_nullable_to_non_nullable
              as ImageResult?,
      rawImage: freezed == rawImage
          ? _value.rawImage
          : rawImage // ignore: cast_nullable_to_non_nullable
              as ImageResult?,
      uploadTime: freezed == uploadTime
          ? _value.uploadTime
          : uploadTime // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      badges: freezed == badges
          ? _value.badges
          : badges // ignore: cast_nullable_to_non_nullable
              as List<TagResult>?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagResult>?,
      comments: freezed == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentResult>?,
      isSuccess: freezed == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      failMessage: freezed == failMessage
          ? _value.failMessage
          : failMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      env: null == env
          ? _value.env
          : env // ignore: cast_nullable_to_non_nullable
              as List<EnvResult>,
      errors: null == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<ParserError>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageResultCopyWith<$Res>? get image {
    if (_value.image == null) {
      return null;
    }

    return $ImageResultCopyWith<$Res>(_value.image!, (value) {
      return _then(_value.copyWith(image: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageResultCopyWith<$Res>? get largerImage {
    if (_value.largerImage == null) {
      return null;
    }

    return $ImageResultCopyWith<$Res>(_value.largerImage!, (value) {
      return _then(_value.copyWith(largerImage: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageResultCopyWith<$Res>? get rawImage {
    if (_value.rawImage == null) {
      return null;
    }

    return $ImageResultCopyWith<$Res>(_value.rawImage!, (value) {
      return _then(_value.copyWith(rawImage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ImageReaderResultCopyWith<$Res>
    implements $ImageReaderResultCopyWith<$Res> {
  factory _$$_ImageReaderResultCopyWith(_$_ImageReaderResult value,
          $Res Function(_$_ImageReaderResult) then) =
      __$$_ImageReaderResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ImageResult? image,
      ImageResult? largerImage,
      ImageResult? rawImage,
      String? uploadTime,
      String? source,
      String? rating,
      double? score,
      List<TagResult>? badges,
      List<TagResult>? tags,
      List<CommentResult>? comments,
      bool? isSuccess,
      String? failMessage,
      List<EnvResult> env,
      List<ParserError> errors});

  @override
  $ImageResultCopyWith<$Res>? get image;
  @override
  $ImageResultCopyWith<$Res>? get largerImage;
  @override
  $ImageResultCopyWith<$Res>? get rawImage;
}

/// @nodoc
class __$$_ImageReaderResultCopyWithImpl<$Res>
    extends _$ImageReaderResultCopyWithImpl<$Res, _$_ImageReaderResult>
    implements _$$_ImageReaderResultCopyWith<$Res> {
  __$$_ImageReaderResultCopyWithImpl(
      _$_ImageReaderResult _value, $Res Function(_$_ImageReaderResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = freezed,
    Object? largerImage = freezed,
    Object? rawImage = freezed,
    Object? uploadTime = freezed,
    Object? source = freezed,
    Object? rating = freezed,
    Object? score = freezed,
    Object? badges = freezed,
    Object? tags = freezed,
    Object? comments = freezed,
    Object? isSuccess = freezed,
    Object? failMessage = freezed,
    Object? env = null,
    Object? errors = null,
  }) {
    return _then(_$_ImageReaderResult(
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as ImageResult?,
      largerImage: freezed == largerImage
          ? _value.largerImage
          : largerImage // ignore: cast_nullable_to_non_nullable
              as ImageResult?,
      rawImage: freezed == rawImage
          ? _value.rawImage
          : rawImage // ignore: cast_nullable_to_non_nullable
              as ImageResult?,
      uploadTime: freezed == uploadTime
          ? _value.uploadTime
          : uploadTime // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      badges: freezed == badges
          ? _value._badges
          : badges // ignore: cast_nullable_to_non_nullable
              as List<TagResult>?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagResult>?,
      comments: freezed == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentResult>?,
      isSuccess: freezed == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      failMessage: freezed == failMessage
          ? _value.failMessage
          : failMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      env: null == env
          ? _value._env
          : env // ignore: cast_nullable_to_non_nullable
              as List<EnvResult>,
      errors: null == errors
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<ParserError>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ImageReaderResult
    with DiagnosticableTreeMixin
    implements _ImageReaderResult {
  const _$_ImageReaderResult(
      {this.image,
      this.largerImage,
      this.rawImage,
      this.uploadTime,
      this.source,
      this.rating,
      this.score,
      final List<TagResult>? badges,
      final List<TagResult>? tags,
      final List<CommentResult>? comments,
      this.isSuccess,
      this.failMessage,
      required final List<EnvResult> env,
      required final List<ParserError> errors})
      : _badges = badges,
        _tags = tags,
        _comments = comments,
        _env = env,
        _errors = errors;

  factory _$_ImageReaderResult.fromJson(Map<String, dynamic> json) =>
      _$$_ImageReaderResultFromJson(json);

  @override
  final ImageResult? image;
  @override
  final ImageResult? largerImage;
  @override
  final ImageResult? rawImage;
  @override
  final String? uploadTime;
  @override
  final String? source;
  @override
  final String? rating;
  @override
  final double? score;
  final List<TagResult>? _badges;
  @override
  List<TagResult>? get badges {
    final value = _badges;
    if (value == null) return null;
    if (_badges is EqualUnmodifiableListView) return _badges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<TagResult>? _tags;
  @override
  List<TagResult>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<CommentResult>? _comments;
  @override
  List<CommentResult>? get comments {
    final value = _comments;
    if (value == null) return null;
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? isSuccess;
  @override
  final String? failMessage;
  final List<EnvResult> _env;
  @override
  List<EnvResult> get env {
    if (_env is EqualUnmodifiableListView) return _env;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_env);
  }

  final List<ParserError> _errors;
  @override
  List<ParserError> get errors {
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_errors);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ImageReaderResult(image: $image, largerImage: $largerImage, rawImage: $rawImage, uploadTime: $uploadTime, source: $source, rating: $rating, score: $score, badges: $badges, tags: $tags, comments: $comments, isSuccess: $isSuccess, failMessage: $failMessage, env: $env, errors: $errors)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ImageReaderResult'))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('largerImage', largerImage))
      ..add(DiagnosticsProperty('rawImage', rawImage))
      ..add(DiagnosticsProperty('uploadTime', uploadTime))
      ..add(DiagnosticsProperty('source', source))
      ..add(DiagnosticsProperty('rating', rating))
      ..add(DiagnosticsProperty('score', score))
      ..add(DiagnosticsProperty('badges', badges))
      ..add(DiagnosticsProperty('tags', tags))
      ..add(DiagnosticsProperty('comments', comments))
      ..add(DiagnosticsProperty('isSuccess', isSuccess))
      ..add(DiagnosticsProperty('failMessage', failMessage))
      ..add(DiagnosticsProperty('env', env))
      ..add(DiagnosticsProperty('errors', errors));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImageReaderResult &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.largerImage, largerImage) ||
                other.largerImage == largerImage) &&
            (identical(other.rawImage, rawImage) ||
                other.rawImage == rawImage) &&
            (identical(other.uploadTime, uploadTime) ||
                other.uploadTime == uploadTime) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.score, score) || other.score == score) &&
            const DeepCollectionEquality().equals(other._badges, _badges) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(other._comments, _comments) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.failMessage, failMessage) ||
                other.failMessage == failMessage) &&
            const DeepCollectionEquality().equals(other._env, _env) &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      image,
      largerImage,
      rawImage,
      uploadTime,
      source,
      rating,
      score,
      const DeepCollectionEquality().hash(_badges),
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_comments),
      isSuccess,
      failMessage,
      const DeepCollectionEquality().hash(_env),
      const DeepCollectionEquality().hash(_errors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ImageReaderResultCopyWith<_$_ImageReaderResult> get copyWith =>
      __$$_ImageReaderResultCopyWithImpl<_$_ImageReaderResult>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ImageReaderResultToJson(
      this,
    );
  }
}

abstract class _ImageReaderResult implements ImageReaderResult {
  const factory _ImageReaderResult(
      {final ImageResult? image,
      final ImageResult? largerImage,
      final ImageResult? rawImage,
      final String? uploadTime,
      final String? source,
      final String? rating,
      final double? score,
      final List<TagResult>? badges,
      final List<TagResult>? tags,
      final List<CommentResult>? comments,
      final bool? isSuccess,
      final String? failMessage,
      required final List<EnvResult> env,
      required final List<ParserError> errors}) = _$_ImageReaderResult;

  factory _ImageReaderResult.fromJson(Map<String, dynamic> json) =
      _$_ImageReaderResult.fromJson;

  @override
  ImageResult? get image;
  @override
  ImageResult? get largerImage;
  @override
  ImageResult? get rawImage;
  @override
  String? get uploadTime;
  @override
  String? get source;
  @override
  String? get rating;
  @override
  double? get score;
  @override
  List<TagResult>? get badges;
  @override
  List<TagResult>? get tags;
  @override
  List<CommentResult>? get comments;
  @override
  bool? get isSuccess;
  @override
  String? get failMessage;
  @override
  List<EnvResult> get env;
  @override
  List<ParserError> get errors;
  @override
  @JsonKey(ignore: true)
  _$$_ImageReaderResultCopyWith<_$_ImageReaderResult> get copyWith =>
      throw _privateConstructorUsedError;
}

ListParserResultItem _$ListParserResultItemFromJson(Map<String, dynamic> json) {
  return _ListParserResultItem.fromJson(json);
}

/// @nodoc
mixin _$ListParserResultItem {
  String? get title => throw _privateConstructorUsedError;
  String? get subtitle => throw _privateConstructorUsedError;
  String? get uploadTime => throw _privateConstructorUsedError;
  double? get star => throw _privateConstructorUsedError;
  int? get imageCount => throw _privateConstructorUsedError;
  ImageResult? get previewImage => throw _privateConstructorUsedError;
  List<TagResult>? get badges => throw _privateConstructorUsedError;
  List<TagResult>? get tags => throw _privateConstructorUsedError;
  String? get target => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;
  String? get paper => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListParserResultItemCopyWith<ListParserResultItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListParserResultItemCopyWith<$Res> {
  factory $ListParserResultItemCopyWith(ListParserResultItem value,
          $Res Function(ListParserResultItem) then) =
      _$ListParserResultItemCopyWithImpl<$Res, ListParserResultItem>;
  @useResult
  $Res call(
      {String? title,
      String? subtitle,
      String? uploadTime,
      double? star,
      int? imageCount,
      ImageResult? previewImage,
      List<TagResult>? badges,
      List<TagResult>? tags,
      String? target,
      String? language,
      String? paper});

  $ImageResultCopyWith<$Res>? get previewImage;
}

/// @nodoc
class _$ListParserResultItemCopyWithImpl<$Res,
        $Val extends ListParserResultItem>
    implements $ListParserResultItemCopyWith<$Res> {
  _$ListParserResultItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? subtitle = freezed,
    Object? uploadTime = freezed,
    Object? star = freezed,
    Object? imageCount = freezed,
    Object? previewImage = freezed,
    Object? badges = freezed,
    Object? tags = freezed,
    Object? target = freezed,
    Object? language = freezed,
    Object? paper = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadTime: freezed == uploadTime
          ? _value.uploadTime
          : uploadTime // ignore: cast_nullable_to_non_nullable
              as String?,
      star: freezed == star
          ? _value.star
          : star // ignore: cast_nullable_to_non_nullable
              as double?,
      imageCount: freezed == imageCount
          ? _value.imageCount
          : imageCount // ignore: cast_nullable_to_non_nullable
              as int?,
      previewImage: freezed == previewImage
          ? _value.previewImage
          : previewImage // ignore: cast_nullable_to_non_nullable
              as ImageResult?,
      badges: freezed == badges
          ? _value.badges
          : badges // ignore: cast_nullable_to_non_nullable
              as List<TagResult>?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagResult>?,
      target: freezed == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      paper: freezed == paper
          ? _value.paper
          : paper // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageResultCopyWith<$Res>? get previewImage {
    if (_value.previewImage == null) {
      return null;
    }

    return $ImageResultCopyWith<$Res>(_value.previewImage!, (value) {
      return _then(_value.copyWith(previewImage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ListParserResultItemCopyWith<$Res>
    implements $ListParserResultItemCopyWith<$Res> {
  factory _$$_ListParserResultItemCopyWith(_$_ListParserResultItem value,
          $Res Function(_$_ListParserResultItem) then) =
      __$$_ListParserResultItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? title,
      String? subtitle,
      String? uploadTime,
      double? star,
      int? imageCount,
      ImageResult? previewImage,
      List<TagResult>? badges,
      List<TagResult>? tags,
      String? target,
      String? language,
      String? paper});

  @override
  $ImageResultCopyWith<$Res>? get previewImage;
}

/// @nodoc
class __$$_ListParserResultItemCopyWithImpl<$Res>
    extends _$ListParserResultItemCopyWithImpl<$Res, _$_ListParserResultItem>
    implements _$$_ListParserResultItemCopyWith<$Res> {
  __$$_ListParserResultItemCopyWithImpl(_$_ListParserResultItem _value,
      $Res Function(_$_ListParserResultItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? subtitle = freezed,
    Object? uploadTime = freezed,
    Object? star = freezed,
    Object? imageCount = freezed,
    Object? previewImage = freezed,
    Object? badges = freezed,
    Object? tags = freezed,
    Object? target = freezed,
    Object? language = freezed,
    Object? paper = freezed,
  }) {
    return _then(_$_ListParserResultItem(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadTime: freezed == uploadTime
          ? _value.uploadTime
          : uploadTime // ignore: cast_nullable_to_non_nullable
              as String?,
      star: freezed == star
          ? _value.star
          : star // ignore: cast_nullable_to_non_nullable
              as double?,
      imageCount: freezed == imageCount
          ? _value.imageCount
          : imageCount // ignore: cast_nullable_to_non_nullable
              as int?,
      previewImage: freezed == previewImage
          ? _value.previewImage
          : previewImage // ignore: cast_nullable_to_non_nullable
              as ImageResult?,
      badges: freezed == badges
          ? _value._badges
          : badges // ignore: cast_nullable_to_non_nullable
              as List<TagResult>?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagResult>?,
      target: freezed == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      paper: freezed == paper
          ? _value.paper
          : paper // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ListParserResultItem
    with DiagnosticableTreeMixin
    implements _ListParserResultItem {
  const _$_ListParserResultItem(
      {this.title,
      this.subtitle,
      this.uploadTime,
      this.star,
      this.imageCount,
      this.previewImage,
      final List<TagResult>? badges,
      final List<TagResult>? tags,
      this.target,
      this.language,
      this.paper})
      : _badges = badges,
        _tags = tags;

  factory _$_ListParserResultItem.fromJson(Map<String, dynamic> json) =>
      _$$_ListParserResultItemFromJson(json);

  @override
  final String? title;
  @override
  final String? subtitle;
  @override
  final String? uploadTime;
  @override
  final double? star;
  @override
  final int? imageCount;
  @override
  final ImageResult? previewImage;
  final List<TagResult>? _badges;
  @override
  List<TagResult>? get badges {
    final value = _badges;
    if (value == null) return null;
    if (_badges is EqualUnmodifiableListView) return _badges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<TagResult>? _tags;
  @override
  List<TagResult>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? target;
  @override
  final String? language;
  @override
  final String? paper;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ListParserResultItem(title: $title, subtitle: $subtitle, uploadTime: $uploadTime, star: $star, imageCount: $imageCount, previewImage: $previewImage, badges: $badges, tags: $tags, target: $target, language: $language, paper: $paper)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ListParserResultItem'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('subtitle', subtitle))
      ..add(DiagnosticsProperty('uploadTime', uploadTime))
      ..add(DiagnosticsProperty('star', star))
      ..add(DiagnosticsProperty('imageCount', imageCount))
      ..add(DiagnosticsProperty('previewImage', previewImage))
      ..add(DiagnosticsProperty('badges', badges))
      ..add(DiagnosticsProperty('tags', tags))
      ..add(DiagnosticsProperty('target', target))
      ..add(DiagnosticsProperty('language', language))
      ..add(DiagnosticsProperty('paper', paper));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListParserResultItem &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.uploadTime, uploadTime) ||
                other.uploadTime == uploadTime) &&
            (identical(other.star, star) || other.star == star) &&
            (identical(other.imageCount, imageCount) ||
                other.imageCount == imageCount) &&
            (identical(other.previewImage, previewImage) ||
                other.previewImage == previewImage) &&
            const DeepCollectionEquality().equals(other._badges, _badges) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.target, target) || other.target == target) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.paper, paper) || other.paper == paper));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      subtitle,
      uploadTime,
      star,
      imageCount,
      previewImage,
      const DeepCollectionEquality().hash(_badges),
      const DeepCollectionEquality().hash(_tags),
      target,
      language,
      paper);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ListParserResultItemCopyWith<_$_ListParserResultItem> get copyWith =>
      __$$_ListParserResultItemCopyWithImpl<_$_ListParserResultItem>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ListParserResultItemToJson(
      this,
    );
  }
}

abstract class _ListParserResultItem implements ListParserResultItem {
  const factory _ListParserResultItem(
      {final String? title,
      final String? subtitle,
      final String? uploadTime,
      final double? star,
      final int? imageCount,
      final ImageResult? previewImage,
      final List<TagResult>? badges,
      final List<TagResult>? tags,
      final String? target,
      final String? language,
      final String? paper}) = _$_ListParserResultItem;

  factory _ListParserResultItem.fromJson(Map<String, dynamic> json) =
      _$_ListParserResultItem.fromJson;

  @override
  String? get title;
  @override
  String? get subtitle;
  @override
  String? get uploadTime;
  @override
  double? get star;
  @override
  int? get imageCount;
  @override
  ImageResult? get previewImage;
  @override
  List<TagResult>? get badges;
  @override
  List<TagResult>? get tags;
  @override
  String? get target;
  @override
  String? get language;
  @override
  String? get paper;
  @override
  @JsonKey(ignore: true)
  _$$_ListParserResultItemCopyWith<_$_ListParserResultItem> get copyWith =>
      throw _privateConstructorUsedError;
}

ListParserResult _$ListParserResultFromJson(Map<String, dynamic> json) {
  return _ListParserResult.fromJson(json);
}

/// @nodoc
mixin _$ListParserResult {
  List<ListParserResultItem>? get items => throw _privateConstructorUsedError;
  String? get nextPage => throw _privateConstructorUsedError;
  bool? get isSuccess => throw _privateConstructorUsedError;
  String? get failMessage => throw _privateConstructorUsedError;
  List<EnvResult> get env => throw _privateConstructorUsedError;
  List<ParserError> get errors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListParserResultCopyWith<ListParserResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListParserResultCopyWith<$Res> {
  factory $ListParserResultCopyWith(
          ListParserResult value, $Res Function(ListParserResult) then) =
      _$ListParserResultCopyWithImpl<$Res, ListParserResult>;
  @useResult
  $Res call(
      {List<ListParserResultItem>? items,
      String? nextPage,
      bool? isSuccess,
      String? failMessage,
      List<EnvResult> env,
      List<ParserError> errors});
}

/// @nodoc
class _$ListParserResultCopyWithImpl<$Res, $Val extends ListParserResult>
    implements $ListParserResultCopyWith<$Res> {
  _$ListParserResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = freezed,
    Object? nextPage = freezed,
    Object? isSuccess = freezed,
    Object? failMessage = freezed,
    Object? env = null,
    Object? errors = null,
  }) {
    return _then(_value.copyWith(
      items: freezed == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ListParserResultItem>?,
      nextPage: freezed == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as String?,
      isSuccess: freezed == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      failMessage: freezed == failMessage
          ? _value.failMessage
          : failMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      env: null == env
          ? _value.env
          : env // ignore: cast_nullable_to_non_nullable
              as List<EnvResult>,
      errors: null == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<ParserError>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ListParserResultCopyWith<$Res>
    implements $ListParserResultCopyWith<$Res> {
  factory _$$_ListParserResultCopyWith(
          _$_ListParserResult value, $Res Function(_$_ListParserResult) then) =
      __$$_ListParserResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ListParserResultItem>? items,
      String? nextPage,
      bool? isSuccess,
      String? failMessage,
      List<EnvResult> env,
      List<ParserError> errors});
}

/// @nodoc
class __$$_ListParserResultCopyWithImpl<$Res>
    extends _$ListParserResultCopyWithImpl<$Res, _$_ListParserResult>
    implements _$$_ListParserResultCopyWith<$Res> {
  __$$_ListParserResultCopyWithImpl(
      _$_ListParserResult _value, $Res Function(_$_ListParserResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = freezed,
    Object? nextPage = freezed,
    Object? isSuccess = freezed,
    Object? failMessage = freezed,
    Object? env = null,
    Object? errors = null,
  }) {
    return _then(_$_ListParserResult(
      items: freezed == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ListParserResultItem>?,
      nextPage: freezed == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as String?,
      isSuccess: freezed == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      failMessage: freezed == failMessage
          ? _value.failMessage
          : failMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      env: null == env
          ? _value._env
          : env // ignore: cast_nullable_to_non_nullable
              as List<EnvResult>,
      errors: null == errors
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<ParserError>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ListParserResult
    with DiagnosticableTreeMixin
    implements _ListParserResult {
  const _$_ListParserResult(
      {final List<ListParserResultItem>? items,
      this.nextPage,
      this.isSuccess,
      this.failMessage,
      required final List<EnvResult> env,
      required final List<ParserError> errors})
      : _items = items,
        _env = env,
        _errors = errors;

  factory _$_ListParserResult.fromJson(Map<String, dynamic> json) =>
      _$$_ListParserResultFromJson(json);

  final List<ListParserResultItem>? _items;
  @override
  List<ListParserResultItem>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? nextPage;
  @override
  final bool? isSuccess;
  @override
  final String? failMessage;
  final List<EnvResult> _env;
  @override
  List<EnvResult> get env {
    if (_env is EqualUnmodifiableListView) return _env;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_env);
  }

  final List<ParserError> _errors;
  @override
  List<ParserError> get errors {
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_errors);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ListParserResult(items: $items, nextPage: $nextPage, isSuccess: $isSuccess, failMessage: $failMessage, env: $env, errors: $errors)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ListParserResult'))
      ..add(DiagnosticsProperty('items', items))
      ..add(DiagnosticsProperty('nextPage', nextPage))
      ..add(DiagnosticsProperty('isSuccess', isSuccess))
      ..add(DiagnosticsProperty('failMessage', failMessage))
      ..add(DiagnosticsProperty('env', env))
      ..add(DiagnosticsProperty('errors', errors));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListParserResult &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.failMessage, failMessage) ||
                other.failMessage == failMessage) &&
            const DeepCollectionEquality().equals(other._env, _env) &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      nextPage,
      isSuccess,
      failMessage,
      const DeepCollectionEquality().hash(_env),
      const DeepCollectionEquality().hash(_errors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ListParserResultCopyWith<_$_ListParserResult> get copyWith =>
      __$$_ListParserResultCopyWithImpl<_$_ListParserResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ListParserResultToJson(
      this,
    );
  }
}

abstract class _ListParserResult implements ListParserResult {
  const factory _ListParserResult(
      {final List<ListParserResultItem>? items,
      final String? nextPage,
      final bool? isSuccess,
      final String? failMessage,
      required final List<EnvResult> env,
      required final List<ParserError> errors}) = _$_ListParserResult;

  factory _ListParserResult.fromJson(Map<String, dynamic> json) =
      _$_ListParserResult.fromJson;

  @override
  List<ListParserResultItem>? get items;
  @override
  String? get nextPage;
  @override
  bool? get isSuccess;
  @override
  String? get failMessage;
  @override
  List<EnvResult> get env;
  @override
  List<ParserError> get errors;
  @override
  @JsonKey(ignore: true)
  _$$_ListParserResultCopyWith<_$_ListParserResult> get copyWith =>
      throw _privateConstructorUsedError;
}
