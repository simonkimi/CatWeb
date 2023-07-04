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
  @JsonKey(toJson: ParserType._toType, fromJson: ParserType._fromType)
  set parserType(ParserType value) => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  set uuid(String value) => throw _privateConstructorUsedError;
  List<ExtraSelector> get extra => throw _privateConstructorUsedError;
  set extra(List<ExtraSelector> value) => throw _privateConstructorUsedError;
  Selector get id => throw _privateConstructorUsedError;
  set id(Selector value) => throw _privateConstructorUsedError;
  ImageSelector get image => throw _privateConstructorUsedError;
  set image(ImageSelector value) => throw _privateConstructorUsedError;
  Selector get largerImage => throw _privateConstructorUsedError;
  set largerImage(Selector value) => throw _privateConstructorUsedError;
  Selector get rawImage => throw _privateConstructorUsedError;
  set rawImage(Selector value) => throw _privateConstructorUsedError;
  Selector get rating => throw _privateConstructorUsedError;
  set rating(Selector value) => throw _privateConstructorUsedError;
  Selector get score => throw _privateConstructorUsedError;
  set score(Selector value) => throw _privateConstructorUsedError;
  Selector get source => throw _privateConstructorUsedError;
  set source(Selector value) => throw _privateConstructorUsedError;
  Selector get uploadTime => throw _privateConstructorUsedError;
  set uploadTime(Selector value) => throw _privateConstructorUsedError;
  Selector get successSelector => throw _privateConstructorUsedError;
  set successSelector(Selector value) => throw _privateConstructorUsedError;
  Selector get failedSelector => throw _privateConstructorUsedError;
  set failedSelector(Selector value) => throw _privateConstructorUsedError;
  Selector get badgeSelector => throw _privateConstructorUsedError;
  set badgeSelector(Selector value) => throw _privateConstructorUsedError;
  Selector get badgeText => throw _privateConstructorUsedError;
  set badgeText(Selector value) => throw _privateConstructorUsedError;
  Selector get badgeCategory => throw _privateConstructorUsedError;
  set badgeCategory(Selector value) => throw _privateConstructorUsedError;

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
      List<ExtraSelector> extra,
      Selector id,
      ImageSelector image,
      Selector largerImage,
      Selector rawImage,
      Selector rating,
      Selector score,
      Selector source,
      Selector uploadTime,
      Selector successSelector,
      Selector failedSelector,
      Selector badgeSelector,
      Selector badgeText,
      Selector badgeCategory});

  $SelectorCopyWith<$Res> get id;
  $ImageSelectorCopyWith<$Res> get image;
  $SelectorCopyWith<$Res> get largerImage;
  $SelectorCopyWith<$Res> get rawImage;
  $SelectorCopyWith<$Res> get rating;
  $SelectorCopyWith<$Res> get score;
  $SelectorCopyWith<$Res> get source;
  $SelectorCopyWith<$Res> get uploadTime;
  $SelectorCopyWith<$Res> get successSelector;
  $SelectorCopyWith<$Res> get failedSelector;
  $SelectorCopyWith<$Res> get badgeSelector;
  $SelectorCopyWith<$Res> get badgeText;
  $SelectorCopyWith<$Res> get badgeCategory;
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
    Object? badgeText = null,
    Object? badgeCategory = null,
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
      extra: null == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as List<ExtraSelector>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as Selector,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as ImageSelector,
      largerImage: null == largerImage
          ? _value.largerImage
          : largerImage // ignore: cast_nullable_to_non_nullable
              as Selector,
      rawImage: null == rawImage
          ? _value.rawImage
          : rawImage // ignore: cast_nullable_to_non_nullable
              as Selector,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as Selector,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as Selector,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as Selector,
      uploadTime: null == uploadTime
          ? _value.uploadTime
          : uploadTime // ignore: cast_nullable_to_non_nullable
              as Selector,
      successSelector: null == successSelector
          ? _value.successSelector
          : successSelector // ignore: cast_nullable_to_non_nullable
              as Selector,
      failedSelector: null == failedSelector
          ? _value.failedSelector
          : failedSelector // ignore: cast_nullable_to_non_nullable
              as Selector,
      badgeSelector: null == badgeSelector
          ? _value.badgeSelector
          : badgeSelector // ignore: cast_nullable_to_non_nullable
              as Selector,
      badgeText: null == badgeText
          ? _value.badgeText
          : badgeText // ignore: cast_nullable_to_non_nullable
              as Selector,
      badgeCategory: null == badgeCategory
          ? _value.badgeCategory
          : badgeCategory // ignore: cast_nullable_to_non_nullable
              as Selector,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get id {
    return $SelectorCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageSelectorCopyWith<$Res> get image {
    return $ImageSelectorCopyWith<$Res>(_value.image, (value) {
      return _then(_value.copyWith(image: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get largerImage {
    return $SelectorCopyWith<$Res>(_value.largerImage, (value) {
      return _then(_value.copyWith(largerImage: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get rawImage {
    return $SelectorCopyWith<$Res>(_value.rawImage, (value) {
      return _then(_value.copyWith(rawImage: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get rating {
    return $SelectorCopyWith<$Res>(_value.rating, (value) {
      return _then(_value.copyWith(rating: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get score {
    return $SelectorCopyWith<$Res>(_value.score, (value) {
      return _then(_value.copyWith(score: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get source {
    return $SelectorCopyWith<$Res>(_value.source, (value) {
      return _then(_value.copyWith(source: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get uploadTime {
    return $SelectorCopyWith<$Res>(_value.uploadTime, (value) {
      return _then(_value.copyWith(uploadTime: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get successSelector {
    return $SelectorCopyWith<$Res>(_value.successSelector, (value) {
      return _then(_value.copyWith(successSelector: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get failedSelector {
    return $SelectorCopyWith<$Res>(_value.failedSelector, (value) {
      return _then(_value.copyWith(failedSelector: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get badgeSelector {
    return $SelectorCopyWith<$Res>(_value.badgeSelector, (value) {
      return _then(_value.copyWith(badgeSelector: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get badgeText {
    return $SelectorCopyWith<$Res>(_value.badgeText, (value) {
      return _then(_value.copyWith(badgeText: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get badgeCategory {
    return $SelectorCopyWith<$Res>(_value.badgeCategory, (value) {
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
      List<ExtraSelector> extra,
      Selector id,
      ImageSelector image,
      Selector largerImage,
      Selector rawImage,
      Selector rating,
      Selector score,
      Selector source,
      Selector uploadTime,
      Selector successSelector,
      Selector failedSelector,
      Selector badgeSelector,
      Selector badgeText,
      Selector badgeCategory});

  @override
  $SelectorCopyWith<$Res> get id;
  @override
  $ImageSelectorCopyWith<$Res> get image;
  @override
  $SelectorCopyWith<$Res> get largerImage;
  @override
  $SelectorCopyWith<$Res> get rawImage;
  @override
  $SelectorCopyWith<$Res> get rating;
  @override
  $SelectorCopyWith<$Res> get score;
  @override
  $SelectorCopyWith<$Res> get source;
  @override
  $SelectorCopyWith<$Res> get uploadTime;
  @override
  $SelectorCopyWith<$Res> get successSelector;
  @override
  $SelectorCopyWith<$Res> get failedSelector;
  @override
  $SelectorCopyWith<$Res> get badgeSelector;
  @override
  $SelectorCopyWith<$Res> get badgeText;
  @override
  $SelectorCopyWith<$Res> get badgeCategory;
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
    Object? badgeText = null,
    Object? badgeCategory = null,
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
      extra: null == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as List<ExtraSelector>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as Selector,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as ImageSelector,
      largerImage: null == largerImage
          ? _value.largerImage
          : largerImage // ignore: cast_nullable_to_non_nullable
              as Selector,
      rawImage: null == rawImage
          ? _value.rawImage
          : rawImage // ignore: cast_nullable_to_non_nullable
              as Selector,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as Selector,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as Selector,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as Selector,
      uploadTime: null == uploadTime
          ? _value.uploadTime
          : uploadTime // ignore: cast_nullable_to_non_nullable
              as Selector,
      successSelector: null == successSelector
          ? _value.successSelector
          : successSelector // ignore: cast_nullable_to_non_nullable
              as Selector,
      failedSelector: null == failedSelector
          ? _value.failedSelector
          : failedSelector // ignore: cast_nullable_to_non_nullable
              as Selector,
      badgeSelector: null == badgeSelector
          ? _value.badgeSelector
          : badgeSelector // ignore: cast_nullable_to_non_nullable
              as Selector,
      badgeText: null == badgeText
          ? _value.badgeText
          : badgeText // ignore: cast_nullable_to_non_nullable
              as Selector,
      badgeCategory: null == badgeCategory
          ? _value.badgeCategory
          : badgeCategory // ignore: cast_nullable_to_non_nullable
              as Selector,
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
      this.id = const Selector(),
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
  ParserType parserType;
  @override
  String name;
  @override
  String uuid;
  @override
  @JsonKey()
  List<ExtraSelector> extra;
  @override
  @JsonKey()
  Selector id;
  @override
  @JsonKey()
  ImageSelector image;
  @override
  @JsonKey()
  Selector largerImage;
  @override
  @JsonKey()
  Selector rawImage;
  @override
  @JsonKey()
  Selector rating;
  @override
  @JsonKey()
  Selector score;
  @override
  @JsonKey()
  Selector source;
  @override
  @JsonKey()
  Selector uploadTime;
  @override
  @JsonKey()
  Selector successSelector;
  @override
  @JsonKey()
  Selector failedSelector;
  @override
  @JsonKey()
  Selector badgeSelector;
  @override
  @JsonKey()
  Selector badgeText;
  @override
  @JsonKey()
  Selector badgeCategory;

  @override
  String toString() {
    return 'ImageReaderParser(parserType: $parserType, name: $name, uuid: $uuid, extra: $extra, id: $id, image: $image, largerImage: $largerImage, rawImage: $rawImage, rating: $rating, score: $score, source: $source, uploadTime: $uploadTime, successSelector: $successSelector, failedSelector: $failedSelector, badgeSelector: $badgeSelector, badgeText: $badgeText, badgeCategory: $badgeCategory)';
  }

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
          ParserType parserType,
      required String name,
      required String uuid,
      List<ExtraSelector> extra,
      Selector id,
      ImageSelector image,
      Selector largerImage,
      Selector rawImage,
      Selector rating,
      Selector score,
      Selector source,
      Selector uploadTime,
      Selector successSelector,
      Selector failedSelector,
      Selector badgeSelector,
      Selector badgeText,
      Selector badgeCategory}) = _$_ImageReaderParser;
  _ImageReaderParser._() : super._();

  factory _ImageReaderParser.fromJson(Map<String, dynamic> json) =
      _$_ImageReaderParser.fromJson;

  @override
  @JsonKey(toJson: ParserType._toType, fromJson: ParserType._fromType)
  ParserType get parserType;
  @JsonKey(toJson: ParserType._toType, fromJson: ParserType._fromType)
  set parserType(ParserType value);
  @override
  String get name;
  set name(String value);
  @override
  String get uuid;
  set uuid(String value);
  @override
  List<ExtraSelector> get extra;
  set extra(List<ExtraSelector> value);
  @override
  Selector get id;
  set id(Selector value);
  @override
  ImageSelector get image;
  set image(ImageSelector value);
  @override
  Selector get largerImage;
  set largerImage(Selector value);
  @override
  Selector get rawImage;
  set rawImage(Selector value);
  @override
  Selector get rating;
  set rating(Selector value);
  @override
  Selector get score;
  set score(Selector value);
  @override
  Selector get source;
  set source(Selector value);
  @override
  Selector get uploadTime;
  set uploadTime(Selector value);
  @override
  Selector get successSelector;
  set successSelector(Selector value);
  @override
  Selector get failedSelector;
  set failedSelector(Selector value);
  @override
  Selector get badgeSelector;
  set badgeSelector(Selector value);
  @override
  Selector get badgeText;
  set badgeText(Selector value);
  @override
  Selector get badgeCategory;
  set badgeCategory(Selector value);
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
  @JsonKey(toJson: ParserType._toType, fromJson: ParserType._fromType)
  set parserType(ParserType value) => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  set uuid(String value) => throw _privateConstructorUsedError;
  List<ExtraSelector> get extra => throw _privateConstructorUsedError;
  set extra(List<ExtraSelector> value) => throw _privateConstructorUsedError;
  Selector get title => throw _privateConstructorUsedError;
  set title(Selector value) => throw _privateConstructorUsedError;
  Selector get subtitle => throw _privateConstructorUsedError;
  set subtitle(Selector value) => throw _privateConstructorUsedError;
  Selector get uploadTime => throw _privateConstructorUsedError;
  set uploadTime(Selector value) => throw _privateConstructorUsedError;
  Selector get star => throw _privateConstructorUsedError;
  set star(Selector value) => throw _privateConstructorUsedError;
  Selector get imgCount => throw _privateConstructorUsedError;
  set imgCount(Selector value) => throw _privateConstructorUsedError;
  Selector get pageCount => throw _privateConstructorUsedError;
  set pageCount(Selector value) => throw _privateConstructorUsedError;
  Selector get language => throw _privateConstructorUsedError;
  set language(Selector value) => throw _privateConstructorUsedError;
  ImageSelector get coverImg => throw _privateConstructorUsedError;
  set coverImg(ImageSelector value) => throw _privateConstructorUsedError;
  Selector get description => throw _privateConstructorUsedError;
  set description(Selector value) => throw _privateConstructorUsedError;
  Selector get successSelector => throw _privateConstructorUsedError;
  set successSelector(Selector value) => throw _privateConstructorUsedError;
  Selector get failedSelector => throw _privateConstructorUsedError;
  set failedSelector(Selector value) => throw _privateConstructorUsedError;
  Selector get thumbnailSelector => throw _privateConstructorUsedError;
  set thumbnailSelector(Selector value) => throw _privateConstructorUsedError;
  ImageSelector get thumbnail => throw _privateConstructorUsedError;
  set thumbnail(ImageSelector value) => throw _privateConstructorUsedError;
  Selector get target => throw _privateConstructorUsedError;
  set target(Selector value) => throw _privateConstructorUsedError;
  Selector get commentSelector => throw _privateConstructorUsedError;
  set commentSelector(Selector value) => throw _privateConstructorUsedError;
  CommentSelector get comments => throw _privateConstructorUsedError;
  set comments(CommentSelector value) => throw _privateConstructorUsedError;
  Selector get tag => throw _privateConstructorUsedError;
  set tag(Selector value) => throw _privateConstructorUsedError;
  Selector get tagColor => throw _privateConstructorUsedError;
  set tagColor(Selector value) => throw _privateConstructorUsedError;
  Selector get badgeSelector => throw _privateConstructorUsedError;
  set badgeSelector(Selector value) => throw _privateConstructorUsedError;
  Selector get badgeText => throw _privateConstructorUsedError;
  set badgeText(Selector value) => throw _privateConstructorUsedError;
  Selector get badgeCategory => throw _privateConstructorUsedError;
  set badgeCategory(Selector value) => throw _privateConstructorUsedError;
  Selector get chapterSelector => throw _privateConstructorUsedError;
  set chapterSelector(Selector value) => throw _privateConstructorUsedError;
  Selector get chapterTitle => throw _privateConstructorUsedError;
  set chapterTitle(Selector value) => throw _privateConstructorUsedError;
  Selector get chapterSubtitle => throw _privateConstructorUsedError;
  set chapterSubtitle(Selector value) => throw _privateConstructorUsedError;
  ImageSelector get chapterCover => throw _privateConstructorUsedError;
  set chapterCover(ImageSelector value) => throw _privateConstructorUsedError;
  Selector get nextPage => throw _privateConstructorUsedError;
  set nextPage(Selector value) => throw _privateConstructorUsedError;
  Selector get countPrePage => throw _privateConstructorUsedError;
  set countPrePage(Selector value) => throw _privateConstructorUsedError;

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
      List<ExtraSelector> extra,
      Selector title,
      Selector subtitle,
      Selector uploadTime,
      Selector star,
      Selector imgCount,
      Selector pageCount,
      Selector language,
      ImageSelector coverImg,
      Selector description,
      Selector successSelector,
      Selector failedSelector,
      Selector thumbnailSelector,
      ImageSelector thumbnail,
      Selector target,
      Selector commentSelector,
      CommentSelector comments,
      Selector tag,
      Selector tagColor,
      Selector badgeSelector,
      Selector badgeText,
      Selector badgeCategory,
      Selector chapterSelector,
      Selector chapterTitle,
      Selector chapterSubtitle,
      ImageSelector chapterCover,
      Selector nextPage,
      Selector countPrePage});

  $SelectorCopyWith<$Res> get title;
  $SelectorCopyWith<$Res> get subtitle;
  $SelectorCopyWith<$Res> get uploadTime;
  $SelectorCopyWith<$Res> get star;
  $SelectorCopyWith<$Res> get imgCount;
  $SelectorCopyWith<$Res> get pageCount;
  $SelectorCopyWith<$Res> get language;
  $ImageSelectorCopyWith<$Res> get coverImg;
  $SelectorCopyWith<$Res> get description;
  $SelectorCopyWith<$Res> get successSelector;
  $SelectorCopyWith<$Res> get failedSelector;
  $SelectorCopyWith<$Res> get thumbnailSelector;
  $ImageSelectorCopyWith<$Res> get thumbnail;
  $SelectorCopyWith<$Res> get target;
  $SelectorCopyWith<$Res> get commentSelector;
  $CommentSelectorCopyWith<$Res> get comments;
  $SelectorCopyWith<$Res> get tag;
  $SelectorCopyWith<$Res> get tagColor;
  $SelectorCopyWith<$Res> get badgeSelector;
  $SelectorCopyWith<$Res> get badgeText;
  $SelectorCopyWith<$Res> get badgeCategory;
  $SelectorCopyWith<$Res> get chapterSelector;
  $SelectorCopyWith<$Res> get chapterTitle;
  $SelectorCopyWith<$Res> get chapterSubtitle;
  $ImageSelectorCopyWith<$Res> get chapterCover;
  $SelectorCopyWith<$Res> get nextPage;
  $SelectorCopyWith<$Res> get countPrePage;
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
    Object? extra = null,
    Object? title = null,
    Object? subtitle = null,
    Object? uploadTime = null,
    Object? star = null,
    Object? imgCount = null,
    Object? pageCount = null,
    Object? language = null,
    Object? coverImg = null,
    Object? description = null,
    Object? successSelector = null,
    Object? failedSelector = null,
    Object? thumbnailSelector = null,
    Object? thumbnail = null,
    Object? target = null,
    Object? commentSelector = null,
    Object? comments = null,
    Object? tag = null,
    Object? tagColor = null,
    Object? badgeSelector = null,
    Object? badgeText = null,
    Object? badgeCategory = null,
    Object? chapterSelector = null,
    Object? chapterTitle = null,
    Object? chapterSubtitle = null,
    Object? chapterCover = null,
    Object? nextPage = null,
    Object? countPrePage = null,
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
      extra: null == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as List<ExtraSelector>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as Selector,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as Selector,
      uploadTime: null == uploadTime
          ? _value.uploadTime
          : uploadTime // ignore: cast_nullable_to_non_nullable
              as Selector,
      star: null == star
          ? _value.star
          : star // ignore: cast_nullable_to_non_nullable
              as Selector,
      imgCount: null == imgCount
          ? _value.imgCount
          : imgCount // ignore: cast_nullable_to_non_nullable
              as Selector,
      pageCount: null == pageCount
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as Selector,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as Selector,
      coverImg: null == coverImg
          ? _value.coverImg
          : coverImg // ignore: cast_nullable_to_non_nullable
              as ImageSelector,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as Selector,
      successSelector: null == successSelector
          ? _value.successSelector
          : successSelector // ignore: cast_nullable_to_non_nullable
              as Selector,
      failedSelector: null == failedSelector
          ? _value.failedSelector
          : failedSelector // ignore: cast_nullable_to_non_nullable
              as Selector,
      thumbnailSelector: null == thumbnailSelector
          ? _value.thumbnailSelector
          : thumbnailSelector // ignore: cast_nullable_to_non_nullable
              as Selector,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as ImageSelector,
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as Selector,
      commentSelector: null == commentSelector
          ? _value.commentSelector
          : commentSelector // ignore: cast_nullable_to_non_nullable
              as Selector,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as CommentSelector,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as Selector,
      tagColor: null == tagColor
          ? _value.tagColor
          : tagColor // ignore: cast_nullable_to_non_nullable
              as Selector,
      badgeSelector: null == badgeSelector
          ? _value.badgeSelector
          : badgeSelector // ignore: cast_nullable_to_non_nullable
              as Selector,
      badgeText: null == badgeText
          ? _value.badgeText
          : badgeText // ignore: cast_nullable_to_non_nullable
              as Selector,
      badgeCategory: null == badgeCategory
          ? _value.badgeCategory
          : badgeCategory // ignore: cast_nullable_to_non_nullable
              as Selector,
      chapterSelector: null == chapterSelector
          ? _value.chapterSelector
          : chapterSelector // ignore: cast_nullable_to_non_nullable
              as Selector,
      chapterTitle: null == chapterTitle
          ? _value.chapterTitle
          : chapterTitle // ignore: cast_nullable_to_non_nullable
              as Selector,
      chapterSubtitle: null == chapterSubtitle
          ? _value.chapterSubtitle
          : chapterSubtitle // ignore: cast_nullable_to_non_nullable
              as Selector,
      chapterCover: null == chapterCover
          ? _value.chapterCover
          : chapterCover // ignore: cast_nullable_to_non_nullable
              as ImageSelector,
      nextPage: null == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as Selector,
      countPrePage: null == countPrePage
          ? _value.countPrePage
          : countPrePage // ignore: cast_nullable_to_non_nullable
              as Selector,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get title {
    return $SelectorCopyWith<$Res>(_value.title, (value) {
      return _then(_value.copyWith(title: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get subtitle {
    return $SelectorCopyWith<$Res>(_value.subtitle, (value) {
      return _then(_value.copyWith(subtitle: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get uploadTime {
    return $SelectorCopyWith<$Res>(_value.uploadTime, (value) {
      return _then(_value.copyWith(uploadTime: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get star {
    return $SelectorCopyWith<$Res>(_value.star, (value) {
      return _then(_value.copyWith(star: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get imgCount {
    return $SelectorCopyWith<$Res>(_value.imgCount, (value) {
      return _then(_value.copyWith(imgCount: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get pageCount {
    return $SelectorCopyWith<$Res>(_value.pageCount, (value) {
      return _then(_value.copyWith(pageCount: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get language {
    return $SelectorCopyWith<$Res>(_value.language, (value) {
      return _then(_value.copyWith(language: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageSelectorCopyWith<$Res> get coverImg {
    return $ImageSelectorCopyWith<$Res>(_value.coverImg, (value) {
      return _then(_value.copyWith(coverImg: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get description {
    return $SelectorCopyWith<$Res>(_value.description, (value) {
      return _then(_value.copyWith(description: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get successSelector {
    return $SelectorCopyWith<$Res>(_value.successSelector, (value) {
      return _then(_value.copyWith(successSelector: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get failedSelector {
    return $SelectorCopyWith<$Res>(_value.failedSelector, (value) {
      return _then(_value.copyWith(failedSelector: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get thumbnailSelector {
    return $SelectorCopyWith<$Res>(_value.thumbnailSelector, (value) {
      return _then(_value.copyWith(thumbnailSelector: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageSelectorCopyWith<$Res> get thumbnail {
    return $ImageSelectorCopyWith<$Res>(_value.thumbnail, (value) {
      return _then(_value.copyWith(thumbnail: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get target {
    return $SelectorCopyWith<$Res>(_value.target, (value) {
      return _then(_value.copyWith(target: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get commentSelector {
    return $SelectorCopyWith<$Res>(_value.commentSelector, (value) {
      return _then(_value.copyWith(commentSelector: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CommentSelectorCopyWith<$Res> get comments {
    return $CommentSelectorCopyWith<$Res>(_value.comments, (value) {
      return _then(_value.copyWith(comments: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get tag {
    return $SelectorCopyWith<$Res>(_value.tag, (value) {
      return _then(_value.copyWith(tag: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get tagColor {
    return $SelectorCopyWith<$Res>(_value.tagColor, (value) {
      return _then(_value.copyWith(tagColor: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get badgeSelector {
    return $SelectorCopyWith<$Res>(_value.badgeSelector, (value) {
      return _then(_value.copyWith(badgeSelector: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get badgeText {
    return $SelectorCopyWith<$Res>(_value.badgeText, (value) {
      return _then(_value.copyWith(badgeText: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get badgeCategory {
    return $SelectorCopyWith<$Res>(_value.badgeCategory, (value) {
      return _then(_value.copyWith(badgeCategory: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get chapterSelector {
    return $SelectorCopyWith<$Res>(_value.chapterSelector, (value) {
      return _then(_value.copyWith(chapterSelector: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get chapterTitle {
    return $SelectorCopyWith<$Res>(_value.chapterTitle, (value) {
      return _then(_value.copyWith(chapterTitle: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get chapterSubtitle {
    return $SelectorCopyWith<$Res>(_value.chapterSubtitle, (value) {
      return _then(_value.copyWith(chapterSubtitle: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageSelectorCopyWith<$Res> get chapterCover {
    return $ImageSelectorCopyWith<$Res>(_value.chapterCover, (value) {
      return _then(_value.copyWith(chapterCover: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get nextPage {
    return $SelectorCopyWith<$Res>(_value.nextPage, (value) {
      return _then(_value.copyWith(nextPage: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get countPrePage {
    return $SelectorCopyWith<$Res>(_value.countPrePage, (value) {
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
      List<ExtraSelector> extra,
      Selector title,
      Selector subtitle,
      Selector uploadTime,
      Selector star,
      Selector imgCount,
      Selector pageCount,
      Selector language,
      ImageSelector coverImg,
      Selector description,
      Selector successSelector,
      Selector failedSelector,
      Selector thumbnailSelector,
      ImageSelector thumbnail,
      Selector target,
      Selector commentSelector,
      CommentSelector comments,
      Selector tag,
      Selector tagColor,
      Selector badgeSelector,
      Selector badgeText,
      Selector badgeCategory,
      Selector chapterSelector,
      Selector chapterTitle,
      Selector chapterSubtitle,
      ImageSelector chapterCover,
      Selector nextPage,
      Selector countPrePage});

  @override
  $SelectorCopyWith<$Res> get title;
  @override
  $SelectorCopyWith<$Res> get subtitle;
  @override
  $SelectorCopyWith<$Res> get uploadTime;
  @override
  $SelectorCopyWith<$Res> get star;
  @override
  $SelectorCopyWith<$Res> get imgCount;
  @override
  $SelectorCopyWith<$Res> get pageCount;
  @override
  $SelectorCopyWith<$Res> get language;
  @override
  $ImageSelectorCopyWith<$Res> get coverImg;
  @override
  $SelectorCopyWith<$Res> get description;
  @override
  $SelectorCopyWith<$Res> get successSelector;
  @override
  $SelectorCopyWith<$Res> get failedSelector;
  @override
  $SelectorCopyWith<$Res> get thumbnailSelector;
  @override
  $ImageSelectorCopyWith<$Res> get thumbnail;
  @override
  $SelectorCopyWith<$Res> get target;
  @override
  $SelectorCopyWith<$Res> get commentSelector;
  @override
  $CommentSelectorCopyWith<$Res> get comments;
  @override
  $SelectorCopyWith<$Res> get tag;
  @override
  $SelectorCopyWith<$Res> get tagColor;
  @override
  $SelectorCopyWith<$Res> get badgeSelector;
  @override
  $SelectorCopyWith<$Res> get badgeText;
  @override
  $SelectorCopyWith<$Res> get badgeCategory;
  @override
  $SelectorCopyWith<$Res> get chapterSelector;
  @override
  $SelectorCopyWith<$Res> get chapterTitle;
  @override
  $SelectorCopyWith<$Res> get chapterSubtitle;
  @override
  $ImageSelectorCopyWith<$Res> get chapterCover;
  @override
  $SelectorCopyWith<$Res> get nextPage;
  @override
  $SelectorCopyWith<$Res> get countPrePage;
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
    Object? extra = null,
    Object? title = null,
    Object? subtitle = null,
    Object? uploadTime = null,
    Object? star = null,
    Object? imgCount = null,
    Object? pageCount = null,
    Object? language = null,
    Object? coverImg = null,
    Object? description = null,
    Object? successSelector = null,
    Object? failedSelector = null,
    Object? thumbnailSelector = null,
    Object? thumbnail = null,
    Object? target = null,
    Object? commentSelector = null,
    Object? comments = null,
    Object? tag = null,
    Object? tagColor = null,
    Object? badgeSelector = null,
    Object? badgeText = null,
    Object? badgeCategory = null,
    Object? chapterSelector = null,
    Object? chapterTitle = null,
    Object? chapterSubtitle = null,
    Object? chapterCover = null,
    Object? nextPage = null,
    Object? countPrePage = null,
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
      extra: null == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as List<ExtraSelector>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as Selector,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as Selector,
      uploadTime: null == uploadTime
          ? _value.uploadTime
          : uploadTime // ignore: cast_nullable_to_non_nullable
              as Selector,
      star: null == star
          ? _value.star
          : star // ignore: cast_nullable_to_non_nullable
              as Selector,
      imgCount: null == imgCount
          ? _value.imgCount
          : imgCount // ignore: cast_nullable_to_non_nullable
              as Selector,
      pageCount: null == pageCount
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as Selector,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as Selector,
      coverImg: null == coverImg
          ? _value.coverImg
          : coverImg // ignore: cast_nullable_to_non_nullable
              as ImageSelector,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as Selector,
      successSelector: null == successSelector
          ? _value.successSelector
          : successSelector // ignore: cast_nullable_to_non_nullable
              as Selector,
      failedSelector: null == failedSelector
          ? _value.failedSelector
          : failedSelector // ignore: cast_nullable_to_non_nullable
              as Selector,
      thumbnailSelector: null == thumbnailSelector
          ? _value.thumbnailSelector
          : thumbnailSelector // ignore: cast_nullable_to_non_nullable
              as Selector,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as ImageSelector,
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as Selector,
      commentSelector: null == commentSelector
          ? _value.commentSelector
          : commentSelector // ignore: cast_nullable_to_non_nullable
              as Selector,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as CommentSelector,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as Selector,
      tagColor: null == tagColor
          ? _value.tagColor
          : tagColor // ignore: cast_nullable_to_non_nullable
              as Selector,
      badgeSelector: null == badgeSelector
          ? _value.badgeSelector
          : badgeSelector // ignore: cast_nullable_to_non_nullable
              as Selector,
      badgeText: null == badgeText
          ? _value.badgeText
          : badgeText // ignore: cast_nullable_to_non_nullable
              as Selector,
      badgeCategory: null == badgeCategory
          ? _value.badgeCategory
          : badgeCategory // ignore: cast_nullable_to_non_nullable
              as Selector,
      chapterSelector: null == chapterSelector
          ? _value.chapterSelector
          : chapterSelector // ignore: cast_nullable_to_non_nullable
              as Selector,
      chapterTitle: null == chapterTitle
          ? _value.chapterTitle
          : chapterTitle // ignore: cast_nullable_to_non_nullable
              as Selector,
      chapterSubtitle: null == chapterSubtitle
          ? _value.chapterSubtitle
          : chapterSubtitle // ignore: cast_nullable_to_non_nullable
              as Selector,
      chapterCover: null == chapterCover
          ? _value.chapterCover
          : chapterCover // ignore: cast_nullable_to_non_nullable
              as ImageSelector,
      nextPage: null == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as Selector,
      countPrePage: null == countPrePage
          ? _value.countPrePage
          : countPrePage // ignore: cast_nullable_to_non_nullable
              as Selector,
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
  ParserType parserType;
  @override
  String name;
  @override
  String uuid;
  @override
  @JsonKey()
  List<ExtraSelector> extra;
  @override
  @JsonKey()
  Selector title;
  @override
  @JsonKey()
  Selector subtitle;
  @override
  @JsonKey()
  Selector uploadTime;
  @override
  @JsonKey()
  Selector star;
  @override
  @JsonKey()
  Selector imgCount;
  @override
  @JsonKey()
  Selector pageCount;
  @override
  @JsonKey()
  Selector language;
  @override
  @JsonKey()
  ImageSelector coverImg;
  @override
  @JsonKey()
  Selector description;
  @override
  @JsonKey()
  Selector successSelector;
  @override
  @JsonKey()
  Selector failedSelector;
  @override
  @JsonKey()
  Selector thumbnailSelector;
  @override
  @JsonKey()
  ImageSelector thumbnail;
  @override
  @JsonKey()
  Selector target;
  @override
  @JsonKey()
  Selector commentSelector;
  @override
  @JsonKey()
  CommentSelector comments;
  @override
  @JsonKey()
  Selector tag;
  @override
  @JsonKey()
  Selector tagColor;
  @override
  @JsonKey()
  Selector badgeSelector;
  @override
  @JsonKey()
  Selector badgeText;
  @override
  @JsonKey()
  Selector badgeCategory;
  @override
  @JsonKey()
  Selector chapterSelector;
  @override
  @JsonKey()
  Selector chapterTitle;
  @override
  @JsonKey()
  Selector chapterSubtitle;
  @override
  @JsonKey()
  ImageSelector chapterCover;
  @override
  @JsonKey()
  Selector nextPage;
  @override
  @JsonKey()
  Selector countPrePage;

  @override
  String toString() {
    return 'GalleryParser(parserType: $parserType, name: $name, uuid: $uuid, extra: $extra, title: $title, subtitle: $subtitle, uploadTime: $uploadTime, star: $star, imgCount: $imgCount, pageCount: $pageCount, language: $language, coverImg: $coverImg, description: $description, successSelector: $successSelector, failedSelector: $failedSelector, thumbnailSelector: $thumbnailSelector, thumbnail: $thumbnail, target: $target, commentSelector: $commentSelector, comments: $comments, tag: $tag, tagColor: $tagColor, badgeSelector: $badgeSelector, badgeText: $badgeText, badgeCategory: $badgeCategory, chapterSelector: $chapterSelector, chapterTitle: $chapterTitle, chapterSubtitle: $chapterSubtitle, chapterCover: $chapterCover, nextPage: $nextPage, countPrePage: $countPrePage)';
  }

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
          ParserType parserType,
      required String name,
      required String uuid,
      List<ExtraSelector> extra,
      Selector title,
      Selector subtitle,
      Selector uploadTime,
      Selector star,
      Selector imgCount,
      Selector pageCount,
      Selector language,
      ImageSelector coverImg,
      Selector description,
      Selector successSelector,
      Selector failedSelector,
      Selector thumbnailSelector,
      ImageSelector thumbnail,
      Selector target,
      Selector commentSelector,
      CommentSelector comments,
      Selector tag,
      Selector tagColor,
      Selector badgeSelector,
      Selector badgeText,
      Selector badgeCategory,
      Selector chapterSelector,
      Selector chapterTitle,
      Selector chapterSubtitle,
      ImageSelector chapterCover,
      Selector nextPage,
      Selector countPrePage}) = _$_GalleryParser;
  _GalleryParser._() : super._();

  factory _GalleryParser.fromJson(Map<String, dynamic> json) =
      _$_GalleryParser.fromJson;

  @override
  @JsonKey(toJson: ParserType._toType, fromJson: ParserType._fromType)
  ParserType get parserType;
  @JsonKey(toJson: ParserType._toType, fromJson: ParserType._fromType)
  set parserType(ParserType value);
  @override
  String get name;
  set name(String value);
  @override
  String get uuid;
  set uuid(String value);
  @override
  List<ExtraSelector> get extra;
  set extra(List<ExtraSelector> value);
  @override
  Selector get title;
  set title(Selector value);
  @override
  Selector get subtitle;
  set subtitle(Selector value);
  @override
  Selector get uploadTime;
  set uploadTime(Selector value);
  @override
  Selector get star;
  set star(Selector value);
  @override
  Selector get imgCount;
  set imgCount(Selector value);
  @override
  Selector get pageCount;
  set pageCount(Selector value);
  @override
  Selector get language;
  set language(Selector value);
  @override
  ImageSelector get coverImg;
  set coverImg(ImageSelector value);
  @override
  Selector get description;
  set description(Selector value);
  @override
  Selector get successSelector;
  set successSelector(Selector value);
  @override
  Selector get failedSelector;
  set failedSelector(Selector value);
  @override
  Selector get thumbnailSelector;
  set thumbnailSelector(Selector value);
  @override
  ImageSelector get thumbnail;
  set thumbnail(ImageSelector value);
  @override
  Selector get target;
  set target(Selector value);
  @override
  Selector get commentSelector;
  set commentSelector(Selector value);
  @override
  CommentSelector get comments;
  set comments(CommentSelector value);
  @override
  Selector get tag;
  set tag(Selector value);
  @override
  Selector get tagColor;
  set tagColor(Selector value);
  @override
  Selector get badgeSelector;
  set badgeSelector(Selector value);
  @override
  Selector get badgeText;
  set badgeText(Selector value);
  @override
  Selector get badgeCategory;
  set badgeCategory(Selector value);
  @override
  Selector get chapterSelector;
  set chapterSelector(Selector value);
  @override
  Selector get chapterTitle;
  set chapterTitle(Selector value);
  @override
  Selector get chapterSubtitle;
  set chapterSubtitle(Selector value);
  @override
  ImageSelector get chapterCover;
  set chapterCover(ImageSelector value);
  @override
  Selector get nextPage;
  set nextPage(Selector value);
  @override
  Selector get countPrePage;
  set countPrePage(Selector value);
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
  @JsonKey(toJson: ParserType._toType, fromJson: ParserType._fromType)
  set parserType(ParserType value) => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  set uuid(String value) => throw _privateConstructorUsedError;
  List<ExtraSelector> get extra => throw _privateConstructorUsedError;
  set extra(List<ExtraSelector> value) => throw _privateConstructorUsedError;
  Selector get itemSelector => throw _privateConstructorUsedError;
  set itemSelector(Selector value) => throw _privateConstructorUsedError;
  Selector get successSelector => throw _privateConstructorUsedError;
  set successSelector(Selector value) => throw _privateConstructorUsedError;
  Selector get failedSelector => throw _privateConstructorUsedError;
  set failedSelector(Selector value) => throw _privateConstructorUsedError;
  Selector get title => throw _privateConstructorUsedError;
  set title(Selector value) => throw _privateConstructorUsedError;
  Selector get subtitle => throw _privateConstructorUsedError;
  set subtitle(Selector value) => throw _privateConstructorUsedError;
  Selector get uploadTime => throw _privateConstructorUsedError;
  set uploadTime(Selector value) => throw _privateConstructorUsedError;
  Selector get star => throw _privateConstructorUsedError;
  set star(Selector value) => throw _privateConstructorUsedError;
  Selector get imgCount => throw _privateConstructorUsedError;
  set imgCount(Selector value) => throw _privateConstructorUsedError;
  Selector get language => throw _privateConstructorUsedError;
  set language(Selector value) => throw _privateConstructorUsedError;
  ImageSelector get previewImg => throw _privateConstructorUsedError;
  set previewImg(ImageSelector value) => throw _privateConstructorUsedError;
  Selector get target => throw _privateConstructorUsedError;
  set target(Selector value) => throw _privateConstructorUsedError;
  Selector get tag => throw _privateConstructorUsedError;
  set tag(Selector value) => throw _privateConstructorUsedError;
  Selector get tagColor => throw _privateConstructorUsedError;
  set tagColor(Selector value) => throw _privateConstructorUsedError;
  Selector get badgeSelector => throw _privateConstructorUsedError;
  set badgeSelector(Selector value) => throw _privateConstructorUsedError;
  Selector get badgeText => throw _privateConstructorUsedError;
  set badgeText(Selector value) => throw _privateConstructorUsedError;
  Selector get badgeColor => throw _privateConstructorUsedError;
  set badgeColor(Selector value) => throw _privateConstructorUsedError;
  Selector get paper => throw _privateConstructorUsedError;
  set paper(Selector value) => throw _privateConstructorUsedError;
  Selector get idCode => throw _privateConstructorUsedError;
  set idCode(Selector value) => throw _privateConstructorUsedError;
  Selector get nextPage => throw _privateConstructorUsedError;
  set nextPage(Selector value) => throw _privateConstructorUsedError;

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
      List<ExtraSelector> extra,
      Selector itemSelector,
      Selector successSelector,
      Selector failedSelector,
      Selector title,
      Selector subtitle,
      Selector uploadTime,
      Selector star,
      Selector imgCount,
      Selector language,
      ImageSelector previewImg,
      Selector target,
      Selector tag,
      Selector tagColor,
      Selector badgeSelector,
      Selector badgeText,
      Selector badgeColor,
      Selector paper,
      Selector idCode,
      Selector nextPage});

  $SelectorCopyWith<$Res> get itemSelector;
  $SelectorCopyWith<$Res> get successSelector;
  $SelectorCopyWith<$Res> get failedSelector;
  $SelectorCopyWith<$Res> get title;
  $SelectorCopyWith<$Res> get subtitle;
  $SelectorCopyWith<$Res> get uploadTime;
  $SelectorCopyWith<$Res> get star;
  $SelectorCopyWith<$Res> get imgCount;
  $SelectorCopyWith<$Res> get language;
  $ImageSelectorCopyWith<$Res> get previewImg;
  $SelectorCopyWith<$Res> get target;
  $SelectorCopyWith<$Res> get tag;
  $SelectorCopyWith<$Res> get tagColor;
  $SelectorCopyWith<$Res> get badgeSelector;
  $SelectorCopyWith<$Res> get badgeText;
  $SelectorCopyWith<$Res> get badgeColor;
  $SelectorCopyWith<$Res> get paper;
  $SelectorCopyWith<$Res> get idCode;
  $SelectorCopyWith<$Res> get nextPage;
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
    Object? extra = null,
    Object? itemSelector = null,
    Object? successSelector = null,
    Object? failedSelector = null,
    Object? title = null,
    Object? subtitle = null,
    Object? uploadTime = null,
    Object? star = null,
    Object? imgCount = null,
    Object? language = null,
    Object? previewImg = null,
    Object? target = null,
    Object? tag = null,
    Object? tagColor = null,
    Object? badgeSelector = null,
    Object? badgeText = null,
    Object? badgeColor = null,
    Object? paper = null,
    Object? idCode = null,
    Object? nextPage = null,
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
      extra: null == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as List<ExtraSelector>,
      itemSelector: null == itemSelector
          ? _value.itemSelector
          : itemSelector // ignore: cast_nullable_to_non_nullable
              as Selector,
      successSelector: null == successSelector
          ? _value.successSelector
          : successSelector // ignore: cast_nullable_to_non_nullable
              as Selector,
      failedSelector: null == failedSelector
          ? _value.failedSelector
          : failedSelector // ignore: cast_nullable_to_non_nullable
              as Selector,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as Selector,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as Selector,
      uploadTime: null == uploadTime
          ? _value.uploadTime
          : uploadTime // ignore: cast_nullable_to_non_nullable
              as Selector,
      star: null == star
          ? _value.star
          : star // ignore: cast_nullable_to_non_nullable
              as Selector,
      imgCount: null == imgCount
          ? _value.imgCount
          : imgCount // ignore: cast_nullable_to_non_nullable
              as Selector,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as Selector,
      previewImg: null == previewImg
          ? _value.previewImg
          : previewImg // ignore: cast_nullable_to_non_nullable
              as ImageSelector,
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as Selector,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as Selector,
      tagColor: null == tagColor
          ? _value.tagColor
          : tagColor // ignore: cast_nullable_to_non_nullable
              as Selector,
      badgeSelector: null == badgeSelector
          ? _value.badgeSelector
          : badgeSelector // ignore: cast_nullable_to_non_nullable
              as Selector,
      badgeText: null == badgeText
          ? _value.badgeText
          : badgeText // ignore: cast_nullable_to_non_nullable
              as Selector,
      badgeColor: null == badgeColor
          ? _value.badgeColor
          : badgeColor // ignore: cast_nullable_to_non_nullable
              as Selector,
      paper: null == paper
          ? _value.paper
          : paper // ignore: cast_nullable_to_non_nullable
              as Selector,
      idCode: null == idCode
          ? _value.idCode
          : idCode // ignore: cast_nullable_to_non_nullable
              as Selector,
      nextPage: null == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as Selector,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get itemSelector {
    return $SelectorCopyWith<$Res>(_value.itemSelector, (value) {
      return _then(_value.copyWith(itemSelector: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get successSelector {
    return $SelectorCopyWith<$Res>(_value.successSelector, (value) {
      return _then(_value.copyWith(successSelector: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get failedSelector {
    return $SelectorCopyWith<$Res>(_value.failedSelector, (value) {
      return _then(_value.copyWith(failedSelector: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get title {
    return $SelectorCopyWith<$Res>(_value.title, (value) {
      return _then(_value.copyWith(title: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get subtitle {
    return $SelectorCopyWith<$Res>(_value.subtitle, (value) {
      return _then(_value.copyWith(subtitle: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get uploadTime {
    return $SelectorCopyWith<$Res>(_value.uploadTime, (value) {
      return _then(_value.copyWith(uploadTime: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get star {
    return $SelectorCopyWith<$Res>(_value.star, (value) {
      return _then(_value.copyWith(star: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get imgCount {
    return $SelectorCopyWith<$Res>(_value.imgCount, (value) {
      return _then(_value.copyWith(imgCount: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get language {
    return $SelectorCopyWith<$Res>(_value.language, (value) {
      return _then(_value.copyWith(language: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageSelectorCopyWith<$Res> get previewImg {
    return $ImageSelectorCopyWith<$Res>(_value.previewImg, (value) {
      return _then(_value.copyWith(previewImg: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get target {
    return $SelectorCopyWith<$Res>(_value.target, (value) {
      return _then(_value.copyWith(target: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get tag {
    return $SelectorCopyWith<$Res>(_value.tag, (value) {
      return _then(_value.copyWith(tag: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get tagColor {
    return $SelectorCopyWith<$Res>(_value.tagColor, (value) {
      return _then(_value.copyWith(tagColor: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get badgeSelector {
    return $SelectorCopyWith<$Res>(_value.badgeSelector, (value) {
      return _then(_value.copyWith(badgeSelector: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get badgeText {
    return $SelectorCopyWith<$Res>(_value.badgeText, (value) {
      return _then(_value.copyWith(badgeText: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get badgeColor {
    return $SelectorCopyWith<$Res>(_value.badgeColor, (value) {
      return _then(_value.copyWith(badgeColor: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get paper {
    return $SelectorCopyWith<$Res>(_value.paper, (value) {
      return _then(_value.copyWith(paper: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get idCode {
    return $SelectorCopyWith<$Res>(_value.idCode, (value) {
      return _then(_value.copyWith(idCode: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get nextPage {
    return $SelectorCopyWith<$Res>(_value.nextPage, (value) {
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
      List<ExtraSelector> extra,
      Selector itemSelector,
      Selector successSelector,
      Selector failedSelector,
      Selector title,
      Selector subtitle,
      Selector uploadTime,
      Selector star,
      Selector imgCount,
      Selector language,
      ImageSelector previewImg,
      Selector target,
      Selector tag,
      Selector tagColor,
      Selector badgeSelector,
      Selector badgeText,
      Selector badgeColor,
      Selector paper,
      Selector idCode,
      Selector nextPage});

  @override
  $SelectorCopyWith<$Res> get itemSelector;
  @override
  $SelectorCopyWith<$Res> get successSelector;
  @override
  $SelectorCopyWith<$Res> get failedSelector;
  @override
  $SelectorCopyWith<$Res> get title;
  @override
  $SelectorCopyWith<$Res> get subtitle;
  @override
  $SelectorCopyWith<$Res> get uploadTime;
  @override
  $SelectorCopyWith<$Res> get star;
  @override
  $SelectorCopyWith<$Res> get imgCount;
  @override
  $SelectorCopyWith<$Res> get language;
  @override
  $ImageSelectorCopyWith<$Res> get previewImg;
  @override
  $SelectorCopyWith<$Res> get target;
  @override
  $SelectorCopyWith<$Res> get tag;
  @override
  $SelectorCopyWith<$Res> get tagColor;
  @override
  $SelectorCopyWith<$Res> get badgeSelector;
  @override
  $SelectorCopyWith<$Res> get badgeText;
  @override
  $SelectorCopyWith<$Res> get badgeColor;
  @override
  $SelectorCopyWith<$Res> get paper;
  @override
  $SelectorCopyWith<$Res> get idCode;
  @override
  $SelectorCopyWith<$Res> get nextPage;
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
    Object? extra = null,
    Object? itemSelector = null,
    Object? successSelector = null,
    Object? failedSelector = null,
    Object? title = null,
    Object? subtitle = null,
    Object? uploadTime = null,
    Object? star = null,
    Object? imgCount = null,
    Object? language = null,
    Object? previewImg = null,
    Object? target = null,
    Object? tag = null,
    Object? tagColor = null,
    Object? badgeSelector = null,
    Object? badgeText = null,
    Object? badgeColor = null,
    Object? paper = null,
    Object? idCode = null,
    Object? nextPage = null,
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
      extra: null == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as List<ExtraSelector>,
      itemSelector: null == itemSelector
          ? _value.itemSelector
          : itemSelector // ignore: cast_nullable_to_non_nullable
              as Selector,
      successSelector: null == successSelector
          ? _value.successSelector
          : successSelector // ignore: cast_nullable_to_non_nullable
              as Selector,
      failedSelector: null == failedSelector
          ? _value.failedSelector
          : failedSelector // ignore: cast_nullable_to_non_nullable
              as Selector,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as Selector,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as Selector,
      uploadTime: null == uploadTime
          ? _value.uploadTime
          : uploadTime // ignore: cast_nullable_to_non_nullable
              as Selector,
      star: null == star
          ? _value.star
          : star // ignore: cast_nullable_to_non_nullable
              as Selector,
      imgCount: null == imgCount
          ? _value.imgCount
          : imgCount // ignore: cast_nullable_to_non_nullable
              as Selector,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as Selector,
      previewImg: null == previewImg
          ? _value.previewImg
          : previewImg // ignore: cast_nullable_to_non_nullable
              as ImageSelector,
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as Selector,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as Selector,
      tagColor: null == tagColor
          ? _value.tagColor
          : tagColor // ignore: cast_nullable_to_non_nullable
              as Selector,
      badgeSelector: null == badgeSelector
          ? _value.badgeSelector
          : badgeSelector // ignore: cast_nullable_to_non_nullable
              as Selector,
      badgeText: null == badgeText
          ? _value.badgeText
          : badgeText // ignore: cast_nullable_to_non_nullable
              as Selector,
      badgeColor: null == badgeColor
          ? _value.badgeColor
          : badgeColor // ignore: cast_nullable_to_non_nullable
              as Selector,
      paper: null == paper
          ? _value.paper
          : paper // ignore: cast_nullable_to_non_nullable
              as Selector,
      idCode: null == idCode
          ? _value.idCode
          : idCode // ignore: cast_nullable_to_non_nullable
              as Selector,
      nextPage: null == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as Selector,
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
  ParserType parserType;
  @override
  String name;
  @override
  String uuid;
  @override
  @JsonKey()
  List<ExtraSelector> extra;
  @override
  @JsonKey()
  Selector itemSelector;
  @override
  @JsonKey()
  Selector successSelector;
  @override
  @JsonKey()
  Selector failedSelector;
  @override
  @JsonKey()
  Selector title;
  @override
  @JsonKey()
  Selector subtitle;
  @override
  @JsonKey()
  Selector uploadTime;
  @override
  @JsonKey()
  Selector star;
  @override
  @JsonKey()
  Selector imgCount;
  @override
  @JsonKey()
  Selector language;
  @override
  @JsonKey()
  ImageSelector previewImg;
  @override
  @JsonKey()
  Selector target;
  @override
  @JsonKey()
  Selector tag;
  @override
  @JsonKey()
  Selector tagColor;
  @override
  @JsonKey()
  Selector badgeSelector;
  @override
  @JsonKey()
  Selector badgeText;
  @override
  @JsonKey()
  Selector badgeColor;
  @override
  @JsonKey()
  Selector paper;
  @override
  @JsonKey()
  Selector idCode;
  @override
  @JsonKey()
  Selector nextPage;

  @override
  String toString() {
    return 'ListViewParser(parserType: $parserType, name: $name, uuid: $uuid, extra: $extra, itemSelector: $itemSelector, successSelector: $successSelector, failedSelector: $failedSelector, title: $title, subtitle: $subtitle, uploadTime: $uploadTime, star: $star, imgCount: $imgCount, language: $language, previewImg: $previewImg, target: $target, tag: $tag, tagColor: $tagColor, badgeSelector: $badgeSelector, badgeText: $badgeText, badgeColor: $badgeColor, paper: $paper, idCode: $idCode, nextPage: $nextPage)';
  }

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
          ParserType parserType,
      required String name,
      required String uuid,
      List<ExtraSelector> extra,
      Selector itemSelector,
      Selector successSelector,
      Selector failedSelector,
      Selector title,
      Selector subtitle,
      Selector uploadTime,
      Selector star,
      Selector imgCount,
      Selector language,
      ImageSelector previewImg,
      Selector target,
      Selector tag,
      Selector tagColor,
      Selector badgeSelector,
      Selector badgeText,
      Selector badgeColor,
      Selector paper,
      Selector idCode,
      Selector nextPage}) = _$_ListViewParser;
  _ListViewParser._() : super._();

  factory _ListViewParser.fromJson(Map<String, dynamic> json) =
      _$_ListViewParser.fromJson;

  @override
  @JsonKey(toJson: ParserType._toType, fromJson: ParserType._fromType)
  ParserType get parserType;
  @JsonKey(toJson: ParserType._toType, fromJson: ParserType._fromType)
  set parserType(ParserType value);
  @override
  String get name;
  set name(String value);
  @override
  String get uuid;
  set uuid(String value);
  @override
  List<ExtraSelector> get extra;
  set extra(List<ExtraSelector> value);
  @override
  Selector get itemSelector;
  set itemSelector(Selector value);
  @override
  Selector get successSelector;
  set successSelector(Selector value);
  @override
  Selector get failedSelector;
  set failedSelector(Selector value);
  @override
  Selector get title;
  set title(Selector value);
  @override
  Selector get subtitle;
  set subtitle(Selector value);
  @override
  Selector get uploadTime;
  set uploadTime(Selector value);
  @override
  Selector get star;
  set star(Selector value);
  @override
  Selector get imgCount;
  set imgCount(Selector value);
  @override
  Selector get language;
  set language(Selector value);
  @override
  ImageSelector get previewImg;
  set previewImg(ImageSelector value);
  @override
  Selector get target;
  set target(Selector value);
  @override
  Selector get tag;
  set tag(Selector value);
  @override
  Selector get tagColor;
  set tagColor(Selector value);
  @override
  Selector get badgeSelector;
  set badgeSelector(Selector value);
  @override
  Selector get badgeText;
  set badgeText(Selector value);
  @override
  Selector get badgeColor;
  set badgeColor(Selector value);
  @override
  Selector get paper;
  set paper(Selector value);
  @override
  Selector get idCode;
  set idCode(Selector value);
  @override
  Selector get nextPage;
  set nextPage(Selector value);
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
  @JsonKey(toJson: ParserType._toType, fromJson: ParserType._fromType)
  set parserType(ParserType value) => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  set uuid(String value) => throw _privateConstructorUsedError;
  List<ExtraSelector> get extra => throw _privateConstructorUsedError;
  set extra(List<ExtraSelector> value) => throw _privateConstructorUsedError;
  Selector get itemSelector => throw _privateConstructorUsedError;
  set itemSelector(Selector value) => throw _privateConstructorUsedError;
  Selector get itemComplete => throw _privateConstructorUsedError;
  set itemComplete(Selector value) => throw _privateConstructorUsedError;
  Selector get itemTitle => throw _privateConstructorUsedError;
  set itemTitle(Selector value) => throw _privateConstructorUsedError;
  Selector get itemSubtitle => throw _privateConstructorUsedError;
  set itemSubtitle(Selector value) => throw _privateConstructorUsedError;
  Selector get successSelector => throw _privateConstructorUsedError;
  set successSelector(Selector value) => throw _privateConstructorUsedError;
  Selector get failedSelector => throw _privateConstructorUsedError;
  set failedSelector(Selector value) => throw _privateConstructorUsedError;

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
      List<ExtraSelector> extra,
      Selector itemSelector,
      Selector itemComplete,
      Selector itemTitle,
      Selector itemSubtitle,
      Selector successSelector,
      Selector failedSelector});

  $SelectorCopyWith<$Res> get itemSelector;
  $SelectorCopyWith<$Res> get itemComplete;
  $SelectorCopyWith<$Res> get itemTitle;
  $SelectorCopyWith<$Res> get itemSubtitle;
  $SelectorCopyWith<$Res> get successSelector;
  $SelectorCopyWith<$Res> get failedSelector;
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
    Object? extra = null,
    Object? itemSelector = null,
    Object? itemComplete = null,
    Object? itemTitle = null,
    Object? itemSubtitle = null,
    Object? successSelector = null,
    Object? failedSelector = null,
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
      extra: null == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as List<ExtraSelector>,
      itemSelector: null == itemSelector
          ? _value.itemSelector
          : itemSelector // ignore: cast_nullable_to_non_nullable
              as Selector,
      itemComplete: null == itemComplete
          ? _value.itemComplete
          : itemComplete // ignore: cast_nullable_to_non_nullable
              as Selector,
      itemTitle: null == itemTitle
          ? _value.itemTitle
          : itemTitle // ignore: cast_nullable_to_non_nullable
              as Selector,
      itemSubtitle: null == itemSubtitle
          ? _value.itemSubtitle
          : itemSubtitle // ignore: cast_nullable_to_non_nullable
              as Selector,
      successSelector: null == successSelector
          ? _value.successSelector
          : successSelector // ignore: cast_nullable_to_non_nullable
              as Selector,
      failedSelector: null == failedSelector
          ? _value.failedSelector
          : failedSelector // ignore: cast_nullable_to_non_nullable
              as Selector,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get itemSelector {
    return $SelectorCopyWith<$Res>(_value.itemSelector, (value) {
      return _then(_value.copyWith(itemSelector: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get itemComplete {
    return $SelectorCopyWith<$Res>(_value.itemComplete, (value) {
      return _then(_value.copyWith(itemComplete: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get itemTitle {
    return $SelectorCopyWith<$Res>(_value.itemTitle, (value) {
      return _then(_value.copyWith(itemTitle: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get itemSubtitle {
    return $SelectorCopyWith<$Res>(_value.itemSubtitle, (value) {
      return _then(_value.copyWith(itemSubtitle: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get successSelector {
    return $SelectorCopyWith<$Res>(_value.successSelector, (value) {
      return _then(_value.copyWith(successSelector: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectorCopyWith<$Res> get failedSelector {
    return $SelectorCopyWith<$Res>(_value.failedSelector, (value) {
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
      List<ExtraSelector> extra,
      Selector itemSelector,
      Selector itemComplete,
      Selector itemTitle,
      Selector itemSubtitle,
      Selector successSelector,
      Selector failedSelector});

  @override
  $SelectorCopyWith<$Res> get itemSelector;
  @override
  $SelectorCopyWith<$Res> get itemComplete;
  @override
  $SelectorCopyWith<$Res> get itemTitle;
  @override
  $SelectorCopyWith<$Res> get itemSubtitle;
  @override
  $SelectorCopyWith<$Res> get successSelector;
  @override
  $SelectorCopyWith<$Res> get failedSelector;
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
    Object? extra = null,
    Object? itemSelector = null,
    Object? itemComplete = null,
    Object? itemTitle = null,
    Object? itemSubtitle = null,
    Object? successSelector = null,
    Object? failedSelector = null,
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
      extra: null == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as List<ExtraSelector>,
      itemSelector: null == itemSelector
          ? _value.itemSelector
          : itemSelector // ignore: cast_nullable_to_non_nullable
              as Selector,
      itemComplete: null == itemComplete
          ? _value.itemComplete
          : itemComplete // ignore: cast_nullable_to_non_nullable
              as Selector,
      itemTitle: null == itemTitle
          ? _value.itemTitle
          : itemTitle // ignore: cast_nullable_to_non_nullable
              as Selector,
      itemSubtitle: null == itemSubtitle
          ? _value.itemSubtitle
          : itemSubtitle // ignore: cast_nullable_to_non_nullable
              as Selector,
      successSelector: null == successSelector
          ? _value.successSelector
          : successSelector // ignore: cast_nullable_to_non_nullable
              as Selector,
      failedSelector: null == failedSelector
          ? _value.failedSelector
          : failedSelector // ignore: cast_nullable_to_non_nullable
              as Selector,
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
  ParserType parserType;
  @override
  String name;
  @override
  String uuid;
  @override
  @JsonKey()
  List<ExtraSelector> extra;
  @override
  @JsonKey()
  Selector itemSelector;
  @override
  @JsonKey()
  Selector itemComplete;
  @override
  @JsonKey()
  Selector itemTitle;
  @override
  @JsonKey()
  Selector itemSubtitle;
  @override
  @JsonKey()
  Selector successSelector;
  @override
  @JsonKey()
  Selector failedSelector;

  @override
  String toString() {
    return 'AutoCompleteParser(parserType: $parserType, name: $name, uuid: $uuid, extra: $extra, itemSelector: $itemSelector, itemComplete: $itemComplete, itemTitle: $itemTitle, itemSubtitle: $itemSubtitle, successSelector: $successSelector, failedSelector: $failedSelector)';
  }

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
          ParserType parserType,
      required String name,
      required String uuid,
      List<ExtraSelector> extra,
      Selector itemSelector,
      Selector itemComplete,
      Selector itemTitle,
      Selector itemSubtitle,
      Selector successSelector,
      Selector failedSelector}) = _$_AutoCompleteParser;
  _AutoCompleteParser._() : super._();

  factory _AutoCompleteParser.fromJson(Map<String, dynamic> json) =
      _$_AutoCompleteParser.fromJson;

  @override
  @JsonKey(toJson: ParserType._toType, fromJson: ParserType._fromType)
  ParserType get parserType;
  @JsonKey(toJson: ParserType._toType, fromJson: ParserType._fromType)
  set parserType(ParserType value);
  @override
  String get name;
  set name(String value);
  @override
  String get uuid;
  set uuid(String value);
  @override
  List<ExtraSelector> get extra;
  set extra(List<ExtraSelector> value);
  @override
  Selector get itemSelector;
  set itemSelector(Selector value);
  @override
  Selector get itemComplete;
  set itemComplete(Selector value);
  @override
  Selector get itemTitle;
  set itemTitle(Selector value);
  @override
  Selector get itemSubtitle;
  set itemSubtitle(Selector value);
  @override
  Selector get successSelector;
  set successSelector(Selector value);
  @override
  Selector get failedSelector;
  set failedSelector(Selector value);
  @override
  @JsonKey(ignore: true)
  _$$_AutoCompleteParserCopyWith<_$_AutoCompleteParser> get copyWith =>
      throw _privateConstructorUsedError;
}
