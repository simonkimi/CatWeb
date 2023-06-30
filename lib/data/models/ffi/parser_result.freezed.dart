// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parser_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListParserResultItem _$ListParserResultItemFromJson(Map<String, dynamic> json) {
  return _ListParserItem.fromJson(json);
}

/// @nodoc
mixin _$ListParserResultItem {
  String? get title => throw _privateConstructorUsedError;
  String? get subtitle => throw _privateConstructorUsedError;
  String? get uploadTime => throw _privateConstructorUsedError;
  double? get star => throw _privateConstructorUsedError;
  int? get imgCount => throw _privateConstructorUsedError;
  ImageRspModel? get previewImg => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;
  TagRspModel? get tag => throw _privateConstructorUsedError;
  List<TagRspModel> get badges => throw _privateConstructorUsedError;
  String? get paper => throw _privateConstructorUsedError;
  String? get target => throw _privateConstructorUsedError;
  String? get nextPage => throw _privateConstructorUsedError;
  Map<String, String> get env => throw _privateConstructorUsedError;

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
      int? imgCount,
      ImageRspModel? previewImg,
      String? language,
      TagRspModel? tag,
      List<TagRspModel> badges,
      String? paper,
      String? target,
      String? nextPage,
      Map<String, String> env});

  $ImageRspModelCopyWith<$Res>? get previewImg;
  $TagRspModelCopyWith<$Res>? get tag;
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
    Object? imgCount = freezed,
    Object? previewImg = freezed,
    Object? language = freezed,
    Object? tag = freezed,
    Object? badges = null,
    Object? paper = freezed,
    Object? target = freezed,
    Object? nextPage = freezed,
    Object? env = null,
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
      imgCount: freezed == imgCount
          ? _value.imgCount
          : imgCount // ignore: cast_nullable_to_non_nullable
              as int?,
      previewImg: freezed == previewImg
          ? _value.previewImg
          : previewImg // ignore: cast_nullable_to_non_nullable
              as ImageRspModel?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as TagRspModel?,
      badges: null == badges
          ? _value.badges
          : badges // ignore: cast_nullable_to_non_nullable
              as List<TagRspModel>,
      paper: freezed == paper
          ? _value.paper
          : paper // ignore: cast_nullable_to_non_nullable
              as String?,
      target: freezed == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String?,
      nextPage: freezed == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as String?,
      env: null == env
          ? _value.env
          : env // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageRspModelCopyWith<$Res>? get previewImg {
    if (_value.previewImg == null) {
      return null;
    }

    return $ImageRspModelCopyWith<$Res>(_value.previewImg!, (value) {
      return _then(_value.copyWith(previewImg: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TagRspModelCopyWith<$Res>? get tag {
    if (_value.tag == null) {
      return null;
    }

    return $TagRspModelCopyWith<$Res>(_value.tag!, (value) {
      return _then(_value.copyWith(tag: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ListParserItemCopyWith<$Res>
    implements $ListParserResultItemCopyWith<$Res> {
  factory _$$_ListParserItemCopyWith(
          _$_ListParserItem value, $Res Function(_$_ListParserItem) then) =
      __$$_ListParserItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? title,
      String? subtitle,
      String? uploadTime,
      double? star,
      int? imgCount,
      ImageRspModel? previewImg,
      String? language,
      TagRspModel? tag,
      List<TagRspModel> badges,
      String? paper,
      String? target,
      String? nextPage,
      Map<String, String> env});

  @override
  $ImageRspModelCopyWith<$Res>? get previewImg;
  @override
  $TagRspModelCopyWith<$Res>? get tag;
}

/// @nodoc
class __$$_ListParserItemCopyWithImpl<$Res>
    extends _$ListParserResultItemCopyWithImpl<$Res, _$_ListParserItem>
    implements _$$_ListParserItemCopyWith<$Res> {
  __$$_ListParserItemCopyWithImpl(
      _$_ListParserItem _value, $Res Function(_$_ListParserItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? subtitle = freezed,
    Object? uploadTime = freezed,
    Object? star = freezed,
    Object? imgCount = freezed,
    Object? previewImg = freezed,
    Object? language = freezed,
    Object? tag = freezed,
    Object? badges = null,
    Object? paper = freezed,
    Object? target = freezed,
    Object? nextPage = freezed,
    Object? env = null,
  }) {
    return _then(_$_ListParserItem(
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
      imgCount: freezed == imgCount
          ? _value.imgCount
          : imgCount // ignore: cast_nullable_to_non_nullable
              as int?,
      previewImg: freezed == previewImg
          ? _value.previewImg
          : previewImg // ignore: cast_nullable_to_non_nullable
              as ImageRspModel?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as TagRspModel?,
      badges: null == badges
          ? _value._badges
          : badges // ignore: cast_nullable_to_non_nullable
              as List<TagRspModel>,
      paper: freezed == paper
          ? _value.paper
          : paper // ignore: cast_nullable_to_non_nullable
              as String?,
      target: freezed == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String?,
      nextPage: freezed == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as String?,
      env: null == env
          ? _value._env
          : env // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ListParserItem implements _ListParserItem {
  _$_ListParserItem(
      {required this.title,
      required this.subtitle,
      required this.uploadTime,
      required this.star,
      required this.imgCount,
      required this.previewImg,
      required this.language,
      required this.tag,
      required final List<TagRspModel> badges,
      required this.paper,
      required this.target,
      required this.nextPage,
      required final Map<String, String> env})
      : _badges = badges,
        _env = env;

  factory _$_ListParserItem.fromJson(Map<String, dynamic> json) =>
      _$$_ListParserItemFromJson(json);

  @override
  final String? title;
  @override
  final String? subtitle;
  @override
  final String? uploadTime;
  @override
  final double? star;
  @override
  final int? imgCount;
  @override
  final ImageRspModel? previewImg;
  @override
  final String? language;
  @override
  final TagRspModel? tag;
  final List<TagRspModel> _badges;
  @override
  List<TagRspModel> get badges {
    if (_badges is EqualUnmodifiableListView) return _badges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_badges);
  }

  @override
  final String? paper;
  @override
  final String? target;
  @override
  final String? nextPage;
  final Map<String, String> _env;
  @override
  Map<String, String> get env {
    if (_env is EqualUnmodifiableMapView) return _env;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_env);
  }

  @override
  String toString() {
    return 'ListParserResultItem(title: $title, subtitle: $subtitle, uploadTime: $uploadTime, star: $star, imgCount: $imgCount, previewImg: $previewImg, language: $language, tag: $tag, badges: $badges, paper: $paper, target: $target, nextPage: $nextPage, env: $env)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListParserItem &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.uploadTime, uploadTime) ||
                other.uploadTime == uploadTime) &&
            (identical(other.star, star) || other.star == star) &&
            (identical(other.imgCount, imgCount) ||
                other.imgCount == imgCount) &&
            (identical(other.previewImg, previewImg) ||
                other.previewImg == previewImg) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            const DeepCollectionEquality().equals(other._badges, _badges) &&
            (identical(other.paper, paper) || other.paper == paper) &&
            (identical(other.target, target) || other.target == target) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage) &&
            const DeepCollectionEquality().equals(other._env, _env));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      subtitle,
      uploadTime,
      star,
      imgCount,
      previewImg,
      language,
      tag,
      const DeepCollectionEquality().hash(_badges),
      paper,
      target,
      nextPage,
      const DeepCollectionEquality().hash(_env));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ListParserItemCopyWith<_$_ListParserItem> get copyWith =>
      __$$_ListParserItemCopyWithImpl<_$_ListParserItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ListParserItemToJson(
      this,
    );
  }
}

abstract class _ListParserItem implements ListParserResultItem {
  factory _ListParserItem(
      {required final String? title,
      required final String? subtitle,
      required final String? uploadTime,
      required final double? star,
      required final int? imgCount,
      required final ImageRspModel? previewImg,
      required final String? language,
      required final TagRspModel? tag,
      required final List<TagRspModel> badges,
      required final String? paper,
      required final String? target,
      required final String? nextPage,
      required final Map<String, String> env}) = _$_ListParserItem;

  factory _ListParserItem.fromJson(Map<String, dynamic> json) =
      _$_ListParserItem.fromJson;

  @override
  String? get title;
  @override
  String? get subtitle;
  @override
  String? get uploadTime;
  @override
  double? get star;
  @override
  int? get imgCount;
  @override
  ImageRspModel? get previewImg;
  @override
  String? get language;
  @override
  TagRspModel? get tag;
  @override
  List<TagRspModel> get badges;
  @override
  String? get paper;
  @override
  String? get target;
  @override
  String? get nextPage;
  @override
  Map<String, String> get env;
  @override
  @JsonKey(ignore: true)
  _$$_ListParserItemCopyWith<_$_ListParserItem> get copyWith =>
      throw _privateConstructorUsedError;
}

ListParserResult _$ListParserResultFromJson(Map<String, dynamic> json) {
  return _ListParserResult.fromJson(json);
}

/// @nodoc
mixin _$ListParserResult {
  List<ListParserResultItem> get items => throw _privateConstructorUsedError;
  String get nextPage => throw _privateConstructorUsedError;
  bool get enableSuccess => throw _privateConstructorUsedError;
  bool get enableFail => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  String get failedMessage => throw _privateConstructorUsedError;
  Map<String, String> get localEnv => throw _privateConstructorUsedError;
  Map<String, String> get globalEnv => throw _privateConstructorUsedError;

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
      {List<ListParserResultItem> items,
      String nextPage,
      bool enableSuccess,
      bool enableFail,
      bool isSuccess,
      String failedMessage,
      Map<String, String> localEnv,
      Map<String, String> globalEnv});
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
    Object? items = null,
    Object? nextPage = null,
    Object? enableSuccess = null,
    Object? enableFail = null,
    Object? isSuccess = null,
    Object? failedMessage = null,
    Object? localEnv = null,
    Object? globalEnv = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ListParserResultItem>,
      nextPage: null == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as String,
      enableSuccess: null == enableSuccess
          ? _value.enableSuccess
          : enableSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      enableFail: null == enableFail
          ? _value.enableFail
          : enableFail // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      failedMessage: null == failedMessage
          ? _value.failedMessage
          : failedMessage // ignore: cast_nullable_to_non_nullable
              as String,
      localEnv: null == localEnv
          ? _value.localEnv
          : localEnv // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      globalEnv: null == globalEnv
          ? _value.globalEnv
          : globalEnv // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
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
      {List<ListParserResultItem> items,
      String nextPage,
      bool enableSuccess,
      bool enableFail,
      bool isSuccess,
      String failedMessage,
      Map<String, String> localEnv,
      Map<String, String> globalEnv});
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
    Object? items = null,
    Object? nextPage = null,
    Object? enableSuccess = null,
    Object? enableFail = null,
    Object? isSuccess = null,
    Object? failedMessage = null,
    Object? localEnv = null,
    Object? globalEnv = null,
  }) {
    return _then(_$_ListParserResult(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ListParserResultItem>,
      nextPage: null == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as String,
      enableSuccess: null == enableSuccess
          ? _value.enableSuccess
          : enableSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      enableFail: null == enableFail
          ? _value.enableFail
          : enableFail // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      failedMessage: null == failedMessage
          ? _value.failedMessage
          : failedMessage // ignore: cast_nullable_to_non_nullable
              as String,
      localEnv: null == localEnv
          ? _value._localEnv
          : localEnv // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      globalEnv: null == globalEnv
          ? _value._globalEnv
          : globalEnv // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ListParserResult implements _ListParserResult {
  _$_ListParserResult(
      {required final List<ListParserResultItem> items,
      required this.nextPage,
      required this.enableSuccess,
      required this.enableFail,
      required this.isSuccess,
      required this.failedMessage,
      required final Map<String, String> localEnv,
      required final Map<String, String> globalEnv})
      : _items = items,
        _localEnv = localEnv,
        _globalEnv = globalEnv;

  factory _$_ListParserResult.fromJson(Map<String, dynamic> json) =>
      _$$_ListParserResultFromJson(json);

  final List<ListParserResultItem> _items;
  @override
  List<ListParserResultItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final String nextPage;
  @override
  final bool enableSuccess;
  @override
  final bool enableFail;
  @override
  final bool isSuccess;
  @override
  final String failedMessage;
  final Map<String, String> _localEnv;
  @override
  Map<String, String> get localEnv {
    if (_localEnv is EqualUnmodifiableMapView) return _localEnv;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_localEnv);
  }

  final Map<String, String> _globalEnv;
  @override
  Map<String, String> get globalEnv {
    if (_globalEnv is EqualUnmodifiableMapView) return _globalEnv;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_globalEnv);
  }

  @override
  String toString() {
    return 'ListParserResult(items: $items, nextPage: $nextPage, enableSuccess: $enableSuccess, enableFail: $enableFail, isSuccess: $isSuccess, failedMessage: $failedMessage, localEnv: $localEnv, globalEnv: $globalEnv)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListParserResult &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage) &&
            (identical(other.enableSuccess, enableSuccess) ||
                other.enableSuccess == enableSuccess) &&
            (identical(other.enableFail, enableFail) ||
                other.enableFail == enableFail) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.failedMessage, failedMessage) ||
                other.failedMessage == failedMessage) &&
            const DeepCollectionEquality().equals(other._localEnv, _localEnv) &&
            const DeepCollectionEquality()
                .equals(other._globalEnv, _globalEnv));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      nextPage,
      enableSuccess,
      enableFail,
      isSuccess,
      failedMessage,
      const DeepCollectionEquality().hash(_localEnv),
      const DeepCollectionEquality().hash(_globalEnv));

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
  factory _ListParserResult(
      {required final List<ListParserResultItem> items,
      required final String nextPage,
      required final bool enableSuccess,
      required final bool enableFail,
      required final bool isSuccess,
      required final String failedMessage,
      required final Map<String, String> localEnv,
      required final Map<String, String> globalEnv}) = _$_ListParserResult;

  factory _ListParserResult.fromJson(Map<String, dynamic> json) =
      _$_ListParserResult.fromJson;

  @override
  List<ListParserResultItem> get items;
  @override
  String get nextPage;
  @override
  bool get enableSuccess;
  @override
  bool get enableFail;
  @override
  bool get isSuccess;
  @override
  String get failedMessage;
  @override
  Map<String, String> get localEnv;
  @override
  Map<String, String> get globalEnv;
  @override
  @JsonKey(ignore: true)
  _$$_ListParserResultCopyWith<_$_ListParserResult> get copyWith =>
      throw _privateConstructorUsedError;
}

GalleryParserResult _$GalleryParserResultFromJson(Map<String, dynamic> json) {
  return _GalleryParserResult.fromJson(json);
}

/// @nodoc
mixin _$GalleryParserResult {
  String? get title => throw _privateConstructorUsedError;
  String? get subtitle => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;
  int? get imageCount => throw _privateConstructorUsedError;
  String? get uploadTime => throw _privateConstructorUsedError;
  int? get countPrePage => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  double? get star => throw _privateConstructorUsedError;
  List<GalleryParserResultItem> get items => throw _privateConstructorUsedError;
  ImageRspModel? get coverImg => throw _privateConstructorUsedError;
  TagRspModel? get tag => throw _privateConstructorUsedError;
  List<TagRspModel> get badges => throw _privateConstructorUsedError;
  List<GalleryParserResultComment> get comments =>
      throw _privateConstructorUsedError;
  String? get nextPage => throw _privateConstructorUsedError;
  bool? get enableSuccess => throw _privateConstructorUsedError;
  bool? get enableFail => throw _privateConstructorUsedError;
  bool? get isSuccess => throw _privateConstructorUsedError;
  String? get failedMessage => throw _privateConstructorUsedError;
  Map<String, String> get localEnv => throw _privateConstructorUsedError;
  Map<String, String> get globalEnv => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GalleryParserResultCopyWith<GalleryParserResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GalleryParserResultCopyWith<$Res> {
  factory $GalleryParserResultCopyWith(
          GalleryParserResult value, $Res Function(GalleryParserResult) then) =
      _$GalleryParserResultCopyWithImpl<$Res, GalleryParserResult>;
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
      List<GalleryParserResultItem> items,
      ImageRspModel? coverImg,
      TagRspModel? tag,
      List<TagRspModel> badges,
      List<GalleryParserResultComment> comments,
      String? nextPage,
      bool? enableSuccess,
      bool? enableFail,
      bool? isSuccess,
      String? failedMessage,
      Map<String, String> localEnv,
      Map<String, String> globalEnv});

  $ImageRspModelCopyWith<$Res>? get coverImg;
  $TagRspModelCopyWith<$Res>? get tag;
}

/// @nodoc
class _$GalleryParserResultCopyWithImpl<$Res, $Val extends GalleryParserResult>
    implements $GalleryParserResultCopyWith<$Res> {
  _$GalleryParserResultCopyWithImpl(this._value, this._then);

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
    Object? items = null,
    Object? coverImg = freezed,
    Object? tag = freezed,
    Object? badges = null,
    Object? comments = null,
    Object? nextPage = freezed,
    Object? enableSuccess = freezed,
    Object? enableFail = freezed,
    Object? isSuccess = freezed,
    Object? failedMessage = freezed,
    Object? localEnv = null,
    Object? globalEnv = null,
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
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<GalleryParserResultItem>,
      coverImg: freezed == coverImg
          ? _value.coverImg
          : coverImg // ignore: cast_nullable_to_non_nullable
              as ImageRspModel?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as TagRspModel?,
      badges: null == badges
          ? _value.badges
          : badges // ignore: cast_nullable_to_non_nullable
              as List<TagRspModel>,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<GalleryParserResultComment>,
      nextPage: freezed == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as String?,
      enableSuccess: freezed == enableSuccess
          ? _value.enableSuccess
          : enableSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      enableFail: freezed == enableFail
          ? _value.enableFail
          : enableFail // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSuccess: freezed == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      failedMessage: freezed == failedMessage
          ? _value.failedMessage
          : failedMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      localEnv: null == localEnv
          ? _value.localEnv
          : localEnv // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      globalEnv: null == globalEnv
          ? _value.globalEnv
          : globalEnv // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageRspModelCopyWith<$Res>? get coverImg {
    if (_value.coverImg == null) {
      return null;
    }

    return $ImageRspModelCopyWith<$Res>(_value.coverImg!, (value) {
      return _then(_value.copyWith(coverImg: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TagRspModelCopyWith<$Res>? get tag {
    if (_value.tag == null) {
      return null;
    }

    return $TagRspModelCopyWith<$Res>(_value.tag!, (value) {
      return _then(_value.copyWith(tag: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_GalleryParserResultCopyWith<$Res>
    implements $GalleryParserResultCopyWith<$Res> {
  factory _$$_GalleryParserResultCopyWith(_$_GalleryParserResult value,
          $Res Function(_$_GalleryParserResult) then) =
      __$$_GalleryParserResultCopyWithImpl<$Res>;
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
      List<GalleryParserResultItem> items,
      ImageRspModel? coverImg,
      TagRspModel? tag,
      List<TagRspModel> badges,
      List<GalleryParserResultComment> comments,
      String? nextPage,
      bool? enableSuccess,
      bool? enableFail,
      bool? isSuccess,
      String? failedMessage,
      Map<String, String> localEnv,
      Map<String, String> globalEnv});

  @override
  $ImageRspModelCopyWith<$Res>? get coverImg;
  @override
  $TagRspModelCopyWith<$Res>? get tag;
}

/// @nodoc
class __$$_GalleryParserResultCopyWithImpl<$Res>
    extends _$GalleryParserResultCopyWithImpl<$Res, _$_GalleryParserResult>
    implements _$$_GalleryParserResultCopyWith<$Res> {
  __$$_GalleryParserResultCopyWithImpl(_$_GalleryParserResult _value,
      $Res Function(_$_GalleryParserResult) _then)
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
    Object? items = null,
    Object? coverImg = freezed,
    Object? tag = freezed,
    Object? badges = null,
    Object? comments = null,
    Object? nextPage = freezed,
    Object? enableSuccess = freezed,
    Object? enableFail = freezed,
    Object? isSuccess = freezed,
    Object? failedMessage = freezed,
    Object? localEnv = null,
    Object? globalEnv = null,
  }) {
    return _then(_$_GalleryParserResult(
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
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<GalleryParserResultItem>,
      coverImg: freezed == coverImg
          ? _value.coverImg
          : coverImg // ignore: cast_nullable_to_non_nullable
              as ImageRspModel?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as TagRspModel?,
      badges: null == badges
          ? _value._badges
          : badges // ignore: cast_nullable_to_non_nullable
              as List<TagRspModel>,
      comments: null == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<GalleryParserResultComment>,
      nextPage: freezed == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as String?,
      enableSuccess: freezed == enableSuccess
          ? _value.enableSuccess
          : enableSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      enableFail: freezed == enableFail
          ? _value.enableFail
          : enableFail // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSuccess: freezed == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      failedMessage: freezed == failedMessage
          ? _value.failedMessage
          : failedMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      localEnv: null == localEnv
          ? _value._localEnv
          : localEnv // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      globalEnv: null == globalEnv
          ? _value._globalEnv
          : globalEnv // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GalleryParserResult implements _GalleryParserResult {
  _$_GalleryParserResult(
      {required this.title,
      required this.subtitle,
      required this.language,
      required this.imageCount,
      required this.uploadTime,
      required this.countPrePage,
      required this.description,
      required this.star,
      required final List<GalleryParserResultItem> items,
      required this.coverImg,
      required this.tag,
      required final List<TagRspModel> badges,
      required final List<GalleryParserResultComment> comments,
      required this.nextPage,
      required this.enableSuccess,
      required this.enableFail,
      required this.isSuccess,
      required this.failedMessage,
      required final Map<String, String> localEnv,
      required final Map<String, String> globalEnv})
      : _items = items,
        _badges = badges,
        _comments = comments,
        _localEnv = localEnv,
        _globalEnv = globalEnv;

  factory _$_GalleryParserResult.fromJson(Map<String, dynamic> json) =>
      _$$_GalleryParserResultFromJson(json);

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
  final List<GalleryParserResultItem> _items;
  @override
  List<GalleryParserResultItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final ImageRspModel? coverImg;
  @override
  final TagRspModel? tag;
  final List<TagRspModel> _badges;
  @override
  List<TagRspModel> get badges {
    if (_badges is EqualUnmodifiableListView) return _badges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_badges);
  }

  final List<GalleryParserResultComment> _comments;
  @override
  List<GalleryParserResultComment> get comments {
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  @override
  final String? nextPage;
  @override
  final bool? enableSuccess;
  @override
  final bool? enableFail;
  @override
  final bool? isSuccess;
  @override
  final String? failedMessage;
  final Map<String, String> _localEnv;
  @override
  Map<String, String> get localEnv {
    if (_localEnv is EqualUnmodifiableMapView) return _localEnv;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_localEnv);
  }

  final Map<String, String> _globalEnv;
  @override
  Map<String, String> get globalEnv {
    if (_globalEnv is EqualUnmodifiableMapView) return _globalEnv;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_globalEnv);
  }

  @override
  String toString() {
    return 'GalleryParserResult(title: $title, subtitle: $subtitle, language: $language, imageCount: $imageCount, uploadTime: $uploadTime, countPrePage: $countPrePage, description: $description, star: $star, items: $items, coverImg: $coverImg, tag: $tag, badges: $badges, comments: $comments, nextPage: $nextPage, enableSuccess: $enableSuccess, enableFail: $enableFail, isSuccess: $isSuccess, failedMessage: $failedMessage, localEnv: $localEnv, globalEnv: $globalEnv)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GalleryParserResult &&
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
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.coverImg, coverImg) ||
                other.coverImg == coverImg) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            const DeepCollectionEquality().equals(other._badges, _badges) &&
            const DeepCollectionEquality().equals(other._comments, _comments) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage) &&
            (identical(other.enableSuccess, enableSuccess) ||
                other.enableSuccess == enableSuccess) &&
            (identical(other.enableFail, enableFail) ||
                other.enableFail == enableFail) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.failedMessage, failedMessage) ||
                other.failedMessage == failedMessage) &&
            const DeepCollectionEquality().equals(other._localEnv, _localEnv) &&
            const DeepCollectionEquality()
                .equals(other._globalEnv, _globalEnv));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        title,
        subtitle,
        language,
        imageCount,
        uploadTime,
        countPrePage,
        description,
        star,
        const DeepCollectionEquality().hash(_items),
        coverImg,
        tag,
        const DeepCollectionEquality().hash(_badges),
        const DeepCollectionEquality().hash(_comments),
        nextPage,
        enableSuccess,
        enableFail,
        isSuccess,
        failedMessage,
        const DeepCollectionEquality().hash(_localEnv),
        const DeepCollectionEquality().hash(_globalEnv)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GalleryParserResultCopyWith<_$_GalleryParserResult> get copyWith =>
      __$$_GalleryParserResultCopyWithImpl<_$_GalleryParserResult>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GalleryParserResultToJson(
      this,
    );
  }
}

abstract class _GalleryParserResult implements GalleryParserResult {
  factory _GalleryParserResult(
      {required final String? title,
      required final String? subtitle,
      required final String? language,
      required final int? imageCount,
      required final String? uploadTime,
      required final int? countPrePage,
      required final String? description,
      required final double? star,
      required final List<GalleryParserResultItem> items,
      required final ImageRspModel? coverImg,
      required final TagRspModel? tag,
      required final List<TagRspModel> badges,
      required final List<GalleryParserResultComment> comments,
      required final String? nextPage,
      required final bool? enableSuccess,
      required final bool? enableFail,
      required final bool? isSuccess,
      required final String? failedMessage,
      required final Map<String, String> localEnv,
      required final Map<String, String> globalEnv}) = _$_GalleryParserResult;

  factory _GalleryParserResult.fromJson(Map<String, dynamic> json) =
      _$_GalleryParserResult.fromJson;

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
  List<GalleryParserResultItem> get items;
  @override
  ImageRspModel? get coverImg;
  @override
  TagRspModel? get tag;
  @override
  List<TagRspModel> get badges;
  @override
  List<GalleryParserResultComment> get comments;
  @override
  String? get nextPage;
  @override
  bool? get enableSuccess;
  @override
  bool? get enableFail;
  @override
  bool? get isSuccess;
  @override
  String? get failedMessage;
  @override
  Map<String, String> get localEnv;
  @override
  Map<String, String> get globalEnv;
  @override
  @JsonKey(ignore: true)
  _$$_GalleryParserResultCopyWith<_$_GalleryParserResult> get copyWith =>
      throw _privateConstructorUsedError;
}

GalleryParserResultComment _$GalleryParserResultCommentFromJson(
    Map<String, dynamic> json) {
  return _GalleryParserResultComment.fromJson(json);
}

/// @nodoc
mixin _$GalleryParserResultComment {
  String? get username => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  String? get time => throw _privateConstructorUsedError;
  String? get score => throw _privateConstructorUsedError;
  ImageRspModel get avatar => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GalleryParserResultCommentCopyWith<GalleryParserResultComment>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GalleryParserResultCommentCopyWith<$Res> {
  factory $GalleryParserResultCommentCopyWith(GalleryParserResultComment value,
          $Res Function(GalleryParserResultComment) then) =
      _$GalleryParserResultCommentCopyWithImpl<$Res,
          GalleryParserResultComment>;
  @useResult
  $Res call(
      {String? username,
      String? content,
      String? time,
      String? score,
      ImageRspModel avatar});

  $ImageRspModelCopyWith<$Res> get avatar;
}

/// @nodoc
class _$GalleryParserResultCommentCopyWithImpl<$Res,
        $Val extends GalleryParserResultComment>
    implements $GalleryParserResultCommentCopyWith<$Res> {
  _$GalleryParserResultCommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = freezed,
    Object? content = freezed,
    Object? time = freezed,
    Object? score = freezed,
    Object? avatar = null,
  }) {
    return _then(_value.copyWith(
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as ImageRspModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageRspModelCopyWith<$Res> get avatar {
    return $ImageRspModelCopyWith<$Res>(_value.avatar, (value) {
      return _then(_value.copyWith(avatar: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_GalleryParserResultCommentCopyWith<$Res>
    implements $GalleryParserResultCommentCopyWith<$Res> {
  factory _$$_GalleryParserResultCommentCopyWith(
          _$_GalleryParserResultComment value,
          $Res Function(_$_GalleryParserResultComment) then) =
      __$$_GalleryParserResultCommentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? username,
      String? content,
      String? time,
      String? score,
      ImageRspModel avatar});

  @override
  $ImageRspModelCopyWith<$Res> get avatar;
}

/// @nodoc
class __$$_GalleryParserResultCommentCopyWithImpl<$Res>
    extends _$GalleryParserResultCommentCopyWithImpl<$Res,
        _$_GalleryParserResultComment>
    implements _$$_GalleryParserResultCommentCopyWith<$Res> {
  __$$_GalleryParserResultCommentCopyWithImpl(
      _$_GalleryParserResultComment _value,
      $Res Function(_$_GalleryParserResultComment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = freezed,
    Object? content = freezed,
    Object? time = freezed,
    Object? score = freezed,
    Object? avatar = null,
  }) {
    return _then(_$_GalleryParserResultComment(
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as ImageRspModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GalleryParserResultComment extends _GalleryParserResultComment {
  _$_GalleryParserResultComment(
      {required this.username,
      required this.content,
      required this.time,
      required this.score,
      required this.avatar})
      : super._();

  factory _$_GalleryParserResultComment.fromJson(Map<String, dynamic> json) =>
      _$$_GalleryParserResultCommentFromJson(json);

  @override
  final String? username;
  @override
  final String? content;
  @override
  final String? time;
  @override
  final String? score;
  @override
  final ImageRspModel avatar;

  @override
  String toString() {
    return 'GalleryParserResultComment(username: $username, content: $content, time: $time, score: $score, avatar: $avatar)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GalleryParserResultComment &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, username, content, time, score, avatar);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GalleryParserResultCommentCopyWith<_$_GalleryParserResultComment>
      get copyWith => __$$_GalleryParserResultCommentCopyWithImpl<
          _$_GalleryParserResultComment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GalleryParserResultCommentToJson(
      this,
    );
  }
}

abstract class _GalleryParserResultComment extends GalleryParserResultComment {
  factory _GalleryParserResultComment(
      {required final String? username,
      required final String? content,
      required final String? time,
      required final String? score,
      required final ImageRspModel avatar}) = _$_GalleryParserResultComment;
  _GalleryParserResultComment._() : super._();

  factory _GalleryParserResultComment.fromJson(Map<String, dynamic> json) =
      _$_GalleryParserResultComment.fromJson;

  @override
  String? get username;
  @override
  String? get content;
  @override
  String? get time;
  @override
  String? get score;
  @override
  ImageRspModel get avatar;
  @override
  @JsonKey(ignore: true)
  _$$_GalleryParserResultCommentCopyWith<_$_GalleryParserResultComment>
      get copyWith => throw _privateConstructorUsedError;
}

GalleryParserResultItem _$GalleryParserResultItemFromJson(
    Map<String, dynamic> json) {
  return _GalleryParserResultItem.fromJson(json);
}

/// @nodoc
mixin _$GalleryParserResultItem {
  ImageRspModel? get previewImg => throw _privateConstructorUsedError;
  String? get target => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GalleryParserResultItemCopyWith<GalleryParserResultItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GalleryParserResultItemCopyWith<$Res> {
  factory $GalleryParserResultItemCopyWith(GalleryParserResultItem value,
          $Res Function(GalleryParserResultItem) then) =
      _$GalleryParserResultItemCopyWithImpl<$Res, GalleryParserResultItem>;
  @useResult
  $Res call({ImageRspModel? previewImg, String? target});

  $ImageRspModelCopyWith<$Res>? get previewImg;
}

/// @nodoc
class _$GalleryParserResultItemCopyWithImpl<$Res,
        $Val extends GalleryParserResultItem>
    implements $GalleryParserResultItemCopyWith<$Res> {
  _$GalleryParserResultItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? previewImg = freezed,
    Object? target = freezed,
  }) {
    return _then(_value.copyWith(
      previewImg: freezed == previewImg
          ? _value.previewImg
          : previewImg // ignore: cast_nullable_to_non_nullable
              as ImageRspModel?,
      target: freezed == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageRspModelCopyWith<$Res>? get previewImg {
    if (_value.previewImg == null) {
      return null;
    }

    return $ImageRspModelCopyWith<$Res>(_value.previewImg!, (value) {
      return _then(_value.copyWith(previewImg: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_GalleryParserResultItemCopyWith<$Res>
    implements $GalleryParserResultItemCopyWith<$Res> {
  factory _$$_GalleryParserResultItemCopyWith(_$_GalleryParserResultItem value,
          $Res Function(_$_GalleryParserResultItem) then) =
      __$$_GalleryParserResultItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ImageRspModel? previewImg, String? target});

  @override
  $ImageRspModelCopyWith<$Res>? get previewImg;
}

/// @nodoc
class __$$_GalleryParserResultItemCopyWithImpl<$Res>
    extends _$GalleryParserResultItemCopyWithImpl<$Res,
        _$_GalleryParserResultItem>
    implements _$$_GalleryParserResultItemCopyWith<$Res> {
  __$$_GalleryParserResultItemCopyWithImpl(_$_GalleryParserResultItem _value,
      $Res Function(_$_GalleryParserResultItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? previewImg = freezed,
    Object? target = freezed,
  }) {
    return _then(_$_GalleryParserResultItem(
      previewImg: freezed == previewImg
          ? _value.previewImg
          : previewImg // ignore: cast_nullable_to_non_nullable
              as ImageRspModel?,
      target: freezed == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GalleryParserResultItem extends _GalleryParserResultItem {
  _$_GalleryParserResultItem({required this.previewImg, required this.target})
      : super._();

  factory _$_GalleryParserResultItem.fromJson(Map<String, dynamic> json) =>
      _$$_GalleryParserResultItemFromJson(json);

  @override
  final ImageRspModel? previewImg;
  @override
  final String? target;

  @override
  String toString() {
    return 'GalleryParserResultItem(previewImg: $previewImg, target: $target)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GalleryParserResultItem &&
            (identical(other.previewImg, previewImg) ||
                other.previewImg == previewImg) &&
            (identical(other.target, target) || other.target == target));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, previewImg, target);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GalleryParserResultItemCopyWith<_$_GalleryParserResultItem>
      get copyWith =>
          __$$_GalleryParserResultItemCopyWithImpl<_$_GalleryParserResultItem>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GalleryParserResultItemToJson(
      this,
    );
  }
}

abstract class _GalleryParserResultItem extends GalleryParserResultItem {
  factory _GalleryParserResultItem(
      {required final ImageRspModel? previewImg,
      required final String? target}) = _$_GalleryParserResultItem;
  _GalleryParserResultItem._() : super._();

  factory _GalleryParserResultItem.fromJson(Map<String, dynamic> json) =
      _$_GalleryParserResultItem.fromJson;

  @override
  ImageRspModel? get previewImg;
  @override
  String? get target;
  @override
  @JsonKey(ignore: true)
  _$$_GalleryParserResultItemCopyWith<_$_GalleryParserResultItem>
      get copyWith => throw _privateConstructorUsedError;
}

ImageReaderParserResult _$ImageReaderParserResultFromJson(
    Map<String, dynamic> json) {
  return _ImageReaderParserResult.fromJson(json);
}

/// @nodoc
mixin _$ImageReaderParserResult {
  ImageRspModel get image => throw _privateConstructorUsedError;
  String? get largerImageUrl => throw _privateConstructorUsedError;
  String? get rawImageUrl => throw _privateConstructorUsedError;
  String? get uploadTime => throw _privateConstructorUsedError;
  String? get source => throw _privateConstructorUsedError;
  String? get rating => throw _privateConstructorUsedError;
  String? get score => throw _privateConstructorUsedError;
  List<TagRspModel> get badges => throw _privateConstructorUsedError;
  Map<String, String> get localEnv => throw _privateConstructorUsedError;
  Map<String, String> get globalEnv => throw _privateConstructorUsedError;
  bool? get enableSuccess => throw _privateConstructorUsedError;
  bool? get enableFail => throw _privateConstructorUsedError;
  bool? get isSuccess => throw _privateConstructorUsedError;
  String? get failedMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageReaderParserResultCopyWith<ImageReaderParserResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageReaderParserResultCopyWith<$Res> {
  factory $ImageReaderParserResultCopyWith(ImageReaderParserResult value,
          $Res Function(ImageReaderParserResult) then) =
      _$ImageReaderParserResultCopyWithImpl<$Res, ImageReaderParserResult>;
  @useResult
  $Res call(
      {ImageRspModel image,
      String? largerImageUrl,
      String? rawImageUrl,
      String? uploadTime,
      String? source,
      String? rating,
      String? score,
      List<TagRspModel> badges,
      Map<String, String> localEnv,
      Map<String, String> globalEnv,
      bool? enableSuccess,
      bool? enableFail,
      bool? isSuccess,
      String? failedMessage});

  $ImageRspModelCopyWith<$Res> get image;
}

/// @nodoc
class _$ImageReaderParserResultCopyWithImpl<$Res,
        $Val extends ImageReaderParserResult>
    implements $ImageReaderParserResultCopyWith<$Res> {
  _$ImageReaderParserResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? largerImageUrl = freezed,
    Object? rawImageUrl = freezed,
    Object? uploadTime = freezed,
    Object? source = freezed,
    Object? rating = freezed,
    Object? score = freezed,
    Object? badges = null,
    Object? localEnv = null,
    Object? globalEnv = null,
    Object? enableSuccess = freezed,
    Object? enableFail = freezed,
    Object? isSuccess = freezed,
    Object? failedMessage = freezed,
  }) {
    return _then(_value.copyWith(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as ImageRspModel,
      largerImageUrl: freezed == largerImageUrl
          ? _value.largerImageUrl
          : largerImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      rawImageUrl: freezed == rawImageUrl
          ? _value.rawImageUrl
          : rawImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as String?,
      badges: null == badges
          ? _value.badges
          : badges // ignore: cast_nullable_to_non_nullable
              as List<TagRspModel>,
      localEnv: null == localEnv
          ? _value.localEnv
          : localEnv // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      globalEnv: null == globalEnv
          ? _value.globalEnv
          : globalEnv // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      enableSuccess: freezed == enableSuccess
          ? _value.enableSuccess
          : enableSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      enableFail: freezed == enableFail
          ? _value.enableFail
          : enableFail // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSuccess: freezed == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      failedMessage: freezed == failedMessage
          ? _value.failedMessage
          : failedMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageRspModelCopyWith<$Res> get image {
    return $ImageRspModelCopyWith<$Res>(_value.image, (value) {
      return _then(_value.copyWith(image: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ImageReaderParserResultCopyWith<$Res>
    implements $ImageReaderParserResultCopyWith<$Res> {
  factory _$$_ImageReaderParserResultCopyWith(_$_ImageReaderParserResult value,
          $Res Function(_$_ImageReaderParserResult) then) =
      __$$_ImageReaderParserResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ImageRspModel image,
      String? largerImageUrl,
      String? rawImageUrl,
      String? uploadTime,
      String? source,
      String? rating,
      String? score,
      List<TagRspModel> badges,
      Map<String, String> localEnv,
      Map<String, String> globalEnv,
      bool? enableSuccess,
      bool? enableFail,
      bool? isSuccess,
      String? failedMessage});

  @override
  $ImageRspModelCopyWith<$Res> get image;
}

/// @nodoc
class __$$_ImageReaderParserResultCopyWithImpl<$Res>
    extends _$ImageReaderParserResultCopyWithImpl<$Res,
        _$_ImageReaderParserResult>
    implements _$$_ImageReaderParserResultCopyWith<$Res> {
  __$$_ImageReaderParserResultCopyWithImpl(_$_ImageReaderParserResult _value,
      $Res Function(_$_ImageReaderParserResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? largerImageUrl = freezed,
    Object? rawImageUrl = freezed,
    Object? uploadTime = freezed,
    Object? source = freezed,
    Object? rating = freezed,
    Object? score = freezed,
    Object? badges = null,
    Object? localEnv = null,
    Object? globalEnv = null,
    Object? enableSuccess = freezed,
    Object? enableFail = freezed,
    Object? isSuccess = freezed,
    Object? failedMessage = freezed,
  }) {
    return _then(_$_ImageReaderParserResult(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as ImageRspModel,
      largerImageUrl: freezed == largerImageUrl
          ? _value.largerImageUrl
          : largerImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      rawImageUrl: freezed == rawImageUrl
          ? _value.rawImageUrl
          : rawImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as String?,
      badges: null == badges
          ? _value._badges
          : badges // ignore: cast_nullable_to_non_nullable
              as List<TagRspModel>,
      localEnv: null == localEnv
          ? _value._localEnv
          : localEnv // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      globalEnv: null == globalEnv
          ? _value._globalEnv
          : globalEnv // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      enableSuccess: freezed == enableSuccess
          ? _value.enableSuccess
          : enableSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      enableFail: freezed == enableFail
          ? _value.enableFail
          : enableFail // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSuccess: freezed == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      failedMessage: freezed == failedMessage
          ? _value.failedMessage
          : failedMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ImageReaderParserResult extends _ImageReaderParserResult {
  _$_ImageReaderParserResult(
      {required this.image,
      required this.largerImageUrl,
      required this.rawImageUrl,
      required this.uploadTime,
      required this.source,
      required this.rating,
      required this.score,
      required final List<TagRspModel> badges,
      required final Map<String, String> localEnv,
      required final Map<String, String> globalEnv,
      required this.enableSuccess,
      required this.enableFail,
      required this.isSuccess,
      required this.failedMessage})
      : _badges = badges,
        _localEnv = localEnv,
        _globalEnv = globalEnv,
        super._();

  factory _$_ImageReaderParserResult.fromJson(Map<String, dynamic> json) =>
      _$$_ImageReaderParserResultFromJson(json);

  @override
  final ImageRspModel image;
  @override
  final String? largerImageUrl;
  @override
  final String? rawImageUrl;
  @override
  final String? uploadTime;
  @override
  final String? source;
  @override
  final String? rating;
  @override
  final String? score;
  final List<TagRspModel> _badges;
  @override
  List<TagRspModel> get badges {
    if (_badges is EqualUnmodifiableListView) return _badges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_badges);
  }

  final Map<String, String> _localEnv;
  @override
  Map<String, String> get localEnv {
    if (_localEnv is EqualUnmodifiableMapView) return _localEnv;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_localEnv);
  }

  final Map<String, String> _globalEnv;
  @override
  Map<String, String> get globalEnv {
    if (_globalEnv is EqualUnmodifiableMapView) return _globalEnv;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_globalEnv);
  }

  @override
  final bool? enableSuccess;
  @override
  final bool? enableFail;
  @override
  final bool? isSuccess;
  @override
  final String? failedMessage;

  @override
  String toString() {
    return 'ImageReaderParserResult(image: $image, largerImageUrl: $largerImageUrl, rawImageUrl: $rawImageUrl, uploadTime: $uploadTime, source: $source, rating: $rating, score: $score, badges: $badges, localEnv: $localEnv, globalEnv: $globalEnv, enableSuccess: $enableSuccess, enableFail: $enableFail, isSuccess: $isSuccess, failedMessage: $failedMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImageReaderParserResult &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.largerImageUrl, largerImageUrl) ||
                other.largerImageUrl == largerImageUrl) &&
            (identical(other.rawImageUrl, rawImageUrl) ||
                other.rawImageUrl == rawImageUrl) &&
            (identical(other.uploadTime, uploadTime) ||
                other.uploadTime == uploadTime) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.score, score) || other.score == score) &&
            const DeepCollectionEquality().equals(other._badges, _badges) &&
            const DeepCollectionEquality().equals(other._localEnv, _localEnv) &&
            const DeepCollectionEquality()
                .equals(other._globalEnv, _globalEnv) &&
            (identical(other.enableSuccess, enableSuccess) ||
                other.enableSuccess == enableSuccess) &&
            (identical(other.enableFail, enableFail) ||
                other.enableFail == enableFail) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.failedMessage, failedMessage) ||
                other.failedMessage == failedMessage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      image,
      largerImageUrl,
      rawImageUrl,
      uploadTime,
      source,
      rating,
      score,
      const DeepCollectionEquality().hash(_badges),
      const DeepCollectionEquality().hash(_localEnv),
      const DeepCollectionEquality().hash(_globalEnv),
      enableSuccess,
      enableFail,
      isSuccess,
      failedMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ImageReaderParserResultCopyWith<_$_ImageReaderParserResult>
      get copyWith =>
          __$$_ImageReaderParserResultCopyWithImpl<_$_ImageReaderParserResult>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ImageReaderParserResultToJson(
      this,
    );
  }
}

abstract class _ImageReaderParserResult extends ImageReaderParserResult {
  factory _ImageReaderParserResult(
      {required final ImageRspModel image,
      required final String? largerImageUrl,
      required final String? rawImageUrl,
      required final String? uploadTime,
      required final String? source,
      required final String? rating,
      required final String? score,
      required final List<TagRspModel> badges,
      required final Map<String, String> localEnv,
      required final Map<String, String> globalEnv,
      required final bool? enableSuccess,
      required final bool? enableFail,
      required final bool? isSuccess,
      required final String? failedMessage}) = _$_ImageReaderParserResult;
  _ImageReaderParserResult._() : super._();

  factory _ImageReaderParserResult.fromJson(Map<String, dynamic> json) =
      _$_ImageReaderParserResult.fromJson;

  @override
  ImageRspModel get image;
  @override
  String? get largerImageUrl;
  @override
  String? get rawImageUrl;
  @override
  String? get uploadTime;
  @override
  String? get source;
  @override
  String? get rating;
  @override
  String? get score;
  @override
  List<TagRspModel> get badges;
  @override
  Map<String, String> get localEnv;
  @override
  Map<String, String> get globalEnv;
  @override
  bool? get enableSuccess;
  @override
  bool? get enableFail;
  @override
  bool? get isSuccess;
  @override
  String? get failedMessage;
  @override
  @JsonKey(ignore: true)
  _$$_ImageReaderParserResultCopyWith<_$_ImageReaderParserResult>
      get copyWith => throw _privateConstructorUsedError;
}

AutoCompleteParserResultItem _$AutoCompleteParserResultItemFromJson(
    Map<String, dynamic> json) {
  return _AutoCompleteParserResultItem.fromJson(json);
}

/// @nodoc
mixin _$AutoCompleteParserResultItem {
  String? get title => throw _privateConstructorUsedError;
  String? get subtitle => throw _privateConstructorUsedError;
  String? get complete => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AutoCompleteParserResultItemCopyWith<AutoCompleteParserResultItem>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AutoCompleteParserResultItemCopyWith<$Res> {
  factory $AutoCompleteParserResultItemCopyWith(
          AutoCompleteParserResultItem value,
          $Res Function(AutoCompleteParserResultItem) then) =
      _$AutoCompleteParserResultItemCopyWithImpl<$Res,
          AutoCompleteParserResultItem>;
  @useResult
  $Res call({String? title, String? subtitle, String? complete});
}

/// @nodoc
class _$AutoCompleteParserResultItemCopyWithImpl<$Res,
        $Val extends AutoCompleteParserResultItem>
    implements $AutoCompleteParserResultItemCopyWith<$Res> {
  _$AutoCompleteParserResultItemCopyWithImpl(this._value, this._then);

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
abstract class _$$_AutoCompleteParserResultItemCopyWith<$Res>
    implements $AutoCompleteParserResultItemCopyWith<$Res> {
  factory _$$_AutoCompleteParserResultItemCopyWith(
          _$_AutoCompleteParserResultItem value,
          $Res Function(_$_AutoCompleteParserResultItem) then) =
      __$$_AutoCompleteParserResultItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? title, String? subtitle, String? complete});
}

/// @nodoc
class __$$_AutoCompleteParserResultItemCopyWithImpl<$Res>
    extends _$AutoCompleteParserResultItemCopyWithImpl<$Res,
        _$_AutoCompleteParserResultItem>
    implements _$$_AutoCompleteParserResultItemCopyWith<$Res> {
  __$$_AutoCompleteParserResultItemCopyWithImpl(
      _$_AutoCompleteParserResultItem _value,
      $Res Function(_$_AutoCompleteParserResultItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? subtitle = freezed,
    Object? complete = freezed,
  }) {
    return _then(_$_AutoCompleteParserResultItem(
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
class _$_AutoCompleteParserResultItem extends _AutoCompleteParserResultItem {
  _$_AutoCompleteParserResultItem(
      {required this.title, required this.subtitle, required this.complete})
      : super._();

  factory _$_AutoCompleteParserResultItem.fromJson(Map<String, dynamic> json) =>
      _$$_AutoCompleteParserResultItemFromJson(json);

  @override
  final String? title;
  @override
  final String? subtitle;
  @override
  final String? complete;

  @override
  String toString() {
    return 'AutoCompleteParserResultItem(title: $title, subtitle: $subtitle, complete: $complete)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AutoCompleteParserResultItem &&
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
  _$$_AutoCompleteParserResultItemCopyWith<_$_AutoCompleteParserResultItem>
      get copyWith => __$$_AutoCompleteParserResultItemCopyWithImpl<
          _$_AutoCompleteParserResultItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AutoCompleteParserResultItemToJson(
      this,
    );
  }
}

abstract class _AutoCompleteParserResultItem
    extends AutoCompleteParserResultItem {
  factory _AutoCompleteParserResultItem(
      {required final String? title,
      required final String? subtitle,
      required final String? complete}) = _$_AutoCompleteParserResultItem;
  _AutoCompleteParserResultItem._() : super._();

  factory _AutoCompleteParserResultItem.fromJson(Map<String, dynamic> json) =
      _$_AutoCompleteParserResultItem.fromJson;

  @override
  String? get title;
  @override
  String? get subtitle;
  @override
  String? get complete;
  @override
  @JsonKey(ignore: true)
  _$$_AutoCompleteParserResultItemCopyWith<_$_AutoCompleteParserResultItem>
      get copyWith => throw _privateConstructorUsedError;
}

AutoCompleteParserResult _$AutoCompleteParserResultFromJson(
    Map<String, dynamic> json) {
  return _AutoCompleteParserResult.fromJson(json);
}

/// @nodoc
mixin _$AutoCompleteParserResult {
  List<AutoCompleteParserResultItem> get items =>
      throw _privateConstructorUsedError;
  Map<String, String> get localEnv => throw _privateConstructorUsedError;
  Map<String, String> get globalEnv => throw _privateConstructorUsedError;
  bool? get enableSuccess => throw _privateConstructorUsedError;
  bool? get enableFail => throw _privateConstructorUsedError;
  bool? get isSuccess => throw _privateConstructorUsedError;
  String? get failedMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AutoCompleteParserResultCopyWith<AutoCompleteParserResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AutoCompleteParserResultCopyWith<$Res> {
  factory $AutoCompleteParserResultCopyWith(AutoCompleteParserResult value,
          $Res Function(AutoCompleteParserResult) then) =
      _$AutoCompleteParserResultCopyWithImpl<$Res, AutoCompleteParserResult>;
  @useResult
  $Res call(
      {List<AutoCompleteParserResultItem> items,
      Map<String, String> localEnv,
      Map<String, String> globalEnv,
      bool? enableSuccess,
      bool? enableFail,
      bool? isSuccess,
      String? failedMessage});
}

/// @nodoc
class _$AutoCompleteParserResultCopyWithImpl<$Res,
        $Val extends AutoCompleteParserResult>
    implements $AutoCompleteParserResultCopyWith<$Res> {
  _$AutoCompleteParserResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? localEnv = null,
    Object? globalEnv = null,
    Object? enableSuccess = freezed,
    Object? enableFail = freezed,
    Object? isSuccess = freezed,
    Object? failedMessage = freezed,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<AutoCompleteParserResultItem>,
      localEnv: null == localEnv
          ? _value.localEnv
          : localEnv // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      globalEnv: null == globalEnv
          ? _value.globalEnv
          : globalEnv // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      enableSuccess: freezed == enableSuccess
          ? _value.enableSuccess
          : enableSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      enableFail: freezed == enableFail
          ? _value.enableFail
          : enableFail // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSuccess: freezed == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      failedMessage: freezed == failedMessage
          ? _value.failedMessage
          : failedMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AutoCompleteParserResultCopyWith<$Res>
    implements $AutoCompleteParserResultCopyWith<$Res> {
  factory _$$_AutoCompleteParserResultCopyWith(
          _$_AutoCompleteParserResult value,
          $Res Function(_$_AutoCompleteParserResult) then) =
      __$$_AutoCompleteParserResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<AutoCompleteParserResultItem> items,
      Map<String, String> localEnv,
      Map<String, String> globalEnv,
      bool? enableSuccess,
      bool? enableFail,
      bool? isSuccess,
      String? failedMessage});
}

/// @nodoc
class __$$_AutoCompleteParserResultCopyWithImpl<$Res>
    extends _$AutoCompleteParserResultCopyWithImpl<$Res,
        _$_AutoCompleteParserResult>
    implements _$$_AutoCompleteParserResultCopyWith<$Res> {
  __$$_AutoCompleteParserResultCopyWithImpl(_$_AutoCompleteParserResult _value,
      $Res Function(_$_AutoCompleteParserResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? localEnv = null,
    Object? globalEnv = null,
    Object? enableSuccess = freezed,
    Object? enableFail = freezed,
    Object? isSuccess = freezed,
    Object? failedMessage = freezed,
  }) {
    return _then(_$_AutoCompleteParserResult(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<AutoCompleteParserResultItem>,
      localEnv: null == localEnv
          ? _value._localEnv
          : localEnv // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      globalEnv: null == globalEnv
          ? _value._globalEnv
          : globalEnv // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      enableSuccess: freezed == enableSuccess
          ? _value.enableSuccess
          : enableSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      enableFail: freezed == enableFail
          ? _value.enableFail
          : enableFail // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSuccess: freezed == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      failedMessage: freezed == failedMessage
          ? _value.failedMessage
          : failedMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AutoCompleteParserResult extends _AutoCompleteParserResult {
  _$_AutoCompleteParserResult(
      {required final List<AutoCompleteParserResultItem> items,
      required final Map<String, String> localEnv,
      required final Map<String, String> globalEnv,
      required this.enableSuccess,
      required this.enableFail,
      required this.isSuccess,
      required this.failedMessage})
      : _items = items,
        _localEnv = localEnv,
        _globalEnv = globalEnv,
        super._();

  factory _$_AutoCompleteParserResult.fromJson(Map<String, dynamic> json) =>
      _$$_AutoCompleteParserResultFromJson(json);

  final List<AutoCompleteParserResultItem> _items;
  @override
  List<AutoCompleteParserResultItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  final Map<String, String> _localEnv;
  @override
  Map<String, String> get localEnv {
    if (_localEnv is EqualUnmodifiableMapView) return _localEnv;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_localEnv);
  }

  final Map<String, String> _globalEnv;
  @override
  Map<String, String> get globalEnv {
    if (_globalEnv is EqualUnmodifiableMapView) return _globalEnv;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_globalEnv);
  }

  @override
  final bool? enableSuccess;
  @override
  final bool? enableFail;
  @override
  final bool? isSuccess;
  @override
  final String? failedMessage;

  @override
  String toString() {
    return 'AutoCompleteParserResult(items: $items, localEnv: $localEnv, globalEnv: $globalEnv, enableSuccess: $enableSuccess, enableFail: $enableFail, isSuccess: $isSuccess, failedMessage: $failedMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AutoCompleteParserResult &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality().equals(other._localEnv, _localEnv) &&
            const DeepCollectionEquality()
                .equals(other._globalEnv, _globalEnv) &&
            (identical(other.enableSuccess, enableSuccess) ||
                other.enableSuccess == enableSuccess) &&
            (identical(other.enableFail, enableFail) ||
                other.enableFail == enableFail) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.failedMessage, failedMessage) ||
                other.failedMessage == failedMessage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(_localEnv),
      const DeepCollectionEquality().hash(_globalEnv),
      enableSuccess,
      enableFail,
      isSuccess,
      failedMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AutoCompleteParserResultCopyWith<_$_AutoCompleteParserResult>
      get copyWith => __$$_AutoCompleteParserResultCopyWithImpl<
          _$_AutoCompleteParserResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AutoCompleteParserResultToJson(
      this,
    );
  }
}

abstract class _AutoCompleteParserResult extends AutoCompleteParserResult {
  factory _AutoCompleteParserResult(
      {required final List<AutoCompleteParserResultItem> items,
      required final Map<String, String> localEnv,
      required final Map<String, String> globalEnv,
      required final bool? enableSuccess,
      required final bool? enableFail,
      required final bool? isSuccess,
      required final String? failedMessage}) = _$_AutoCompleteParserResult;
  _AutoCompleteParserResult._() : super._();

  factory _AutoCompleteParserResult.fromJson(Map<String, dynamic> json) =
      _$_AutoCompleteParserResult.fromJson;

  @override
  List<AutoCompleteParserResultItem> get items;
  @override
  Map<String, String> get localEnv;
  @override
  Map<String, String> get globalEnv;
  @override
  bool? get enableSuccess;
  @override
  bool? get enableFail;
  @override
  bool? get isSuccess;
  @override
  String? get failedMessage;
  @override
  @JsonKey(ignore: true)
  _$$_AutoCompleteParserResultCopyWith<_$_AutoCompleteParserResult>
      get copyWith => throw _privateConstructorUsedError;
}
