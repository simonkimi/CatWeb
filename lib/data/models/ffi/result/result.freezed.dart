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

PreviewItem _$PreviewItemFromJson(Map<String, dynamic> json) {
  return _PreviewItem.fromJson(json);
}

/// @nodoc
mixin _$PreviewItem {
  ImageResult? get previewImage => throw _privateConstructorUsedError;
  String? get target => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PreviewItemCopyWith<PreviewItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreviewItemCopyWith<$Res> {
  factory $PreviewItemCopyWith(
          PreviewItem value, $Res Function(PreviewItem) then) =
      _$PreviewItemCopyWithImpl<$Res, PreviewItem>;
  @useResult
  $Res call({ImageResult? previewImage, String? target});

  $ImageResultCopyWith<$Res>? get previewImage;
}

/// @nodoc
class _$PreviewItemCopyWithImpl<$Res, $Val extends PreviewItem>
    implements $PreviewItemCopyWith<$Res> {
  _$PreviewItemCopyWithImpl(this._value, this._then);

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
    implements $PreviewItemCopyWith<$Res> {
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
    extends _$PreviewItemCopyWithImpl<$Res, _$_PreviewItem>
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
    return 'PreviewItem(previewImage: $previewImage, target: $target)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PreviewItem'))
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

abstract class _PreviewItem implements PreviewItem {
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
  List<PreviewItem>? get previews => throw _privateConstructorUsedError;
  ImageResult? get coverImage => throw _privateConstructorUsedError;
  List<TagResult>? get badges => throw _privateConstructorUsedError;
  List<TagResult>? get tags => throw _privateConstructorUsedError;
  List<CommentResult>? get comments => throw _privateConstructorUsedError;
  String? get nextPage => throw _privateConstructorUsedError;
  bool? get isSuccess => throw _privateConstructorUsedError;
  String? get failMessage => throw _privateConstructorUsedError;
  List<EnvResult>? get env => throw _privateConstructorUsedError;

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
      List<PreviewItem>? previews,
      ImageResult? coverImage,
      List<TagResult>? badges,
      List<TagResult>? tags,
      List<CommentResult>? comments,
      String? nextPage,
      bool? isSuccess,
      String? failMessage,
      List<EnvResult>? env});

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
    Object? env = freezed,
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
              as List<PreviewItem>?,
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
      env: freezed == env
          ? _value.env
          : env // ignore: cast_nullable_to_non_nullable
              as List<EnvResult>?,
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
      List<PreviewItem>? previews,
      ImageResult? coverImage,
      List<TagResult>? badges,
      List<TagResult>? tags,
      List<CommentResult>? comments,
      String? nextPage,
      bool? isSuccess,
      String? failMessage,
      List<EnvResult>? env});

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
    Object? env = freezed,
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
              as List<PreviewItem>?,
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
      env: freezed == env
          ? _value._env
          : env // ignore: cast_nullable_to_non_nullable
              as List<EnvResult>?,
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
      final List<PreviewItem>? previews,
      this.coverImage,
      final List<TagResult>? badges,
      final List<TagResult>? tags,
      final List<CommentResult>? comments,
      this.nextPage,
      this.isSuccess,
      this.failMessage,
      final List<EnvResult>? env})
      : _previews = previews,
        _badges = badges,
        _tags = tags,
        _comments = comments,
        _env = env;

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
  final List<PreviewItem>? _previews;
  @override
  List<PreviewItem>? get previews {
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
  final List<EnvResult>? _env;
  @override
  List<EnvResult>? get env {
    final value = _env;
    if (value == null) return null;
    if (_env is EqualUnmodifiableListView) return _env;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DetailParserResult(title: $title, subtitle: $subtitle, language: $language, imageCount: $imageCount, uploadTime: $uploadTime, countPrePage: $countPrePage, description: $description, star: $star, previews: $previews, coverImage: $coverImage, badges: $badges, tags: $tags, comments: $comments, nextPage: $nextPage, isSuccess: $isSuccess, failMessage: $failMessage, env: $env)';
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
      ..add(DiagnosticsProperty('env', env));
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
            const DeepCollectionEquality().equals(other._env, _env));
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
      const DeepCollectionEquality().hash(_env));

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
      final List<PreviewItem>? previews,
      final ImageResult? coverImage,
      final List<TagResult>? badges,
      final List<TagResult>? tags,
      final List<CommentResult>? comments,
      final String? nextPage,
      final bool? isSuccess,
      final String? failMessage,
      final List<EnvResult>? env}) = _$_DetailParserResult;

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
  List<PreviewItem>? get previews;
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
  List<EnvResult>? get env;
  @override
  @JsonKey(ignore: true)
  _$$_DetailParserResultCopyWith<_$_DetailParserResult> get copyWith =>
      throw _privateConstructorUsedError;
}
