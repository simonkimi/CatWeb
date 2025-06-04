// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parser.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
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
  String get name;
  String get uuid;
  List<ExtraSelectorModel> get extra;
  SelectorModel get successSelector;
  SelectorModel get failedSelector;

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ParserModelCopyWith<ParserModel> get copyWith =>
      _$ParserModelCopyWithImpl<ParserModel>(this as ParserModel, _$identity);

  /// Serializes this ParserModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ParserModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            const DeepCollectionEquality().equals(other.extra, extra) &&
            (identical(other.successSelector, successSelector) ||
                other.successSelector == successSelector) &&
            (identical(other.failedSelector, failedSelector) ||
                other.failedSelector == failedSelector));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      uuid,
      const DeepCollectionEquality().hash(extra),
      successSelector,
      failedSelector);

  @override
  String toString() {
    return 'ParserModel(name: $name, uuid: $uuid, extra: $extra, successSelector: $successSelector, failedSelector: $failedSelector)';
  }
}

/// @nodoc
abstract mixin class $ParserModelCopyWith<$Res> {
  factory $ParserModelCopyWith(
          ParserModel value, $Res Function(ParserModel) _then) =
      _$ParserModelCopyWithImpl;
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
class _$ParserModelCopyWithImpl<$Res> implements $ParserModelCopyWith<$Res> {
  _$ParserModelCopyWithImpl(this._self, this._then);

  final ParserModel _self;
  final $Res Function(ParserModel) _then;

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? uuid = null,
    Object? extra = null,
    Object? successSelector = null,
    Object? failedSelector = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      extra: null == extra
          ? _self.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as List<ExtraSelectorModel>,
      successSelector: null == successSelector
          ? _self.successSelector
          : successSelector // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      failedSelector: null == failedSelector
          ? _self.failedSelector
          : failedSelector // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
    ));
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get successSelector {
    return $SelectorModelCopyWith<$Res>(_self.successSelector, (value) {
      return _then(_self.copyWith(successSelector: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get failedSelector {
    return $SelectorModelCopyWith<$Res>(_self.failedSelector, (value) {
      return _then(_self.copyWith(failedSelector: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class ParserModelImageReader extends ParserModel {
  const ParserModelImageReader(
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
        $type = $type ?? 'imageReader',
        super._();
  factory ParserModelImageReader.fromJson(Map<String, dynamic> json) =>
      _$ParserModelImageReaderFromJson(json);

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

  @JsonKey()
  final SelectorModel id;
  @JsonKey()
  final ImageSelectorModel image;
  @JsonKey()
  final SelectorModel largerImage;
  @JsonKey()
  final SelectorModel rawImage;
  @JsonKey()
  final SelectorModel rating;
  @JsonKey()
  final SelectorModel score;
  @JsonKey()
  final SelectorModel source;
  @JsonKey()
  final SelectorModel uploadTime;
  @override
  @JsonKey()
  final SelectorModel successSelector;
  @override
  @JsonKey()
  final SelectorModel failedSelector;
  @JsonKey()
  final SelectorModel badgeSelector;
  @JsonKey()
  final TagSelectorModel badgeItem;
  @JsonKey()
  final SelectorModel tagSelector;
  @JsonKey()
  final TagSelectorModel tagItem;
  @JsonKey()
  final SelectorModel commentSelector;
  @JsonKey()
  final CommentSelectorModel commentItem;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ParserModelImageReaderCopyWith<ParserModelImageReader> get copyWith =>
      _$ParserModelImageReaderCopyWithImpl<ParserModelImageReader>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ParserModelImageReaderToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ParserModelImageReader &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  @override
  String toString() {
    return 'ParserModel.imageReader(name: $name, uuid: $uuid, extra: $extra, id: $id, image: $image, largerImage: $largerImage, rawImage: $rawImage, rating: $rating, score: $score, source: $source, uploadTime: $uploadTime, successSelector: $successSelector, failedSelector: $failedSelector, badgeSelector: $badgeSelector, badgeItem: $badgeItem, tagSelector: $tagSelector, tagItem: $tagItem, commentSelector: $commentSelector, commentItem: $commentItem)';
  }
}

/// @nodoc
abstract mixin class $ParserModelImageReaderCopyWith<$Res>
    implements $ParserModelCopyWith<$Res> {
  factory $ParserModelImageReaderCopyWith(ParserModelImageReader value,
          $Res Function(ParserModelImageReader) _then) =
      _$ParserModelImageReaderCopyWithImpl;
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
class _$ParserModelImageReaderCopyWithImpl<$Res>
    implements $ParserModelImageReaderCopyWith<$Res> {
  _$ParserModelImageReaderCopyWithImpl(this._self, this._then);

  final ParserModelImageReader _self;
  final $Res Function(ParserModelImageReader) _then;

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(ParserModelImageReader(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      extra: null == extra
          ? _self._extra
          : extra // ignore: cast_nullable_to_non_nullable
              as List<ExtraSelectorModel>,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      image: null == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as ImageSelectorModel,
      largerImage: null == largerImage
          ? _self.largerImage
          : largerImage // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      rawImage: null == rawImage
          ? _self.rawImage
          : rawImage // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      rating: null == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      score: null == score
          ? _self.score
          : score // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      source: null == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      uploadTime: null == uploadTime
          ? _self.uploadTime
          : uploadTime // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      successSelector: null == successSelector
          ? _self.successSelector
          : successSelector // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      failedSelector: null == failedSelector
          ? _self.failedSelector
          : failedSelector // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      badgeSelector: null == badgeSelector
          ? _self.badgeSelector
          : badgeSelector // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      badgeItem: null == badgeItem
          ? _self.badgeItem
          : badgeItem // ignore: cast_nullable_to_non_nullable
              as TagSelectorModel,
      tagSelector: null == tagSelector
          ? _self.tagSelector
          : tagSelector // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      tagItem: null == tagItem
          ? _self.tagItem
          : tagItem // ignore: cast_nullable_to_non_nullable
              as TagSelectorModel,
      commentSelector: null == commentSelector
          ? _self.commentSelector
          : commentSelector // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      commentItem: null == commentItem
          ? _self.commentItem
          : commentItem // ignore: cast_nullable_to_non_nullable
              as CommentSelectorModel,
    ));
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get id {
    return $SelectorModelCopyWith<$Res>(_self.id, (value) {
      return _then(_self.copyWith(id: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImageSelectorModelCopyWith<$Res> get image {
    return $ImageSelectorModelCopyWith<$Res>(_self.image, (value) {
      return _then(_self.copyWith(image: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get largerImage {
    return $SelectorModelCopyWith<$Res>(_self.largerImage, (value) {
      return _then(_self.copyWith(largerImage: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get rawImage {
    return $SelectorModelCopyWith<$Res>(_self.rawImage, (value) {
      return _then(_self.copyWith(rawImage: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get rating {
    return $SelectorModelCopyWith<$Res>(_self.rating, (value) {
      return _then(_self.copyWith(rating: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get score {
    return $SelectorModelCopyWith<$Res>(_self.score, (value) {
      return _then(_self.copyWith(score: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get source {
    return $SelectorModelCopyWith<$Res>(_self.source, (value) {
      return _then(_self.copyWith(source: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get uploadTime {
    return $SelectorModelCopyWith<$Res>(_self.uploadTime, (value) {
      return _then(_self.copyWith(uploadTime: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get successSelector {
    return $SelectorModelCopyWith<$Res>(_self.successSelector, (value) {
      return _then(_self.copyWith(successSelector: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get failedSelector {
    return $SelectorModelCopyWith<$Res>(_self.failedSelector, (value) {
      return _then(_self.copyWith(failedSelector: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get badgeSelector {
    return $SelectorModelCopyWith<$Res>(_self.badgeSelector, (value) {
      return _then(_self.copyWith(badgeSelector: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TagSelectorModelCopyWith<$Res> get badgeItem {
    return $TagSelectorModelCopyWith<$Res>(_self.badgeItem, (value) {
      return _then(_self.copyWith(badgeItem: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get tagSelector {
    return $SelectorModelCopyWith<$Res>(_self.tagSelector, (value) {
      return _then(_self.copyWith(tagSelector: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TagSelectorModelCopyWith<$Res> get tagItem {
    return $TagSelectorModelCopyWith<$Res>(_self.tagItem, (value) {
      return _then(_self.copyWith(tagItem: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get commentSelector {
    return $SelectorModelCopyWith<$Res>(_self.commentSelector, (value) {
      return _then(_self.copyWith(commentSelector: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommentSelectorModelCopyWith<$Res> get commentItem {
    return $CommentSelectorModelCopyWith<$Res>(_self.commentItem, (value) {
      return _then(_self.copyWith(commentItem: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class ParserModelDetail extends ParserModel {
  const ParserModelDetail(
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
        $type = $type ?? 'detail',
        super._();
  factory ParserModelDetail.fromJson(Map<String, dynamic> json) =>
      _$ParserModelDetailFromJson(json);

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

  @JsonKey()
  final SelectorModel title;
  @JsonKey()
  final SelectorModel subtitle;
  @JsonKey()
  final SelectorModel uploadTime;
  @JsonKey()
  final SelectorModel star;
  @JsonKey()
  final SelectorModel imageCount;
  @JsonKey()
  final SelectorModel pageCount;
  @JsonKey()
  final SelectorModel language;
  @JsonKey()
  final ImageSelectorModel coverImage;
  @JsonKey()
  final SelectorModel description;
  @override
  @JsonKey()
  final SelectorModel successSelector;
  @override
  @JsonKey()
  final SelectorModel failedSelector;
  @JsonKey()
  final SelectorModel thumbnailSelector;
  @JsonKey()
  final ImageSelectorModel thumbnail;
  @JsonKey()
  final SelectorModel target;
  @JsonKey()
  final SelectorModel commentSelector;
  @JsonKey()
  final CommentSelectorModel comments;
  @JsonKey()
  final SelectorModel badgeSelector;
  @JsonKey()
  final TagSelectorModel badgeItem;
  @JsonKey()
  final SelectorModel tagSelector;
  @JsonKey()
  final TagSelectorModel tagItem;
  @JsonKey()
  final SelectorModel chapterSelector;
  @JsonKey()
  final SelectorModel chapterTitle;
  @JsonKey()
  final SelectorModel chapterSubtitle;
  @JsonKey()
  final ImageSelectorModel chapterCover;
  @JsonKey()
  final SelectorModel nextPage;
  @JsonKey()
  final SelectorModel countPrePage;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ParserModelDetailCopyWith<ParserModelDetail> get copyWith =>
      _$ParserModelDetailCopyWithImpl<ParserModelDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ParserModelDetailToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ParserModelDetail &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  @override
  String toString() {
    return 'ParserModel.detail(name: $name, uuid: $uuid, extra: $extra, title: $title, subtitle: $subtitle, uploadTime: $uploadTime, star: $star, imageCount: $imageCount, pageCount: $pageCount, language: $language, coverImage: $coverImage, description: $description, successSelector: $successSelector, failedSelector: $failedSelector, thumbnailSelector: $thumbnailSelector, thumbnail: $thumbnail, target: $target, commentSelector: $commentSelector, comments: $comments, badgeSelector: $badgeSelector, badgeItem: $badgeItem, tagSelector: $tagSelector, tagItem: $tagItem, chapterSelector: $chapterSelector, chapterTitle: $chapterTitle, chapterSubtitle: $chapterSubtitle, chapterCover: $chapterCover, nextPage: $nextPage, countPrePage: $countPrePage)';
  }
}

/// @nodoc
abstract mixin class $ParserModelDetailCopyWith<$Res>
    implements $ParserModelCopyWith<$Res> {
  factory $ParserModelDetailCopyWith(
          ParserModelDetail value, $Res Function(ParserModelDetail) _then) =
      _$ParserModelDetailCopyWithImpl;
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
class _$ParserModelDetailCopyWithImpl<$Res>
    implements $ParserModelDetailCopyWith<$Res> {
  _$ParserModelDetailCopyWithImpl(this._self, this._then);

  final ParserModelDetail _self;
  final $Res Function(ParserModelDetail) _then;

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(ParserModelDetail(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      extra: null == extra
          ? _self._extra
          : extra // ignore: cast_nullable_to_non_nullable
              as List<ExtraSelectorModel>,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      subtitle: null == subtitle
          ? _self.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      uploadTime: null == uploadTime
          ? _self.uploadTime
          : uploadTime // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      star: null == star
          ? _self.star
          : star // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      imageCount: null == imageCount
          ? _self.imageCount
          : imageCount // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      pageCount: null == pageCount
          ? _self.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      language: null == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      coverImage: null == coverImage
          ? _self.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as ImageSelectorModel,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      successSelector: null == successSelector
          ? _self.successSelector
          : successSelector // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      failedSelector: null == failedSelector
          ? _self.failedSelector
          : failedSelector // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      thumbnailSelector: null == thumbnailSelector
          ? _self.thumbnailSelector
          : thumbnailSelector // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      thumbnail: null == thumbnail
          ? _self.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as ImageSelectorModel,
      target: null == target
          ? _self.target
          : target // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      commentSelector: null == commentSelector
          ? _self.commentSelector
          : commentSelector // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      comments: null == comments
          ? _self.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as CommentSelectorModel,
      badgeSelector: null == badgeSelector
          ? _self.badgeSelector
          : badgeSelector // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      badgeItem: null == badgeItem
          ? _self.badgeItem
          : badgeItem // ignore: cast_nullable_to_non_nullable
              as TagSelectorModel,
      tagSelector: null == tagSelector
          ? _self.tagSelector
          : tagSelector // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      tagItem: null == tagItem
          ? _self.tagItem
          : tagItem // ignore: cast_nullable_to_non_nullable
              as TagSelectorModel,
      chapterSelector: null == chapterSelector
          ? _self.chapterSelector
          : chapterSelector // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      chapterTitle: null == chapterTitle
          ? _self.chapterTitle
          : chapterTitle // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      chapterSubtitle: null == chapterSubtitle
          ? _self.chapterSubtitle
          : chapterSubtitle // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      chapterCover: null == chapterCover
          ? _self.chapterCover
          : chapterCover // ignore: cast_nullable_to_non_nullable
              as ImageSelectorModel,
      nextPage: null == nextPage
          ? _self.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      countPrePage: null == countPrePage
          ? _self.countPrePage
          : countPrePage // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
    ));
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get title {
    return $SelectorModelCopyWith<$Res>(_self.title, (value) {
      return _then(_self.copyWith(title: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get subtitle {
    return $SelectorModelCopyWith<$Res>(_self.subtitle, (value) {
      return _then(_self.copyWith(subtitle: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get uploadTime {
    return $SelectorModelCopyWith<$Res>(_self.uploadTime, (value) {
      return _then(_self.copyWith(uploadTime: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get star {
    return $SelectorModelCopyWith<$Res>(_self.star, (value) {
      return _then(_self.copyWith(star: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get imageCount {
    return $SelectorModelCopyWith<$Res>(_self.imageCount, (value) {
      return _then(_self.copyWith(imageCount: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get pageCount {
    return $SelectorModelCopyWith<$Res>(_self.pageCount, (value) {
      return _then(_self.copyWith(pageCount: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get language {
    return $SelectorModelCopyWith<$Res>(_self.language, (value) {
      return _then(_self.copyWith(language: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImageSelectorModelCopyWith<$Res> get coverImage {
    return $ImageSelectorModelCopyWith<$Res>(_self.coverImage, (value) {
      return _then(_self.copyWith(coverImage: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get description {
    return $SelectorModelCopyWith<$Res>(_self.description, (value) {
      return _then(_self.copyWith(description: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get successSelector {
    return $SelectorModelCopyWith<$Res>(_self.successSelector, (value) {
      return _then(_self.copyWith(successSelector: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get failedSelector {
    return $SelectorModelCopyWith<$Res>(_self.failedSelector, (value) {
      return _then(_self.copyWith(failedSelector: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get thumbnailSelector {
    return $SelectorModelCopyWith<$Res>(_self.thumbnailSelector, (value) {
      return _then(_self.copyWith(thumbnailSelector: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImageSelectorModelCopyWith<$Res> get thumbnail {
    return $ImageSelectorModelCopyWith<$Res>(_self.thumbnail, (value) {
      return _then(_self.copyWith(thumbnail: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get target {
    return $SelectorModelCopyWith<$Res>(_self.target, (value) {
      return _then(_self.copyWith(target: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get commentSelector {
    return $SelectorModelCopyWith<$Res>(_self.commentSelector, (value) {
      return _then(_self.copyWith(commentSelector: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommentSelectorModelCopyWith<$Res> get comments {
    return $CommentSelectorModelCopyWith<$Res>(_self.comments, (value) {
      return _then(_self.copyWith(comments: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get badgeSelector {
    return $SelectorModelCopyWith<$Res>(_self.badgeSelector, (value) {
      return _then(_self.copyWith(badgeSelector: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TagSelectorModelCopyWith<$Res> get badgeItem {
    return $TagSelectorModelCopyWith<$Res>(_self.badgeItem, (value) {
      return _then(_self.copyWith(badgeItem: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get tagSelector {
    return $SelectorModelCopyWith<$Res>(_self.tagSelector, (value) {
      return _then(_self.copyWith(tagSelector: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TagSelectorModelCopyWith<$Res> get tagItem {
    return $TagSelectorModelCopyWith<$Res>(_self.tagItem, (value) {
      return _then(_self.copyWith(tagItem: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get chapterSelector {
    return $SelectorModelCopyWith<$Res>(_self.chapterSelector, (value) {
      return _then(_self.copyWith(chapterSelector: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get chapterTitle {
    return $SelectorModelCopyWith<$Res>(_self.chapterTitle, (value) {
      return _then(_self.copyWith(chapterTitle: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get chapterSubtitle {
    return $SelectorModelCopyWith<$Res>(_self.chapterSubtitle, (value) {
      return _then(_self.copyWith(chapterSubtitle: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImageSelectorModelCopyWith<$Res> get chapterCover {
    return $ImageSelectorModelCopyWith<$Res>(_self.chapterCover, (value) {
      return _then(_self.copyWith(chapterCover: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get nextPage {
    return $SelectorModelCopyWith<$Res>(_self.nextPage, (value) {
      return _then(_self.copyWith(nextPage: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get countPrePage {
    return $SelectorModelCopyWith<$Res>(_self.countPrePage, (value) {
      return _then(_self.copyWith(countPrePage: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class ParserModelList extends ParserModel {
  const ParserModelList(
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
        $type = $type ?? 'list',
        super._();
  factory ParserModelList.fromJson(Map<String, dynamic> json) =>
      _$ParserModelListFromJson(json);

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

  @JsonKey()
  final SelectorModel itemSelector;
  @JsonKey()
  final SelectorModel itemComplete;
  @override
  @JsonKey()
  final SelectorModel successSelector;
  @override
  @JsonKey()
  final SelectorModel failedSelector;
  @JsonKey()
  final SelectorModel title;
  @JsonKey()
  final SelectorModel subtitle;
  @JsonKey()
  final SelectorModel uploadTime;
  @JsonKey()
  final SelectorModel star;
  @JsonKey()
  final SelectorModel imageCount;
  @JsonKey()
  final SelectorModel language;
  @JsonKey()
  final ImageSelectorModel previewImage;
  @JsonKey()
  final SelectorModel target;
  @JsonKey()
  final SelectorModel badgeSelector;
  @JsonKey()
  final TagSelectorModel badgeItem;
  @JsonKey()
  final SelectorModel tag;
  @JsonKey()
  final TagSelectorModel tagItem;
  @JsonKey()
  final SelectorModel paper;
  @JsonKey()
  final SelectorModel idCode;
  @JsonKey()
  final SelectorModel nextPage;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ParserModelListCopyWith<ParserModelList> get copyWith =>
      _$ParserModelListCopyWithImpl<ParserModelList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ParserModelListToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ParserModelList &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  @override
  String toString() {
    return 'ParserModel.list(name: $name, uuid: $uuid, extra: $extra, itemSelector: $itemSelector, itemComplete: $itemComplete, successSelector: $successSelector, failedSelector: $failedSelector, title: $title, subtitle: $subtitle, uploadTime: $uploadTime, star: $star, imageCount: $imageCount, language: $language, previewImage: $previewImage, target: $target, badgeSelector: $badgeSelector, badgeItem: $badgeItem, tag: $tag, tagItem: $tagItem, paper: $paper, idCode: $idCode, nextPage: $nextPage)';
  }
}

/// @nodoc
abstract mixin class $ParserModelListCopyWith<$Res>
    implements $ParserModelCopyWith<$Res> {
  factory $ParserModelListCopyWith(
          ParserModelList value, $Res Function(ParserModelList) _then) =
      _$ParserModelListCopyWithImpl;
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
class _$ParserModelListCopyWithImpl<$Res>
    implements $ParserModelListCopyWith<$Res> {
  _$ParserModelListCopyWithImpl(this._self, this._then);

  final ParserModelList _self;
  final $Res Function(ParserModelList) _then;

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(ParserModelList(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      extra: null == extra
          ? _self._extra
          : extra // ignore: cast_nullable_to_non_nullable
              as List<ExtraSelectorModel>,
      itemSelector: null == itemSelector
          ? _self.itemSelector
          : itemSelector // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      itemComplete: null == itemComplete
          ? _self.itemComplete
          : itemComplete // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      successSelector: null == successSelector
          ? _self.successSelector
          : successSelector // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      failedSelector: null == failedSelector
          ? _self.failedSelector
          : failedSelector // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      subtitle: null == subtitle
          ? _self.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      uploadTime: null == uploadTime
          ? _self.uploadTime
          : uploadTime // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      star: null == star
          ? _self.star
          : star // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      imageCount: null == imageCount
          ? _self.imageCount
          : imageCount // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      language: null == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      previewImage: null == previewImage
          ? _self.previewImage
          : previewImage // ignore: cast_nullable_to_non_nullable
              as ImageSelectorModel,
      target: null == target
          ? _self.target
          : target // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      badgeSelector: null == badgeSelector
          ? _self.badgeSelector
          : badgeSelector // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      badgeItem: null == badgeItem
          ? _self.badgeItem
          : badgeItem // ignore: cast_nullable_to_non_nullable
              as TagSelectorModel,
      tag: null == tag
          ? _self.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      tagItem: null == tagItem
          ? _self.tagItem
          : tagItem // ignore: cast_nullable_to_non_nullable
              as TagSelectorModel,
      paper: null == paper
          ? _self.paper
          : paper // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      idCode: null == idCode
          ? _self.idCode
          : idCode // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      nextPage: null == nextPage
          ? _self.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
    ));
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get itemSelector {
    return $SelectorModelCopyWith<$Res>(_self.itemSelector, (value) {
      return _then(_self.copyWith(itemSelector: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get itemComplete {
    return $SelectorModelCopyWith<$Res>(_self.itemComplete, (value) {
      return _then(_self.copyWith(itemComplete: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get successSelector {
    return $SelectorModelCopyWith<$Res>(_self.successSelector, (value) {
      return _then(_self.copyWith(successSelector: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get failedSelector {
    return $SelectorModelCopyWith<$Res>(_self.failedSelector, (value) {
      return _then(_self.copyWith(failedSelector: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get title {
    return $SelectorModelCopyWith<$Res>(_self.title, (value) {
      return _then(_self.copyWith(title: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get subtitle {
    return $SelectorModelCopyWith<$Res>(_self.subtitle, (value) {
      return _then(_self.copyWith(subtitle: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get uploadTime {
    return $SelectorModelCopyWith<$Res>(_self.uploadTime, (value) {
      return _then(_self.copyWith(uploadTime: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get star {
    return $SelectorModelCopyWith<$Res>(_self.star, (value) {
      return _then(_self.copyWith(star: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get imageCount {
    return $SelectorModelCopyWith<$Res>(_self.imageCount, (value) {
      return _then(_self.copyWith(imageCount: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get language {
    return $SelectorModelCopyWith<$Res>(_self.language, (value) {
      return _then(_self.copyWith(language: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImageSelectorModelCopyWith<$Res> get previewImage {
    return $ImageSelectorModelCopyWith<$Res>(_self.previewImage, (value) {
      return _then(_self.copyWith(previewImage: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get target {
    return $SelectorModelCopyWith<$Res>(_self.target, (value) {
      return _then(_self.copyWith(target: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get badgeSelector {
    return $SelectorModelCopyWith<$Res>(_self.badgeSelector, (value) {
      return _then(_self.copyWith(badgeSelector: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TagSelectorModelCopyWith<$Res> get badgeItem {
    return $TagSelectorModelCopyWith<$Res>(_self.badgeItem, (value) {
      return _then(_self.copyWith(badgeItem: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get tag {
    return $SelectorModelCopyWith<$Res>(_self.tag, (value) {
      return _then(_self.copyWith(tag: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TagSelectorModelCopyWith<$Res> get tagItem {
    return $TagSelectorModelCopyWith<$Res>(_self.tagItem, (value) {
      return _then(_self.copyWith(tagItem: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get paper {
    return $SelectorModelCopyWith<$Res>(_self.paper, (value) {
      return _then(_self.copyWith(paper: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get idCode {
    return $SelectorModelCopyWith<$Res>(_self.idCode, (value) {
      return _then(_self.copyWith(idCode: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get nextPage {
    return $SelectorModelCopyWith<$Res>(_self.nextPage, (value) {
      return _then(_self.copyWith(nextPage: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class ParserModelAutoComplete extends ParserModel {
  const ParserModelAutoComplete(
      {this.name = '',
      this.uuid = '',
      final List<ExtraSelectorModel> extra = const [],
      this.itemSelector = const SelectorModel(),
      this.itemComplete = const SelectorModel(),
      this.itemTitle = const SelectorModel(),
      this.itemSubtitle = const SelectorModel(),
      this.successSelector = const SelectorModel(),
      this.failedSelector = const SelectorModel(),
      final String? $type})
      : _extra = extra,
        $type = $type ?? 'autoComplete',
        super._();
  factory ParserModelAutoComplete.fromJson(Map<String, dynamic> json) =>
      _$ParserModelAutoCompleteFromJson(json);

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

  @JsonKey()
  final SelectorModel itemSelector;
  @JsonKey()
  final SelectorModel itemComplete;
  @JsonKey()
  final SelectorModel itemTitle;
  @JsonKey()
  final SelectorModel itemSubtitle;
  @override
  @JsonKey()
  final SelectorModel successSelector;
  @override
  @JsonKey()
  final SelectorModel failedSelector;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ParserModelAutoCompleteCopyWith<ParserModelAutoComplete> get copyWith =>
      _$ParserModelAutoCompleteCopyWithImpl<ParserModelAutoComplete>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ParserModelAutoCompleteToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ParserModelAutoComplete &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            const DeepCollectionEquality().equals(other._extra, _extra) &&
            (identical(other.itemSelector, itemSelector) ||
                other.itemSelector == itemSelector) &&
            (identical(other.itemComplete, itemComplete) ||
                other.itemComplete == itemComplete) &&
            (identical(other.itemTitle, itemTitle) ||
                other.itemTitle == itemTitle) &&
            (identical(other.itemSubtitle, itemSubtitle) ||
                other.itemSubtitle == itemSubtitle) &&
            (identical(other.successSelector, successSelector) ||
                other.successSelector == successSelector) &&
            (identical(other.failedSelector, failedSelector) ||
                other.failedSelector == failedSelector));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      uuid,
      const DeepCollectionEquality().hash(_extra),
      itemSelector,
      itemComplete,
      itemTitle,
      itemSubtitle,
      successSelector,
      failedSelector);

  @override
  String toString() {
    return 'ParserModel.autoComplete(name: $name, uuid: $uuid, extra: $extra, itemSelector: $itemSelector, itemComplete: $itemComplete, itemTitle: $itemTitle, itemSubtitle: $itemSubtitle, successSelector: $successSelector, failedSelector: $failedSelector)';
  }
}

/// @nodoc
abstract mixin class $ParserModelAutoCompleteCopyWith<$Res>
    implements $ParserModelCopyWith<$Res> {
  factory $ParserModelAutoCompleteCopyWith(ParserModelAutoComplete value,
          $Res Function(ParserModelAutoComplete) _then) =
      _$ParserModelAutoCompleteCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name,
      String uuid,
      List<ExtraSelectorModel> extra,
      SelectorModel itemSelector,
      SelectorModel itemComplete,
      SelectorModel itemTitle,
      SelectorModel itemSubtitle,
      SelectorModel successSelector,
      SelectorModel failedSelector});

  $SelectorModelCopyWith<$Res> get itemSelector;
  $SelectorModelCopyWith<$Res> get itemComplete;
  $SelectorModelCopyWith<$Res> get itemTitle;
  $SelectorModelCopyWith<$Res> get itemSubtitle;
  @override
  $SelectorModelCopyWith<$Res> get successSelector;
  @override
  $SelectorModelCopyWith<$Res> get failedSelector;
}

/// @nodoc
class _$ParserModelAutoCompleteCopyWithImpl<$Res>
    implements $ParserModelAutoCompleteCopyWith<$Res> {
  _$ParserModelAutoCompleteCopyWithImpl(this._self, this._then);

  final ParserModelAutoComplete _self;
  final $Res Function(ParserModelAutoComplete) _then;

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? uuid = null,
    Object? extra = null,
    Object? itemSelector = null,
    Object? itemComplete = null,
    Object? itemTitle = null,
    Object? itemSubtitle = null,
    Object? successSelector = null,
    Object? failedSelector = null,
  }) {
    return _then(ParserModelAutoComplete(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      extra: null == extra
          ? _self._extra
          : extra // ignore: cast_nullable_to_non_nullable
              as List<ExtraSelectorModel>,
      itemSelector: null == itemSelector
          ? _self.itemSelector
          : itemSelector // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      itemComplete: null == itemComplete
          ? _self.itemComplete
          : itemComplete // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      itemTitle: null == itemTitle
          ? _self.itemTitle
          : itemTitle // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      itemSubtitle: null == itemSubtitle
          ? _self.itemSubtitle
          : itemSubtitle // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      successSelector: null == successSelector
          ? _self.successSelector
          : successSelector // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
      failedSelector: null == failedSelector
          ? _self.failedSelector
          : failedSelector // ignore: cast_nullable_to_non_nullable
              as SelectorModel,
    ));
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get itemSelector {
    return $SelectorModelCopyWith<$Res>(_self.itemSelector, (value) {
      return _then(_self.copyWith(itemSelector: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get itemComplete {
    return $SelectorModelCopyWith<$Res>(_self.itemComplete, (value) {
      return _then(_self.copyWith(itemComplete: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get itemTitle {
    return $SelectorModelCopyWith<$Res>(_self.itemTitle, (value) {
      return _then(_self.copyWith(itemTitle: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get itemSubtitle {
    return $SelectorModelCopyWith<$Res>(_self.itemSubtitle, (value) {
      return _then(_self.copyWith(itemSubtitle: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get successSelector {
    return $SelectorModelCopyWith<$Res>(_self.successSelector, (value) {
      return _then(_self.copyWith(successSelector: value));
    });
  }

  /// Create a copy of ParserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectorModelCopyWith<$Res> get failedSelector {
    return $SelectorModelCopyWith<$Res>(_self.failedSelector, (value) {
      return _then(_self.copyWith(failedSelector: value));
    });
  }
}

// dart format on
