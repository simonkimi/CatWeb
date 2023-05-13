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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ImageReaderParser _$ImageReaderParserFromJson(Map<String, dynamic> json) {
  return _ImageReaderParser.fromJson(json);
}

/// @nodoc
mixin _$ImageReaderParser {
  @JsonKey(toJson: ParserType._toType, fromJson: ParserType._fromType)
  ParserType get parserType => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  Iterable<ExtraSelector>? get extra => throw _privateConstructorUsedError;
  ImageSelector? get image => throw _privateConstructorUsedError;
  Selector? get largerImage => throw _privateConstructorUsedError;
  Selector? get rawImage => throw _privateConstructorUsedError;
  Selector? get rating => throw _privateConstructorUsedError;
  Selector? get score => throw _privateConstructorUsedError;
  Selector? get source => throw _privateConstructorUsedError;
  Selector? get uploadTime => throw _privateConstructorUsedError;
  Selector? get successSelector => throw _privateConstructorUsedError;
  Selector? get failedSelector => throw _privateConstructorUsedError;
  Selector? get badgeSelector => throw _privateConstructorUsedError;
  Selector? get badgeText => throw _privateConstructorUsedError;
  Selector? get badgeCategory => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageReaderParserCopyWith<ImageReaderParser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageReaderParserCopyWith<$Res> {
  factory $ImageReaderParserCopyWith(
          ImageReaderParser value, $Res Function(ImageReaderParser) then) =
      _$ImageReaderParserCopyWithImpl<$Res, ImageReaderParser>;
  @useResult
  $Res call(
      {@JsonKey(toJson: ParserType._toType, fromJson: ParserType._fromType)
          ParserType parserType,
      String name,
      String uuid,
      Iterable<ExtraSelector>? extra,
      ImageSelector? image,
      Selector? largerImage,
      Selector? rawImage,
      Selector? rating,
      Selector? score,
      Selector? source,
      Selector? uploadTime,
      Selector? successSelector,
      Selector? failedSelector,
      Selector? badgeSelector,
      Selector? badgeText,
      Selector? badgeCategory});

  $ImageSelectorCopyWith<$Res>? get image;
  $SelectorCopyWith<$Res>? get largerImage;
  $SelectorCopyWith<$Res>? get rawImage;
  $SelectorCopyWith<$Res>? get rating;
  $SelectorCopyWith<$Res>? get score;
  $SelectorCopyWith<$Res>? get source;
  $SelectorCopyWith<$Res>? get uploadTime;
  $SelectorCopyWith<$Res>? get successSelector;
  $SelectorCopyWith<$Res>? get failedSelector;
  $SelectorCopyWith<$Res>? get badgeSelector;
  $SelectorCopyWith<$Res>? get badgeText;
  $SelectorCopyWith<$Res>? get badgeCategory;
}

/// @nodoc
class _$ImageReaderParserCopyWithImpl<$Res, $Val extends ImageReaderParser>
    implements $ImageReaderParserCopyWith<$Res> {
  _$ImageReaderParserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parserType = null,
    Object? name = null,
    Object? uuid = null,
    Object? extra = freezed,
    Object? image = freezed,
    Object? largerImage = freezed,
    Object? rawImage = freezed,
    Object? rating = freezed,
    Object? score = freezed,
    Object? source = freezed,
    Object? uploadTime = freezed,
    Object? successSelector = freezed,
    Object? failedSelector = freezed,
    Object? badgeSelector = freezed,
    Object? badgeText = freezed,
    Object? badgeCategory = freezed,
  }) {
    return _then(_value.copyWith(
      parserType: null == parserType
          ? _value.parserType
          : parserType // ignore: cast_nullable_to_non_nullable
              as ParserType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      extra: freezed == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as Iterable<ExtraSelector>?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as ImageSelector?,
      largerImage: freezed == largerImage
          ? _value.largerImage
          : largerImage // ignore: cast_nullable_to_non_nullable
              as Selector?,
      rawImage: freezed == rawImage
          ? _value.rawImage
          : rawImage // ignore: cast_nullable_to_non_nullable
              as Selector?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as Selector?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as Selector?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as Selector?,
      uploadTime: freezed == uploadTime
          ? _value.uploadTime
          : uploadTime // ignore: cast_nullable_to_non_nullable
              as Selector?,
      successSelector: freezed == successSelector
          ? _value.successSelector
          : successSelector // ignore: cast_nullable_to_non_nullable
              as Selector?,
      failedSelector: freezed == failedSelector
          ? _value.failedSelector
          : failedSelector // ignore: cast_nullable_to_non_nullable
              as Selector?,
      badgeSelector: freezed == badgeSelector
          ? _value.badgeSelector
          : badgeSelector // ignore: cast_nullable_to_non_nullable
              as Selector?,
      badgeText: freezed == badgeText
          ? _value.badgeText
          : badgeText // ignore: cast_nullable_to_non_nullable
              as Selector?,
      badgeCategory: freezed == badgeCategory
          ? _value.badgeCategory
          : badgeCategory // ignore: cast_nullable_to_non_nullable
              as Selector?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageSelectorCopyWith<$Res>? get image {
    if (_value.image == null) {
      return null;
    }

    return $ImageSelectorCopyWith<$Res>(_value.image!, (value) {
      return _then(_value.copyWith(image: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get largerImage {
    if (_value.largerImage == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.largerImage!, (value) {
      return _then(_value.copyWith(largerImage: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get rawImage {
    if (_value.rawImage == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.rawImage!, (value) {
      return _then(_value.copyWith(rawImage: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get rating {
    if (_value.rating == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.rating!, (value) {
      return _then(_value.copyWith(rating: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get score {
    if (_value.score == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.score!, (value) {
      return _then(_value.copyWith(score: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get source {
    if (_value.source == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.source!, (value) {
      return _then(_value.copyWith(source: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get uploadTime {
    if (_value.uploadTime == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.uploadTime!, (value) {
      return _then(_value.copyWith(uploadTime: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get successSelector {
    if (_value.successSelector == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.successSelector!, (value) {
      return _then(_value.copyWith(successSelector: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get failedSelector {
    if (_value.failedSelector == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.failedSelector!, (value) {
      return _then(_value.copyWith(failedSelector: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get badgeSelector {
    if (_value.badgeSelector == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.badgeSelector!, (value) {
      return _then(_value.copyWith(badgeSelector: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get badgeText {
    if (_value.badgeText == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.badgeText!, (value) {
      return _then(_value.copyWith(badgeText: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get badgeCategory {
    if (_value.badgeCategory == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.badgeCategory!, (value) {
      return _then(_value.copyWith(badgeCategory: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ImageReaderParserCopyWith<$Res>
    implements $ImageReaderParserCopyWith<$Res> {
  factory _$$_ImageReaderParserCopyWith(_$_ImageReaderParser value,
          $Res Function(_$_ImageReaderParser) then) =
      __$$_ImageReaderParserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(toJson: ParserType._toType, fromJson: ParserType._fromType)
          ParserType parserType,
      String name,
      String uuid,
      Iterable<ExtraSelector>? extra,
      ImageSelector? image,
      Selector? largerImage,
      Selector? rawImage,
      Selector? rating,
      Selector? score,
      Selector? source,
      Selector? uploadTime,
      Selector? successSelector,
      Selector? failedSelector,
      Selector? badgeSelector,
      Selector? badgeText,
      Selector? badgeCategory});

  @override
  $ImageSelectorCopyWith<$Res>? get image;
  @override
  $SelectorCopyWith<$Res>? get largerImage;
  @override
  $SelectorCopyWith<$Res>? get rawImage;
  @override
  $SelectorCopyWith<$Res>? get rating;
  @override
  $SelectorCopyWith<$Res>? get score;
  @override
  $SelectorCopyWith<$Res>? get source;
  @override
  $SelectorCopyWith<$Res>? get uploadTime;
  @override
  $SelectorCopyWith<$Res>? get successSelector;
  @override
  $SelectorCopyWith<$Res>? get failedSelector;
  @override
  $SelectorCopyWith<$Res>? get badgeSelector;
  @override
  $SelectorCopyWith<$Res>? get badgeText;
  @override
  $SelectorCopyWith<$Res>? get badgeCategory;
}

/// @nodoc
class __$$_ImageReaderParserCopyWithImpl<$Res>
    extends _$ImageReaderParserCopyWithImpl<$Res, _$_ImageReaderParser>
    implements _$$_ImageReaderParserCopyWith<$Res> {
  __$$_ImageReaderParserCopyWithImpl(
      _$_ImageReaderParser _value, $Res Function(_$_ImageReaderParser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parserType = null,
    Object? name = null,
    Object? uuid = null,
    Object? extra = freezed,
    Object? image = freezed,
    Object? largerImage = freezed,
    Object? rawImage = freezed,
    Object? rating = freezed,
    Object? score = freezed,
    Object? source = freezed,
    Object? uploadTime = freezed,
    Object? successSelector = freezed,
    Object? failedSelector = freezed,
    Object? badgeSelector = freezed,
    Object? badgeText = freezed,
    Object? badgeCategory = freezed,
  }) {
    return _then(_$_ImageReaderParser(
      parserType: null == parserType
          ? _value.parserType
          : parserType // ignore: cast_nullable_to_non_nullable
              as ParserType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      extra: freezed == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as Iterable<ExtraSelector>?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as ImageSelector?,
      largerImage: freezed == largerImage
          ? _value.largerImage
          : largerImage // ignore: cast_nullable_to_non_nullable
              as Selector?,
      rawImage: freezed == rawImage
          ? _value.rawImage
          : rawImage // ignore: cast_nullable_to_non_nullable
              as Selector?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as Selector?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as Selector?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as Selector?,
      uploadTime: freezed == uploadTime
          ? _value.uploadTime
          : uploadTime // ignore: cast_nullable_to_non_nullable
              as Selector?,
      successSelector: freezed == successSelector
          ? _value.successSelector
          : successSelector // ignore: cast_nullable_to_non_nullable
              as Selector?,
      failedSelector: freezed == failedSelector
          ? _value.failedSelector
          : failedSelector // ignore: cast_nullable_to_non_nullable
              as Selector?,
      badgeSelector: freezed == badgeSelector
          ? _value.badgeSelector
          : badgeSelector // ignore: cast_nullable_to_non_nullable
              as Selector?,
      badgeText: freezed == badgeText
          ? _value.badgeText
          : badgeText // ignore: cast_nullable_to_non_nullable
              as Selector?,
      badgeCategory: freezed == badgeCategory
          ? _value.badgeCategory
          : badgeCategory // ignore: cast_nullable_to_non_nullable
              as Selector?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ImageReaderParser extends _ImageReaderParser {
  _$_ImageReaderParser(
      {@JsonKey(toJson: ParserType._toType, fromJson: ParserType._fromType)
          this.parserType = ParserType.imageReader,
      required this.name,
      required this.uuid,
      this.extra = const [],
      this.image = const ImageSelector(),
      this.largerImage = const Selector(),
      this.rawImage = const Selector(),
      this.rating = const Selector(),
      this.score = const Selector(),
      this.source = const Selector(),
      this.uploadTime = const Selector(),
      this.successSelector = const Selector(),
      this.failedSelector = const Selector(),
      this.badgeSelector = const Selector(),
      this.badgeText = const Selector(),
      this.badgeCategory = const Selector()})
      : assert(parserType == ParserType.imageReader,
            'parserType must be imageReader'),
        super._();

  factory _$_ImageReaderParser.fromJson(Map<String, dynamic> json) =>
      _$$_ImageReaderParserFromJson(json);

  @override
  @JsonKey(toJson: ParserType._toType, fromJson: ParserType._fromType)
  final ParserType parserType;
  @override
  final String name;
  @override
  final String uuid;
  @override
  @JsonKey()
  final Iterable<ExtraSelector>? extra;
  @override
  @JsonKey()
  final ImageSelector? image;
  @override
  @JsonKey()
  final Selector? largerImage;
  @override
  @JsonKey()
  final Selector? rawImage;
  @override
  @JsonKey()
  final Selector? rating;
  @override
  @JsonKey()
  final Selector? score;
  @override
  @JsonKey()
  final Selector? source;
  @override
  @JsonKey()
  final Selector? uploadTime;
  @override
  @JsonKey()
  final Selector? successSelector;
  @override
  @JsonKey()
  final Selector? failedSelector;
  @override
  @JsonKey()
  final Selector? badgeSelector;
  @override
  @JsonKey()
  final Selector? badgeText;
  @override
  @JsonKey()
  final Selector? badgeCategory;

  @override
  String toString() {
    return 'ImageReaderParser(parserType: $parserType, name: $name, uuid: $uuid, extra: $extra, image: $image, largerImage: $largerImage, rawImage: $rawImage, rating: $rating, score: $score, source: $source, uploadTime: $uploadTime, successSelector: $successSelector, failedSelector: $failedSelector, badgeSelector: $badgeSelector, badgeText: $badgeText, badgeCategory: $badgeCategory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImageReaderParser &&
            (identical(other.parserType, parserType) ||
                other.parserType == parserType) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            const DeepCollectionEquality().equals(other.extra, extra) &&
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
            (identical(other.badgeText, badgeText) ||
                other.badgeText == badgeText) &&
            (identical(other.badgeCategory, badgeCategory) ||
                other.badgeCategory == badgeCategory));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      parserType,
      name,
      uuid,
      const DeepCollectionEquality().hash(extra),
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
      badgeText,
      badgeCategory);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ImageReaderParserCopyWith<_$_ImageReaderParser> get copyWith =>
      __$$_ImageReaderParserCopyWithImpl<_$_ImageReaderParser>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ImageReaderParserToJson(
      this,
    );
  }
}

abstract class _ImageReaderParser extends ImageReaderParser {
  factory _ImageReaderParser(
      {@JsonKey(toJson: ParserType._toType, fromJson: ParserType._fromType)
          final ParserType parserType,
      required final String name,
      required final String uuid,
      final Iterable<ExtraSelector>? extra,
      final ImageSelector? image,
      final Selector? largerImage,
      final Selector? rawImage,
      final Selector? rating,
      final Selector? score,
      final Selector? source,
      final Selector? uploadTime,
      final Selector? successSelector,
      final Selector? failedSelector,
      final Selector? badgeSelector,
      final Selector? badgeText,
      final Selector? badgeCategory}) = _$_ImageReaderParser;
  _ImageReaderParser._() : super._();

  factory _ImageReaderParser.fromJson(Map<String, dynamic> json) =
      _$_ImageReaderParser.fromJson;

  @override
  @JsonKey(toJson: ParserType._toType, fromJson: ParserType._fromType)
  ParserType get parserType;
  @override
  String get name;
  @override
  String get uuid;
  @override
  Iterable<ExtraSelector>? get extra;
  @override
  ImageSelector? get image;
  @override
  Selector? get largerImage;
  @override
  Selector? get rawImage;
  @override
  Selector? get rating;
  @override
  Selector? get score;
  @override
  Selector? get source;
  @override
  Selector? get uploadTime;
  @override
  Selector? get successSelector;
  @override
  Selector? get failedSelector;
  @override
  Selector? get badgeSelector;
  @override
  Selector? get badgeText;
  @override
  Selector? get badgeCategory;
  @override
  @JsonKey(ignore: true)
  _$$_ImageReaderParserCopyWith<_$_ImageReaderParser> get copyWith =>
      throw _privateConstructorUsedError;
}

GalleryParser _$GalleryParserFromJson(Map<String, dynamic> json) {
  return _GalleryParser.fromJson(json);
}

/// @nodoc
mixin _$GalleryParser {
  @JsonKey(toJson: ParserType._toType, fromJson: ParserType._fromType)
  ParserType get parserType => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  Iterable<ExtraSelector>? get extra => throw _privateConstructorUsedError;
  Selector? get title => throw _privateConstructorUsedError;
  Selector? get subtitle => throw _privateConstructorUsedError;
  Selector? get uploadTime => throw _privateConstructorUsedError;
  Selector? get star => throw _privateConstructorUsedError;
  Selector? get imgCount => throw _privateConstructorUsedError;
  Selector? get pageCount => throw _privateConstructorUsedError;
  Selector? get language => throw _privateConstructorUsedError;
  ImageSelector? get coverImg => throw _privateConstructorUsedError;
  Selector? get description => throw _privateConstructorUsedError;
  Selector? get successSelector => throw _privateConstructorUsedError;
  Selector? get failedSelector => throw _privateConstructorUsedError;
  Selector? get thumbnailSelector => throw _privateConstructorUsedError;
  ImageSelector? get thumbnail => throw _privateConstructorUsedError;
  Selector? get target => throw _privateConstructorUsedError;
  Selector? get commentSelector => throw _privateConstructorUsedError;
  CommentSelector? get comments => throw _privateConstructorUsedError;
  Selector? get tag => throw _privateConstructorUsedError;
  Selector? get tagColor => throw _privateConstructorUsedError;
  Selector? get badgeSelector => throw _privateConstructorUsedError;
  Selector? get badgeText => throw _privateConstructorUsedError;
  Selector? get badgeCategory => throw _privateConstructorUsedError;
  Selector? get chapterSelector => throw _privateConstructorUsedError;
  Selector? get chapterTitle => throw _privateConstructorUsedError;
  Selector? get chapterSubtitle => throw _privateConstructorUsedError;
  ImageSelector? get chapterCover => throw _privateConstructorUsedError;
  Selector? get nextPage => throw _privateConstructorUsedError;
  Selector? get countPrePage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GalleryParserCopyWith<GalleryParser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GalleryParserCopyWith<$Res> {
  factory $GalleryParserCopyWith(
          GalleryParser value, $Res Function(GalleryParser) then) =
      _$GalleryParserCopyWithImpl<$Res, GalleryParser>;
  @useResult
  $Res call(
      {@JsonKey(toJson: ParserType._toType, fromJson: ParserType._fromType)
          ParserType parserType,
      String name,
      String uuid,
      Iterable<ExtraSelector>? extra,
      Selector? title,
      Selector? subtitle,
      Selector? uploadTime,
      Selector? star,
      Selector? imgCount,
      Selector? pageCount,
      Selector? language,
      ImageSelector? coverImg,
      Selector? description,
      Selector? successSelector,
      Selector? failedSelector,
      Selector? thumbnailSelector,
      ImageSelector? thumbnail,
      Selector? target,
      Selector? commentSelector,
      CommentSelector? comments,
      Selector? tag,
      Selector? tagColor,
      Selector? badgeSelector,
      Selector? badgeText,
      Selector? badgeCategory,
      Selector? chapterSelector,
      Selector? chapterTitle,
      Selector? chapterSubtitle,
      ImageSelector? chapterCover,
      Selector? nextPage,
      Selector? countPrePage});

  $SelectorCopyWith<$Res>? get title;
  $SelectorCopyWith<$Res>? get subtitle;
  $SelectorCopyWith<$Res>? get uploadTime;
  $SelectorCopyWith<$Res>? get star;
  $SelectorCopyWith<$Res>? get imgCount;
  $SelectorCopyWith<$Res>? get pageCount;
  $SelectorCopyWith<$Res>? get language;
  $ImageSelectorCopyWith<$Res>? get coverImg;
  $SelectorCopyWith<$Res>? get description;
  $SelectorCopyWith<$Res>? get successSelector;
  $SelectorCopyWith<$Res>? get failedSelector;
  $SelectorCopyWith<$Res>? get thumbnailSelector;
  $ImageSelectorCopyWith<$Res>? get thumbnail;
  $SelectorCopyWith<$Res>? get target;
  $SelectorCopyWith<$Res>? get commentSelector;
  $CommentSelectorCopyWith<$Res>? get comments;
  $SelectorCopyWith<$Res>? get tag;
  $SelectorCopyWith<$Res>? get tagColor;
  $SelectorCopyWith<$Res>? get badgeSelector;
  $SelectorCopyWith<$Res>? get badgeText;
  $SelectorCopyWith<$Res>? get badgeCategory;
  $SelectorCopyWith<$Res>? get chapterSelector;
  $SelectorCopyWith<$Res>? get chapterTitle;
  $SelectorCopyWith<$Res>? get chapterSubtitle;
  $ImageSelectorCopyWith<$Res>? get chapterCover;
  $SelectorCopyWith<$Res>? get nextPage;
  $SelectorCopyWith<$Res>? get countPrePage;
}

/// @nodoc
class _$GalleryParserCopyWithImpl<$Res, $Val extends GalleryParser>
    implements $GalleryParserCopyWith<$Res> {
  _$GalleryParserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parserType = null,
    Object? name = null,
    Object? uuid = null,
    Object? extra = freezed,
    Object? title = freezed,
    Object? subtitle = freezed,
    Object? uploadTime = freezed,
    Object? star = freezed,
    Object? imgCount = freezed,
    Object? pageCount = freezed,
    Object? language = freezed,
    Object? coverImg = freezed,
    Object? description = freezed,
    Object? successSelector = freezed,
    Object? failedSelector = freezed,
    Object? thumbnailSelector = freezed,
    Object? thumbnail = freezed,
    Object? target = freezed,
    Object? commentSelector = freezed,
    Object? comments = freezed,
    Object? tag = freezed,
    Object? tagColor = freezed,
    Object? badgeSelector = freezed,
    Object? badgeText = freezed,
    Object? badgeCategory = freezed,
    Object? chapterSelector = freezed,
    Object? chapterTitle = freezed,
    Object? chapterSubtitle = freezed,
    Object? chapterCover = freezed,
    Object? nextPage = freezed,
    Object? countPrePage = freezed,
  }) {
    return _then(_value.copyWith(
      parserType: null == parserType
          ? _value.parserType
          : parserType // ignore: cast_nullable_to_non_nullable
              as ParserType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      extra: freezed == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as Iterable<ExtraSelector>?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as Selector?,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as Selector?,
      uploadTime: freezed == uploadTime
          ? _value.uploadTime
          : uploadTime // ignore: cast_nullable_to_non_nullable
              as Selector?,
      star: freezed == star
          ? _value.star
          : star // ignore: cast_nullable_to_non_nullable
              as Selector?,
      imgCount: freezed == imgCount
          ? _value.imgCount
          : imgCount // ignore: cast_nullable_to_non_nullable
              as Selector?,
      pageCount: freezed == pageCount
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as Selector?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as Selector?,
      coverImg: freezed == coverImg
          ? _value.coverImg
          : coverImg // ignore: cast_nullable_to_non_nullable
              as ImageSelector?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as Selector?,
      successSelector: freezed == successSelector
          ? _value.successSelector
          : successSelector // ignore: cast_nullable_to_non_nullable
              as Selector?,
      failedSelector: freezed == failedSelector
          ? _value.failedSelector
          : failedSelector // ignore: cast_nullable_to_non_nullable
              as Selector?,
      thumbnailSelector: freezed == thumbnailSelector
          ? _value.thumbnailSelector
          : thumbnailSelector // ignore: cast_nullable_to_non_nullable
              as Selector?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as ImageSelector?,
      target: freezed == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as Selector?,
      commentSelector: freezed == commentSelector
          ? _value.commentSelector
          : commentSelector // ignore: cast_nullable_to_non_nullable
              as Selector?,
      comments: freezed == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as CommentSelector?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as Selector?,
      tagColor: freezed == tagColor
          ? _value.tagColor
          : tagColor // ignore: cast_nullable_to_non_nullable
              as Selector?,
      badgeSelector: freezed == badgeSelector
          ? _value.badgeSelector
          : badgeSelector // ignore: cast_nullable_to_non_nullable
              as Selector?,
      badgeText: freezed == badgeText
          ? _value.badgeText
          : badgeText // ignore: cast_nullable_to_non_nullable
              as Selector?,
      badgeCategory: freezed == badgeCategory
          ? _value.badgeCategory
          : badgeCategory // ignore: cast_nullable_to_non_nullable
              as Selector?,
      chapterSelector: freezed == chapterSelector
          ? _value.chapterSelector
          : chapterSelector // ignore: cast_nullable_to_non_nullable
              as Selector?,
      chapterTitle: freezed == chapterTitle
          ? _value.chapterTitle
          : chapterTitle // ignore: cast_nullable_to_non_nullable
              as Selector?,
      chapterSubtitle: freezed == chapterSubtitle
          ? _value.chapterSubtitle
          : chapterSubtitle // ignore: cast_nullable_to_non_nullable
              as Selector?,
      chapterCover: freezed == chapterCover
          ? _value.chapterCover
          : chapterCover // ignore: cast_nullable_to_non_nullable
              as ImageSelector?,
      nextPage: freezed == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as Selector?,
      countPrePage: freezed == countPrePage
          ? _value.countPrePage
          : countPrePage // ignore: cast_nullable_to_non_nullable
              as Selector?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get title {
    if (_value.title == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.title!, (value) {
      return _then(_value.copyWith(title: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get subtitle {
    if (_value.subtitle == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.subtitle!, (value) {
      return _then(_value.copyWith(subtitle: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get uploadTime {
    if (_value.uploadTime == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.uploadTime!, (value) {
      return _then(_value.copyWith(uploadTime: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get star {
    if (_value.star == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.star!, (value) {
      return _then(_value.copyWith(star: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get imgCount {
    if (_value.imgCount == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.imgCount!, (value) {
      return _then(_value.copyWith(imgCount: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get pageCount {
    if (_value.pageCount == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.pageCount!, (value) {
      return _then(_value.copyWith(pageCount: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get language {
    if (_value.language == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.language!, (value) {
      return _then(_value.copyWith(language: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageSelectorCopyWith<$Res>? get coverImg {
    if (_value.coverImg == null) {
      return null;
    }

    return $ImageSelectorCopyWith<$Res>(_value.coverImg!, (value) {
      return _then(_value.copyWith(coverImg: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get description {
    if (_value.description == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.description!, (value) {
      return _then(_value.copyWith(description: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get successSelector {
    if (_value.successSelector == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.successSelector!, (value) {
      return _then(_value.copyWith(successSelector: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get failedSelector {
    if (_value.failedSelector == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.failedSelector!, (value) {
      return _then(_value.copyWith(failedSelector: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get thumbnailSelector {
    if (_value.thumbnailSelector == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.thumbnailSelector!, (value) {
      return _then(_value.copyWith(thumbnailSelector: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageSelectorCopyWith<$Res>? get thumbnail {
    if (_value.thumbnail == null) {
      return null;
    }

    return $ImageSelectorCopyWith<$Res>(_value.thumbnail!, (value) {
      return _then(_value.copyWith(thumbnail: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get target {
    if (_value.target == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.target!, (value) {
      return _then(_value.copyWith(target: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get commentSelector {
    if (_value.commentSelector == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.commentSelector!, (value) {
      return _then(_value.copyWith(commentSelector: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CommentSelectorCopyWith<$Res>? get comments {
    if (_value.comments == null) {
      return null;
    }

    return $CommentSelectorCopyWith<$Res>(_value.comments!, (value) {
      return _then(_value.copyWith(comments: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get tag {
    if (_value.tag == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.tag!, (value) {
      return _then(_value.copyWith(tag: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get tagColor {
    if (_value.tagColor == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.tagColor!, (value) {
      return _then(_value.copyWith(tagColor: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get badgeSelector {
    if (_value.badgeSelector == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.badgeSelector!, (value) {
      return _then(_value.copyWith(badgeSelector: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get badgeText {
    if (_value.badgeText == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.badgeText!, (value) {
      return _then(_value.copyWith(badgeText: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get badgeCategory {
    if (_value.badgeCategory == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.badgeCategory!, (value) {
      return _then(_value.copyWith(badgeCategory: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get chapterSelector {
    if (_value.chapterSelector == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.chapterSelector!, (value) {
      return _then(_value.copyWith(chapterSelector: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get chapterTitle {
    if (_value.chapterTitle == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.chapterTitle!, (value) {
      return _then(_value.copyWith(chapterTitle: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get chapterSubtitle {
    if (_value.chapterSubtitle == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.chapterSubtitle!, (value) {
      return _then(_value.copyWith(chapterSubtitle: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageSelectorCopyWith<$Res>? get chapterCover {
    if (_value.chapterCover == null) {
      return null;
    }

    return $ImageSelectorCopyWith<$Res>(_value.chapterCover!, (value) {
      return _then(_value.copyWith(chapterCover: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get nextPage {
    if (_value.nextPage == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.nextPage!, (value) {
      return _then(_value.copyWith(nextPage: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get countPrePage {
    if (_value.countPrePage == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.countPrePage!, (value) {
      return _then(_value.copyWith(countPrePage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_GalleryParserCopyWith<$Res>
    implements $GalleryParserCopyWith<$Res> {
  factory _$$_GalleryParserCopyWith(
          _$_GalleryParser value, $Res Function(_$_GalleryParser) then) =
      __$$_GalleryParserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(toJson: ParserType._toType, fromJson: ParserType._fromType)
          ParserType parserType,
      String name,
      String uuid,
      Iterable<ExtraSelector>? extra,
      Selector? title,
      Selector? subtitle,
      Selector? uploadTime,
      Selector? star,
      Selector? imgCount,
      Selector? pageCount,
      Selector? language,
      ImageSelector? coverImg,
      Selector? description,
      Selector? successSelector,
      Selector? failedSelector,
      Selector? thumbnailSelector,
      ImageSelector? thumbnail,
      Selector? target,
      Selector? commentSelector,
      CommentSelector? comments,
      Selector? tag,
      Selector? tagColor,
      Selector? badgeSelector,
      Selector? badgeText,
      Selector? badgeCategory,
      Selector? chapterSelector,
      Selector? chapterTitle,
      Selector? chapterSubtitle,
      ImageSelector? chapterCover,
      Selector? nextPage,
      Selector? countPrePage});

  @override
  $SelectorCopyWith<$Res>? get title;
  @override
  $SelectorCopyWith<$Res>? get subtitle;
  @override
  $SelectorCopyWith<$Res>? get uploadTime;
  @override
  $SelectorCopyWith<$Res>? get star;
  @override
  $SelectorCopyWith<$Res>? get imgCount;
  @override
  $SelectorCopyWith<$Res>? get pageCount;
  @override
  $SelectorCopyWith<$Res>? get language;
  @override
  $ImageSelectorCopyWith<$Res>? get coverImg;
  @override
  $SelectorCopyWith<$Res>? get description;
  @override
  $SelectorCopyWith<$Res>? get successSelector;
  @override
  $SelectorCopyWith<$Res>? get failedSelector;
  @override
  $SelectorCopyWith<$Res>? get thumbnailSelector;
  @override
  $ImageSelectorCopyWith<$Res>? get thumbnail;
  @override
  $SelectorCopyWith<$Res>? get target;
  @override
  $SelectorCopyWith<$Res>? get commentSelector;
  @override
  $CommentSelectorCopyWith<$Res>? get comments;
  @override
  $SelectorCopyWith<$Res>? get tag;
  @override
  $SelectorCopyWith<$Res>? get tagColor;
  @override
  $SelectorCopyWith<$Res>? get badgeSelector;
  @override
  $SelectorCopyWith<$Res>? get badgeText;
  @override
  $SelectorCopyWith<$Res>? get badgeCategory;
  @override
  $SelectorCopyWith<$Res>? get chapterSelector;
  @override
  $SelectorCopyWith<$Res>? get chapterTitle;
  @override
  $SelectorCopyWith<$Res>? get chapterSubtitle;
  @override
  $ImageSelectorCopyWith<$Res>? get chapterCover;
  @override
  $SelectorCopyWith<$Res>? get nextPage;
  @override
  $SelectorCopyWith<$Res>? get countPrePage;
}

/// @nodoc
class __$$_GalleryParserCopyWithImpl<$Res>
    extends _$GalleryParserCopyWithImpl<$Res, _$_GalleryParser>
    implements _$$_GalleryParserCopyWith<$Res> {
  __$$_GalleryParserCopyWithImpl(
      _$_GalleryParser _value, $Res Function(_$_GalleryParser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parserType = null,
    Object? name = null,
    Object? uuid = null,
    Object? extra = freezed,
    Object? title = freezed,
    Object? subtitle = freezed,
    Object? uploadTime = freezed,
    Object? star = freezed,
    Object? imgCount = freezed,
    Object? pageCount = freezed,
    Object? language = freezed,
    Object? coverImg = freezed,
    Object? description = freezed,
    Object? successSelector = freezed,
    Object? failedSelector = freezed,
    Object? thumbnailSelector = freezed,
    Object? thumbnail = freezed,
    Object? target = freezed,
    Object? commentSelector = freezed,
    Object? comments = freezed,
    Object? tag = freezed,
    Object? tagColor = freezed,
    Object? badgeSelector = freezed,
    Object? badgeText = freezed,
    Object? badgeCategory = freezed,
    Object? chapterSelector = freezed,
    Object? chapterTitle = freezed,
    Object? chapterSubtitle = freezed,
    Object? chapterCover = freezed,
    Object? nextPage = freezed,
    Object? countPrePage = freezed,
  }) {
    return _then(_$_GalleryParser(
      parserType: null == parserType
          ? _value.parserType
          : parserType // ignore: cast_nullable_to_non_nullable
              as ParserType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      extra: freezed == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as Iterable<ExtraSelector>?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as Selector?,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as Selector?,
      uploadTime: freezed == uploadTime
          ? _value.uploadTime
          : uploadTime // ignore: cast_nullable_to_non_nullable
              as Selector?,
      star: freezed == star
          ? _value.star
          : star // ignore: cast_nullable_to_non_nullable
              as Selector?,
      imgCount: freezed == imgCount
          ? _value.imgCount
          : imgCount // ignore: cast_nullable_to_non_nullable
              as Selector?,
      pageCount: freezed == pageCount
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as Selector?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as Selector?,
      coverImg: freezed == coverImg
          ? _value.coverImg
          : coverImg // ignore: cast_nullable_to_non_nullable
              as ImageSelector?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as Selector?,
      successSelector: freezed == successSelector
          ? _value.successSelector
          : successSelector // ignore: cast_nullable_to_non_nullable
              as Selector?,
      failedSelector: freezed == failedSelector
          ? _value.failedSelector
          : failedSelector // ignore: cast_nullable_to_non_nullable
              as Selector?,
      thumbnailSelector: freezed == thumbnailSelector
          ? _value.thumbnailSelector
          : thumbnailSelector // ignore: cast_nullable_to_non_nullable
              as Selector?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as ImageSelector?,
      target: freezed == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as Selector?,
      commentSelector: freezed == commentSelector
          ? _value.commentSelector
          : commentSelector // ignore: cast_nullable_to_non_nullable
              as Selector?,
      comments: freezed == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as CommentSelector?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as Selector?,
      tagColor: freezed == tagColor
          ? _value.tagColor
          : tagColor // ignore: cast_nullable_to_non_nullable
              as Selector?,
      badgeSelector: freezed == badgeSelector
          ? _value.badgeSelector
          : badgeSelector // ignore: cast_nullable_to_non_nullable
              as Selector?,
      badgeText: freezed == badgeText
          ? _value.badgeText
          : badgeText // ignore: cast_nullable_to_non_nullable
              as Selector?,
      badgeCategory: freezed == badgeCategory
          ? _value.badgeCategory
          : badgeCategory // ignore: cast_nullable_to_non_nullable
              as Selector?,
      chapterSelector: freezed == chapterSelector
          ? _value.chapterSelector
          : chapterSelector // ignore: cast_nullable_to_non_nullable
              as Selector?,
      chapterTitle: freezed == chapterTitle
          ? _value.chapterTitle
          : chapterTitle // ignore: cast_nullable_to_non_nullable
              as Selector?,
      chapterSubtitle: freezed == chapterSubtitle
          ? _value.chapterSubtitle
          : chapterSubtitle // ignore: cast_nullable_to_non_nullable
              as Selector?,
      chapterCover: freezed == chapterCover
          ? _value.chapterCover
          : chapterCover // ignore: cast_nullable_to_non_nullable
              as ImageSelector?,
      nextPage: freezed == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as Selector?,
      countPrePage: freezed == countPrePage
          ? _value.countPrePage
          : countPrePage // ignore: cast_nullable_to_non_nullable
              as Selector?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GalleryParser extends _GalleryParser {
  _$_GalleryParser(
      {@JsonKey(toJson: ParserType._toType, fromJson: ParserType._fromType)
          this.parserType = ParserType.gallery,
      required this.name,
      required this.uuid,
      this.extra = const [],
      this.title = const Selector(),
      this.subtitle = const Selector(),
      this.uploadTime = const Selector(),
      this.star = const Selector(),
      this.imgCount = const Selector(),
      this.pageCount = const Selector(),
      this.language = const Selector(),
      this.coverImg = const ImageSelector(),
      this.description = const Selector(),
      this.successSelector = const Selector(),
      this.failedSelector = const Selector(),
      this.thumbnailSelector = const Selector(),
      this.thumbnail = const ImageSelector(),
      this.target = const Selector(),
      this.commentSelector = const Selector(),
      this.comments = const CommentSelector(),
      this.tag = const Selector(),
      this.tagColor = const Selector(),
      this.badgeSelector = const Selector(),
      this.badgeText = const Selector(),
      this.badgeCategory = const Selector(),
      this.chapterSelector = const Selector(),
      this.chapterTitle = const Selector(),
      this.chapterSubtitle = const Selector(),
      this.chapterCover = const ImageSelector(),
      this.nextPage = const Selector(),
      this.countPrePage = const Selector()})
      : assert(parserType == ParserType.gallery, 'parserType must be gallery'),
        super._();

  factory _$_GalleryParser.fromJson(Map<String, dynamic> json) =>
      _$$_GalleryParserFromJson(json);

  @override
  @JsonKey(toJson: ParserType._toType, fromJson: ParserType._fromType)
  final ParserType parserType;
  @override
  final String name;
  @override
  final String uuid;
  @override
  @JsonKey()
  final Iterable<ExtraSelector>? extra;
  @override
  @JsonKey()
  final Selector? title;
  @override
  @JsonKey()
  final Selector? subtitle;
  @override
  @JsonKey()
  final Selector? uploadTime;
  @override
  @JsonKey()
  final Selector? star;
  @override
  @JsonKey()
  final Selector? imgCount;
  @override
  @JsonKey()
  final Selector? pageCount;
  @override
  @JsonKey()
  final Selector? language;
  @override
  @JsonKey()
  final ImageSelector? coverImg;
  @override
  @JsonKey()
  final Selector? description;
  @override
  @JsonKey()
  final Selector? successSelector;
  @override
  @JsonKey()
  final Selector? failedSelector;
  @override
  @JsonKey()
  final Selector? thumbnailSelector;
  @override
  @JsonKey()
  final ImageSelector? thumbnail;
  @override
  @JsonKey()
  final Selector? target;
  @override
  @JsonKey()
  final Selector? commentSelector;
  @override
  @JsonKey()
  final CommentSelector? comments;
  @override
  @JsonKey()
  final Selector? tag;
  @override
  @JsonKey()
  final Selector? tagColor;
  @override
  @JsonKey()
  final Selector? badgeSelector;
  @override
  @JsonKey()
  final Selector? badgeText;
  @override
  @JsonKey()
  final Selector? badgeCategory;
  @override
  @JsonKey()
  final Selector? chapterSelector;
  @override
  @JsonKey()
  final Selector? chapterTitle;
  @override
  @JsonKey()
  final Selector? chapterSubtitle;
  @override
  @JsonKey()
  final ImageSelector? chapterCover;
  @override
  @JsonKey()
  final Selector? nextPage;
  @override
  @JsonKey()
  final Selector? countPrePage;

  @override
  String toString() {
    return 'GalleryParser(parserType: $parserType, name: $name, uuid: $uuid, extra: $extra, title: $title, subtitle: $subtitle, uploadTime: $uploadTime, star: $star, imgCount: $imgCount, pageCount: $pageCount, language: $language, coverImg: $coverImg, description: $description, successSelector: $successSelector, failedSelector: $failedSelector, thumbnailSelector: $thumbnailSelector, thumbnail: $thumbnail, target: $target, commentSelector: $commentSelector, comments: $comments, tag: $tag, tagColor: $tagColor, badgeSelector: $badgeSelector, badgeText: $badgeText, badgeCategory: $badgeCategory, chapterSelector: $chapterSelector, chapterTitle: $chapterTitle, chapterSubtitle: $chapterSubtitle, chapterCover: $chapterCover, nextPage: $nextPage, countPrePage: $countPrePage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GalleryParser &&
            (identical(other.parserType, parserType) ||
                other.parserType == parserType) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            const DeepCollectionEquality().equals(other.extra, extra) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.uploadTime, uploadTime) ||
                other.uploadTime == uploadTime) &&
            (identical(other.star, star) || other.star == star) &&
            (identical(other.imgCount, imgCount) ||
                other.imgCount == imgCount) &&
            (identical(other.pageCount, pageCount) ||
                other.pageCount == pageCount) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.coverImg, coverImg) ||
                other.coverImg == coverImg) &&
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
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.tagColor, tagColor) ||
                other.tagColor == tagColor) &&
            (identical(other.badgeSelector, badgeSelector) ||
                other.badgeSelector == badgeSelector) &&
            (identical(other.badgeText, badgeText) ||
                other.badgeText == badgeText) &&
            (identical(other.badgeCategory, badgeCategory) ||
                other.badgeCategory == badgeCategory) &&
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
        parserType,
        name,
        uuid,
        const DeepCollectionEquality().hash(extra),
        title,
        subtitle,
        uploadTime,
        star,
        imgCount,
        pageCount,
        language,
        coverImg,
        description,
        successSelector,
        failedSelector,
        thumbnailSelector,
        thumbnail,
        target,
        commentSelector,
        comments,
        tag,
        tagColor,
        badgeSelector,
        badgeText,
        badgeCategory,
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
  _$$_GalleryParserCopyWith<_$_GalleryParser> get copyWith =>
      __$$_GalleryParserCopyWithImpl<_$_GalleryParser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GalleryParserToJson(
      this,
    );
  }
}

abstract class _GalleryParser extends GalleryParser {
  factory _GalleryParser(
      {@JsonKey(toJson: ParserType._toType, fromJson: ParserType._fromType)
          final ParserType parserType,
      required final String name,
      required final String uuid,
      final Iterable<ExtraSelector>? extra,
      final Selector? title,
      final Selector? subtitle,
      final Selector? uploadTime,
      final Selector? star,
      final Selector? imgCount,
      final Selector? pageCount,
      final Selector? language,
      final ImageSelector? coverImg,
      final Selector? description,
      final Selector? successSelector,
      final Selector? failedSelector,
      final Selector? thumbnailSelector,
      final ImageSelector? thumbnail,
      final Selector? target,
      final Selector? commentSelector,
      final CommentSelector? comments,
      final Selector? tag,
      final Selector? tagColor,
      final Selector? badgeSelector,
      final Selector? badgeText,
      final Selector? badgeCategory,
      final Selector? chapterSelector,
      final Selector? chapterTitle,
      final Selector? chapterSubtitle,
      final ImageSelector? chapterCover,
      final Selector? nextPage,
      final Selector? countPrePage}) = _$_GalleryParser;
  _GalleryParser._() : super._();

  factory _GalleryParser.fromJson(Map<String, dynamic> json) =
      _$_GalleryParser.fromJson;

  @override
  @JsonKey(toJson: ParserType._toType, fromJson: ParserType._fromType)
  ParserType get parserType;
  @override
  String get name;
  @override
  String get uuid;
  @override
  Iterable<ExtraSelector>? get extra;
  @override
  Selector? get title;
  @override
  Selector? get subtitle;
  @override
  Selector? get uploadTime;
  @override
  Selector? get star;
  @override
  Selector? get imgCount;
  @override
  Selector? get pageCount;
  @override
  Selector? get language;
  @override
  ImageSelector? get coverImg;
  @override
  Selector? get description;
  @override
  Selector? get successSelector;
  @override
  Selector? get failedSelector;
  @override
  Selector? get thumbnailSelector;
  @override
  ImageSelector? get thumbnail;
  @override
  Selector? get target;
  @override
  Selector? get commentSelector;
  @override
  CommentSelector? get comments;
  @override
  Selector? get tag;
  @override
  Selector? get tagColor;
  @override
  Selector? get badgeSelector;
  @override
  Selector? get badgeText;
  @override
  Selector? get badgeCategory;
  @override
  Selector? get chapterSelector;
  @override
  Selector? get chapterTitle;
  @override
  Selector? get chapterSubtitle;
  @override
  ImageSelector? get chapterCover;
  @override
  Selector? get nextPage;
  @override
  Selector? get countPrePage;
  @override
  @JsonKey(ignore: true)
  _$$_GalleryParserCopyWith<_$_GalleryParser> get copyWith =>
      throw _privateConstructorUsedError;
}

ListViewParser _$ListViewParserFromJson(Map<String, dynamic> json) {
  return _ListViewParser.fromJson(json);
}

/// @nodoc
mixin _$ListViewParser {
  @JsonKey(toJson: ParserType._toType, fromJson: ParserType._fromType)
  ParserType get parserType => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  Iterable<ExtraSelector>? get extra => throw _privateConstructorUsedError;
  Selector? get itemSelector => throw _privateConstructorUsedError;
  Selector? get successSelector => throw _privateConstructorUsedError;
  Selector? get failedSelector => throw _privateConstructorUsedError;
  Selector? get title => throw _privateConstructorUsedError;
  Selector? get subtitle => throw _privateConstructorUsedError;
  Selector? get uploadTime => throw _privateConstructorUsedError;
  Selector? get star => throw _privateConstructorUsedError;
  Selector? get imgCount => throw _privateConstructorUsedError;
  Selector? get language => throw _privateConstructorUsedError;
  ImageSelector? get previewImg => throw _privateConstructorUsedError;
  Selector? get target => throw _privateConstructorUsedError;
  Selector? get tag => throw _privateConstructorUsedError;
  Selector? get tagColor => throw _privateConstructorUsedError;
  Selector? get badgeSelector => throw _privateConstructorUsedError;
  Selector? get badgeText => throw _privateConstructorUsedError;
  Selector? get badgeColor => throw _privateConstructorUsedError;
  Selector? get paper => throw _privateConstructorUsedError;
  Selector? get idCode => throw _privateConstructorUsedError;
  Selector? get nextPage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListViewParserCopyWith<ListViewParser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListViewParserCopyWith<$Res> {
  factory $ListViewParserCopyWith(
          ListViewParser value, $Res Function(ListViewParser) then) =
      _$ListViewParserCopyWithImpl<$Res, ListViewParser>;
  @useResult
  $Res call(
      {@JsonKey(toJson: ParserType._toType, fromJson: ParserType._fromType)
          ParserType parserType,
      String name,
      String uuid,
      Iterable<ExtraSelector>? extra,
      Selector? itemSelector,
      Selector? successSelector,
      Selector? failedSelector,
      Selector? title,
      Selector? subtitle,
      Selector? uploadTime,
      Selector? star,
      Selector? imgCount,
      Selector? language,
      ImageSelector? previewImg,
      Selector? target,
      Selector? tag,
      Selector? tagColor,
      Selector? badgeSelector,
      Selector? badgeText,
      Selector? badgeColor,
      Selector? paper,
      Selector? idCode,
      Selector? nextPage});

  $SelectorCopyWith<$Res>? get itemSelector;
  $SelectorCopyWith<$Res>? get successSelector;
  $SelectorCopyWith<$Res>? get failedSelector;
  $SelectorCopyWith<$Res>? get title;
  $SelectorCopyWith<$Res>? get subtitle;
  $SelectorCopyWith<$Res>? get uploadTime;
  $SelectorCopyWith<$Res>? get star;
  $SelectorCopyWith<$Res>? get imgCount;
  $SelectorCopyWith<$Res>? get language;
  $ImageSelectorCopyWith<$Res>? get previewImg;
  $SelectorCopyWith<$Res>? get target;
  $SelectorCopyWith<$Res>? get tag;
  $SelectorCopyWith<$Res>? get tagColor;
  $SelectorCopyWith<$Res>? get badgeSelector;
  $SelectorCopyWith<$Res>? get badgeText;
  $SelectorCopyWith<$Res>? get badgeColor;
  $SelectorCopyWith<$Res>? get paper;
  $SelectorCopyWith<$Res>? get idCode;
  $SelectorCopyWith<$Res>? get nextPage;
}

/// @nodoc
class _$ListViewParserCopyWithImpl<$Res, $Val extends ListViewParser>
    implements $ListViewParserCopyWith<$Res> {
  _$ListViewParserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parserType = null,
    Object? name = null,
    Object? uuid = null,
    Object? extra = freezed,
    Object? itemSelector = freezed,
    Object? successSelector = freezed,
    Object? failedSelector = freezed,
    Object? title = freezed,
    Object? subtitle = freezed,
    Object? uploadTime = freezed,
    Object? star = freezed,
    Object? imgCount = freezed,
    Object? language = freezed,
    Object? previewImg = freezed,
    Object? target = freezed,
    Object? tag = freezed,
    Object? tagColor = freezed,
    Object? badgeSelector = freezed,
    Object? badgeText = freezed,
    Object? badgeColor = freezed,
    Object? paper = freezed,
    Object? idCode = freezed,
    Object? nextPage = freezed,
  }) {
    return _then(_value.copyWith(
      parserType: null == parserType
          ? _value.parserType
          : parserType // ignore: cast_nullable_to_non_nullable
              as ParserType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      extra: freezed == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as Iterable<ExtraSelector>?,
      itemSelector: freezed == itemSelector
          ? _value.itemSelector
          : itemSelector // ignore: cast_nullable_to_non_nullable
              as Selector?,
      successSelector: freezed == successSelector
          ? _value.successSelector
          : successSelector // ignore: cast_nullable_to_non_nullable
              as Selector?,
      failedSelector: freezed == failedSelector
          ? _value.failedSelector
          : failedSelector // ignore: cast_nullable_to_non_nullable
              as Selector?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as Selector?,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as Selector?,
      uploadTime: freezed == uploadTime
          ? _value.uploadTime
          : uploadTime // ignore: cast_nullable_to_non_nullable
              as Selector?,
      star: freezed == star
          ? _value.star
          : star // ignore: cast_nullable_to_non_nullable
              as Selector?,
      imgCount: freezed == imgCount
          ? _value.imgCount
          : imgCount // ignore: cast_nullable_to_non_nullable
              as Selector?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as Selector?,
      previewImg: freezed == previewImg
          ? _value.previewImg
          : previewImg // ignore: cast_nullable_to_non_nullable
              as ImageSelector?,
      target: freezed == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as Selector?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as Selector?,
      tagColor: freezed == tagColor
          ? _value.tagColor
          : tagColor // ignore: cast_nullable_to_non_nullable
              as Selector?,
      badgeSelector: freezed == badgeSelector
          ? _value.badgeSelector
          : badgeSelector // ignore: cast_nullable_to_non_nullable
              as Selector?,
      badgeText: freezed == badgeText
          ? _value.badgeText
          : badgeText // ignore: cast_nullable_to_non_nullable
              as Selector?,
      badgeColor: freezed == badgeColor
          ? _value.badgeColor
          : badgeColor // ignore: cast_nullable_to_non_nullable
              as Selector?,
      paper: freezed == paper
          ? _value.paper
          : paper // ignore: cast_nullable_to_non_nullable
              as Selector?,
      idCode: freezed == idCode
          ? _value.idCode
          : idCode // ignore: cast_nullable_to_non_nullable
              as Selector?,
      nextPage: freezed == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as Selector?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get itemSelector {
    if (_value.itemSelector == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.itemSelector!, (value) {
      return _then(_value.copyWith(itemSelector: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get successSelector {
    if (_value.successSelector == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.successSelector!, (value) {
      return _then(_value.copyWith(successSelector: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get failedSelector {
    if (_value.failedSelector == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.failedSelector!, (value) {
      return _then(_value.copyWith(failedSelector: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get title {
    if (_value.title == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.title!, (value) {
      return _then(_value.copyWith(title: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get subtitle {
    if (_value.subtitle == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.subtitle!, (value) {
      return _then(_value.copyWith(subtitle: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get uploadTime {
    if (_value.uploadTime == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.uploadTime!, (value) {
      return _then(_value.copyWith(uploadTime: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get star {
    if (_value.star == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.star!, (value) {
      return _then(_value.copyWith(star: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get imgCount {
    if (_value.imgCount == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.imgCount!, (value) {
      return _then(_value.copyWith(imgCount: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get language {
    if (_value.language == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.language!, (value) {
      return _then(_value.copyWith(language: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageSelectorCopyWith<$Res>? get previewImg {
    if (_value.previewImg == null) {
      return null;
    }

    return $ImageSelectorCopyWith<$Res>(_value.previewImg!, (value) {
      return _then(_value.copyWith(previewImg: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get target {
    if (_value.target == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.target!, (value) {
      return _then(_value.copyWith(target: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get tag {
    if (_value.tag == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.tag!, (value) {
      return _then(_value.copyWith(tag: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get tagColor {
    if (_value.tagColor == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.tagColor!, (value) {
      return _then(_value.copyWith(tagColor: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get badgeSelector {
    if (_value.badgeSelector == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.badgeSelector!, (value) {
      return _then(_value.copyWith(badgeSelector: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get badgeText {
    if (_value.badgeText == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.badgeText!, (value) {
      return _then(_value.copyWith(badgeText: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get badgeColor {
    if (_value.badgeColor == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.badgeColor!, (value) {
      return _then(_value.copyWith(badgeColor: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get paper {
    if (_value.paper == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.paper!, (value) {
      return _then(_value.copyWith(paper: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get idCode {
    if (_value.idCode == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.idCode!, (value) {
      return _then(_value.copyWith(idCode: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get nextPage {
    if (_value.nextPage == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.nextPage!, (value) {
      return _then(_value.copyWith(nextPage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ListViewParserCopyWith<$Res>
    implements $ListViewParserCopyWith<$Res> {
  factory _$$_ListViewParserCopyWith(
          _$_ListViewParser value, $Res Function(_$_ListViewParser) then) =
      __$$_ListViewParserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(toJson: ParserType._toType, fromJson: ParserType._fromType)
          ParserType parserType,
      String name,
      String uuid,
      Iterable<ExtraSelector>? extra,
      Selector? itemSelector,
      Selector? successSelector,
      Selector? failedSelector,
      Selector? title,
      Selector? subtitle,
      Selector? uploadTime,
      Selector? star,
      Selector? imgCount,
      Selector? language,
      ImageSelector? previewImg,
      Selector? target,
      Selector? tag,
      Selector? tagColor,
      Selector? badgeSelector,
      Selector? badgeText,
      Selector? badgeColor,
      Selector? paper,
      Selector? idCode,
      Selector? nextPage});

  @override
  $SelectorCopyWith<$Res>? get itemSelector;
  @override
  $SelectorCopyWith<$Res>? get successSelector;
  @override
  $SelectorCopyWith<$Res>? get failedSelector;
  @override
  $SelectorCopyWith<$Res>? get title;
  @override
  $SelectorCopyWith<$Res>? get subtitle;
  @override
  $SelectorCopyWith<$Res>? get uploadTime;
  @override
  $SelectorCopyWith<$Res>? get star;
  @override
  $SelectorCopyWith<$Res>? get imgCount;
  @override
  $SelectorCopyWith<$Res>? get language;
  @override
  $ImageSelectorCopyWith<$Res>? get previewImg;
  @override
  $SelectorCopyWith<$Res>? get target;
  @override
  $SelectorCopyWith<$Res>? get tag;
  @override
  $SelectorCopyWith<$Res>? get tagColor;
  @override
  $SelectorCopyWith<$Res>? get badgeSelector;
  @override
  $SelectorCopyWith<$Res>? get badgeText;
  @override
  $SelectorCopyWith<$Res>? get badgeColor;
  @override
  $SelectorCopyWith<$Res>? get paper;
  @override
  $SelectorCopyWith<$Res>? get idCode;
  @override
  $SelectorCopyWith<$Res>? get nextPage;
}

/// @nodoc
class __$$_ListViewParserCopyWithImpl<$Res>
    extends _$ListViewParserCopyWithImpl<$Res, _$_ListViewParser>
    implements _$$_ListViewParserCopyWith<$Res> {
  __$$_ListViewParserCopyWithImpl(
      _$_ListViewParser _value, $Res Function(_$_ListViewParser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parserType = null,
    Object? name = null,
    Object? uuid = null,
    Object? extra = freezed,
    Object? itemSelector = freezed,
    Object? successSelector = freezed,
    Object? failedSelector = freezed,
    Object? title = freezed,
    Object? subtitle = freezed,
    Object? uploadTime = freezed,
    Object? star = freezed,
    Object? imgCount = freezed,
    Object? language = freezed,
    Object? previewImg = freezed,
    Object? target = freezed,
    Object? tag = freezed,
    Object? tagColor = freezed,
    Object? badgeSelector = freezed,
    Object? badgeText = freezed,
    Object? badgeColor = freezed,
    Object? paper = freezed,
    Object? idCode = freezed,
    Object? nextPage = freezed,
  }) {
    return _then(_$_ListViewParser(
      parserType: null == parserType
          ? _value.parserType
          : parserType // ignore: cast_nullable_to_non_nullable
              as ParserType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      extra: freezed == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as Iterable<ExtraSelector>?,
      itemSelector: freezed == itemSelector
          ? _value.itemSelector
          : itemSelector // ignore: cast_nullable_to_non_nullable
              as Selector?,
      successSelector: freezed == successSelector
          ? _value.successSelector
          : successSelector // ignore: cast_nullable_to_non_nullable
              as Selector?,
      failedSelector: freezed == failedSelector
          ? _value.failedSelector
          : failedSelector // ignore: cast_nullable_to_non_nullable
              as Selector?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as Selector?,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as Selector?,
      uploadTime: freezed == uploadTime
          ? _value.uploadTime
          : uploadTime // ignore: cast_nullable_to_non_nullable
              as Selector?,
      star: freezed == star
          ? _value.star
          : star // ignore: cast_nullable_to_non_nullable
              as Selector?,
      imgCount: freezed == imgCount
          ? _value.imgCount
          : imgCount // ignore: cast_nullable_to_non_nullable
              as Selector?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as Selector?,
      previewImg: freezed == previewImg
          ? _value.previewImg
          : previewImg // ignore: cast_nullable_to_non_nullable
              as ImageSelector?,
      target: freezed == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as Selector?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as Selector?,
      tagColor: freezed == tagColor
          ? _value.tagColor
          : tagColor // ignore: cast_nullable_to_non_nullable
              as Selector?,
      badgeSelector: freezed == badgeSelector
          ? _value.badgeSelector
          : badgeSelector // ignore: cast_nullable_to_non_nullable
              as Selector?,
      badgeText: freezed == badgeText
          ? _value.badgeText
          : badgeText // ignore: cast_nullable_to_non_nullable
              as Selector?,
      badgeColor: freezed == badgeColor
          ? _value.badgeColor
          : badgeColor // ignore: cast_nullable_to_non_nullable
              as Selector?,
      paper: freezed == paper
          ? _value.paper
          : paper // ignore: cast_nullable_to_non_nullable
              as Selector?,
      idCode: freezed == idCode
          ? _value.idCode
          : idCode // ignore: cast_nullable_to_non_nullable
              as Selector?,
      nextPage: freezed == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as Selector?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ListViewParser extends _ListViewParser {
  _$_ListViewParser(
      {@JsonKey(toJson: ParserType._toType, fromJson: ParserType._fromType)
          this.parserType = ParserType.listView,
      required this.name,
      required this.uuid,
      this.extra = const [],
      this.itemSelector = const Selector(),
      this.successSelector = const Selector(),
      this.failedSelector = const Selector(),
      this.title = const Selector(),
      this.subtitle = const Selector(),
      this.uploadTime = const Selector(),
      this.star = const Selector(),
      this.imgCount = const Selector(),
      this.language = const Selector(),
      this.previewImg = const ImageSelector(),
      this.target = const Selector(),
      this.tag = const Selector(),
      this.tagColor = const Selector(),
      this.badgeSelector = const Selector(),
      this.badgeText = const Selector(),
      this.badgeColor = const Selector(),
      this.paper = const Selector(),
      this.idCode = const Selector(),
      this.nextPage = const Selector()})
      : assert(
            parserType == ParserType.listView, 'parserType must be listView'),
        super._();

  factory _$_ListViewParser.fromJson(Map<String, dynamic> json) =>
      _$$_ListViewParserFromJson(json);

  @override
  @JsonKey(toJson: ParserType._toType, fromJson: ParserType._fromType)
  final ParserType parserType;
  @override
  final String name;
  @override
  final String uuid;
  @override
  @JsonKey()
  final Iterable<ExtraSelector>? extra;
  @override
  @JsonKey()
  final Selector? itemSelector;
  @override
  @JsonKey()
  final Selector? successSelector;
  @override
  @JsonKey()
  final Selector? failedSelector;
  @override
  @JsonKey()
  final Selector? title;
  @override
  @JsonKey()
  final Selector? subtitle;
  @override
  @JsonKey()
  final Selector? uploadTime;
  @override
  @JsonKey()
  final Selector? star;
  @override
  @JsonKey()
  final Selector? imgCount;
  @override
  @JsonKey()
  final Selector? language;
  @override
  @JsonKey()
  final ImageSelector? previewImg;
  @override
  @JsonKey()
  final Selector? target;
  @override
  @JsonKey()
  final Selector? tag;
  @override
  @JsonKey()
  final Selector? tagColor;
  @override
  @JsonKey()
  final Selector? badgeSelector;
  @override
  @JsonKey()
  final Selector? badgeText;
  @override
  @JsonKey()
  final Selector? badgeColor;
  @override
  @JsonKey()
  final Selector? paper;
  @override
  @JsonKey()
  final Selector? idCode;
  @override
  @JsonKey()
  final Selector? nextPage;

  @override
  String toString() {
    return 'ListViewParser(parserType: $parserType, name: $name, uuid: $uuid, extra: $extra, itemSelector: $itemSelector, successSelector: $successSelector, failedSelector: $failedSelector, title: $title, subtitle: $subtitle, uploadTime: $uploadTime, star: $star, imgCount: $imgCount, language: $language, previewImg: $previewImg, target: $target, tag: $tag, tagColor: $tagColor, badgeSelector: $badgeSelector, badgeText: $badgeText, badgeColor: $badgeColor, paper: $paper, idCode: $idCode, nextPage: $nextPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListViewParser &&
            (identical(other.parserType, parserType) ||
                other.parserType == parserType) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            const DeepCollectionEquality().equals(other.extra, extra) &&
            (identical(other.itemSelector, itemSelector) ||
                other.itemSelector == itemSelector) &&
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
            (identical(other.imgCount, imgCount) ||
                other.imgCount == imgCount) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.previewImg, previewImg) ||
                other.previewImg == previewImg) &&
            (identical(other.target, target) || other.target == target) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.tagColor, tagColor) ||
                other.tagColor == tagColor) &&
            (identical(other.badgeSelector, badgeSelector) ||
                other.badgeSelector == badgeSelector) &&
            (identical(other.badgeText, badgeText) ||
                other.badgeText == badgeText) &&
            (identical(other.badgeColor, badgeColor) ||
                other.badgeColor == badgeColor) &&
            (identical(other.paper, paper) || other.paper == paper) &&
            (identical(other.idCode, idCode) || other.idCode == idCode) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        parserType,
        name,
        uuid,
        const DeepCollectionEquality().hash(extra),
        itemSelector,
        successSelector,
        failedSelector,
        title,
        subtitle,
        uploadTime,
        star,
        imgCount,
        language,
        previewImg,
        target,
        tag,
        tagColor,
        badgeSelector,
        badgeText,
        badgeColor,
        paper,
        idCode,
        nextPage
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ListViewParserCopyWith<_$_ListViewParser> get copyWith =>
      __$$_ListViewParserCopyWithImpl<_$_ListViewParser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ListViewParserToJson(
      this,
    );
  }
}

abstract class _ListViewParser extends ListViewParser {
  factory _ListViewParser(
      {@JsonKey(toJson: ParserType._toType, fromJson: ParserType._fromType)
          final ParserType parserType,
      required final String name,
      required final String uuid,
      final Iterable<ExtraSelector>? extra,
      final Selector? itemSelector,
      final Selector? successSelector,
      final Selector? failedSelector,
      final Selector? title,
      final Selector? subtitle,
      final Selector? uploadTime,
      final Selector? star,
      final Selector? imgCount,
      final Selector? language,
      final ImageSelector? previewImg,
      final Selector? target,
      final Selector? tag,
      final Selector? tagColor,
      final Selector? badgeSelector,
      final Selector? badgeText,
      final Selector? badgeColor,
      final Selector? paper,
      final Selector? idCode,
      final Selector? nextPage}) = _$_ListViewParser;
  _ListViewParser._() : super._();

  factory _ListViewParser.fromJson(Map<String, dynamic> json) =
      _$_ListViewParser.fromJson;

  @override
  @JsonKey(toJson: ParserType._toType, fromJson: ParserType._fromType)
  ParserType get parserType;
  @override
  String get name;
  @override
  String get uuid;
  @override
  Iterable<ExtraSelector>? get extra;
  @override
  Selector? get itemSelector;
  @override
  Selector? get successSelector;
  @override
  Selector? get failedSelector;
  @override
  Selector? get title;
  @override
  Selector? get subtitle;
  @override
  Selector? get uploadTime;
  @override
  Selector? get star;
  @override
  Selector? get imgCount;
  @override
  Selector? get language;
  @override
  ImageSelector? get previewImg;
  @override
  Selector? get target;
  @override
  Selector? get tag;
  @override
  Selector? get tagColor;
  @override
  Selector? get badgeSelector;
  @override
  Selector? get badgeText;
  @override
  Selector? get badgeColor;
  @override
  Selector? get paper;
  @override
  Selector? get idCode;
  @override
  Selector? get nextPage;
  @override
  @JsonKey(ignore: true)
  _$$_ListViewParserCopyWith<_$_ListViewParser> get copyWith =>
      throw _privateConstructorUsedError;
}

AutoCompleteParser _$AutoCompleteParserFromJson(Map<String, dynamic> json) {
  return _AutoCompleteParser.fromJson(json);
}

/// @nodoc
mixin _$AutoCompleteParser {
  @JsonKey(toJson: ParserType._toType, fromJson: ParserType._fromType)
  ParserType get parserType => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  Iterable<ExtraSelector>? get extra => throw _privateConstructorUsedError;
  Selector? get itemSelector => throw _privateConstructorUsedError;
  Selector? get itemComplete => throw _privateConstructorUsedError;
  Selector? get itemTitle => throw _privateConstructorUsedError;
  Selector? get itemSubtitle => throw _privateConstructorUsedError;
  Selector? get successSelector => throw _privateConstructorUsedError;
  Selector? get failedSelector => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AutoCompleteParserCopyWith<AutoCompleteParser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AutoCompleteParserCopyWith<$Res> {
  factory $AutoCompleteParserCopyWith(
          AutoCompleteParser value, $Res Function(AutoCompleteParser) then) =
      _$AutoCompleteParserCopyWithImpl<$Res, AutoCompleteParser>;
  @useResult
  $Res call(
      {@JsonKey(toJson: ParserType._toType, fromJson: ParserType._fromType)
          ParserType parserType,
      String name,
      String uuid,
      Iterable<ExtraSelector>? extra,
      Selector? itemSelector,
      Selector? itemComplete,
      Selector? itemTitle,
      Selector? itemSubtitle,
      Selector? successSelector,
      Selector? failedSelector});

  $SelectorCopyWith<$Res>? get itemSelector;
  $SelectorCopyWith<$Res>? get itemComplete;
  $SelectorCopyWith<$Res>? get itemTitle;
  $SelectorCopyWith<$Res>? get itemSubtitle;
  $SelectorCopyWith<$Res>? get successSelector;
  $SelectorCopyWith<$Res>? get failedSelector;
}

/// @nodoc
class _$AutoCompleteParserCopyWithImpl<$Res, $Val extends AutoCompleteParser>
    implements $AutoCompleteParserCopyWith<$Res> {
  _$AutoCompleteParserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parserType = null,
    Object? name = null,
    Object? uuid = null,
    Object? extra = freezed,
    Object? itemSelector = freezed,
    Object? itemComplete = freezed,
    Object? itemTitle = freezed,
    Object? itemSubtitle = freezed,
    Object? successSelector = freezed,
    Object? failedSelector = freezed,
  }) {
    return _then(_value.copyWith(
      parserType: null == parserType
          ? _value.parserType
          : parserType // ignore: cast_nullable_to_non_nullable
              as ParserType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      extra: freezed == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as Iterable<ExtraSelector>?,
      itemSelector: freezed == itemSelector
          ? _value.itemSelector
          : itemSelector // ignore: cast_nullable_to_non_nullable
              as Selector?,
      itemComplete: freezed == itemComplete
          ? _value.itemComplete
          : itemComplete // ignore: cast_nullable_to_non_nullable
              as Selector?,
      itemTitle: freezed == itemTitle
          ? _value.itemTitle
          : itemTitle // ignore: cast_nullable_to_non_nullable
              as Selector?,
      itemSubtitle: freezed == itemSubtitle
          ? _value.itemSubtitle
          : itemSubtitle // ignore: cast_nullable_to_non_nullable
              as Selector?,
      successSelector: freezed == successSelector
          ? _value.successSelector
          : successSelector // ignore: cast_nullable_to_non_nullable
              as Selector?,
      failedSelector: freezed == failedSelector
          ? _value.failedSelector
          : failedSelector // ignore: cast_nullable_to_non_nullable
              as Selector?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get itemSelector {
    if (_value.itemSelector == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.itemSelector!, (value) {
      return _then(_value.copyWith(itemSelector: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get itemComplete {
    if (_value.itemComplete == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.itemComplete!, (value) {
      return _then(_value.copyWith(itemComplete: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get itemTitle {
    if (_value.itemTitle == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.itemTitle!, (value) {
      return _then(_value.copyWith(itemTitle: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get itemSubtitle {
    if (_value.itemSubtitle == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.itemSubtitle!, (value) {
      return _then(_value.copyWith(itemSubtitle: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get successSelector {
    if (_value.successSelector == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.successSelector!, (value) {
      return _then(_value.copyWith(successSelector: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res>? get failedSelector {
    if (_value.failedSelector == null) {
      return null;
    }

    return $SelectorCopyWith<$Res>(_value.failedSelector!, (value) {
      return _then(_value.copyWith(failedSelector: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AutoCompleteParserCopyWith<$Res>
    implements $AutoCompleteParserCopyWith<$Res> {
  factory _$$_AutoCompleteParserCopyWith(_$_AutoCompleteParser value,
          $Res Function(_$_AutoCompleteParser) then) =
      __$$_AutoCompleteParserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(toJson: ParserType._toType, fromJson: ParserType._fromType)
          ParserType parserType,
      String name,
      String uuid,
      Iterable<ExtraSelector>? extra,
      Selector? itemSelector,
      Selector? itemComplete,
      Selector? itemTitle,
      Selector? itemSubtitle,
      Selector? successSelector,
      Selector? failedSelector});

  @override
  $SelectorCopyWith<$Res>? get itemSelector;
  @override
  $SelectorCopyWith<$Res>? get itemComplete;
  @override
  $SelectorCopyWith<$Res>? get itemTitle;
  @override
  $SelectorCopyWith<$Res>? get itemSubtitle;
  @override
  $SelectorCopyWith<$Res>? get successSelector;
  @override
  $SelectorCopyWith<$Res>? get failedSelector;
}

/// @nodoc
class __$$_AutoCompleteParserCopyWithImpl<$Res>
    extends _$AutoCompleteParserCopyWithImpl<$Res, _$_AutoCompleteParser>
    implements _$$_AutoCompleteParserCopyWith<$Res> {
  __$$_AutoCompleteParserCopyWithImpl(
      _$_AutoCompleteParser _value, $Res Function(_$_AutoCompleteParser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parserType = null,
    Object? name = null,
    Object? uuid = null,
    Object? extra = freezed,
    Object? itemSelector = freezed,
    Object? itemComplete = freezed,
    Object? itemTitle = freezed,
    Object? itemSubtitle = freezed,
    Object? successSelector = freezed,
    Object? failedSelector = freezed,
  }) {
    return _then(_$_AutoCompleteParser(
      parserType: null == parserType
          ? _value.parserType
          : parserType // ignore: cast_nullable_to_non_nullable
              as ParserType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      extra: freezed == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as Iterable<ExtraSelector>?,
      itemSelector: freezed == itemSelector
          ? _value.itemSelector
          : itemSelector // ignore: cast_nullable_to_non_nullable
              as Selector?,
      itemComplete: freezed == itemComplete
          ? _value.itemComplete
          : itemComplete // ignore: cast_nullable_to_non_nullable
              as Selector?,
      itemTitle: freezed == itemTitle
          ? _value.itemTitle
          : itemTitle // ignore: cast_nullable_to_non_nullable
              as Selector?,
      itemSubtitle: freezed == itemSubtitle
          ? _value.itemSubtitle
          : itemSubtitle // ignore: cast_nullable_to_non_nullable
              as Selector?,
      successSelector: freezed == successSelector
          ? _value.successSelector
          : successSelector // ignore: cast_nullable_to_non_nullable
              as Selector?,
      failedSelector: freezed == failedSelector
          ? _value.failedSelector
          : failedSelector // ignore: cast_nullable_to_non_nullable
              as Selector?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AutoCompleteParser extends _AutoCompleteParser {
  _$_AutoCompleteParser(
      {@JsonKey(toJson: ParserType._toType, fromJson: ParserType._fromType)
          this.parserType = ParserType.autoComplete,
      required this.name,
      required this.uuid,
      this.extra = const [],
      this.itemSelector = const Selector(),
      this.itemComplete = const Selector(),
      this.itemTitle = const Selector(),
      this.itemSubtitle = const Selector(),
      this.successSelector = const Selector(),
      this.failedSelector = const Selector()})
      : assert(parserType == ParserType.autoComplete,
            'parserType must be autoComplete'),
        super._();

  factory _$_AutoCompleteParser.fromJson(Map<String, dynamic> json) =>
      _$$_AutoCompleteParserFromJson(json);

  @override
  @JsonKey(toJson: ParserType._toType, fromJson: ParserType._fromType)
  final ParserType parserType;
  @override
  final String name;
  @override
  final String uuid;
  @override
  @JsonKey()
  final Iterable<ExtraSelector>? extra;
  @override
  @JsonKey()
  final Selector? itemSelector;
  @override
  @JsonKey()
  final Selector? itemComplete;
  @override
  @JsonKey()
  final Selector? itemTitle;
  @override
  @JsonKey()
  final Selector? itemSubtitle;
  @override
  @JsonKey()
  final Selector? successSelector;
  @override
  @JsonKey()
  final Selector? failedSelector;

  @override
  String toString() {
    return 'AutoCompleteParser(parserType: $parserType, name: $name, uuid: $uuid, extra: $extra, itemSelector: $itemSelector, itemComplete: $itemComplete, itemTitle: $itemTitle, itemSubtitle: $itemSubtitle, successSelector: $successSelector, failedSelector: $failedSelector)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AutoCompleteParser &&
            (identical(other.parserType, parserType) ||
                other.parserType == parserType) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            const DeepCollectionEquality().equals(other.extra, extra) &&
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      parserType,
      name,
      uuid,
      const DeepCollectionEquality().hash(extra),
      itemSelector,
      itemComplete,
      itemTitle,
      itemSubtitle,
      successSelector,
      failedSelector);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AutoCompleteParserCopyWith<_$_AutoCompleteParser> get copyWith =>
      __$$_AutoCompleteParserCopyWithImpl<_$_AutoCompleteParser>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AutoCompleteParserToJson(
      this,
    );
  }
}

abstract class _AutoCompleteParser extends AutoCompleteParser {
  factory _AutoCompleteParser(
      {@JsonKey(toJson: ParserType._toType, fromJson: ParserType._fromType)
          final ParserType parserType,
      required final String name,
      required final String uuid,
      final Iterable<ExtraSelector>? extra,
      final Selector? itemSelector,
      final Selector? itemComplete,
      final Selector? itemTitle,
      final Selector? itemSubtitle,
      final Selector? successSelector,
      final Selector? failedSelector}) = _$_AutoCompleteParser;
  _AutoCompleteParser._() : super._();

  factory _AutoCompleteParser.fromJson(Map<String, dynamic> json) =
      _$_AutoCompleteParser.fromJson;

  @override
  @JsonKey(toJson: ParserType._toType, fromJson: ParserType._fromType)
  ParserType get parserType;
  @override
  String get name;
  @override
  String get uuid;
  @override
  Iterable<ExtraSelector>? get extra;
  @override
  Selector? get itemSelector;
  @override
  Selector? get itemComplete;
  @override
  Selector? get itemTitle;
  @override
  Selector? get itemSubtitle;
  @override
  Selector? get successSelector;
  @override
  Selector? get failedSelector;
  @override
  @JsonKey(ignore: true)
  _$$_AutoCompleteParserCopyWith<_$_AutoCompleteParser> get copyWith =>
      throw _privateConstructorUsedError;
}
