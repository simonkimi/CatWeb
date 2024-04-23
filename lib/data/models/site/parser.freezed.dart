// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parser.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ParserModel _$ParserModelFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'imageReader':
      return ParserModelImageReader.fromJson(json);
    case 'detail':
      return ParserModelDetail.fromJson(json);
    case 'list':
      return ParserModelList.fromJson(json);
    case 'autoComplete':
      return ParserModelAutoComplete.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'ParserModel',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$ParserModel {
  String get name => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  List<ExtraSelectorModel> get extra => throw _privateConstructorUsedError;
  SelectorModel get successSelector => throw _privateConstructorUsedError;
  SelectorModel get failedSelector => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel id,
            ImageSelectorModel image,
            SelectorModel largerImage,
            SelectorModel rawImage,
            SelectorModel rating,
            SelectorModel score,
            SelectorModel source,
            SelectorModel uploadTime,
            SelectorModel successSelector,
            SelectorModel failedSelector,
            SelectorModel badgeSelector,
            TagSelectorModel badgeItem,
            SelectorModel tagSelector,
            TagSelectorModel tagItem,
            SelectorModel commentSelector,
            CommentSelectorModel commentItem)
        imageReader,
    required TResult Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel title,
            SelectorModel subtitle,
            SelectorModel uploadTime,
            SelectorModel star,
            SelectorModel imageCount,
            SelectorModel pageCount,
            SelectorModel language,
            ImageSelectorModel coverImage,
            SelectorModel description,
            SelectorModel successSelector,
            SelectorModel failedSelector,
            SelectorModel thumbnailSelector,
            ImageSelectorModel thumbnail,
            SelectorModel target,
            SelectorModel commentSelector,
            CommentSelectorModel comments,
            SelectorModel badgeSelector,
            TagSelectorModel badgeItem,
            SelectorModel tagSelector,
            TagSelectorModel tagItem,
            SelectorModel chapterSelector,
            SelectorModel chapterTitle,
            SelectorModel chapterSubtitle,
            ImageSelectorModel chapterCover,
            SelectorModel nextPage,
            SelectorModel countPrePage)
        detail,
    required TResult Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel itemSelector,
            SelectorModel itemComplete,
            SelectorModel successSelector,
            SelectorModel failedSelector,
            SelectorModel title,
            SelectorModel subtitle,
            SelectorModel uploadTime,
            SelectorModel star,
            SelectorModel imageCount,
            SelectorModel language,
            ImageSelectorModel previewImage,
            SelectorModel target,
            SelectorModel badgeSelector,
            TagSelectorModel badgeItem,
            SelectorModel tag,
            TagSelectorModel tagItem,
            SelectorModel paper,
            SelectorModel idCode,
            SelectorModel nextPage)
        list,
    required TResult Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel itemSelector,
            SelectorModel itemComplete,
            SelectorModel successSelector,
            SelectorModel failedSelector)
        autoComplete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel id,
            ImageSelectorModel image,
            SelectorModel largerImage,
            SelectorModel rawImage,
            SelectorModel rating,
            SelectorModel score,
            SelectorModel source,
            SelectorModel uploadTime,
            SelectorModel successSelector,
            SelectorModel failedSelector,
            SelectorModel badgeSelector,
            TagSelectorModel badgeItem,
            SelectorModel tagSelector,
            TagSelectorModel tagItem,
            SelectorModel commentSelector,
            CommentSelectorModel commentItem)?
        imageReader,
    TResult? Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel title,
            SelectorModel subtitle,
            SelectorModel uploadTime,
            SelectorModel star,
            SelectorModel imageCount,
            SelectorModel pageCount,
            SelectorModel language,
            ImageSelectorModel coverImage,
            SelectorModel description,
            SelectorModel successSelector,
            SelectorModel failedSelector,
            SelectorModel thumbnailSelector,
            ImageSelectorModel thumbnail,
            SelectorModel target,
            SelectorModel commentSelector,
            CommentSelectorModel comments,
            SelectorModel badgeSelector,
            TagSelectorModel badgeItem,
            SelectorModel tagSelector,
            TagSelectorModel tagItem,
            SelectorModel chapterSelector,
            SelectorModel chapterTitle,
            SelectorModel chapterSubtitle,
            ImageSelectorModel chapterCover,
            SelectorModel nextPage,
            SelectorModel countPrePage)?
        detail,
    TResult? Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel itemSelector,
            SelectorModel itemComplete,
            SelectorModel successSelector,
            SelectorModel failedSelector,
            SelectorModel title,
            SelectorModel subtitle,
            SelectorModel uploadTime,
            SelectorModel star,
            SelectorModel imageCount,
            SelectorModel language,
            ImageSelectorModel previewImage,
            SelectorModel target,
            SelectorModel badgeSelector,
            TagSelectorModel badgeItem,
            SelectorModel tag,
            TagSelectorModel tagItem,
            SelectorModel paper,
            SelectorModel idCode,
            SelectorModel nextPage)?
        list,
    TResult? Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel itemSelector,
            SelectorModel itemComplete,
            SelectorModel successSelector,
            SelectorModel failedSelector)?
        autoComplete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel id,
            ImageSelectorModel image,
            SelectorModel largerImage,
            SelectorModel rawImage,
            SelectorModel rating,
            SelectorModel score,
            SelectorModel source,
            SelectorModel uploadTime,
            SelectorModel successSelector,
            SelectorModel failedSelector,
            SelectorModel badgeSelector,
            TagSelectorModel badgeItem,
            SelectorModel tagSelector,
            TagSelectorModel tagItem,
            SelectorModel commentSelector,
            CommentSelectorModel commentItem)?
        imageReader,
    TResult Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel title,
            SelectorModel subtitle,
            SelectorModel uploadTime,
            SelectorModel star,
            SelectorModel imageCount,
            SelectorModel pageCount,
            SelectorModel language,
            ImageSelectorModel coverImage,
            SelectorModel description,
            SelectorModel successSelector,
            SelectorModel failedSelector,
            SelectorModel thumbnailSelector,
            ImageSelectorModel thumbnail,
            SelectorModel target,
            SelectorModel commentSelector,
            CommentSelectorModel comments,
            SelectorModel badgeSelector,
            TagSelectorModel badgeItem,
            SelectorModel tagSelector,
            TagSelectorModel tagItem,
            SelectorModel chapterSelector,
            SelectorModel chapterTitle,
            SelectorModel chapterSubtitle,
            ImageSelectorModel chapterCover,
            SelectorModel nextPage,
            SelectorModel countPrePage)?
        detail,
    TResult Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel itemSelector,
            SelectorModel itemComplete,
            SelectorModel successSelector,
            SelectorModel failedSelector,
            SelectorModel title,
            SelectorModel subtitle,
            SelectorModel uploadTime,
            SelectorModel star,
            SelectorModel imageCount,
            SelectorModel language,
            ImageSelectorModel previewImage,
            SelectorModel target,
            SelectorModel badgeSelector,
            TagSelectorModel badgeItem,
            SelectorModel tag,
            TagSelectorModel tagItem,
            SelectorModel paper,
            SelectorModel idCode,
            SelectorModel nextPage)?
        list,
    TResult Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel itemSelector,
            SelectorModel itemComplete,
            SelectorModel successSelector,
            SelectorModel failedSelector)?
        autoComplete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ParserModelImageReader value) imageReader,
    required TResult Function(ParserModelDetail value) detail,
    required TResult Function(ParserModelList value) list,
    required TResult Function(ParserModelAutoComplete value) autoComplete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ParserModelImageReader value)? imageReader,
    TResult? Function(ParserModelDetail value)? detail,
    TResult? Function(ParserModelList value)? list,
    TResult? Function(ParserModelAutoComplete value)? autoComplete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ParserModelImageReader value)? imageReader,
    TResult Function(ParserModelDetail value)? detail,
    TResult Function(ParserModelList value)? list,
    TResult Function(ParserModelAutoComplete value)? autoComplete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ParserModelCopyWith<ParserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParserModelCopyWith<$Res> {
  factory $ParserModelCopyWith(
          ParserModel value, $Res Function(ParserModel) then) =
      _$ParserModelCopyWithImpl<$Res, ParserModel>;
  @useResult
  $Res call(
      {String name,
      String uuid,
      List<ExtraSelectorModel> extra,
      SelectorModel successSelector,
      SelectorModel failedSelector});

  $SelectorModelCopyWith<$Res> get successSelector;
  $SelectorModelCopyWith<$Res> get failedSelector;
}

/// @nodoc
class _$ParserModelCopyWithImpl<$Res, $Val extends ParserModel>
    implements $ParserModelCopyWith<$Res> {
  _$ParserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? uuid = null,
    Object? extra = null,
    Object? successSelector = null,
    Object? failedSelector = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      extra: null == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as List<ExtraSelectorModel>,
      successSelector: null == successSelector
          ? _value.successSelector
          : successSelector // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      failedSelector: null == failedSelector
          ? _value.failedSelector
          : failedSelector // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get successSelector {
    return $SelectorModelCopyWith<$Res>(_value.successSelector, (value) {
      return _then(_value.copyWith(successSelector: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get failedSelector {
    return $SelectorModelCopyWith<$Res>(_value.failedSelector, (value) {
      return _then(_value.copyWith(failedSelector: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ParserModelImageReaderImplCopyWith<$Res>
    implements $ParserModelCopyWith<$Res> {
  factory _$$ParserModelImageReaderImplCopyWith(
          _$ParserModelImageReaderImpl value,
          $Res Function(_$ParserModelImageReaderImpl) then) =
      __$$ParserModelImageReaderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String uuid,
      List<ExtraSelectorModel> extra,
      SelectorModel id,
      ImageSelectorModel image,
      SelectorModel largerImage,
      SelectorModel rawImage,
      SelectorModel rating,
      SelectorModel score,
      SelectorModel source,
      SelectorModel uploadTime,
      SelectorModel successSelector,
      SelectorModel failedSelector,
      SelectorModel badgeSelector,
      TagSelectorModel badgeItem,
      SelectorModel tagSelector,
      TagSelectorModel tagItem,
      SelectorModel commentSelector,
      CommentSelectorModel commentItem});

  $SelectorModelCopyWith<$Res> get id;
  $ImageSelectorModelCopyWith<$Res> get image;
  $SelectorModelCopyWith<$Res> get largerImage;
  $SelectorModelCopyWith<$Res> get rawImage;
  $SelectorModelCopyWith<$Res> get rating;
  $SelectorModelCopyWith<$Res> get score;
  $SelectorModelCopyWith<$Res> get source;
  $SelectorModelCopyWith<$Res> get uploadTime;
  @override
  $SelectorModelCopyWith<$Res> get successSelector;
  @override
  $SelectorModelCopyWith<$Res> get failedSelector;
  $SelectorModelCopyWith<$Res> get badgeSelector;
  $TagSelectorModelCopyWith<$Res> get badgeItem;
  $SelectorModelCopyWith<$Res> get tagSelector;
  $TagSelectorModelCopyWith<$Res> get tagItem;
  $SelectorModelCopyWith<$Res> get commentSelector;
  $CommentSelectorModelCopyWith<$Res> get commentItem;
}

/// @nodoc
class __$$ParserModelImageReaderImplCopyWithImpl<$Res>
    extends _$ParserModelCopyWithImpl<$Res, _$ParserModelImageReaderImpl>
    implements _$$ParserModelImageReaderImplCopyWith<$Res> {
  __$$ParserModelImageReaderImplCopyWithImpl(
      _$ParserModelImageReaderImpl _value,
      $Res Function(_$ParserModelImageReaderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? uuid = null,
    Object? extra = null,
    Object? id = null,
    Object? image = null,
    Object? largerImage = null,
    Object? rawImage = null,
    Object? rating = null,
    Object? score = null,
    Object? source = null,
    Object? uploadTime = null,
    Object? successSelector = null,
    Object? failedSelector = null,
    Object? badgeSelector = null,
    Object? badgeItem = null,
    Object? tagSelector = null,
    Object? tagItem = null,
    Object? commentSelector = null,
    Object? commentItem = null,
  }) {
    return _then(_$ParserModelImageReaderImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      extra: null == extra
          ? _value._extra
          : extra // ignore: cast_nullable_to_non_nullable
              as List<ExtraSelectorModel>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as ImageSelectorModel,
      largerImage: null == largerImage
          ? _value.largerImage
          : largerImage // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      rawImage: null == rawImage
          ? _value.rawImage
          : rawImage // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      uploadTime: null == uploadTime
          ? _value.uploadTime
          : uploadTime // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      successSelector: null == successSelector
          ? _value.successSelector
          : successSelector // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      failedSelector: null == failedSelector
          ? _value.failedSelector
          : failedSelector // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      badgeSelector: null == badgeSelector
          ? _value.badgeSelector
          : badgeSelector // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      badgeItem: null == badgeItem
          ? _value.badgeItem
          : badgeItem // ignore: cast_nullable_to_non_nullable
              as TagSelectorModel,
      tagSelector: null == tagSelector
          ? _value.tagSelector
          : tagSelector // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      tagItem: null == tagItem
          ? _value.tagItem
          : tagItem // ignore: cast_nullable_to_non_nullable
              as TagSelectorModel,
      commentSelector: null == commentSelector
          ? _value.commentSelector
          : commentSelector // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      commentItem: null == commentItem
          ? _value.commentItem
          : commentItem // ignore: cast_nullable_to_non_nullable
              as CommentSelectorModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get id {
    return $SelectorModelCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageSelectorModelCopyWith<$Res> get image {
    return $ImageSelectorModelCopyWith<$Res>(_value.image, (value) {
      return _then(_value.copyWith(image: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get largerImage {
    return $SelectorModelCopyWith<$Res>(_value.largerImage, (value) {
      return _then(_value.copyWith(largerImage: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get rawImage {
    return $SelectorModelCopyWith<$Res>(_value.rawImage, (value) {
      return _then(_value.copyWith(rawImage: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get rating {
    return $SelectorModelCopyWith<$Res>(_value.rating, (value) {
      return _then(_value.copyWith(rating: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get score {
    return $SelectorModelCopyWith<$Res>(_value.score, (value) {
      return _then(_value.copyWith(score: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get source {
    return $SelectorModelCopyWith<$Res>(_value.source, (value) {
      return _then(_value.copyWith(source: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get uploadTime {
    return $SelectorModelCopyWith<$Res>(_value.uploadTime, (value) {
      return _then(_value.copyWith(uploadTime: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get badgeSelector {
    return $SelectorModelCopyWith<$Res>(_value.badgeSelector, (value) {
      return _then(_value.copyWith(badgeSelector: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TagSelectorModelCopyWith<$Res> get badgeItem {
    return $TagSelectorModelCopyWith<$Res>(_value.badgeItem, (value) {
      return _then(_value.copyWith(badgeItem: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get tagSelector {
    return $SelectorModelCopyWith<$Res>(_value.tagSelector, (value) {
      return _then(_value.copyWith(tagSelector: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TagSelectorModelCopyWith<$Res> get tagItem {
    return $TagSelectorModelCopyWith<$Res>(_value.tagItem, (value) {
      return _then(_value.copyWith(tagItem: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get commentSelector {
    return $SelectorModelCopyWith<$Res>(_value.commentSelector, (value) {
      return _then(_value.copyWith(commentSelector: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CommentSelectorModelCopyWith<$Res> get commentItem {
    return $CommentSelectorModelCopyWith<$Res>(_value.commentItem, (value) {
      return _then(_value.copyWith(commentItem: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$ParserModelImageReaderImpl implements ParserModelImageReader {
  const _$ParserModelImageReaderImpl(
      {this.name = '',
      this.uuid = '',
      final List<ExtraSelectorModel> extra = const [],
      this.id = const SelectorModel(),
      this.image = const ImageSelectorModel(),
      this.largerImage = const SelectorModel(),
      this.rawImage = const SelectorModel(),
      this.rating = const SelectorModel(),
      this.score = const SelectorModel(),
      this.source = const SelectorModel(),
      this.uploadTime = const SelectorModel(),
      this.successSelector = const SelectorModel(),
      this.failedSelector = const SelectorModel(),
      this.badgeSelector = const SelectorModel(),
      this.badgeItem = const TagSelectorModel(),
      this.tagSelector = const SelectorModel(),
      this.tagItem = const TagSelectorModel(),
      this.commentSelector = const SelectorModel(),
      this.commentItem = const CommentSelectorModel(),
      final String? $type})
      : _extra = extra,
        $type = $type ?? 'imageReader';

  factory _$ParserModelImageReaderImpl.fromJson(Map<String, dynamic> json) =>
      _$$ParserModelImageReaderImplFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String uuid;
  final List<ExtraSelectorModel> _extra;
  @override
  @JsonKey()
  List<ExtraSelectorModel> get extra {
    if (_extra is EqualUnmodifiableListView) return _extra;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_extra);
  }

  @override
  @JsonKey()
  final SelectorModel id;
  @override
  @JsonKey()
  final ImageSelectorModel image;
  @override
  @JsonKey()
  final SelectorModel largerImage;
  @override
  @JsonKey()
  final SelectorModel rawImage;
  @override
  @JsonKey()
  final SelectorModel rating;
  @override
  @JsonKey()
  final SelectorModel score;
  @override
  @JsonKey()
  final SelectorModel source;
  @override
  @JsonKey()
  final SelectorModel uploadTime;
  @override
  @JsonKey()
  final SelectorModel successSelector;
  @override
  @JsonKey()
  final SelectorModel failedSelector;
  @override
  @JsonKey()
  final SelectorModel badgeSelector;
  @override
  @JsonKey()
  final TagSelectorModel badgeItem;
  @override
  @JsonKey()
  final SelectorModel tagSelector;
  @override
  @JsonKey()
  final TagSelectorModel tagItem;
  @override
  @JsonKey()
  final SelectorModel commentSelector;
  @override
  @JsonKey()
  final CommentSelectorModel commentItem;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ParserModel.imageReader(name: $name, uuid: $uuid, extra: $extra, id: $id, image: $image, largerImage: $largerImage, rawImage: $rawImage, rating: $rating, score: $score, source: $source, uploadTime: $uploadTime, successSelector: $successSelector, failedSelector: $failedSelector, badgeSelector: $badgeSelector, badgeItem: $badgeItem, tagSelector: $tagSelector, tagItem: $tagItem, commentSelector: $commentSelector, commentItem: $commentItem)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParserModelImageReaderImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            const DeepCollectionEquality().equals(other._extra, _extra) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.largerImage, largerImage) ||
                other.largerImage == largerImage) &&
            (identical(other.rawImage, rawImage) ||
                other.rawImage == rawImage) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.uploadTime, uploadTime) ||
                other.uploadTime == uploadTime) &&
            (identical(other.successSelector, successSelector) ||
                other.successSelector == successSelector) &&
            (identical(other.failedSelector, failedSelector) ||
                other.failedSelector == failedSelector) &&
            (identical(other.badgeSelector, badgeSelector) ||
                other.badgeSelector == badgeSelector) &&
            (identical(other.badgeItem, badgeItem) ||
                other.badgeItem == badgeItem) &&
            (identical(other.tagSelector, tagSelector) ||
                other.tagSelector == tagSelector) &&
            (identical(other.tagItem, tagItem) || other.tagItem == tagItem) &&
            (identical(other.commentSelector, commentSelector) ||
                other.commentSelector == commentSelector) &&
            (identical(other.commentItem, commentItem) ||
                other.commentItem == commentItem));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        name,
        uuid,
        const DeepCollectionEquality().hash(_extra),
        id,
        image,
        largerImage,
        rawImage,
        rating,
        score,
        source,
        uploadTime,
        successSelector,
        failedSelector,
        badgeSelector,
        badgeItem,
        tagSelector,
        tagItem,
        commentSelector,
        commentItem
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ParserModelImageReaderImplCopyWith<_$ParserModelImageReaderImpl>
      get copyWith => __$$ParserModelImageReaderImplCopyWithImpl<
          _$ParserModelImageReaderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel id,
            ImageSelectorModel image,
            SelectorModel largerImage,
            SelectorModel rawImage,
            SelectorModel rating,
            SelectorModel score,
            SelectorModel source,
            SelectorModel uploadTime,
            SelectorModel successSelector,
            SelectorModel failedSelector,
            SelectorModel badgeSelector,
            TagSelectorModel badgeItem,
            SelectorModel tagSelector,
            TagSelectorModel tagItem,
            SelectorModel commentSelector,
            CommentSelectorModel commentItem)
        imageReader,
    required TResult Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel title,
            SelectorModel subtitle,
            SelectorModel uploadTime,
            SelectorModel star,
            SelectorModel imageCount,
            SelectorModel pageCount,
            SelectorModel language,
            ImageSelectorModel coverImage,
            SelectorModel description,
            SelectorModel successSelector,
            SelectorModel failedSelector,
            SelectorModel thumbnailSelector,
            ImageSelectorModel thumbnail,
            SelectorModel target,
            SelectorModel commentSelector,
            CommentSelectorModel comments,
            SelectorModel badgeSelector,
            TagSelectorModel badgeItem,
            SelectorModel tagSelector,
            TagSelectorModel tagItem,
            SelectorModel chapterSelector,
            SelectorModel chapterTitle,
            SelectorModel chapterSubtitle,
            ImageSelectorModel chapterCover,
            SelectorModel nextPage,
            SelectorModel countPrePage)
        detail,
    required TResult Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel itemSelector,
            SelectorModel itemComplete,
            SelectorModel successSelector,
            SelectorModel failedSelector,
            SelectorModel title,
            SelectorModel subtitle,
            SelectorModel uploadTime,
            SelectorModel star,
            SelectorModel imageCount,
            SelectorModel language,
            ImageSelectorModel previewImage,
            SelectorModel target,
            SelectorModel badgeSelector,
            TagSelectorModel badgeItem,
            SelectorModel tag,
            TagSelectorModel tagItem,
            SelectorModel paper,
            SelectorModel idCode,
            SelectorModel nextPage)
        list,
    required TResult Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel itemSelector,
            SelectorModel itemComplete,
            SelectorModel successSelector,
            SelectorModel failedSelector)
        autoComplete,
  }) {
    return imageReader(
        name,
        uuid,
        extra,
        id,
        image,
        largerImage,
        rawImage,
        rating,
        score,
        source,
        uploadTime,
        successSelector,
        failedSelector,
        badgeSelector,
        badgeItem,
        tagSelector,
        tagItem,
        commentSelector,
        commentItem);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel id,
            ImageSelectorModel image,
            SelectorModel largerImage,
            SelectorModel rawImage,
            SelectorModel rating,
            SelectorModel score,
            SelectorModel source,
            SelectorModel uploadTime,
            SelectorModel successSelector,
            SelectorModel failedSelector,
            SelectorModel badgeSelector,
            TagSelectorModel badgeItem,
            SelectorModel tagSelector,
            TagSelectorModel tagItem,
            SelectorModel commentSelector,
            CommentSelectorModel commentItem)?
        imageReader,
    TResult? Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel title,
            SelectorModel subtitle,
            SelectorModel uploadTime,
            SelectorModel star,
            SelectorModel imageCount,
            SelectorModel pageCount,
            SelectorModel language,
            ImageSelectorModel coverImage,
            SelectorModel description,
            SelectorModel successSelector,
            SelectorModel failedSelector,
            SelectorModel thumbnailSelector,
            ImageSelectorModel thumbnail,
            SelectorModel target,
            SelectorModel commentSelector,
            CommentSelectorModel comments,
            SelectorModel badgeSelector,
            TagSelectorModel badgeItem,
            SelectorModel tagSelector,
            TagSelectorModel tagItem,
            SelectorModel chapterSelector,
            SelectorModel chapterTitle,
            SelectorModel chapterSubtitle,
            ImageSelectorModel chapterCover,
            SelectorModel nextPage,
            SelectorModel countPrePage)?
        detail,
    TResult? Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel itemSelector,
            SelectorModel itemComplete,
            SelectorModel successSelector,
            SelectorModel failedSelector,
            SelectorModel title,
            SelectorModel subtitle,
            SelectorModel uploadTime,
            SelectorModel star,
            SelectorModel imageCount,
            SelectorModel language,
            ImageSelectorModel previewImage,
            SelectorModel target,
            SelectorModel badgeSelector,
            TagSelectorModel badgeItem,
            SelectorModel tag,
            TagSelectorModel tagItem,
            SelectorModel paper,
            SelectorModel idCode,
            SelectorModel nextPage)?
        list,
    TResult? Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel itemSelector,
            SelectorModel itemComplete,
            SelectorModel successSelector,
            SelectorModel failedSelector)?
        autoComplete,
  }) {
    return imageReader?.call(
        name,
        uuid,
        extra,
        id,
        image,
        largerImage,
        rawImage,
        rating,
        score,
        source,
        uploadTime,
        successSelector,
        failedSelector,
        badgeSelector,
        badgeItem,
        tagSelector,
        tagItem,
        commentSelector,
        commentItem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel id,
            ImageSelectorModel image,
            SelectorModel largerImage,
            SelectorModel rawImage,
            SelectorModel rating,
            SelectorModel score,
            SelectorModel source,
            SelectorModel uploadTime,
            SelectorModel successSelector,
            SelectorModel failedSelector,
            SelectorModel badgeSelector,
            TagSelectorModel badgeItem,
            SelectorModel tagSelector,
            TagSelectorModel tagItem,
            SelectorModel commentSelector,
            CommentSelectorModel commentItem)?
        imageReader,
    TResult Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel title,
            SelectorModel subtitle,
            SelectorModel uploadTime,
            SelectorModel star,
            SelectorModel imageCount,
            SelectorModel pageCount,
            SelectorModel language,
            ImageSelectorModel coverImage,
            SelectorModel description,
            SelectorModel successSelector,
            SelectorModel failedSelector,
            SelectorModel thumbnailSelector,
            ImageSelectorModel thumbnail,
            SelectorModel target,
            SelectorModel commentSelector,
            CommentSelectorModel comments,
            SelectorModel badgeSelector,
            TagSelectorModel badgeItem,
            SelectorModel tagSelector,
            TagSelectorModel tagItem,
            SelectorModel chapterSelector,
            SelectorModel chapterTitle,
            SelectorModel chapterSubtitle,
            ImageSelectorModel chapterCover,
            SelectorModel nextPage,
            SelectorModel countPrePage)?
        detail,
    TResult Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel itemSelector,
            SelectorModel itemComplete,
            SelectorModel successSelector,
            SelectorModel failedSelector,
            SelectorModel title,
            SelectorModel subtitle,
            SelectorModel uploadTime,
            SelectorModel star,
            SelectorModel imageCount,
            SelectorModel language,
            ImageSelectorModel previewImage,
            SelectorModel target,
            SelectorModel badgeSelector,
            TagSelectorModel badgeItem,
            SelectorModel tag,
            TagSelectorModel tagItem,
            SelectorModel paper,
            SelectorModel idCode,
            SelectorModel nextPage)?
        list,
    TResult Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel itemSelector,
            SelectorModel itemComplete,
            SelectorModel successSelector,
            SelectorModel failedSelector)?
        autoComplete,
    required TResult orElse(),
  }) {
    if (imageReader != null) {
      return imageReader(
          name,
          uuid,
          extra,
          id,
          image,
          largerImage,
          rawImage,
          rating,
          score,
          source,
          uploadTime,
          successSelector,
          failedSelector,
          badgeSelector,
          badgeItem,
          tagSelector,
          tagItem,
          commentSelector,
          commentItem);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ParserModelImageReader value) imageReader,
    required TResult Function(ParserModelDetail value) detail,
    required TResult Function(ParserModelList value) list,
    required TResult Function(ParserModelAutoComplete value) autoComplete,
  }) {
    return imageReader(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ParserModelImageReader value)? imageReader,
    TResult? Function(ParserModelDetail value)? detail,
    TResult? Function(ParserModelList value)? list,
    TResult? Function(ParserModelAutoComplete value)? autoComplete,
  }) {
    return imageReader?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ParserModelImageReader value)? imageReader,
    TResult Function(ParserModelDetail value)? detail,
    TResult Function(ParserModelList value)? list,
    TResult Function(ParserModelAutoComplete value)? autoComplete,
    required TResult orElse(),
  }) {
    if (imageReader != null) {
      return imageReader(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ParserModelImageReaderImplToJson(
      this,
    );
  }
}

abstract class ParserModelImageReader implements ParserModel {
  const factory ParserModelImageReader(
      {final String name,
      final String uuid,
      final List<ExtraSelectorModel> extra,
      final SelectorModel id,
      final ImageSelectorModel image,
      final SelectorModel largerImage,
      final SelectorModel rawImage,
      final SelectorModel rating,
      final SelectorModel score,
      final SelectorModel source,
      final SelectorModel uploadTime,
      final SelectorModel successSelector,
      final SelectorModel failedSelector,
      final SelectorModel badgeSelector,
      final TagSelectorModel badgeItem,
      final SelectorModel tagSelector,
      final TagSelectorModel tagItem,
      final SelectorModel commentSelector,
      final CommentSelectorModel commentItem}) = _$ParserModelImageReaderImpl;

  factory ParserModelImageReader.fromJson(Map<String, dynamic> json) =
      _$ParserModelImageReaderImpl.fromJson;

  @override
  String get name;
  @override
  String get uuid;
  @override
  List<ExtraSelectorModel> get extra;
  SelectorModel get id;
  ImageSelectorModel get image;
  SelectorModel get largerImage;
  SelectorModel get rawImage;
  SelectorModel get rating;
  SelectorModel get score;
  SelectorModel get source;
  SelectorModel get uploadTime;
  @override
  SelectorModel get successSelector;
  @override
  SelectorModel get failedSelector;
  SelectorModel get badgeSelector;
  TagSelectorModel get badgeItem;
  SelectorModel get tagSelector;
  TagSelectorModel get tagItem;
  SelectorModel get commentSelector;
  CommentSelectorModel get commentItem;
  @override
  @JsonKey(ignore: true)
  _$$ParserModelImageReaderImplCopyWith<_$ParserModelImageReaderImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ParserModelDetailImplCopyWith<$Res>
    implements $ParserModelCopyWith<$Res> {
  factory _$$ParserModelDetailImplCopyWith(_$ParserModelDetailImpl value,
          $Res Function(_$ParserModelDetailImpl) then) =
      __$$ParserModelDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String uuid,
      List<ExtraSelectorModel> extra,
      SelectorModel title,
      SelectorModel subtitle,
      SelectorModel uploadTime,
      SelectorModel star,
      SelectorModel imageCount,
      SelectorModel pageCount,
      SelectorModel language,
      ImageSelectorModel coverImage,
      SelectorModel description,
      SelectorModel successSelector,
      SelectorModel failedSelector,
      SelectorModel thumbnailSelector,
      ImageSelectorModel thumbnail,
      SelectorModel target,
      SelectorModel commentSelector,
      CommentSelectorModel comments,
      SelectorModel badgeSelector,
      TagSelectorModel badgeItem,
      SelectorModel tagSelector,
      TagSelectorModel tagItem,
      SelectorModel chapterSelector,
      SelectorModel chapterTitle,
      SelectorModel chapterSubtitle,
      ImageSelectorModel chapterCover,
      SelectorModel nextPage,
      SelectorModel countPrePage});

  $SelectorModelCopyWith<$Res> get title;
  $SelectorModelCopyWith<$Res> get subtitle;
  $SelectorModelCopyWith<$Res> get uploadTime;
  $SelectorModelCopyWith<$Res> get star;
  $SelectorModelCopyWith<$Res> get imageCount;
  $SelectorModelCopyWith<$Res> get pageCount;
  $SelectorModelCopyWith<$Res> get language;
  $ImageSelectorModelCopyWith<$Res> get coverImage;
  $SelectorModelCopyWith<$Res> get description;
  @override
  $SelectorModelCopyWith<$Res> get successSelector;
  @override
  $SelectorModelCopyWith<$Res> get failedSelector;
  $SelectorModelCopyWith<$Res> get thumbnailSelector;
  $ImageSelectorModelCopyWith<$Res> get thumbnail;
  $SelectorModelCopyWith<$Res> get target;
  $SelectorModelCopyWith<$Res> get commentSelector;
  $CommentSelectorModelCopyWith<$Res> get comments;
  $SelectorModelCopyWith<$Res> get badgeSelector;
  $TagSelectorModelCopyWith<$Res> get badgeItem;
  $SelectorModelCopyWith<$Res> get tagSelector;
  $TagSelectorModelCopyWith<$Res> get tagItem;
  $SelectorModelCopyWith<$Res> get chapterSelector;
  $SelectorModelCopyWith<$Res> get chapterTitle;
  $SelectorModelCopyWith<$Res> get chapterSubtitle;
  $ImageSelectorModelCopyWith<$Res> get chapterCover;
  $SelectorModelCopyWith<$Res> get nextPage;
  $SelectorModelCopyWith<$Res> get countPrePage;
}

/// @nodoc
class __$$ParserModelDetailImplCopyWithImpl<$Res>
    extends _$ParserModelCopyWithImpl<$Res, _$ParserModelDetailImpl>
    implements _$$ParserModelDetailImplCopyWith<$Res> {
  __$$ParserModelDetailImplCopyWithImpl(_$ParserModelDetailImpl _value,
      $Res Function(_$ParserModelDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? uuid = null,
    Object? extra = null,
    Object? title = null,
    Object? subtitle = null,
    Object? uploadTime = null,
    Object? star = null,
    Object? imageCount = null,
    Object? pageCount = null,
    Object? language = null,
    Object? coverImage = null,
    Object? description = null,
    Object? successSelector = null,
    Object? failedSelector = null,
    Object? thumbnailSelector = null,
    Object? thumbnail = null,
    Object? target = null,
    Object? commentSelector = null,
    Object? comments = null,
    Object? badgeSelector = null,
    Object? badgeItem = null,
    Object? tagSelector = null,
    Object? tagItem = null,
    Object? chapterSelector = null,
    Object? chapterTitle = null,
    Object? chapterSubtitle = null,
    Object? chapterCover = null,
    Object? nextPage = null,
    Object? countPrePage = null,
  }) {
    return _then(_$ParserModelDetailImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      extra: null == extra
          ? _value._extra
          : extra // ignore: cast_nullable_to_non_nullable
              as List<ExtraSelectorModel>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      uploadTime: null == uploadTime
          ? _value.uploadTime
          : uploadTime // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      star: null == star
          ? _value.star
          : star // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      imageCount: null == imageCount
          ? _value.imageCount
          : imageCount // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      pageCount: null == pageCount
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      coverImage: null == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as ImageSelectorModel,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      successSelector: null == successSelector
          ? _value.successSelector
          : successSelector // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      failedSelector: null == failedSelector
          ? _value.failedSelector
          : failedSelector // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      thumbnailSelector: null == thumbnailSelector
          ? _value.thumbnailSelector
          : thumbnailSelector // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as ImageSelectorModel,
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      commentSelector: null == commentSelector
          ? _value.commentSelector
          : commentSelector // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as CommentSelectorModel,
      badgeSelector: null == badgeSelector
          ? _value.badgeSelector
          : badgeSelector // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      badgeItem: null == badgeItem
          ? _value.badgeItem
          : badgeItem // ignore: cast_nullable_to_non_nullable
              as TagSelectorModel,
      tagSelector: null == tagSelector
          ? _value.tagSelector
          : tagSelector // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      tagItem: null == tagItem
          ? _value.tagItem
          : tagItem // ignore: cast_nullable_to_non_nullable
              as TagSelectorModel,
      chapterSelector: null == chapterSelector
          ? _value.chapterSelector
          : chapterSelector // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      chapterTitle: null == chapterTitle
          ? _value.chapterTitle
          : chapterTitle // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      chapterSubtitle: null == chapterSubtitle
          ? _value.chapterSubtitle
          : chapterSubtitle // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      chapterCover: null == chapterCover
          ? _value.chapterCover
          : chapterCover // ignore: cast_nullable_to_non_nullable
              as ImageSelectorModel,
      nextPage: null == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      countPrePage: null == countPrePage
          ? _value.countPrePage
          : countPrePage // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get title {
    return $SelectorModelCopyWith<$Res>(_value.title, (value) {
      return _then(_value.copyWith(title: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get subtitle {
    return $SelectorModelCopyWith<$Res>(_value.subtitle, (value) {
      return _then(_value.copyWith(subtitle: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get uploadTime {
    return $SelectorModelCopyWith<$Res>(_value.uploadTime, (value) {
      return _then(_value.copyWith(uploadTime: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get star {
    return $SelectorModelCopyWith<$Res>(_value.star, (value) {
      return _then(_value.copyWith(star: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get imageCount {
    return $SelectorModelCopyWith<$Res>(_value.imageCount, (value) {
      return _then(_value.copyWith(imageCount: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get pageCount {
    return $SelectorModelCopyWith<$Res>(_value.pageCount, (value) {
      return _then(_value.copyWith(pageCount: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get language {
    return $SelectorModelCopyWith<$Res>(_value.language, (value) {
      return _then(_value.copyWith(language: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageSelectorModelCopyWith<$Res> get coverImage {
    return $ImageSelectorModelCopyWith<$Res>(_value.coverImage, (value) {
      return _then(_value.copyWith(coverImage: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get description {
    return $SelectorModelCopyWith<$Res>(_value.description, (value) {
      return _then(_value.copyWith(description: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get thumbnailSelector {
    return $SelectorModelCopyWith<$Res>(_value.thumbnailSelector, (value) {
      return _then(_value.copyWith(thumbnailSelector: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageSelectorModelCopyWith<$Res> get thumbnail {
    return $ImageSelectorModelCopyWith<$Res>(_value.thumbnail, (value) {
      return _then(_value.copyWith(thumbnail: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get target {
    return $SelectorModelCopyWith<$Res>(_value.target, (value) {
      return _then(_value.copyWith(target: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get commentSelector {
    return $SelectorModelCopyWith<$Res>(_value.commentSelector, (value) {
      return _then(_value.copyWith(commentSelector: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CommentSelectorModelCopyWith<$Res> get comments {
    return $CommentSelectorModelCopyWith<$Res>(_value.comments, (value) {
      return _then(_value.copyWith(comments: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get badgeSelector {
    return $SelectorModelCopyWith<$Res>(_value.badgeSelector, (value) {
      return _then(_value.copyWith(badgeSelector: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TagSelectorModelCopyWith<$Res> get badgeItem {
    return $TagSelectorModelCopyWith<$Res>(_value.badgeItem, (value) {
      return _then(_value.copyWith(badgeItem: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get tagSelector {
    return $SelectorModelCopyWith<$Res>(_value.tagSelector, (value) {
      return _then(_value.copyWith(tagSelector: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TagSelectorModelCopyWith<$Res> get tagItem {
    return $TagSelectorModelCopyWith<$Res>(_value.tagItem, (value) {
      return _then(_value.copyWith(tagItem: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get chapterSelector {
    return $SelectorModelCopyWith<$Res>(_value.chapterSelector, (value) {
      return _then(_value.copyWith(chapterSelector: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get chapterTitle {
    return $SelectorModelCopyWith<$Res>(_value.chapterTitle, (value) {
      return _then(_value.copyWith(chapterTitle: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get chapterSubtitle {
    return $SelectorModelCopyWith<$Res>(_value.chapterSubtitle, (value) {
      return _then(_value.copyWith(chapterSubtitle: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageSelectorModelCopyWith<$Res> get chapterCover {
    return $ImageSelectorModelCopyWith<$Res>(_value.chapterCover, (value) {
      return _then(_value.copyWith(chapterCover: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get nextPage {
    return $SelectorModelCopyWith<$Res>(_value.nextPage, (value) {
      return _then(_value.copyWith(nextPage: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get countPrePage {
    return $SelectorModelCopyWith<$Res>(_value.countPrePage, (value) {
      return _then(_value.copyWith(countPrePage: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$ParserModelDetailImpl implements ParserModelDetail {
  const _$ParserModelDetailImpl(
      {this.name = '',
      this.uuid = '',
      final List<ExtraSelectorModel> extra = const [],
      this.title = const SelectorModel(),
      this.subtitle = const SelectorModel(),
      this.uploadTime = const SelectorModel(),
      this.star = const SelectorModel(),
      this.imageCount = const SelectorModel(),
      this.pageCount = const SelectorModel(),
      this.language = const SelectorModel(),
      this.coverImage = const ImageSelectorModel(),
      this.description = const SelectorModel(),
      this.successSelector = const SelectorModel(),
      this.failedSelector = const SelectorModel(),
      this.thumbnailSelector = const SelectorModel(),
      this.thumbnail = const ImageSelectorModel(),
      this.target = const SelectorModel(),
      this.commentSelector = const SelectorModel(),
      this.comments = const CommentSelectorModel(),
      this.badgeSelector = const SelectorModel(),
      this.badgeItem = const TagSelectorModel(),
      this.tagSelector = const SelectorModel(),
      this.tagItem = const TagSelectorModel(),
      this.chapterSelector = const SelectorModel(),
      this.chapterTitle = const SelectorModel(),
      this.chapterSubtitle = const SelectorModel(),
      this.chapterCover = const ImageSelectorModel(),
      this.nextPage = const SelectorModel(),
      this.countPrePage = const SelectorModel(),
      final String? $type})
      : _extra = extra,
        $type = $type ?? 'detail';

  factory _$ParserModelDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$ParserModelDetailImplFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String uuid;
  final List<ExtraSelectorModel> _extra;
  @override
  @JsonKey()
  List<ExtraSelectorModel> get extra {
    if (_extra is EqualUnmodifiableListView) return _extra;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_extra);
  }

  @override
  @JsonKey()
  final SelectorModel title;
  @override
  @JsonKey()
  final SelectorModel subtitle;
  @override
  @JsonKey()
  final SelectorModel uploadTime;
  @override
  @JsonKey()
  final SelectorModel star;
  @override
  @JsonKey()
  final SelectorModel imageCount;
  @override
  @JsonKey()
  final SelectorModel pageCount;
  @override
  @JsonKey()
  final SelectorModel language;
  @override
  @JsonKey()
  final ImageSelectorModel coverImage;
  @override
  @JsonKey()
  final SelectorModel description;
  @override
  @JsonKey()
  final SelectorModel successSelector;
  @override
  @JsonKey()
  final SelectorModel failedSelector;
  @override
  @JsonKey()
  final SelectorModel thumbnailSelector;
  @override
  @JsonKey()
  final ImageSelectorModel thumbnail;
  @override
  @JsonKey()
  final SelectorModel target;
  @override
  @JsonKey()
  final SelectorModel commentSelector;
  @override
  @JsonKey()
  final CommentSelectorModel comments;
  @override
  @JsonKey()
  final SelectorModel badgeSelector;
  @override
  @JsonKey()
  final TagSelectorModel badgeItem;
  @override
  @JsonKey()
  final SelectorModel tagSelector;
  @override
  @JsonKey()
  final TagSelectorModel tagItem;
  @override
  @JsonKey()
  final SelectorModel chapterSelector;
  @override
  @JsonKey()
  final SelectorModel chapterTitle;
  @override
  @JsonKey()
  final SelectorModel chapterSubtitle;
  @override
  @JsonKey()
  final ImageSelectorModel chapterCover;
  @override
  @JsonKey()
  final SelectorModel nextPage;
  @override
  @JsonKey()
  final SelectorModel countPrePage;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ParserModel.detail(name: $name, uuid: $uuid, extra: $extra, title: $title, subtitle: $subtitle, uploadTime: $uploadTime, star: $star, imageCount: $imageCount, pageCount: $pageCount, language: $language, coverImage: $coverImage, description: $description, successSelector: $successSelector, failedSelector: $failedSelector, thumbnailSelector: $thumbnailSelector, thumbnail: $thumbnail, target: $target, commentSelector: $commentSelector, comments: $comments, badgeSelector: $badgeSelector, badgeItem: $badgeItem, tagSelector: $tagSelector, tagItem: $tagItem, chapterSelector: $chapterSelector, chapterTitle: $chapterTitle, chapterSubtitle: $chapterSubtitle, chapterCover: $chapterCover, nextPage: $nextPage, countPrePage: $countPrePage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParserModelDetailImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            const DeepCollectionEquality().equals(other._extra, _extra) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.uploadTime, uploadTime) ||
                other.uploadTime == uploadTime) &&
            (identical(other.star, star) || other.star == star) &&
            (identical(other.imageCount, imageCount) ||
                other.imageCount == imageCount) &&
            (identical(other.pageCount, pageCount) ||
                other.pageCount == pageCount) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.coverImage, coverImage) ||
                other.coverImage == coverImage) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.successSelector, successSelector) ||
                other.successSelector == successSelector) &&
            (identical(other.failedSelector, failedSelector) ||
                other.failedSelector == failedSelector) &&
            (identical(other.thumbnailSelector, thumbnailSelector) ||
                other.thumbnailSelector == thumbnailSelector) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.target, target) || other.target == target) &&
            (identical(other.commentSelector, commentSelector) ||
                other.commentSelector == commentSelector) &&
            (identical(other.comments, comments) ||
                other.comments == comments) &&
            (identical(other.badgeSelector, badgeSelector) ||
                other.badgeSelector == badgeSelector) &&
            (identical(other.badgeItem, badgeItem) ||
                other.badgeItem == badgeItem) &&
            (identical(other.tagSelector, tagSelector) ||
                other.tagSelector == tagSelector) &&
            (identical(other.tagItem, tagItem) || other.tagItem == tagItem) &&
            (identical(other.chapterSelector, chapterSelector) ||
                other.chapterSelector == chapterSelector) &&
            (identical(other.chapterTitle, chapterTitle) ||
                other.chapterTitle == chapterTitle) &&
            (identical(other.chapterSubtitle, chapterSubtitle) ||
                other.chapterSubtitle == chapterSubtitle) &&
            (identical(other.chapterCover, chapterCover) ||
                other.chapterCover == chapterCover) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage) &&
            (identical(other.countPrePage, countPrePage) ||
                other.countPrePage == countPrePage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        name,
        uuid,
        const DeepCollectionEquality().hash(_extra),
        title,
        subtitle,
        uploadTime,
        star,
        imageCount,
        pageCount,
        language,
        coverImage,
        description,
        successSelector,
        failedSelector,
        thumbnailSelector,
        thumbnail,
        target,
        commentSelector,
        comments,
        badgeSelector,
        badgeItem,
        tagSelector,
        tagItem,
        chapterSelector,
        chapterTitle,
        chapterSubtitle,
        chapterCover,
        nextPage,
        countPrePage
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ParserModelDetailImplCopyWith<_$ParserModelDetailImpl> get copyWith =>
      __$$ParserModelDetailImplCopyWithImpl<_$ParserModelDetailImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel id,
            ImageSelectorModel image,
            SelectorModel largerImage,
            SelectorModel rawImage,
            SelectorModel rating,
            SelectorModel score,
            SelectorModel source,
            SelectorModel uploadTime,
            SelectorModel successSelector,
            SelectorModel failedSelector,
            SelectorModel badgeSelector,
            TagSelectorModel badgeItem,
            SelectorModel tagSelector,
            TagSelectorModel tagItem,
            SelectorModel commentSelector,
            CommentSelectorModel commentItem)
        imageReader,
    required TResult Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel title,
            SelectorModel subtitle,
            SelectorModel uploadTime,
            SelectorModel star,
            SelectorModel imageCount,
            SelectorModel pageCount,
            SelectorModel language,
            ImageSelectorModel coverImage,
            SelectorModel description,
            SelectorModel successSelector,
            SelectorModel failedSelector,
            SelectorModel thumbnailSelector,
            ImageSelectorModel thumbnail,
            SelectorModel target,
            SelectorModel commentSelector,
            CommentSelectorModel comments,
            SelectorModel badgeSelector,
            TagSelectorModel badgeItem,
            SelectorModel tagSelector,
            TagSelectorModel tagItem,
            SelectorModel chapterSelector,
            SelectorModel chapterTitle,
            SelectorModel chapterSubtitle,
            ImageSelectorModel chapterCover,
            SelectorModel nextPage,
            SelectorModel countPrePage)
        detail,
    required TResult Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel itemSelector,
            SelectorModel itemComplete,
            SelectorModel successSelector,
            SelectorModel failedSelector,
            SelectorModel title,
            SelectorModel subtitle,
            SelectorModel uploadTime,
            SelectorModel star,
            SelectorModel imageCount,
            SelectorModel language,
            ImageSelectorModel previewImage,
            SelectorModel target,
            SelectorModel badgeSelector,
            TagSelectorModel badgeItem,
            SelectorModel tag,
            TagSelectorModel tagItem,
            SelectorModel paper,
            SelectorModel idCode,
            SelectorModel nextPage)
        list,
    required TResult Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel itemSelector,
            SelectorModel itemComplete,
            SelectorModel successSelector,
            SelectorModel failedSelector)
        autoComplete,
  }) {
    return detail(
        name,
        uuid,
        extra,
        title,
        subtitle,
        uploadTime,
        star,
        imageCount,
        pageCount,
        language,
        coverImage,
        description,
        successSelector,
        failedSelector,
        thumbnailSelector,
        thumbnail,
        target,
        commentSelector,
        comments,
        badgeSelector,
        badgeItem,
        tagSelector,
        tagItem,
        chapterSelector,
        chapterTitle,
        chapterSubtitle,
        chapterCover,
        nextPage,
        countPrePage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel id,
            ImageSelectorModel image,
            SelectorModel largerImage,
            SelectorModel rawImage,
            SelectorModel rating,
            SelectorModel score,
            SelectorModel source,
            SelectorModel uploadTime,
            SelectorModel successSelector,
            SelectorModel failedSelector,
            SelectorModel badgeSelector,
            TagSelectorModel badgeItem,
            SelectorModel tagSelector,
            TagSelectorModel tagItem,
            SelectorModel commentSelector,
            CommentSelectorModel commentItem)?
        imageReader,
    TResult? Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel title,
            SelectorModel subtitle,
            SelectorModel uploadTime,
            SelectorModel star,
            SelectorModel imageCount,
            SelectorModel pageCount,
            SelectorModel language,
            ImageSelectorModel coverImage,
            SelectorModel description,
            SelectorModel successSelector,
            SelectorModel failedSelector,
            SelectorModel thumbnailSelector,
            ImageSelectorModel thumbnail,
            SelectorModel target,
            SelectorModel commentSelector,
            CommentSelectorModel comments,
            SelectorModel badgeSelector,
            TagSelectorModel badgeItem,
            SelectorModel tagSelector,
            TagSelectorModel tagItem,
            SelectorModel chapterSelector,
            SelectorModel chapterTitle,
            SelectorModel chapterSubtitle,
            ImageSelectorModel chapterCover,
            SelectorModel nextPage,
            SelectorModel countPrePage)?
        detail,
    TResult? Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel itemSelector,
            SelectorModel itemComplete,
            SelectorModel successSelector,
            SelectorModel failedSelector,
            SelectorModel title,
            SelectorModel subtitle,
            SelectorModel uploadTime,
            SelectorModel star,
            SelectorModel imageCount,
            SelectorModel language,
            ImageSelectorModel previewImage,
            SelectorModel target,
            SelectorModel badgeSelector,
            TagSelectorModel badgeItem,
            SelectorModel tag,
            TagSelectorModel tagItem,
            SelectorModel paper,
            SelectorModel idCode,
            SelectorModel nextPage)?
        list,
    TResult? Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel itemSelector,
            SelectorModel itemComplete,
            SelectorModel successSelector,
            SelectorModel failedSelector)?
        autoComplete,
  }) {
    return detail?.call(
        name,
        uuid,
        extra,
        title,
        subtitle,
        uploadTime,
        star,
        imageCount,
        pageCount,
        language,
        coverImage,
        description,
        successSelector,
        failedSelector,
        thumbnailSelector,
        thumbnail,
        target,
        commentSelector,
        comments,
        badgeSelector,
        badgeItem,
        tagSelector,
        tagItem,
        chapterSelector,
        chapterTitle,
        chapterSubtitle,
        chapterCover,
        nextPage,
        countPrePage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel id,
            ImageSelectorModel image,
            SelectorModel largerImage,
            SelectorModel rawImage,
            SelectorModel rating,
            SelectorModel score,
            SelectorModel source,
            SelectorModel uploadTime,
            SelectorModel successSelector,
            SelectorModel failedSelector,
            SelectorModel badgeSelector,
            TagSelectorModel badgeItem,
            SelectorModel tagSelector,
            TagSelectorModel tagItem,
            SelectorModel commentSelector,
            CommentSelectorModel commentItem)?
        imageReader,
    TResult Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel title,
            SelectorModel subtitle,
            SelectorModel uploadTime,
            SelectorModel star,
            SelectorModel imageCount,
            SelectorModel pageCount,
            SelectorModel language,
            ImageSelectorModel coverImage,
            SelectorModel description,
            SelectorModel successSelector,
            SelectorModel failedSelector,
            SelectorModel thumbnailSelector,
            ImageSelectorModel thumbnail,
            SelectorModel target,
            SelectorModel commentSelector,
            CommentSelectorModel comments,
            SelectorModel badgeSelector,
            TagSelectorModel badgeItem,
            SelectorModel tagSelector,
            TagSelectorModel tagItem,
            SelectorModel chapterSelector,
            SelectorModel chapterTitle,
            SelectorModel chapterSubtitle,
            ImageSelectorModel chapterCover,
            SelectorModel nextPage,
            SelectorModel countPrePage)?
        detail,
    TResult Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel itemSelector,
            SelectorModel itemComplete,
            SelectorModel successSelector,
            SelectorModel failedSelector,
            SelectorModel title,
            SelectorModel subtitle,
            SelectorModel uploadTime,
            SelectorModel star,
            SelectorModel imageCount,
            SelectorModel language,
            ImageSelectorModel previewImage,
            SelectorModel target,
            SelectorModel badgeSelector,
            TagSelectorModel badgeItem,
            SelectorModel tag,
            TagSelectorModel tagItem,
            SelectorModel paper,
            SelectorModel idCode,
            SelectorModel nextPage)?
        list,
    TResult Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel itemSelector,
            SelectorModel itemComplete,
            SelectorModel successSelector,
            SelectorModel failedSelector)?
        autoComplete,
    required TResult orElse(),
  }) {
    if (detail != null) {
      return detail(
          name,
          uuid,
          extra,
          title,
          subtitle,
          uploadTime,
          star,
          imageCount,
          pageCount,
          language,
          coverImage,
          description,
          successSelector,
          failedSelector,
          thumbnailSelector,
          thumbnail,
          target,
          commentSelector,
          comments,
          badgeSelector,
          badgeItem,
          tagSelector,
          tagItem,
          chapterSelector,
          chapterTitle,
          chapterSubtitle,
          chapterCover,
          nextPage,
          countPrePage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ParserModelImageReader value) imageReader,
    required TResult Function(ParserModelDetail value) detail,
    required TResult Function(ParserModelList value) list,
    required TResult Function(ParserModelAutoComplete value) autoComplete,
  }) {
    return detail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ParserModelImageReader value)? imageReader,
    TResult? Function(ParserModelDetail value)? detail,
    TResult? Function(ParserModelList value)? list,
    TResult? Function(ParserModelAutoComplete value)? autoComplete,
  }) {
    return detail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ParserModelImageReader value)? imageReader,
    TResult Function(ParserModelDetail value)? detail,
    TResult Function(ParserModelList value)? list,
    TResult Function(ParserModelAutoComplete value)? autoComplete,
    required TResult orElse(),
  }) {
    if (detail != null) {
      return detail(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ParserModelDetailImplToJson(
      this,
    );
  }
}

abstract class ParserModelDetail implements ParserModel {
  const factory ParserModelDetail(
      {final String name,
      final String uuid,
      final List<ExtraSelectorModel> extra,
      final SelectorModel title,
      final SelectorModel subtitle,
      final SelectorModel uploadTime,
      final SelectorModel star,
      final SelectorModel imageCount,
      final SelectorModel pageCount,
      final SelectorModel language,
      final ImageSelectorModel coverImage,
      final SelectorModel description,
      final SelectorModel successSelector,
      final SelectorModel failedSelector,
      final SelectorModel thumbnailSelector,
      final ImageSelectorModel thumbnail,
      final SelectorModel target,
      final SelectorModel commentSelector,
      final CommentSelectorModel comments,
      final SelectorModel badgeSelector,
      final TagSelectorModel badgeItem,
      final SelectorModel tagSelector,
      final TagSelectorModel tagItem,
      final SelectorModel chapterSelector,
      final SelectorModel chapterTitle,
      final SelectorModel chapterSubtitle,
      final ImageSelectorModel chapterCover,
      final SelectorModel nextPage,
      final SelectorModel countPrePage}) = _$ParserModelDetailImpl;

  factory ParserModelDetail.fromJson(Map<String, dynamic> json) =
      _$ParserModelDetailImpl.fromJson;

  @override
  String get name;
  @override
  String get uuid;
  @override
  List<ExtraSelectorModel> get extra;
  SelectorModel get title;
  SelectorModel get subtitle;
  SelectorModel get uploadTime;
  SelectorModel get star;
  SelectorModel get imageCount;
  SelectorModel get pageCount;
  SelectorModel get language;
  ImageSelectorModel get coverImage;
  SelectorModel get description;
  @override
  SelectorModel get successSelector;
  @override
  SelectorModel get failedSelector;
  SelectorModel get thumbnailSelector;
  ImageSelectorModel get thumbnail;
  SelectorModel get target;
  SelectorModel get commentSelector;
  CommentSelectorModel get comments;
  SelectorModel get badgeSelector;
  TagSelectorModel get badgeItem;
  SelectorModel get tagSelector;
  TagSelectorModel get tagItem;
  SelectorModel get chapterSelector;
  SelectorModel get chapterTitle;
  SelectorModel get chapterSubtitle;
  ImageSelectorModel get chapterCover;
  SelectorModel get nextPage;
  SelectorModel get countPrePage;
  @override
  @JsonKey(ignore: true)
  _$$ParserModelDetailImplCopyWith<_$ParserModelDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ParserModelListImplCopyWith<$Res>
    implements $ParserModelCopyWith<$Res> {
  factory _$$ParserModelListImplCopyWith(_$ParserModelListImpl value,
          $Res Function(_$ParserModelListImpl) then) =
      __$$ParserModelListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String uuid,
      List<ExtraSelectorModel> extra,
      SelectorModel itemSelector,
      SelectorModel itemComplete,
      SelectorModel successSelector,
      SelectorModel failedSelector,
      SelectorModel title,
      SelectorModel subtitle,
      SelectorModel uploadTime,
      SelectorModel star,
      SelectorModel imageCount,
      SelectorModel language,
      ImageSelectorModel previewImage,
      SelectorModel target,
      SelectorModel badgeSelector,
      TagSelectorModel badgeItem,
      SelectorModel tag,
      TagSelectorModel tagItem,
      SelectorModel paper,
      SelectorModel idCode,
      SelectorModel nextPage});

  $SelectorModelCopyWith<$Res> get itemSelector;
  $SelectorModelCopyWith<$Res> get itemComplete;
  @override
  $SelectorModelCopyWith<$Res> get successSelector;
  @override
  $SelectorModelCopyWith<$Res> get failedSelector;
  $SelectorModelCopyWith<$Res> get title;
  $SelectorModelCopyWith<$Res> get subtitle;
  $SelectorModelCopyWith<$Res> get uploadTime;
  $SelectorModelCopyWith<$Res> get star;
  $SelectorModelCopyWith<$Res> get imageCount;
  $SelectorModelCopyWith<$Res> get language;
  $ImageSelectorModelCopyWith<$Res> get previewImage;
  $SelectorModelCopyWith<$Res> get target;
  $SelectorModelCopyWith<$Res> get badgeSelector;
  $TagSelectorModelCopyWith<$Res> get badgeItem;
  $SelectorModelCopyWith<$Res> get tag;
  $TagSelectorModelCopyWith<$Res> get tagItem;
  $SelectorModelCopyWith<$Res> get paper;
  $SelectorModelCopyWith<$Res> get idCode;
  $SelectorModelCopyWith<$Res> get nextPage;
}

/// @nodoc
class __$$ParserModelListImplCopyWithImpl<$Res>
    extends _$ParserModelCopyWithImpl<$Res, _$ParserModelListImpl>
    implements _$$ParserModelListImplCopyWith<$Res> {
  __$$ParserModelListImplCopyWithImpl(
      _$ParserModelListImpl _value, $Res Function(_$ParserModelListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? uuid = null,
    Object? extra = null,
    Object? itemSelector = null,
    Object? itemComplete = null,
    Object? successSelector = null,
    Object? failedSelector = null,
    Object? title = null,
    Object? subtitle = null,
    Object? uploadTime = null,
    Object? star = null,
    Object? imageCount = null,
    Object? language = null,
    Object? previewImage = null,
    Object? target = null,
    Object? badgeSelector = null,
    Object? badgeItem = null,
    Object? tag = null,
    Object? tagItem = null,
    Object? paper = null,
    Object? idCode = null,
    Object? nextPage = null,
  }) {
    return _then(_$ParserModelListImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      extra: null == extra
          ? _value._extra
          : extra // ignore: cast_nullable_to_non_nullable
              as List<ExtraSelectorModel>,
      itemSelector: null == itemSelector
          ? _value.itemSelector
          : itemSelector // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      itemComplete: null == itemComplete
          ? _value.itemComplete
          : itemComplete // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      successSelector: null == successSelector
          ? _value.successSelector
          : successSelector // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      failedSelector: null == failedSelector
          ? _value.failedSelector
          : failedSelector // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      uploadTime: null == uploadTime
          ? _value.uploadTime
          : uploadTime // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      star: null == star
          ? _value.star
          : star // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      imageCount: null == imageCount
          ? _value.imageCount
          : imageCount // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      previewImage: null == previewImage
          ? _value.previewImage
          : previewImage // ignore: cast_nullable_to_non_nullable
              as ImageSelectorModel,
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      badgeSelector: null == badgeSelector
          ? _value.badgeSelector
          : badgeSelector // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      badgeItem: null == badgeItem
          ? _value.badgeItem
          : badgeItem // ignore: cast_nullable_to_non_nullable
              as TagSelectorModel,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      tagItem: null == tagItem
          ? _value.tagItem
          : tagItem // ignore: cast_nullable_to_non_nullable
              as TagSelectorModel,
      paper: null == paper
          ? _value.paper
          : paper // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      idCode: null == idCode
          ? _value.idCode
          : idCode // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      nextPage: null == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get itemSelector {
    return $SelectorModelCopyWith<$Res>(_value.itemSelector, (value) {
      return _then(_value.copyWith(itemSelector: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get itemComplete {
    return $SelectorModelCopyWith<$Res>(_value.itemComplete, (value) {
      return _then(_value.copyWith(itemComplete: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get title {
    return $SelectorModelCopyWith<$Res>(_value.title, (value) {
      return _then(_value.copyWith(title: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get subtitle {
    return $SelectorModelCopyWith<$Res>(_value.subtitle, (value) {
      return _then(_value.copyWith(subtitle: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get uploadTime {
    return $SelectorModelCopyWith<$Res>(_value.uploadTime, (value) {
      return _then(_value.copyWith(uploadTime: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get star {
    return $SelectorModelCopyWith<$Res>(_value.star, (value) {
      return _then(_value.copyWith(star: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get imageCount {
    return $SelectorModelCopyWith<$Res>(_value.imageCount, (value) {
      return _then(_value.copyWith(imageCount: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get language {
    return $SelectorModelCopyWith<$Res>(_value.language, (value) {
      return _then(_value.copyWith(language: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageSelectorModelCopyWith<$Res> get previewImage {
    return $ImageSelectorModelCopyWith<$Res>(_value.previewImage, (value) {
      return _then(_value.copyWith(previewImage: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get target {
    return $SelectorModelCopyWith<$Res>(_value.target, (value) {
      return _then(_value.copyWith(target: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get badgeSelector {
    return $SelectorModelCopyWith<$Res>(_value.badgeSelector, (value) {
      return _then(_value.copyWith(badgeSelector: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TagSelectorModelCopyWith<$Res> get badgeItem {
    return $TagSelectorModelCopyWith<$Res>(_value.badgeItem, (value) {
      return _then(_value.copyWith(badgeItem: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get tag {
    return $SelectorModelCopyWith<$Res>(_value.tag, (value) {
      return _then(_value.copyWith(tag: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TagSelectorModelCopyWith<$Res> get tagItem {
    return $TagSelectorModelCopyWith<$Res>(_value.tagItem, (value) {
      return _then(_value.copyWith(tagItem: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get paper {
    return $SelectorModelCopyWith<$Res>(_value.paper, (value) {
      return _then(_value.copyWith(paper: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get idCode {
    return $SelectorModelCopyWith<$Res>(_value.idCode, (value) {
      return _then(_value.copyWith(idCode: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get nextPage {
    return $SelectorModelCopyWith<$Res>(_value.nextPage, (value) {
      return _then(_value.copyWith(nextPage: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$ParserModelListImpl implements ParserModelList {
  const _$ParserModelListImpl(
      {this.name = '',
      this.uuid = '',
      final List<ExtraSelectorModel> extra = const [],
      this.itemSelector = const SelectorModel(),
      this.itemComplete = const SelectorModel(),
      this.successSelector = const SelectorModel(),
      this.failedSelector = const SelectorModel(),
      this.title = const SelectorModel(),
      this.subtitle = const SelectorModel(),
      this.uploadTime = const SelectorModel(),
      this.star = const SelectorModel(),
      this.imageCount = const SelectorModel(),
      this.language = const SelectorModel(),
      this.previewImage = const ImageSelectorModel(),
      this.target = const SelectorModel(),
      this.badgeSelector = const SelectorModel(),
      this.badgeItem = const TagSelectorModel(),
      this.tag = const SelectorModel(),
      this.tagItem = const TagSelectorModel(),
      this.paper = const SelectorModel(),
      this.idCode = const SelectorModel(),
      this.nextPage = const SelectorModel(),
      final String? $type})
      : _extra = extra,
        $type = $type ?? 'list';

  factory _$ParserModelListImpl.fromJson(Map<String, dynamic> json) =>
      _$$ParserModelListImplFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String uuid;
  final List<ExtraSelectorModel> _extra;
  @override
  @JsonKey()
  List<ExtraSelectorModel> get extra {
    if (_extra is EqualUnmodifiableListView) return _extra;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_extra);
  }

  @override
  @JsonKey()
  final SelectorModel itemSelector;
  @override
  @JsonKey()
  final SelectorModel itemComplete;
  @override
  @JsonKey()
  final SelectorModel successSelector;
  @override
  @JsonKey()
  final SelectorModel failedSelector;
  @override
  @JsonKey()
  final SelectorModel title;
  @override
  @JsonKey()
  final SelectorModel subtitle;
  @override
  @JsonKey()
  final SelectorModel uploadTime;
  @override
  @JsonKey()
  final SelectorModel star;
  @override
  @JsonKey()
  final SelectorModel imageCount;
  @override
  @JsonKey()
  final SelectorModel language;
  @override
  @JsonKey()
  final ImageSelectorModel previewImage;
  @override
  @JsonKey()
  final SelectorModel target;
  @override
  @JsonKey()
  final SelectorModel badgeSelector;
  @override
  @JsonKey()
  final TagSelectorModel badgeItem;
  @override
  @JsonKey()
  final SelectorModel tag;
  @override
  @JsonKey()
  final TagSelectorModel tagItem;
  @override
  @JsonKey()
  final SelectorModel paper;
  @override
  @JsonKey()
  final SelectorModel idCode;
  @override
  @JsonKey()
  final SelectorModel nextPage;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ParserModel.list(name: $name, uuid: $uuid, extra: $extra, itemSelector: $itemSelector, itemComplete: $itemComplete, successSelector: $successSelector, failedSelector: $failedSelector, title: $title, subtitle: $subtitle, uploadTime: $uploadTime, star: $star, imageCount: $imageCount, language: $language, previewImage: $previewImage, target: $target, badgeSelector: $badgeSelector, badgeItem: $badgeItem, tag: $tag, tagItem: $tagItem, paper: $paper, idCode: $idCode, nextPage: $nextPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParserModelListImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            const DeepCollectionEquality().equals(other._extra, _extra) &&
            (identical(other.itemSelector, itemSelector) ||
                other.itemSelector == itemSelector) &&
            (identical(other.itemComplete, itemComplete) ||
                other.itemComplete == itemComplete) &&
            (identical(other.successSelector, successSelector) ||
                other.successSelector == successSelector) &&
            (identical(other.failedSelector, failedSelector) ||
                other.failedSelector == failedSelector) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.uploadTime, uploadTime) ||
                other.uploadTime == uploadTime) &&
            (identical(other.star, star) || other.star == star) &&
            (identical(other.imageCount, imageCount) ||
                other.imageCount == imageCount) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.previewImage, previewImage) ||
                other.previewImage == previewImage) &&
            (identical(other.target, target) || other.target == target) &&
            (identical(other.badgeSelector, badgeSelector) ||
                other.badgeSelector == badgeSelector) &&
            (identical(other.badgeItem, badgeItem) ||
                other.badgeItem == badgeItem) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.tagItem, tagItem) || other.tagItem == tagItem) &&
            (identical(other.paper, paper) || other.paper == paper) &&
            (identical(other.idCode, idCode) || other.idCode == idCode) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        name,
        uuid,
        const DeepCollectionEquality().hash(_extra),
        itemSelector,
        itemComplete,
        successSelector,
        failedSelector,
        title,
        subtitle,
        uploadTime,
        star,
        imageCount,
        language,
        previewImage,
        target,
        badgeSelector,
        badgeItem,
        tag,
        tagItem,
        paper,
        idCode,
        nextPage
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ParserModelListImplCopyWith<_$ParserModelListImpl> get copyWith =>
      __$$ParserModelListImplCopyWithImpl<_$ParserModelListImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel id,
            ImageSelectorModel image,
            SelectorModel largerImage,
            SelectorModel rawImage,
            SelectorModel rating,
            SelectorModel score,
            SelectorModel source,
            SelectorModel uploadTime,
            SelectorModel successSelector,
            SelectorModel failedSelector,
            SelectorModel badgeSelector,
            TagSelectorModel badgeItem,
            SelectorModel tagSelector,
            TagSelectorModel tagItem,
            SelectorModel commentSelector,
            CommentSelectorModel commentItem)
        imageReader,
    required TResult Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel title,
            SelectorModel subtitle,
            SelectorModel uploadTime,
            SelectorModel star,
            SelectorModel imageCount,
            SelectorModel pageCount,
            SelectorModel language,
            ImageSelectorModel coverImage,
            SelectorModel description,
            SelectorModel successSelector,
            SelectorModel failedSelector,
            SelectorModel thumbnailSelector,
            ImageSelectorModel thumbnail,
            SelectorModel target,
            SelectorModel commentSelector,
            CommentSelectorModel comments,
            SelectorModel badgeSelector,
            TagSelectorModel badgeItem,
            SelectorModel tagSelector,
            TagSelectorModel tagItem,
            SelectorModel chapterSelector,
            SelectorModel chapterTitle,
            SelectorModel chapterSubtitle,
            ImageSelectorModel chapterCover,
            SelectorModel nextPage,
            SelectorModel countPrePage)
        detail,
    required TResult Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel itemSelector,
            SelectorModel itemComplete,
            SelectorModel successSelector,
            SelectorModel failedSelector,
            SelectorModel title,
            SelectorModel subtitle,
            SelectorModel uploadTime,
            SelectorModel star,
            SelectorModel imageCount,
            SelectorModel language,
            ImageSelectorModel previewImage,
            SelectorModel target,
            SelectorModel badgeSelector,
            TagSelectorModel badgeItem,
            SelectorModel tag,
            TagSelectorModel tagItem,
            SelectorModel paper,
            SelectorModel idCode,
            SelectorModel nextPage)
        list,
    required TResult Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel itemSelector,
            SelectorModel itemComplete,
            SelectorModel successSelector,
            SelectorModel failedSelector)
        autoComplete,
  }) {
    return list(
        name,
        uuid,
        extra,
        itemSelector,
        itemComplete,
        successSelector,
        failedSelector,
        title,
        subtitle,
        uploadTime,
        star,
        imageCount,
        language,
        previewImage,
        target,
        badgeSelector,
        badgeItem,
        tag,
        tagItem,
        paper,
        idCode,
        nextPage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel id,
            ImageSelectorModel image,
            SelectorModel largerImage,
            SelectorModel rawImage,
            SelectorModel rating,
            SelectorModel score,
            SelectorModel source,
            SelectorModel uploadTime,
            SelectorModel successSelector,
            SelectorModel failedSelector,
            SelectorModel badgeSelector,
            TagSelectorModel badgeItem,
            SelectorModel tagSelector,
            TagSelectorModel tagItem,
            SelectorModel commentSelector,
            CommentSelectorModel commentItem)?
        imageReader,
    TResult? Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel title,
            SelectorModel subtitle,
            SelectorModel uploadTime,
            SelectorModel star,
            SelectorModel imageCount,
            SelectorModel pageCount,
            SelectorModel language,
            ImageSelectorModel coverImage,
            SelectorModel description,
            SelectorModel successSelector,
            SelectorModel failedSelector,
            SelectorModel thumbnailSelector,
            ImageSelectorModel thumbnail,
            SelectorModel target,
            SelectorModel commentSelector,
            CommentSelectorModel comments,
            SelectorModel badgeSelector,
            TagSelectorModel badgeItem,
            SelectorModel tagSelector,
            TagSelectorModel tagItem,
            SelectorModel chapterSelector,
            SelectorModel chapterTitle,
            SelectorModel chapterSubtitle,
            ImageSelectorModel chapterCover,
            SelectorModel nextPage,
            SelectorModel countPrePage)?
        detail,
    TResult? Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel itemSelector,
            SelectorModel itemComplete,
            SelectorModel successSelector,
            SelectorModel failedSelector,
            SelectorModel title,
            SelectorModel subtitle,
            SelectorModel uploadTime,
            SelectorModel star,
            SelectorModel imageCount,
            SelectorModel language,
            ImageSelectorModel previewImage,
            SelectorModel target,
            SelectorModel badgeSelector,
            TagSelectorModel badgeItem,
            SelectorModel tag,
            TagSelectorModel tagItem,
            SelectorModel paper,
            SelectorModel idCode,
            SelectorModel nextPage)?
        list,
    TResult? Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel itemSelector,
            SelectorModel itemComplete,
            SelectorModel successSelector,
            SelectorModel failedSelector)?
        autoComplete,
  }) {
    return list?.call(
        name,
        uuid,
        extra,
        itemSelector,
        itemComplete,
        successSelector,
        failedSelector,
        title,
        subtitle,
        uploadTime,
        star,
        imageCount,
        language,
        previewImage,
        target,
        badgeSelector,
        badgeItem,
        tag,
        tagItem,
        paper,
        idCode,
        nextPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel id,
            ImageSelectorModel image,
            SelectorModel largerImage,
            SelectorModel rawImage,
            SelectorModel rating,
            SelectorModel score,
            SelectorModel source,
            SelectorModel uploadTime,
            SelectorModel successSelector,
            SelectorModel failedSelector,
            SelectorModel badgeSelector,
            TagSelectorModel badgeItem,
            SelectorModel tagSelector,
            TagSelectorModel tagItem,
            SelectorModel commentSelector,
            CommentSelectorModel commentItem)?
        imageReader,
    TResult Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel title,
            SelectorModel subtitle,
            SelectorModel uploadTime,
            SelectorModel star,
            SelectorModel imageCount,
            SelectorModel pageCount,
            SelectorModel language,
            ImageSelectorModel coverImage,
            SelectorModel description,
            SelectorModel successSelector,
            SelectorModel failedSelector,
            SelectorModel thumbnailSelector,
            ImageSelectorModel thumbnail,
            SelectorModel target,
            SelectorModel commentSelector,
            CommentSelectorModel comments,
            SelectorModel badgeSelector,
            TagSelectorModel badgeItem,
            SelectorModel tagSelector,
            TagSelectorModel tagItem,
            SelectorModel chapterSelector,
            SelectorModel chapterTitle,
            SelectorModel chapterSubtitle,
            ImageSelectorModel chapterCover,
            SelectorModel nextPage,
            SelectorModel countPrePage)?
        detail,
    TResult Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel itemSelector,
            SelectorModel itemComplete,
            SelectorModel successSelector,
            SelectorModel failedSelector,
            SelectorModel title,
            SelectorModel subtitle,
            SelectorModel uploadTime,
            SelectorModel star,
            SelectorModel imageCount,
            SelectorModel language,
            ImageSelectorModel previewImage,
            SelectorModel target,
            SelectorModel badgeSelector,
            TagSelectorModel badgeItem,
            SelectorModel tag,
            TagSelectorModel tagItem,
            SelectorModel paper,
            SelectorModel idCode,
            SelectorModel nextPage)?
        list,
    TResult Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel itemSelector,
            SelectorModel itemComplete,
            SelectorModel successSelector,
            SelectorModel failedSelector)?
        autoComplete,
    required TResult orElse(),
  }) {
    if (list != null) {
      return list(
          name,
          uuid,
          extra,
          itemSelector,
          itemComplete,
          successSelector,
          failedSelector,
          title,
          subtitle,
          uploadTime,
          star,
          imageCount,
          language,
          previewImage,
          target,
          badgeSelector,
          badgeItem,
          tag,
          tagItem,
          paper,
          idCode,
          nextPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ParserModelImageReader value) imageReader,
    required TResult Function(ParserModelDetail value) detail,
    required TResult Function(ParserModelList value) list,
    required TResult Function(ParserModelAutoComplete value) autoComplete,
  }) {
    return list(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ParserModelImageReader value)? imageReader,
    TResult? Function(ParserModelDetail value)? detail,
    TResult? Function(ParserModelList value)? list,
    TResult? Function(ParserModelAutoComplete value)? autoComplete,
  }) {
    return list?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ParserModelImageReader value)? imageReader,
    TResult Function(ParserModelDetail value)? detail,
    TResult Function(ParserModelList value)? list,
    TResult Function(ParserModelAutoComplete value)? autoComplete,
    required TResult orElse(),
  }) {
    if (list != null) {
      return list(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ParserModelListImplToJson(
      this,
    );
  }
}

abstract class ParserModelList implements ParserModel {
  const factory ParserModelList(
      {final String name,
      final String uuid,
      final List<ExtraSelectorModel> extra,
      final SelectorModel itemSelector,
      final SelectorModel itemComplete,
      final SelectorModel successSelector,
      final SelectorModel failedSelector,
      final SelectorModel title,
      final SelectorModel subtitle,
      final SelectorModel uploadTime,
      final SelectorModel star,
      final SelectorModel imageCount,
      final SelectorModel language,
      final ImageSelectorModel previewImage,
      final SelectorModel target,
      final SelectorModel badgeSelector,
      final TagSelectorModel badgeItem,
      final SelectorModel tag,
      final TagSelectorModel tagItem,
      final SelectorModel paper,
      final SelectorModel idCode,
      final SelectorModel nextPage}) = _$ParserModelListImpl;

  factory ParserModelList.fromJson(Map<String, dynamic> json) =
      _$ParserModelListImpl.fromJson;

  @override
  String get name;
  @override
  String get uuid;
  @override
  List<ExtraSelectorModel> get extra;
  SelectorModel get itemSelector;
  SelectorModel get itemComplete;
  @override
  SelectorModel get successSelector;
  @override
  SelectorModel get failedSelector;
  SelectorModel get title;
  SelectorModel get subtitle;
  SelectorModel get uploadTime;
  SelectorModel get star;
  SelectorModel get imageCount;
  SelectorModel get language;
  ImageSelectorModel get previewImage;
  SelectorModel get target;
  SelectorModel get badgeSelector;
  TagSelectorModel get badgeItem;
  SelectorModel get tag;
  TagSelectorModel get tagItem;
  SelectorModel get paper;
  SelectorModel get idCode;
  SelectorModel get nextPage;
  @override
  @JsonKey(ignore: true)
  _$$ParserModelListImplCopyWith<_$ParserModelListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ParserModelAutoCompleteImplCopyWith<$Res>
    implements $ParserModelCopyWith<$Res> {
  factory _$$ParserModelAutoCompleteImplCopyWith(
          _$ParserModelAutoCompleteImpl value,
          $Res Function(_$ParserModelAutoCompleteImpl) then) =
      __$$ParserModelAutoCompleteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String uuid,
      List<ExtraSelectorModel> extra,
      SelectorModel itemSelector,
      SelectorModel itemComplete,
      SelectorModel successSelector,
      SelectorModel failedSelector});

  $SelectorModelCopyWith<$Res> get itemSelector;
  $SelectorModelCopyWith<$Res> get itemComplete;
  @override
  $SelectorModelCopyWith<$Res> get successSelector;
  @override
  $SelectorModelCopyWith<$Res> get failedSelector;
}

/// @nodoc
class __$$ParserModelAutoCompleteImplCopyWithImpl<$Res>
    extends _$ParserModelCopyWithImpl<$Res, _$ParserModelAutoCompleteImpl>
    implements _$$ParserModelAutoCompleteImplCopyWith<$Res> {
  __$$ParserModelAutoCompleteImplCopyWithImpl(
      _$ParserModelAutoCompleteImpl _value,
      $Res Function(_$ParserModelAutoCompleteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? uuid = null,
    Object? extra = null,
    Object? itemSelector = null,
    Object? itemComplete = null,
    Object? successSelector = null,
    Object? failedSelector = null,
  }) {
    return _then(_$ParserModelAutoCompleteImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      extra: null == extra
          ? _value._extra
          : extra // ignore: cast_nullable_to_non_nullable
              as List<ExtraSelectorModel>,
      itemSelector: null == itemSelector
          ? _value.itemSelector
          : itemSelector // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      itemComplete: null == itemComplete
          ? _value.itemComplete
          : itemComplete // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      successSelector: null == successSelector
          ? _value.successSelector
          : successSelector // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      failedSelector: null == failedSelector
          ? _value.failedSelector
          : failedSelector // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get itemSelector {
    return $SelectorModelCopyWith<$Res>(_value.itemSelector, (value) {
      return _then(_value.copyWith(itemSelector: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get itemComplete {
    return $SelectorModelCopyWith<$Res>(_value.itemComplete, (value) {
      return _then(_value.copyWith(itemComplete: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$ParserModelAutoCompleteImpl implements ParserModelAutoComplete {
  const _$ParserModelAutoCompleteImpl(
      {this.name = '',
      this.uuid = '',
      final List<ExtraSelectorModel> extra = const [],
      this.itemSelector = const SelectorModel(),
      this.itemComplete = const SelectorModel(),
      this.successSelector = const SelectorModel(),
      this.failedSelector = const SelectorModel(),
      final String? $type})
      : _extra = extra,
        $type = $type ?? 'autoComplete';

  factory _$ParserModelAutoCompleteImpl.fromJson(Map<String, dynamic> json) =>
      _$$ParserModelAutoCompleteImplFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String uuid;
  final List<ExtraSelectorModel> _extra;
  @override
  @JsonKey()
  List<ExtraSelectorModel> get extra {
    if (_extra is EqualUnmodifiableListView) return _extra;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_extra);
  }

  @override
  @JsonKey()
  final SelectorModel itemSelector;
  @override
  @JsonKey()
  final SelectorModel itemComplete;
  @override
  @JsonKey()
  final SelectorModel successSelector;
  @override
  @JsonKey()
  final SelectorModel failedSelector;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ParserModel.autoComplete(name: $name, uuid: $uuid, extra: $extra, itemSelector: $itemSelector, itemComplete: $itemComplete, successSelector: $successSelector, failedSelector: $failedSelector)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParserModelAutoCompleteImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            const DeepCollectionEquality().equals(other._extra, _extra) &&
            (identical(other.itemSelector, itemSelector) ||
                other.itemSelector == itemSelector) &&
            (identical(other.itemComplete, itemComplete) ||
                other.itemComplete == itemComplete) &&
            (identical(other.successSelector, successSelector) ||
                other.successSelector == successSelector) &&
            (identical(other.failedSelector, failedSelector) ||
                other.failedSelector == failedSelector));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      uuid,
      const DeepCollectionEquality().hash(_extra),
      itemSelector,
      itemComplete,
      successSelector,
      failedSelector);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ParserModelAutoCompleteImplCopyWith<_$ParserModelAutoCompleteImpl>
      get copyWith => __$$ParserModelAutoCompleteImplCopyWithImpl<
          _$ParserModelAutoCompleteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel id,
            ImageSelectorModel image,
            SelectorModel largerImage,
            SelectorModel rawImage,
            SelectorModel rating,
            SelectorModel score,
            SelectorModel source,
            SelectorModel uploadTime,
            SelectorModel successSelector,
            SelectorModel failedSelector,
            SelectorModel badgeSelector,
            TagSelectorModel badgeItem,
            SelectorModel tagSelector,
            TagSelectorModel tagItem,
            SelectorModel commentSelector,
            CommentSelectorModel commentItem)
        imageReader,
    required TResult Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel title,
            SelectorModel subtitle,
            SelectorModel uploadTime,
            SelectorModel star,
            SelectorModel imageCount,
            SelectorModel pageCount,
            SelectorModel language,
            ImageSelectorModel coverImage,
            SelectorModel description,
            SelectorModel successSelector,
            SelectorModel failedSelector,
            SelectorModel thumbnailSelector,
            ImageSelectorModel thumbnail,
            SelectorModel target,
            SelectorModel commentSelector,
            CommentSelectorModel comments,
            SelectorModel badgeSelector,
            TagSelectorModel badgeItem,
            SelectorModel tagSelector,
            TagSelectorModel tagItem,
            SelectorModel chapterSelector,
            SelectorModel chapterTitle,
            SelectorModel chapterSubtitle,
            ImageSelectorModel chapterCover,
            SelectorModel nextPage,
            SelectorModel countPrePage)
        detail,
    required TResult Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel itemSelector,
            SelectorModel itemComplete,
            SelectorModel successSelector,
            SelectorModel failedSelector,
            SelectorModel title,
            SelectorModel subtitle,
            SelectorModel uploadTime,
            SelectorModel star,
            SelectorModel imageCount,
            SelectorModel language,
            ImageSelectorModel previewImage,
            SelectorModel target,
            SelectorModel badgeSelector,
            TagSelectorModel badgeItem,
            SelectorModel tag,
            TagSelectorModel tagItem,
            SelectorModel paper,
            SelectorModel idCode,
            SelectorModel nextPage)
        list,
    required TResult Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel itemSelector,
            SelectorModel itemComplete,
            SelectorModel successSelector,
            SelectorModel failedSelector)
        autoComplete,
  }) {
    return autoComplete(name, uuid, extra, itemSelector, itemComplete,
        successSelector, failedSelector);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel id,
            ImageSelectorModel image,
            SelectorModel largerImage,
            SelectorModel rawImage,
            SelectorModel rating,
            SelectorModel score,
            SelectorModel source,
            SelectorModel uploadTime,
            SelectorModel successSelector,
            SelectorModel failedSelector,
            SelectorModel badgeSelector,
            TagSelectorModel badgeItem,
            SelectorModel tagSelector,
            TagSelectorModel tagItem,
            SelectorModel commentSelector,
            CommentSelectorModel commentItem)?
        imageReader,
    TResult? Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel title,
            SelectorModel subtitle,
            SelectorModel uploadTime,
            SelectorModel star,
            SelectorModel imageCount,
            SelectorModel pageCount,
            SelectorModel language,
            ImageSelectorModel coverImage,
            SelectorModel description,
            SelectorModel successSelector,
            SelectorModel failedSelector,
            SelectorModel thumbnailSelector,
            ImageSelectorModel thumbnail,
            SelectorModel target,
            SelectorModel commentSelector,
            CommentSelectorModel comments,
            SelectorModel badgeSelector,
            TagSelectorModel badgeItem,
            SelectorModel tagSelector,
            TagSelectorModel tagItem,
            SelectorModel chapterSelector,
            SelectorModel chapterTitle,
            SelectorModel chapterSubtitle,
            ImageSelectorModel chapterCover,
            SelectorModel nextPage,
            SelectorModel countPrePage)?
        detail,
    TResult? Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel itemSelector,
            SelectorModel itemComplete,
            SelectorModel successSelector,
            SelectorModel failedSelector,
            SelectorModel title,
            SelectorModel subtitle,
            SelectorModel uploadTime,
            SelectorModel star,
            SelectorModel imageCount,
            SelectorModel language,
            ImageSelectorModel previewImage,
            SelectorModel target,
            SelectorModel badgeSelector,
            TagSelectorModel badgeItem,
            SelectorModel tag,
            TagSelectorModel tagItem,
            SelectorModel paper,
            SelectorModel idCode,
            SelectorModel nextPage)?
        list,
    TResult? Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel itemSelector,
            SelectorModel itemComplete,
            SelectorModel successSelector,
            SelectorModel failedSelector)?
        autoComplete,
  }) {
    return autoComplete?.call(name, uuid, extra, itemSelector, itemComplete,
        successSelector, failedSelector);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel id,
            ImageSelectorModel image,
            SelectorModel largerImage,
            SelectorModel rawImage,
            SelectorModel rating,
            SelectorModel score,
            SelectorModel source,
            SelectorModel uploadTime,
            SelectorModel successSelector,
            SelectorModel failedSelector,
            SelectorModel badgeSelector,
            TagSelectorModel badgeItem,
            SelectorModel tagSelector,
            TagSelectorModel tagItem,
            SelectorModel commentSelector,
            CommentSelectorModel commentItem)?
        imageReader,
    TResult Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel title,
            SelectorModel subtitle,
            SelectorModel uploadTime,
            SelectorModel star,
            SelectorModel imageCount,
            SelectorModel pageCount,
            SelectorModel language,
            ImageSelectorModel coverImage,
            SelectorModel description,
            SelectorModel successSelector,
            SelectorModel failedSelector,
            SelectorModel thumbnailSelector,
            ImageSelectorModel thumbnail,
            SelectorModel target,
            SelectorModel commentSelector,
            CommentSelectorModel comments,
            SelectorModel badgeSelector,
            TagSelectorModel badgeItem,
            SelectorModel tagSelector,
            TagSelectorModel tagItem,
            SelectorModel chapterSelector,
            SelectorModel chapterTitle,
            SelectorModel chapterSubtitle,
            ImageSelectorModel chapterCover,
            SelectorModel nextPage,
            SelectorModel countPrePage)?
        detail,
    TResult Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel itemSelector,
            SelectorModel itemComplete,
            SelectorModel successSelector,
            SelectorModel failedSelector,
            SelectorModel title,
            SelectorModel subtitle,
            SelectorModel uploadTime,
            SelectorModel star,
            SelectorModel imageCount,
            SelectorModel language,
            ImageSelectorModel previewImage,
            SelectorModel target,
            SelectorModel badgeSelector,
            TagSelectorModel badgeItem,
            SelectorModel tag,
            TagSelectorModel tagItem,
            SelectorModel paper,
            SelectorModel idCode,
            SelectorModel nextPage)?
        list,
    TResult Function(
            String name,
            String uuid,
            List<ExtraSelectorModel> extra,
            SelectorModel itemSelector,
            SelectorModel itemComplete,
            SelectorModel successSelector,
            SelectorModel failedSelector)?
        autoComplete,
    required TResult orElse(),
  }) {
    if (autoComplete != null) {
      return autoComplete(name, uuid, extra, itemSelector, itemComplete,
          successSelector, failedSelector);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ParserModelImageReader value) imageReader,
    required TResult Function(ParserModelDetail value) detail,
    required TResult Function(ParserModelList value) list,
    required TResult Function(ParserModelAutoComplete value) autoComplete,
  }) {
    return autoComplete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ParserModelImageReader value)? imageReader,
    TResult? Function(ParserModelDetail value)? detail,
    TResult? Function(ParserModelList value)? list,
    TResult? Function(ParserModelAutoComplete value)? autoComplete,
  }) {
    return autoComplete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ParserModelImageReader value)? imageReader,
    TResult Function(ParserModelDetail value)? detail,
    TResult Function(ParserModelList value)? list,
    TResult Function(ParserModelAutoComplete value)? autoComplete,
    required TResult orElse(),
  }) {
    if (autoComplete != null) {
      return autoComplete(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ParserModelAutoCompleteImplToJson(
      this,
    );
  }
}

abstract class ParserModelAutoComplete implements ParserModel {
  const factory ParserModelAutoComplete(
      {final String name,
      final String uuid,
      final List<ExtraSelectorModel> extra,
      final SelectorModel itemSelector,
      final SelectorModel itemComplete,
      final SelectorModel successSelector,
      final SelectorModel failedSelector}) = _$ParserModelAutoCompleteImpl;

  factory ParserModelAutoComplete.fromJson(Map<String, dynamic> json) =
      _$ParserModelAutoCompleteImpl.fromJson;

  @override
  String get name;
  @override
  String get uuid;
  @override
  List<ExtraSelectorModel> get extra;
  SelectorModel get itemSelector;
  SelectorModel get itemComplete;
  @override
  SelectorModel get successSelector;
  @override
  SelectorModel get failedSelector;
  @override
  @JsonKey(ignore: true)
  _$$ParserModelAutoCompleteImplCopyWith<_$ParserModelAutoCompleteImpl>
      get copyWith => throw _privateConstructorUsedError;
}
