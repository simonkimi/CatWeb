// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
DetailPreviewItem _$DetailPreviewItemFromJson(Map<String, dynamic> json) {
  return _PreviewItem.fromJson(json);
}

/// @nodoc
mixin _$DetailPreviewItem implements DiagnosticableTreeMixin {
  ImageResult? get previewImage;
  String? get target;

  /// Create a copy of DetailPreviewItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DetailPreviewItemCopyWith<DetailPreviewItem> get copyWith =>
      _$DetailPreviewItemCopyWithImpl<DetailPreviewItem>(
          this as DetailPreviewItem, _$identity);

  /// Serializes this DetailPreviewItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'DetailPreviewItem'))
      ..add(DiagnosticsProperty('previewImage', previewImage))
      ..add(DiagnosticsProperty('target', target));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DetailPreviewItem &&
            (identical(other.previewImage, previewImage) ||
                other.previewImage == previewImage) &&
            (identical(other.target, target) || other.target == target));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, previewImage, target);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DetailPreviewItem(previewImage: $previewImage, target: $target)';
  }
}

/// @nodoc
abstract mixin class $DetailPreviewItemCopyWith<$Res> {
  factory $DetailPreviewItemCopyWith(
          DetailPreviewItem value, $Res Function(DetailPreviewItem) _then) =
      _$DetailPreviewItemCopyWithImpl;
  @useResult
  $Res call({ImageResult? previewImage, String? target});

  $ImageResultCopyWith<$Res>? get previewImage;
}

/// @nodoc
class _$DetailPreviewItemCopyWithImpl<$Res>
    implements $DetailPreviewItemCopyWith<$Res> {
  _$DetailPreviewItemCopyWithImpl(this._self, this._then);

  final DetailPreviewItem _self;
  final $Res Function(DetailPreviewItem) _then;

  /// Create a copy of DetailPreviewItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? previewImage = freezed,
    Object? target = freezed,
  }) {
    return _then(_self.copyWith(
      previewImage: freezed == previewImage
          ? _self.previewImage
          : previewImage // ignore: cast_nullable_to_non_nullable
              as ImageResult?,
      target: freezed == target
          ? _self.target
          : target // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of DetailPreviewItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImageResultCopyWith<$Res>? get previewImage {
    if (_self.previewImage == null) {
      return null;
    }

    return $ImageResultCopyWith<$Res>(_self.previewImage!, (value) {
      return _then(_self.copyWith(previewImage: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _PreviewItem with DiagnosticableTreeMixin implements DetailPreviewItem {
  const _PreviewItem({this.previewImage, this.target});
  factory _PreviewItem.fromJson(Map<String, dynamic> json) =>
      _$PreviewItemFromJson(json);

  @override
  final ImageResult? previewImage;
  @override
  final String? target;

  /// Create a copy of DetailPreviewItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PreviewItemCopyWith<_PreviewItem> get copyWith =>
      __$PreviewItemCopyWithImpl<_PreviewItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PreviewItemToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'DetailPreviewItem'))
      ..add(DiagnosticsProperty('previewImage', previewImage))
      ..add(DiagnosticsProperty('target', target));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PreviewItem &&
            (identical(other.previewImage, previewImage) ||
                other.previewImage == previewImage) &&
            (identical(other.target, target) || other.target == target));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, previewImage, target);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DetailPreviewItem(previewImage: $previewImage, target: $target)';
  }
}

/// @nodoc
abstract mixin class _$PreviewItemCopyWith<$Res>
    implements $DetailPreviewItemCopyWith<$Res> {
  factory _$PreviewItemCopyWith(
          _PreviewItem value, $Res Function(_PreviewItem) _then) =
      __$PreviewItemCopyWithImpl;
  @override
  @useResult
  $Res call({ImageResult? previewImage, String? target});

  @override
  $ImageResultCopyWith<$Res>? get previewImage;
}

/// @nodoc
class __$PreviewItemCopyWithImpl<$Res> implements _$PreviewItemCopyWith<$Res> {
  __$PreviewItemCopyWithImpl(this._self, this._then);

  final _PreviewItem _self;
  final $Res Function(_PreviewItem) _then;

  /// Create a copy of DetailPreviewItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? previewImage = freezed,
    Object? target = freezed,
  }) {
    return _then(_PreviewItem(
      previewImage: freezed == previewImage
          ? _self.previewImage
          : previewImage // ignore: cast_nullable_to_non_nullable
              as ImageResult?,
      target: freezed == target
          ? _self.target
          : target // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of DetailPreviewItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImageResultCopyWith<$Res>? get previewImage {
    if (_self.previewImage == null) {
      return null;
    }

    return $ImageResultCopyWith<$Res>(_self.previewImage!, (value) {
      return _then(_self.copyWith(previewImage: value));
    });
  }
}

/// @nodoc
mixin _$DetailParserResult implements DiagnosticableTreeMixin {
  String? get title;
  String? get subtitle;
  String? get language;
  int? get imageCount;
  String? get uploadTime;
  int? get countPrePage;
  String? get description;
  double? get star;
  List<DetailPreviewItem>? get previews;
  ImageResult? get coverImage;
  List<TagResult>? get badges;
  List<TagResult>? get tags;
  List<CommentResult>? get comments;
  String? get nextPage;
  bool? get isSuccess;
  String? get failMessage;
  List<EnvResult> get envs;
  List<ParserError> get errors;

  /// Create a copy of DetailParserResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DetailParserResultCopyWith<DetailParserResult> get copyWith =>
      _$DetailParserResultCopyWithImpl<DetailParserResult>(
          this as DetailParserResult, _$identity);

  /// Serializes this DetailParserResult to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
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
      ..add(DiagnosticsProperty('envs', envs))
      ..add(DiagnosticsProperty('errors', errors));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DetailParserResult &&
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
            const DeepCollectionEquality().equals(other.previews, previews) &&
            (identical(other.coverImage, coverImage) ||
                other.coverImage == coverImage) &&
            const DeepCollectionEquality().equals(other.badges, badges) &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            const DeepCollectionEquality().equals(other.comments, comments) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.failMessage, failMessage) ||
                other.failMessage == failMessage) &&
            const DeepCollectionEquality().equals(other.envs, envs) &&
            const DeepCollectionEquality().equals(other.errors, errors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
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
      const DeepCollectionEquality().hash(previews),
      coverImage,
      const DeepCollectionEquality().hash(badges),
      const DeepCollectionEquality().hash(tags),
      const DeepCollectionEquality().hash(comments),
      nextPage,
      isSuccess,
      failMessage,
      const DeepCollectionEquality().hash(envs),
      const DeepCollectionEquality().hash(errors));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DetailParserResult(title: $title, subtitle: $subtitle, language: $language, imageCount: $imageCount, uploadTime: $uploadTime, countPrePage: $countPrePage, description: $description, star: $star, previews: $previews, coverImage: $coverImage, badges: $badges, tags: $tags, comments: $comments, nextPage: $nextPage, isSuccess: $isSuccess, failMessage: $failMessage, envs: $envs, errors: $errors)';
  }
}

/// @nodoc
abstract mixin class $DetailParserResultCopyWith<$Res> {
  factory $DetailParserResultCopyWith(
          DetailParserResult value, $Res Function(DetailParserResult) _then) =
      _$DetailParserResultCopyWithImpl;
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
      List<EnvResult> envs,
      List<ParserError> errors});

  $ImageResultCopyWith<$Res>? get coverImage;
}

/// @nodoc
class _$DetailParserResultCopyWithImpl<$Res>
    implements $DetailParserResultCopyWith<$Res> {
  _$DetailParserResultCopyWithImpl(this._self, this._then);

  final DetailParserResult _self;
  final $Res Function(DetailParserResult) _then;

  /// Create a copy of DetailParserResult
  /// with the given fields replaced by the non-null parameter values.
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
    Object? envs = null,
    Object? errors = null,
  }) {
    return _then(_self.copyWith(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      subtitle: freezed == subtitle
          ? _self.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      imageCount: freezed == imageCount
          ? _self.imageCount
          : imageCount // ignore: cast_nullable_to_non_nullable
              as int?,
      uploadTime: freezed == uploadTime
          ? _self.uploadTime
          : uploadTime // ignore: cast_nullable_to_non_nullable
              as String?,
      countPrePage: freezed == countPrePage
          ? _self.countPrePage
          : countPrePage // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      star: freezed == star
          ? _self.star
          : star // ignore: cast_nullable_to_non_nullable
              as double?,
      previews: freezed == previews
          ? _self.previews
          : previews // ignore: cast_nullable_to_non_nullable
              as List<DetailPreviewItem>?,
      coverImage: freezed == coverImage
          ? _self.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as ImageResult?,
      badges: freezed == badges
          ? _self.badges
          : badges // ignore: cast_nullable_to_non_nullable
              as List<TagResult>?,
      tags: freezed == tags
          ? _self.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagResult>?,
      comments: freezed == comments
          ? _self.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentResult>?,
      nextPage: freezed == nextPage
          ? _self.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as String?,
      isSuccess: freezed == isSuccess
          ? _self.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      failMessage: freezed == failMessage
          ? _self.failMessage
          : failMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      envs: null == envs
          ? _self.envs
          : envs // ignore: cast_nullable_to_non_nullable
              as List<EnvResult>,
      errors: null == errors
          ? _self.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<ParserError>,
    ));
  }

  /// Create a copy of DetailParserResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImageResultCopyWith<$Res>? get coverImage {
    if (_self.coverImage == null) {
      return null;
    }

    return $ImageResultCopyWith<$Res>(_self.coverImage!, (value) {
      return _then(_self.copyWith(coverImage: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _DetailParserResult
    with DiagnosticableTreeMixin
    implements DetailParserResult {
  const _DetailParserResult(
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
      required final List<EnvResult> envs,
      required final List<ParserError> errors})
      : _previews = previews,
        _badges = badges,
        _tags = tags,
        _comments = comments,
        _envs = envs,
        _errors = errors;
  factory _DetailParserResult.fromJson(Map<String, dynamic> json) =>
      _$DetailParserResultFromJson(json);

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
  final List<EnvResult> _envs;
  @override
  List<EnvResult> get envs {
    if (_envs is EqualUnmodifiableListView) return _envs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_envs);
  }

  final List<ParserError> _errors;
  @override
  List<ParserError> get errors {
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_errors);
  }

  /// Create a copy of DetailParserResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DetailParserResultCopyWith<_DetailParserResult> get copyWith =>
      __$DetailParserResultCopyWithImpl<_DetailParserResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DetailParserResultToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
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
      ..add(DiagnosticsProperty('envs', envs))
      ..add(DiagnosticsProperty('errors', errors));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DetailParserResult &&
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
            const DeepCollectionEquality().equals(other._envs, _envs) &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
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
      const DeepCollectionEquality().hash(_envs),
      const DeepCollectionEquality().hash(_errors));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DetailParserResult(title: $title, subtitle: $subtitle, language: $language, imageCount: $imageCount, uploadTime: $uploadTime, countPrePage: $countPrePage, description: $description, star: $star, previews: $previews, coverImage: $coverImage, badges: $badges, tags: $tags, comments: $comments, nextPage: $nextPage, isSuccess: $isSuccess, failMessage: $failMessage, envs: $envs, errors: $errors)';
  }
}

/// @nodoc
abstract mixin class _$DetailParserResultCopyWith<$Res>
    implements $DetailParserResultCopyWith<$Res> {
  factory _$DetailParserResultCopyWith(
          _DetailParserResult value, $Res Function(_DetailParserResult) _then) =
      __$DetailParserResultCopyWithImpl;
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
      List<EnvResult> envs,
      List<ParserError> errors});

  @override
  $ImageResultCopyWith<$Res>? get coverImage;
}

/// @nodoc
class __$DetailParserResultCopyWithImpl<$Res>
    implements _$DetailParserResultCopyWith<$Res> {
  __$DetailParserResultCopyWithImpl(this._self, this._then);

  final _DetailParserResult _self;
  final $Res Function(_DetailParserResult) _then;

  /// Create a copy of DetailParserResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    Object? envs = null,
    Object? errors = null,
  }) {
    return _then(_DetailParserResult(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      subtitle: freezed == subtitle
          ? _self.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      imageCount: freezed == imageCount
          ? _self.imageCount
          : imageCount // ignore: cast_nullable_to_non_nullable
              as int?,
      uploadTime: freezed == uploadTime
          ? _self.uploadTime
          : uploadTime // ignore: cast_nullable_to_non_nullable
              as String?,
      countPrePage: freezed == countPrePage
          ? _self.countPrePage
          : countPrePage // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      star: freezed == star
          ? _self.star
          : star // ignore: cast_nullable_to_non_nullable
              as double?,
      previews: freezed == previews
          ? _self._previews
          : previews // ignore: cast_nullable_to_non_nullable
              as List<DetailPreviewItem>?,
      coverImage: freezed == coverImage
          ? _self.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as ImageResult?,
      badges: freezed == badges
          ? _self._badges
          : badges // ignore: cast_nullable_to_non_nullable
              as List<TagResult>?,
      tags: freezed == tags
          ? _self._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagResult>?,
      comments: freezed == comments
          ? _self._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentResult>?,
      nextPage: freezed == nextPage
          ? _self.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as String?,
      isSuccess: freezed == isSuccess
          ? _self.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      failMessage: freezed == failMessage
          ? _self.failMessage
          : failMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      envs: null == envs
          ? _self._envs
          : envs // ignore: cast_nullable_to_non_nullable
              as List<EnvResult>,
      errors: null == errors
          ? _self._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<ParserError>,
    ));
  }

  /// Create a copy of DetailParserResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImageResultCopyWith<$Res>? get coverImage {
    if (_self.coverImage == null) {
      return null;
    }

    return $ImageResultCopyWith<$Res>(_self.coverImage!, (value) {
      return _then(_self.copyWith(coverImage: value));
    });
  }
}

/// @nodoc
mixin _$AutoCompleteResultItem implements DiagnosticableTreeMixin {
  String? get title;
  String? get subtitle;
  String? get complete;

  /// Create a copy of AutoCompleteResultItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AutoCompleteResultItemCopyWith<AutoCompleteResultItem> get copyWith =>
      _$AutoCompleteResultItemCopyWithImpl<AutoCompleteResultItem>(
          this as AutoCompleteResultItem, _$identity);

  /// Serializes this AutoCompleteResultItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'AutoCompleteResultItem'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('subtitle', subtitle))
      ..add(DiagnosticsProperty('complete', complete));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AutoCompleteResultItem &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.complete, complete) ||
                other.complete == complete));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, subtitle, complete);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AutoCompleteResultItem(title: $title, subtitle: $subtitle, complete: $complete)';
  }
}

/// @nodoc
abstract mixin class $AutoCompleteResultItemCopyWith<$Res> {
  factory $AutoCompleteResultItemCopyWith(AutoCompleteResultItem value,
          $Res Function(AutoCompleteResultItem) _then) =
      _$AutoCompleteResultItemCopyWithImpl;
  @useResult
  $Res call({String? title, String? subtitle, String? complete});
}

/// @nodoc
class _$AutoCompleteResultItemCopyWithImpl<$Res>
    implements $AutoCompleteResultItemCopyWith<$Res> {
  _$AutoCompleteResultItemCopyWithImpl(this._self, this._then);

  final AutoCompleteResultItem _self;
  final $Res Function(AutoCompleteResultItem) _then;

  /// Create a copy of AutoCompleteResultItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? subtitle = freezed,
    Object? complete = freezed,
  }) {
    return _then(_self.copyWith(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      subtitle: freezed == subtitle
          ? _self.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      complete: freezed == complete
          ? _self.complete
          : complete // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AutoCompleteResultItem
    with DiagnosticableTreeMixin
    implements AutoCompleteResultItem {
  const _AutoCompleteResultItem({this.title, this.subtitle, this.complete});
  factory _AutoCompleteResultItem.fromJson(Map<String, dynamic> json) =>
      _$AutoCompleteResultItemFromJson(json);

  @override
  final String? title;
  @override
  final String? subtitle;
  @override
  final String? complete;

  /// Create a copy of AutoCompleteResultItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AutoCompleteResultItemCopyWith<_AutoCompleteResultItem> get copyWith =>
      __$AutoCompleteResultItemCopyWithImpl<_AutoCompleteResultItem>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AutoCompleteResultItemToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'AutoCompleteResultItem'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('subtitle', subtitle))
      ..add(DiagnosticsProperty('complete', complete));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AutoCompleteResultItem &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.complete, complete) ||
                other.complete == complete));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, subtitle, complete);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AutoCompleteResultItem(title: $title, subtitle: $subtitle, complete: $complete)';
  }
}

/// @nodoc
abstract mixin class _$AutoCompleteResultItemCopyWith<$Res>
    implements $AutoCompleteResultItemCopyWith<$Res> {
  factory _$AutoCompleteResultItemCopyWith(_AutoCompleteResultItem value,
          $Res Function(_AutoCompleteResultItem) _then) =
      __$AutoCompleteResultItemCopyWithImpl;
  @override
  @useResult
  $Res call({String? title, String? subtitle, String? complete});
}

/// @nodoc
class __$AutoCompleteResultItemCopyWithImpl<$Res>
    implements _$AutoCompleteResultItemCopyWith<$Res> {
  __$AutoCompleteResultItemCopyWithImpl(this._self, this._then);

  final _AutoCompleteResultItem _self;
  final $Res Function(_AutoCompleteResultItem) _then;

  /// Create a copy of AutoCompleteResultItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = freezed,
    Object? subtitle = freezed,
    Object? complete = freezed,
  }) {
    return _then(_AutoCompleteResultItem(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      subtitle: freezed == subtitle
          ? _self.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      complete: freezed == complete
          ? _self.complete
          : complete // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$AutoCompleteResult implements DiagnosticableTreeMixin {
  List<AutoCompleteResultItem>? get items;
  bool? get isSuccess;
  String? get failMessage;
  List<EnvResult> get envs;
  List<ParserError> get errors;

  /// Create a copy of AutoCompleteResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AutoCompleteResultCopyWith<AutoCompleteResult> get copyWith =>
      _$AutoCompleteResultCopyWithImpl<AutoCompleteResult>(
          this as AutoCompleteResult, _$identity);

  /// Serializes this AutoCompleteResult to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'AutoCompleteResult'))
      ..add(DiagnosticsProperty('items', items))
      ..add(DiagnosticsProperty('isSuccess', isSuccess))
      ..add(DiagnosticsProperty('failMessage', failMessage))
      ..add(DiagnosticsProperty('envs', envs))
      ..add(DiagnosticsProperty('errors', errors));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AutoCompleteResult &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.failMessage, failMessage) ||
                other.failMessage == failMessage) &&
            const DeepCollectionEquality().equals(other.envs, envs) &&
            const DeepCollectionEquality().equals(other.errors, errors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(items),
      isSuccess,
      failMessage,
      const DeepCollectionEquality().hash(envs),
      const DeepCollectionEquality().hash(errors));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AutoCompleteResult(items: $items, isSuccess: $isSuccess, failMessage: $failMessage, envs: $envs, errors: $errors)';
  }
}

/// @nodoc
abstract mixin class $AutoCompleteResultCopyWith<$Res> {
  factory $AutoCompleteResultCopyWith(
          AutoCompleteResult value, $Res Function(AutoCompleteResult) _then) =
      _$AutoCompleteResultCopyWithImpl;
  @useResult
  $Res call(
      {List<AutoCompleteResultItem>? items,
      bool? isSuccess,
      String? failMessage,
      List<EnvResult> envs,
      List<ParserError> errors});
}

/// @nodoc
class _$AutoCompleteResultCopyWithImpl<$Res>
    implements $AutoCompleteResultCopyWith<$Res> {
  _$AutoCompleteResultCopyWithImpl(this._self, this._then);

  final AutoCompleteResult _self;
  final $Res Function(AutoCompleteResult) _then;

  /// Create a copy of AutoCompleteResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = freezed,
    Object? isSuccess = freezed,
    Object? failMessage = freezed,
    Object? envs = null,
    Object? errors = null,
  }) {
    return _then(_self.copyWith(
      items: freezed == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<AutoCompleteResultItem>?,
      isSuccess: freezed == isSuccess
          ? _self.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      failMessage: freezed == failMessage
          ? _self.failMessage
          : failMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      envs: null == envs
          ? _self.envs
          : envs // ignore: cast_nullable_to_non_nullable
              as List<EnvResult>,
      errors: null == errors
          ? _self.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<ParserError>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AutoCompleteResult
    with DiagnosticableTreeMixin
    implements AutoCompleteResult {
  const _AutoCompleteResult(
      {final List<AutoCompleteResultItem>? items,
      this.isSuccess,
      this.failMessage,
      required final List<EnvResult> envs,
      required final List<ParserError> errors})
      : _items = items,
        _envs = envs,
        _errors = errors;
  factory _AutoCompleteResult.fromJson(Map<String, dynamic> json) =>
      _$AutoCompleteResultFromJson(json);

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
  final List<EnvResult> _envs;
  @override
  List<EnvResult> get envs {
    if (_envs is EqualUnmodifiableListView) return _envs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_envs);
  }

  final List<ParserError> _errors;
  @override
  List<ParserError> get errors {
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_errors);
  }

  /// Create a copy of AutoCompleteResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AutoCompleteResultCopyWith<_AutoCompleteResult> get copyWith =>
      __$AutoCompleteResultCopyWithImpl<_AutoCompleteResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AutoCompleteResultToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'AutoCompleteResult'))
      ..add(DiagnosticsProperty('items', items))
      ..add(DiagnosticsProperty('isSuccess', isSuccess))
      ..add(DiagnosticsProperty('failMessage', failMessage))
      ..add(DiagnosticsProperty('envs', envs))
      ..add(DiagnosticsProperty('errors', errors));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AutoCompleteResult &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.failMessage, failMessage) ||
                other.failMessage == failMessage) &&
            const DeepCollectionEquality().equals(other._envs, _envs) &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      isSuccess,
      failMessage,
      const DeepCollectionEquality().hash(_envs),
      const DeepCollectionEquality().hash(_errors));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AutoCompleteResult(items: $items, isSuccess: $isSuccess, failMessage: $failMessage, envs: $envs, errors: $errors)';
  }
}

/// @nodoc
abstract mixin class _$AutoCompleteResultCopyWith<$Res>
    implements $AutoCompleteResultCopyWith<$Res> {
  factory _$AutoCompleteResultCopyWith(
          _AutoCompleteResult value, $Res Function(_AutoCompleteResult) _then) =
      __$AutoCompleteResultCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<AutoCompleteResultItem>? items,
      bool? isSuccess,
      String? failMessage,
      List<EnvResult> envs,
      List<ParserError> errors});
}

/// @nodoc
class __$AutoCompleteResultCopyWithImpl<$Res>
    implements _$AutoCompleteResultCopyWith<$Res> {
  __$AutoCompleteResultCopyWithImpl(this._self, this._then);

  final _AutoCompleteResult _self;
  final $Res Function(_AutoCompleteResult) _then;

  /// Create a copy of AutoCompleteResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? items = freezed,
    Object? isSuccess = freezed,
    Object? failMessage = freezed,
    Object? envs = null,
    Object? errors = null,
  }) {
    return _then(_AutoCompleteResult(
      items: freezed == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<AutoCompleteResultItem>?,
      isSuccess: freezed == isSuccess
          ? _self.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      failMessage: freezed == failMessage
          ? _self.failMessage
          : failMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      envs: null == envs
          ? _self._envs
          : envs // ignore: cast_nullable_to_non_nullable
              as List<EnvResult>,
      errors: null == errors
          ? _self._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<ParserError>,
    ));
  }
}

/// @nodoc
mixin _$ImageReaderResult implements DiagnosticableTreeMixin {
  ImageResult? get image;
  ImageResult? get largerImage;
  ImageResult? get rawImage;
  String? get uploadTime;
  String? get source;
  String? get rating;
  double? get score;
  List<TagResult>? get badges;
  List<TagResult>? get tags;
  List<CommentResult>? get comments;
  bool? get isSuccess;
  String? get failMessage;
  List<EnvResult> get envs;
  List<ParserError> get errors;

  /// Create a copy of ImageReaderResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ImageReaderResultCopyWith<ImageReaderResult> get copyWith =>
      _$ImageReaderResultCopyWithImpl<ImageReaderResult>(
          this as ImageReaderResult, _$identity);

  /// Serializes this ImageReaderResult to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
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
      ..add(DiagnosticsProperty('envs', envs))
      ..add(DiagnosticsProperty('errors', errors));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ImageReaderResult &&
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
            const DeepCollectionEquality().equals(other.badges, badges) &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            const DeepCollectionEquality().equals(other.comments, comments) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.failMessage, failMessage) ||
                other.failMessage == failMessage) &&
            const DeepCollectionEquality().equals(other.envs, envs) &&
            const DeepCollectionEquality().equals(other.errors, errors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
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
      const DeepCollectionEquality().hash(badges),
      const DeepCollectionEquality().hash(tags),
      const DeepCollectionEquality().hash(comments),
      isSuccess,
      failMessage,
      const DeepCollectionEquality().hash(envs),
      const DeepCollectionEquality().hash(errors));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ImageReaderResult(image: $image, largerImage: $largerImage, rawImage: $rawImage, uploadTime: $uploadTime, source: $source, rating: $rating, score: $score, badges: $badges, tags: $tags, comments: $comments, isSuccess: $isSuccess, failMessage: $failMessage, envs: $envs, errors: $errors)';
  }
}

/// @nodoc
abstract mixin class $ImageReaderResultCopyWith<$Res> {
  factory $ImageReaderResultCopyWith(
          ImageReaderResult value, $Res Function(ImageReaderResult) _then) =
      _$ImageReaderResultCopyWithImpl;
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
      List<EnvResult> envs,
      List<ParserError> errors});

  $ImageResultCopyWith<$Res>? get image;
  $ImageResultCopyWith<$Res>? get largerImage;
  $ImageResultCopyWith<$Res>? get rawImage;
}

/// @nodoc
class _$ImageReaderResultCopyWithImpl<$Res>
    implements $ImageReaderResultCopyWith<$Res> {
  _$ImageReaderResultCopyWithImpl(this._self, this._then);

  final ImageReaderResult _self;
  final $Res Function(ImageReaderResult) _then;

  /// Create a copy of ImageReaderResult
  /// with the given fields replaced by the non-null parameter values.
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
    Object? envs = null,
    Object? errors = null,
  }) {
    return _then(_self.copyWith(
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as ImageResult?,
      largerImage: freezed == largerImage
          ? _self.largerImage
          : largerImage // ignore: cast_nullable_to_non_nullable
              as ImageResult?,
      rawImage: freezed == rawImage
          ? _self.rawImage
          : rawImage // ignore: cast_nullable_to_non_nullable
              as ImageResult?,
      uploadTime: freezed == uploadTime
          ? _self.uploadTime
          : uploadTime // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _self.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      badges: freezed == badges
          ? _self.badges
          : badges // ignore: cast_nullable_to_non_nullable
              as List<TagResult>?,
      tags: freezed == tags
          ? _self.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagResult>?,
      comments: freezed == comments
          ? _self.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentResult>?,
      isSuccess: freezed == isSuccess
          ? _self.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      failMessage: freezed == failMessage
          ? _self.failMessage
          : failMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      envs: null == envs
          ? _self.envs
          : envs // ignore: cast_nullable_to_non_nullable
              as List<EnvResult>,
      errors: null == errors
          ? _self.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<ParserError>,
    ));
  }

  /// Create a copy of ImageReaderResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImageResultCopyWith<$Res>? get image {
    if (_self.image == null) {
      return null;
    }

    return $ImageResultCopyWith<$Res>(_self.image!, (value) {
      return _then(_self.copyWith(image: value));
    });
  }

  /// Create a copy of ImageReaderResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImageResultCopyWith<$Res>? get largerImage {
    if (_self.largerImage == null) {
      return null;
    }

    return $ImageResultCopyWith<$Res>(_self.largerImage!, (value) {
      return _then(_self.copyWith(largerImage: value));
    });
  }

  /// Create a copy of ImageReaderResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImageResultCopyWith<$Res>? get rawImage {
    if (_self.rawImage == null) {
      return null;
    }

    return $ImageResultCopyWith<$Res>(_self.rawImage!, (value) {
      return _then(_self.copyWith(rawImage: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _ImageReaderResult
    with DiagnosticableTreeMixin
    implements ImageReaderResult {
  const _ImageReaderResult(
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
      required final List<EnvResult> envs,
      required final List<ParserError> errors})
      : _badges = badges,
        _tags = tags,
        _comments = comments,
        _envs = envs,
        _errors = errors;
  factory _ImageReaderResult.fromJson(Map<String, dynamic> json) =>
      _$ImageReaderResultFromJson(json);

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
  final List<EnvResult> _envs;
  @override
  List<EnvResult> get envs {
    if (_envs is EqualUnmodifiableListView) return _envs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_envs);
  }

  final List<ParserError> _errors;
  @override
  List<ParserError> get errors {
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_errors);
  }

  /// Create a copy of ImageReaderResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ImageReaderResultCopyWith<_ImageReaderResult> get copyWith =>
      __$ImageReaderResultCopyWithImpl<_ImageReaderResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ImageReaderResultToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
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
      ..add(DiagnosticsProperty('envs', envs))
      ..add(DiagnosticsProperty('errors', errors));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ImageReaderResult &&
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
            const DeepCollectionEquality().equals(other._envs, _envs) &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
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
      const DeepCollectionEquality().hash(_envs),
      const DeepCollectionEquality().hash(_errors));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ImageReaderResult(image: $image, largerImage: $largerImage, rawImage: $rawImage, uploadTime: $uploadTime, source: $source, rating: $rating, score: $score, badges: $badges, tags: $tags, comments: $comments, isSuccess: $isSuccess, failMessage: $failMessage, envs: $envs, errors: $errors)';
  }
}

/// @nodoc
abstract mixin class _$ImageReaderResultCopyWith<$Res>
    implements $ImageReaderResultCopyWith<$Res> {
  factory _$ImageReaderResultCopyWith(
          _ImageReaderResult value, $Res Function(_ImageReaderResult) _then) =
      __$ImageReaderResultCopyWithImpl;
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
      List<EnvResult> envs,
      List<ParserError> errors});

  @override
  $ImageResultCopyWith<$Res>? get image;
  @override
  $ImageResultCopyWith<$Res>? get largerImage;
  @override
  $ImageResultCopyWith<$Res>? get rawImage;
}

/// @nodoc
class __$ImageReaderResultCopyWithImpl<$Res>
    implements _$ImageReaderResultCopyWith<$Res> {
  __$ImageReaderResultCopyWithImpl(this._self, this._then);

  final _ImageReaderResult _self;
  final $Res Function(_ImageReaderResult) _then;

  /// Create a copy of ImageReaderResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    Object? envs = null,
    Object? errors = null,
  }) {
    return _then(_ImageReaderResult(
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as ImageResult?,
      largerImage: freezed == largerImage
          ? _self.largerImage
          : largerImage // ignore: cast_nullable_to_non_nullable
              as ImageResult?,
      rawImage: freezed == rawImage
          ? _self.rawImage
          : rawImage // ignore: cast_nullable_to_non_nullable
              as ImageResult?,
      uploadTime: freezed == uploadTime
          ? _self.uploadTime
          : uploadTime // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _self.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      badges: freezed == badges
          ? _self._badges
          : badges // ignore: cast_nullable_to_non_nullable
              as List<TagResult>?,
      tags: freezed == tags
          ? _self._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagResult>?,
      comments: freezed == comments
          ? _self._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentResult>?,
      isSuccess: freezed == isSuccess
          ? _self.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      failMessage: freezed == failMessage
          ? _self.failMessage
          : failMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      envs: null == envs
          ? _self._envs
          : envs // ignore: cast_nullable_to_non_nullable
              as List<EnvResult>,
      errors: null == errors
          ? _self._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<ParserError>,
    ));
  }

  /// Create a copy of ImageReaderResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImageResultCopyWith<$Res>? get image {
    if (_self.image == null) {
      return null;
    }

    return $ImageResultCopyWith<$Res>(_self.image!, (value) {
      return _then(_self.copyWith(image: value));
    });
  }

  /// Create a copy of ImageReaderResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImageResultCopyWith<$Res>? get largerImage {
    if (_self.largerImage == null) {
      return null;
    }

    return $ImageResultCopyWith<$Res>(_self.largerImage!, (value) {
      return _then(_self.copyWith(largerImage: value));
    });
  }

  /// Create a copy of ImageReaderResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImageResultCopyWith<$Res>? get rawImage {
    if (_self.rawImage == null) {
      return null;
    }

    return $ImageResultCopyWith<$Res>(_self.rawImage!, (value) {
      return _then(_self.copyWith(rawImage: value));
    });
  }
}

/// @nodoc
mixin _$ListParserResultItem implements DiagnosticableTreeMixin {
  String? get title;
  String? get subtitle;
  String? get uploadTime;
  double? get star;
  int? get imageCount;
  ImageResult? get previewImage;
  List<TagResult>? get badges;
  List<TagResult>? get tags;
  String? get idCode;
  String? get language;
  String? get paper;

  /// Create a copy of ListParserResultItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ListParserResultItemCopyWith<ListParserResultItem> get copyWith =>
      _$ListParserResultItemCopyWithImpl<ListParserResultItem>(
          this as ListParserResultItem, _$identity);

  /// Serializes this ListParserResultItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
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
      ..add(DiagnosticsProperty('idCode', idCode))
      ..add(DiagnosticsProperty('language', language))
      ..add(DiagnosticsProperty('paper', paper));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ListParserResultItem &&
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
            const DeepCollectionEquality().equals(other.badges, badges) &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            (identical(other.idCode, idCode) || other.idCode == idCode) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.paper, paper) || other.paper == paper));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      subtitle,
      uploadTime,
      star,
      imageCount,
      previewImage,
      const DeepCollectionEquality().hash(badges),
      const DeepCollectionEquality().hash(tags),
      idCode,
      language,
      paper);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ListParserResultItem(title: $title, subtitle: $subtitle, uploadTime: $uploadTime, star: $star, imageCount: $imageCount, previewImage: $previewImage, badges: $badges, tags: $tags, idCode: $idCode, language: $language, paper: $paper)';
  }
}

/// @nodoc
abstract mixin class $ListParserResultItemCopyWith<$Res> {
  factory $ListParserResultItemCopyWith(ListParserResultItem value,
          $Res Function(ListParserResultItem) _then) =
      _$ListParserResultItemCopyWithImpl;
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
      String? idCode,
      String? language,
      String? paper});

  $ImageResultCopyWith<$Res>? get previewImage;
}

/// @nodoc
class _$ListParserResultItemCopyWithImpl<$Res>
    implements $ListParserResultItemCopyWith<$Res> {
  _$ListParserResultItemCopyWithImpl(this._self, this._then);

  final ListParserResultItem _self;
  final $Res Function(ListParserResultItem) _then;

  /// Create a copy of ListParserResultItem
  /// with the given fields replaced by the non-null parameter values.
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
    Object? idCode = freezed,
    Object? language = freezed,
    Object? paper = freezed,
  }) {
    return _then(_self.copyWith(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      subtitle: freezed == subtitle
          ? _self.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadTime: freezed == uploadTime
          ? _self.uploadTime
          : uploadTime // ignore: cast_nullable_to_non_nullable
              as String?,
      star: freezed == star
          ? _self.star
          : star // ignore: cast_nullable_to_non_nullable
              as double?,
      imageCount: freezed == imageCount
          ? _self.imageCount
          : imageCount // ignore: cast_nullable_to_non_nullable
              as int?,
      previewImage: freezed == previewImage
          ? _self.previewImage
          : previewImage // ignore: cast_nullable_to_non_nullable
              as ImageResult?,
      badges: freezed == badges
          ? _self.badges
          : badges // ignore: cast_nullable_to_non_nullable
              as List<TagResult>?,
      tags: freezed == tags
          ? _self.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagResult>?,
      idCode: freezed == idCode
          ? _self.idCode
          : idCode // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      paper: freezed == paper
          ? _self.paper
          : paper // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of ListParserResultItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImageResultCopyWith<$Res>? get previewImage {
    if (_self.previewImage == null) {
      return null;
    }

    return $ImageResultCopyWith<$Res>(_self.previewImage!, (value) {
      return _then(_self.copyWith(previewImage: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _ListParserResultItem
    with DiagnosticableTreeMixin
    implements ListParserResultItem {
  const _ListParserResultItem(
      {this.title,
      this.subtitle,
      this.uploadTime,
      this.star,
      this.imageCount,
      this.previewImage,
      final List<TagResult>? badges,
      final List<TagResult>? tags,
      this.idCode,
      this.language,
      this.paper})
      : _badges = badges,
        _tags = tags;
  factory _ListParserResultItem.fromJson(Map<String, dynamic> json) =>
      _$ListParserResultItemFromJson(json);

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
  final String? idCode;
  @override
  final String? language;
  @override
  final String? paper;

  /// Create a copy of ListParserResultItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ListParserResultItemCopyWith<_ListParserResultItem> get copyWith =>
      __$ListParserResultItemCopyWithImpl<_ListParserResultItem>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ListParserResultItemToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
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
      ..add(DiagnosticsProperty('idCode', idCode))
      ..add(DiagnosticsProperty('language', language))
      ..add(DiagnosticsProperty('paper', paper));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ListParserResultItem &&
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
            (identical(other.idCode, idCode) || other.idCode == idCode) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.paper, paper) || other.paper == paper));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
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
      idCode,
      language,
      paper);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ListParserResultItem(title: $title, subtitle: $subtitle, uploadTime: $uploadTime, star: $star, imageCount: $imageCount, previewImage: $previewImage, badges: $badges, tags: $tags, idCode: $idCode, language: $language, paper: $paper)';
  }
}

/// @nodoc
abstract mixin class _$ListParserResultItemCopyWith<$Res>
    implements $ListParserResultItemCopyWith<$Res> {
  factory _$ListParserResultItemCopyWith(_ListParserResultItem value,
          $Res Function(_ListParserResultItem) _then) =
      __$ListParserResultItemCopyWithImpl;
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
      String? idCode,
      String? language,
      String? paper});

  @override
  $ImageResultCopyWith<$Res>? get previewImage;
}

/// @nodoc
class __$ListParserResultItemCopyWithImpl<$Res>
    implements _$ListParserResultItemCopyWith<$Res> {
  __$ListParserResultItemCopyWithImpl(this._self, this._then);

  final _ListParserResultItem _self;
  final $Res Function(_ListParserResultItem) _then;

  /// Create a copy of ListParserResultItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = freezed,
    Object? subtitle = freezed,
    Object? uploadTime = freezed,
    Object? star = freezed,
    Object? imageCount = freezed,
    Object? previewImage = freezed,
    Object? badges = freezed,
    Object? tags = freezed,
    Object? idCode = freezed,
    Object? language = freezed,
    Object? paper = freezed,
  }) {
    return _then(_ListParserResultItem(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      subtitle: freezed == subtitle
          ? _self.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadTime: freezed == uploadTime
          ? _self.uploadTime
          : uploadTime // ignore: cast_nullable_to_non_nullable
              as String?,
      star: freezed == star
          ? _self.star
          : star // ignore: cast_nullable_to_non_nullable
              as double?,
      imageCount: freezed == imageCount
          ? _self.imageCount
          : imageCount // ignore: cast_nullable_to_non_nullable
              as int?,
      previewImage: freezed == previewImage
          ? _self.previewImage
          : previewImage // ignore: cast_nullable_to_non_nullable
              as ImageResult?,
      badges: freezed == badges
          ? _self._badges
          : badges // ignore: cast_nullable_to_non_nullable
              as List<TagResult>?,
      tags: freezed == tags
          ? _self._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagResult>?,
      idCode: freezed == idCode
          ? _self.idCode
          : idCode // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      paper: freezed == paper
          ? _self.paper
          : paper // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of ListParserResultItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImageResultCopyWith<$Res>? get previewImage {
    if (_self.previewImage == null) {
      return null;
    }

    return $ImageResultCopyWith<$Res>(_self.previewImage!, (value) {
      return _then(_self.copyWith(previewImage: value));
    });
  }
}

/// @nodoc
mixin _$ListParserResult implements DiagnosticableTreeMixin {
  List<ListParserResultItem>? get items;
  String? get nextPage;
  bool? get isSuccess;
  String? get failMessage;
  List<EnvResult> get envs;
  List<ParserError> get errors;

  /// Create a copy of ListParserResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ListParserResultCopyWith<ListParserResult> get copyWith =>
      _$ListParserResultCopyWithImpl<ListParserResult>(
          this as ListParserResult, _$identity);

  /// Serializes this ListParserResult to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ListParserResult'))
      ..add(DiagnosticsProperty('items', items))
      ..add(DiagnosticsProperty('nextPage', nextPage))
      ..add(DiagnosticsProperty('isSuccess', isSuccess))
      ..add(DiagnosticsProperty('failMessage', failMessage))
      ..add(DiagnosticsProperty('envs', envs))
      ..add(DiagnosticsProperty('errors', errors));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ListParserResult &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.failMessage, failMessage) ||
                other.failMessage == failMessage) &&
            const DeepCollectionEquality().equals(other.envs, envs) &&
            const DeepCollectionEquality().equals(other.errors, errors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(items),
      nextPage,
      isSuccess,
      failMessage,
      const DeepCollectionEquality().hash(envs),
      const DeepCollectionEquality().hash(errors));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ListParserResult(items: $items, nextPage: $nextPage, isSuccess: $isSuccess, failMessage: $failMessage, envs: $envs, errors: $errors)';
  }
}

/// @nodoc
abstract mixin class $ListParserResultCopyWith<$Res> {
  factory $ListParserResultCopyWith(
          ListParserResult value, $Res Function(ListParserResult) _then) =
      _$ListParserResultCopyWithImpl;
  @useResult
  $Res call(
      {List<ListParserResultItem>? items,
      String? nextPage,
      bool? isSuccess,
      String? failMessage,
      List<EnvResult> envs,
      List<ParserError> errors});
}

/// @nodoc
class _$ListParserResultCopyWithImpl<$Res>
    implements $ListParserResultCopyWith<$Res> {
  _$ListParserResultCopyWithImpl(this._self, this._then);

  final ListParserResult _self;
  final $Res Function(ListParserResult) _then;

  /// Create a copy of ListParserResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = freezed,
    Object? nextPage = freezed,
    Object? isSuccess = freezed,
    Object? failMessage = freezed,
    Object? envs = null,
    Object? errors = null,
  }) {
    return _then(_self.copyWith(
      items: freezed == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ListParserResultItem>?,
      nextPage: freezed == nextPage
          ? _self.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as String?,
      isSuccess: freezed == isSuccess
          ? _self.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      failMessage: freezed == failMessage
          ? _self.failMessage
          : failMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      envs: null == envs
          ? _self.envs
          : envs // ignore: cast_nullable_to_non_nullable
              as List<EnvResult>,
      errors: null == errors
          ? _self.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<ParserError>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ListParserResult
    with DiagnosticableTreeMixin
    implements ListParserResult {
  const _ListParserResult(
      {final List<ListParserResultItem>? items,
      this.nextPage,
      this.isSuccess,
      this.failMessage,
      required final List<EnvResult> envs,
      required final List<ParserError> errors})
      : _items = items,
        _envs = envs,
        _errors = errors;
  factory _ListParserResult.fromJson(Map<String, dynamic> json) =>
      _$ListParserResultFromJson(json);

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
  final List<EnvResult> _envs;
  @override
  List<EnvResult> get envs {
    if (_envs is EqualUnmodifiableListView) return _envs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_envs);
  }

  final List<ParserError> _errors;
  @override
  List<ParserError> get errors {
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_errors);
  }

  /// Create a copy of ListParserResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ListParserResultCopyWith<_ListParserResult> get copyWith =>
      __$ListParserResultCopyWithImpl<_ListParserResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ListParserResultToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ListParserResult'))
      ..add(DiagnosticsProperty('items', items))
      ..add(DiagnosticsProperty('nextPage', nextPage))
      ..add(DiagnosticsProperty('isSuccess', isSuccess))
      ..add(DiagnosticsProperty('failMessage', failMessage))
      ..add(DiagnosticsProperty('envs', envs))
      ..add(DiagnosticsProperty('errors', errors));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ListParserResult &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.failMessage, failMessage) ||
                other.failMessage == failMessage) &&
            const DeepCollectionEquality().equals(other._envs, _envs) &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      nextPage,
      isSuccess,
      failMessage,
      const DeepCollectionEquality().hash(_envs),
      const DeepCollectionEquality().hash(_errors));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ListParserResult(items: $items, nextPage: $nextPage, isSuccess: $isSuccess, failMessage: $failMessage, envs: $envs, errors: $errors)';
  }
}

/// @nodoc
abstract mixin class _$ListParserResultCopyWith<$Res>
    implements $ListParserResultCopyWith<$Res> {
  factory _$ListParserResultCopyWith(
          _ListParserResult value, $Res Function(_ListParserResult) _then) =
      __$ListParserResultCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<ListParserResultItem>? items,
      String? nextPage,
      bool? isSuccess,
      String? failMessage,
      List<EnvResult> envs,
      List<ParserError> errors});
}

/// @nodoc
class __$ListParserResultCopyWithImpl<$Res>
    implements _$ListParserResultCopyWith<$Res> {
  __$ListParserResultCopyWithImpl(this._self, this._then);

  final _ListParserResult _self;
  final $Res Function(_ListParserResult) _then;

  /// Create a copy of ListParserResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? items = freezed,
    Object? nextPage = freezed,
    Object? isSuccess = freezed,
    Object? failMessage = freezed,
    Object? envs = null,
    Object? errors = null,
  }) {
    return _then(_ListParserResult(
      items: freezed == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ListParserResultItem>?,
      nextPage: freezed == nextPage
          ? _self.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as String?,
      isSuccess: freezed == isSuccess
          ? _self.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      failMessage: freezed == failMessage
          ? _self.failMessage
          : failMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      envs: null == envs
          ? _self._envs
          : envs // ignore: cast_nullable_to_non_nullable
              as List<EnvResult>,
      errors: null == errors
          ? _self._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<ParserError>,
    ));
  }
}

// dart format on
