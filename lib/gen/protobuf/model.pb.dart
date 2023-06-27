//
//  Generated code. Do not modify.
//  source: model.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ImageRpcModel extends $pb.GeneratedMessage {
  factory ImageRpcModel() => create();
  ImageRpcModel._() : super();
  factory ImageRpcModel.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ImageRpcModel.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ImageRpcModel', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'url')
    ..aOS(2, _omitFieldNames ? '' : 'cacheKey', protoName: 'cacheKey')
    ..a<$core.double>(3, _omitFieldNames ? '' : 'width', $pb.PbFieldType.OD)
    ..a<$core.double>(4, _omitFieldNames ? '' : 'height', $pb.PbFieldType.OD)
    ..a<$core.double>(5, _omitFieldNames ? '' : 'imgX', $pb.PbFieldType.OD, protoName: 'imgX')
    ..a<$core.double>(6, _omitFieldNames ? '' : 'imgY', $pb.PbFieldType.OD, protoName: 'imgY')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ImageRpcModel clone() => ImageRpcModel()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ImageRpcModel copyWith(void Function(ImageRpcModel) updates) => super.copyWith((message) => updates(message as ImageRpcModel)) as ImageRpcModel;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ImageRpcModel create() => ImageRpcModel._();
  ImageRpcModel createEmptyInstance() => create();
  static $pb.PbList<ImageRpcModel> createRepeated() => $pb.PbList<ImageRpcModel>();
  @$core.pragma('dart2js:noInline')
  static ImageRpcModel getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ImageRpcModel>(create);
  static ImageRpcModel? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get cacheKey => $_getSZ(1);
  @$pb.TagNumber(2)
  set cacheKey($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCacheKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearCacheKey() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get width => $_getN(2);
  @$pb.TagNumber(3)
  set width($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasWidth() => $_has(2);
  @$pb.TagNumber(3)
  void clearWidth() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get height => $_getN(3);
  @$pb.TagNumber(4)
  set height($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasHeight() => $_has(3);
  @$pb.TagNumber(4)
  void clearHeight() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get imgX => $_getN(4);
  @$pb.TagNumber(5)
  set imgX($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasImgX() => $_has(4);
  @$pb.TagNumber(5)
  void clearImgX() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get imgY => $_getN(5);
  @$pb.TagNumber(6)
  set imgY($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasImgY() => $_has(5);
  @$pb.TagNumber(6)
  void clearImgY() => clearField(6);
}

class ColorRpcModel extends $pb.GeneratedMessage {
  factory ColorRpcModel() => create();
  ColorRpcModel._() : super();
  factory ColorRpcModel.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ColorRpcModel.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ColorRpcModel', createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'a', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'r', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'g', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'b', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ColorRpcModel clone() => ColorRpcModel()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ColorRpcModel copyWith(void Function(ColorRpcModel) updates) => super.copyWith((message) => updates(message as ColorRpcModel)) as ColorRpcModel;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ColorRpcModel create() => ColorRpcModel._();
  ColorRpcModel createEmptyInstance() => create();
  static $pb.PbList<ColorRpcModel> createRepeated() => $pb.PbList<ColorRpcModel>();
  @$core.pragma('dart2js:noInline')
  static ColorRpcModel getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ColorRpcModel>(create);
  static ColorRpcModel? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get a => $_getIZ(0);
  @$pb.TagNumber(1)
  set a($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasA() => $_has(0);
  @$pb.TagNumber(1)
  void clearA() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get r => $_getIZ(1);
  @$pb.TagNumber(2)
  set r($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasR() => $_has(1);
  @$pb.TagNumber(2)
  void clearR() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get g => $_getIZ(2);
  @$pb.TagNumber(3)
  set g($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasG() => $_has(2);
  @$pb.TagNumber(3)
  void clearG() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get b => $_getIZ(3);
  @$pb.TagNumber(4)
  set b($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasB() => $_has(3);
  @$pb.TagNumber(4)
  void clearB() => clearField(4);
}

class TagRpcModel extends $pb.GeneratedMessage {
  factory TagRpcModel() => create();
  TagRpcModel._() : super();
  factory TagRpcModel.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TagRpcModel.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TagRpcModel', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'text')
    ..aOM<ColorRpcModel>(2, _omitFieldNames ? '' : 'color', subBuilder: ColorRpcModel.create)
    ..aOS(3, _omitFieldNames ? '' : 'category')
    ..m<$core.String, $core.String>(4, _omitFieldNames ? '' : 'env', entryClassName: 'TagRpcModel.EnvEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TagRpcModel clone() => TagRpcModel()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TagRpcModel copyWith(void Function(TagRpcModel) updates) => super.copyWith((message) => updates(message as TagRpcModel)) as TagRpcModel;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TagRpcModel create() => TagRpcModel._();
  TagRpcModel createEmptyInstance() => create();
  static $pb.PbList<TagRpcModel> createRepeated() => $pb.PbList<TagRpcModel>();
  @$core.pragma('dart2js:noInline')
  static TagRpcModel getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TagRpcModel>(create);
  static TagRpcModel? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get text => $_getSZ(0);
  @$pb.TagNumber(1)
  set text($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasText() => $_has(0);
  @$pb.TagNumber(1)
  void clearText() => clearField(1);

  @$pb.TagNumber(2)
  ColorRpcModel get color => $_getN(1);
  @$pb.TagNumber(2)
  set color(ColorRpcModel v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasColor() => $_has(1);
  @$pb.TagNumber(2)
  void clearColor() => clearField(2);
  @$pb.TagNumber(2)
  ColorRpcModel ensureColor() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get category => $_getSZ(2);
  @$pb.TagNumber(3)
  set category($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCategory() => $_has(2);
  @$pb.TagNumber(3)
  void clearCategory() => clearField(3);

  @$pb.TagNumber(4)
  $core.Map<$core.String, $core.String> get env => $_getMap(3);
}

class ListRpcModel_Item extends $pb.GeneratedMessage {
  factory ListRpcModel_Item() => create();
  ListRpcModel_Item._() : super();
  factory ListRpcModel_Item.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListRpcModel_Item.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListRpcModel.Item', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'title')
    ..aOS(2, _omitFieldNames ? '' : 'subtitle')
    ..aOS(3, _omitFieldNames ? '' : 'uploadTime')
    ..a<$core.double>(4, _omitFieldNames ? '' : 'star', $pb.PbFieldType.OD)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'imgCount', $pb.PbFieldType.O3)
    ..aOM<ImageRpcModel>(6, _omitFieldNames ? '' : 'previewImg', subBuilder: ImageRpcModel.create)
    ..aOS(7, _omitFieldNames ? '' : 'language')
    ..aOM<TagRpcModel>(10, _omitFieldNames ? '' : 'tag', subBuilder: TagRpcModel.create)
    ..pc<TagRpcModel>(11, _omitFieldNames ? '' : 'badges', $pb.PbFieldType.PM, subBuilder: TagRpcModel.create)
    ..aOS(12, _omitFieldNames ? '' : 'paper')
    ..aOS(13, _omitFieldNames ? '' : 'target')
    ..aOS(20, _omitFieldNames ? '' : 'nextPage')
    ..m<$core.String, $core.String>(30, _omitFieldNames ? '' : 'env', entryClassName: 'ListRpcModel.Item.EnvEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListRpcModel_Item clone() => ListRpcModel_Item()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListRpcModel_Item copyWith(void Function(ListRpcModel_Item) updates) => super.copyWith((message) => updates(message as ListRpcModel_Item)) as ListRpcModel_Item;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListRpcModel_Item create() => ListRpcModel_Item._();
  ListRpcModel_Item createEmptyInstance() => create();
  static $pb.PbList<ListRpcModel_Item> createRepeated() => $pb.PbList<ListRpcModel_Item>();
  @$core.pragma('dart2js:noInline')
  static ListRpcModel_Item getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListRpcModel_Item>(create);
  static ListRpcModel_Item? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get subtitle => $_getSZ(1);
  @$pb.TagNumber(2)
  set subtitle($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSubtitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearSubtitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get uploadTime => $_getSZ(2);
  @$pb.TagNumber(3)
  set uploadTime($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUploadTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearUploadTime() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get star => $_getN(3);
  @$pb.TagNumber(4)
  set star($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasStar() => $_has(3);
  @$pb.TagNumber(4)
  void clearStar() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get imgCount => $_getIZ(4);
  @$pb.TagNumber(5)
  set imgCount($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasImgCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearImgCount() => clearField(5);

  @$pb.TagNumber(6)
  ImageRpcModel get previewImg => $_getN(5);
  @$pb.TagNumber(6)
  set previewImg(ImageRpcModel v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasPreviewImg() => $_has(5);
  @$pb.TagNumber(6)
  void clearPreviewImg() => clearField(6);
  @$pb.TagNumber(6)
  ImageRpcModel ensurePreviewImg() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.String get language => $_getSZ(6);
  @$pb.TagNumber(7)
  set language($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasLanguage() => $_has(6);
  @$pb.TagNumber(7)
  void clearLanguage() => clearField(7);

  @$pb.TagNumber(10)
  TagRpcModel get tag => $_getN(7);
  @$pb.TagNumber(10)
  set tag(TagRpcModel v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasTag() => $_has(7);
  @$pb.TagNumber(10)
  void clearTag() => clearField(10);
  @$pb.TagNumber(10)
  TagRpcModel ensureTag() => $_ensure(7);

  @$pb.TagNumber(11)
  $core.List<TagRpcModel> get badges => $_getList(8);

  @$pb.TagNumber(12)
  $core.String get paper => $_getSZ(9);
  @$pb.TagNumber(12)
  set paper($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(12)
  $core.bool hasPaper() => $_has(9);
  @$pb.TagNumber(12)
  void clearPaper() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get target => $_getSZ(10);
  @$pb.TagNumber(13)
  set target($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(13)
  $core.bool hasTarget() => $_has(10);
  @$pb.TagNumber(13)
  void clearTarget() => clearField(13);

  @$pb.TagNumber(20)
  $core.String get nextPage => $_getSZ(11);
  @$pb.TagNumber(20)
  set nextPage($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(20)
  $core.bool hasNextPage() => $_has(11);
  @$pb.TagNumber(20)
  void clearNextPage() => clearField(20);

  @$pb.TagNumber(30)
  $core.Map<$core.String, $core.String> get env => $_getMap(12);
}

class ListRpcModel extends $pb.GeneratedMessage {
  factory ListRpcModel() => create();
  ListRpcModel._() : super();
  factory ListRpcModel.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListRpcModel.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListRpcModel', createEmptyInstance: create)
    ..pc<ListRpcModel_Item>(1, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM, subBuilder: ListRpcModel_Item.create)
    ..aOS(2, _omitFieldNames ? '' : 'nextPage')
    ..m<$core.String, $core.String>(10, _omitFieldNames ? '' : 'localEnv', protoName: 'localEnv', entryClassName: 'ListRpcModel.LocalEnvEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS)
    ..m<$core.String, $core.String>(11, _omitFieldNames ? '' : 'globalEnv', protoName: 'globalEnv', entryClassName: 'ListRpcModel.GlobalEnvEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS)
    ..aOB(20, _omitFieldNames ? '' : 'enableSuccess')
    ..aOB(21, _omitFieldNames ? '' : 'enableFail')
    ..aOB(22, _omitFieldNames ? '' : 'isSuccess')
    ..aOS(23, _omitFieldNames ? '' : 'failedMessage')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListRpcModel clone() => ListRpcModel()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListRpcModel copyWith(void Function(ListRpcModel) updates) => super.copyWith((message) => updates(message as ListRpcModel)) as ListRpcModel;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListRpcModel create() => ListRpcModel._();
  ListRpcModel createEmptyInstance() => create();
  static $pb.PbList<ListRpcModel> createRepeated() => $pb.PbList<ListRpcModel>();
  @$core.pragma('dart2js:noInline')
  static ListRpcModel getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListRpcModel>(create);
  static ListRpcModel? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ListRpcModel_Item> get items => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get nextPage => $_getSZ(1);
  @$pb.TagNumber(2)
  set nextPage($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNextPage() => $_has(1);
  @$pb.TagNumber(2)
  void clearNextPage() => clearField(2);

  @$pb.TagNumber(10)
  $core.Map<$core.String, $core.String> get localEnv => $_getMap(2);

  @$pb.TagNumber(11)
  $core.Map<$core.String, $core.String> get globalEnv => $_getMap(3);

  @$pb.TagNumber(20)
  $core.bool get enableSuccess => $_getBF(4);
  @$pb.TagNumber(20)
  set enableSuccess($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(20)
  $core.bool hasEnableSuccess() => $_has(4);
  @$pb.TagNumber(20)
  void clearEnableSuccess() => clearField(20);

  @$pb.TagNumber(21)
  $core.bool get enableFail => $_getBF(5);
  @$pb.TagNumber(21)
  set enableFail($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(21)
  $core.bool hasEnableFail() => $_has(5);
  @$pb.TagNumber(21)
  void clearEnableFail() => clearField(21);

  @$pb.TagNumber(22)
  $core.bool get isSuccess => $_getBF(6);
  @$pb.TagNumber(22)
  set isSuccess($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(22)
  $core.bool hasIsSuccess() => $_has(6);
  @$pb.TagNumber(22)
  void clearIsSuccess() => clearField(22);

  @$pb.TagNumber(23)
  $core.String get failedMessage => $_getSZ(7);
  @$pb.TagNumber(23)
  set failedMessage($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(23)
  $core.bool hasFailedMessage() => $_has(7);
  @$pb.TagNumber(23)
  void clearFailedMessage() => clearField(23);
}

class GalleryRpcModel_Comment extends $pb.GeneratedMessage {
  factory GalleryRpcModel_Comment() => create();
  GalleryRpcModel_Comment._() : super();
  factory GalleryRpcModel_Comment.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GalleryRpcModel_Comment.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GalleryRpcModel.Comment', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'username')
    ..aOS(2, _omitFieldNames ? '' : 'content')
    ..aOS(3, _omitFieldNames ? '' : 'time')
    ..aOS(4, _omitFieldNames ? '' : 'score')
    ..aOM<ImageRpcModel>(5, _omitFieldNames ? '' : 'avatar', subBuilder: ImageRpcModel.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GalleryRpcModel_Comment clone() => GalleryRpcModel_Comment()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GalleryRpcModel_Comment copyWith(void Function(GalleryRpcModel_Comment) updates) => super.copyWith((message) => updates(message as GalleryRpcModel_Comment)) as GalleryRpcModel_Comment;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GalleryRpcModel_Comment create() => GalleryRpcModel_Comment._();
  GalleryRpcModel_Comment createEmptyInstance() => create();
  static $pb.PbList<GalleryRpcModel_Comment> createRepeated() => $pb.PbList<GalleryRpcModel_Comment>();
  @$core.pragma('dart2js:noInline')
  static GalleryRpcModel_Comment getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GalleryRpcModel_Comment>(create);
  static GalleryRpcModel_Comment? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get username => $_getSZ(0);
  @$pb.TagNumber(1)
  set username($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUsername() => $_has(0);
  @$pb.TagNumber(1)
  void clearUsername() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get time => $_getSZ(2);
  @$pb.TagNumber(3)
  set time($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearTime() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get score => $_getSZ(3);
  @$pb.TagNumber(4)
  set score($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasScore() => $_has(3);
  @$pb.TagNumber(4)
  void clearScore() => clearField(4);

  @$pb.TagNumber(5)
  ImageRpcModel get avatar => $_getN(4);
  @$pb.TagNumber(5)
  set avatar(ImageRpcModel v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasAvatar() => $_has(4);
  @$pb.TagNumber(5)
  void clearAvatar() => clearField(5);
  @$pb.TagNumber(5)
  ImageRpcModel ensureAvatar() => $_ensure(4);
}

class GalleryRpcModel_Item extends $pb.GeneratedMessage {
  factory GalleryRpcModel_Item() => create();
  GalleryRpcModel_Item._() : super();
  factory GalleryRpcModel_Item.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GalleryRpcModel_Item.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GalleryRpcModel.Item', createEmptyInstance: create)
    ..aOM<ImageRpcModel>(9, _omitFieldNames ? '' : 'previewImg', subBuilder: ImageRpcModel.create)
    ..aOS(10, _omitFieldNames ? '' : 'target')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GalleryRpcModel_Item clone() => GalleryRpcModel_Item()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GalleryRpcModel_Item copyWith(void Function(GalleryRpcModel_Item) updates) => super.copyWith((message) => updates(message as GalleryRpcModel_Item)) as GalleryRpcModel_Item;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GalleryRpcModel_Item create() => GalleryRpcModel_Item._();
  GalleryRpcModel_Item createEmptyInstance() => create();
  static $pb.PbList<GalleryRpcModel_Item> createRepeated() => $pb.PbList<GalleryRpcModel_Item>();
  @$core.pragma('dart2js:noInline')
  static GalleryRpcModel_Item getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GalleryRpcModel_Item>(create);
  static GalleryRpcModel_Item? _defaultInstance;

  @$pb.TagNumber(9)
  ImageRpcModel get previewImg => $_getN(0);
  @$pb.TagNumber(9)
  set previewImg(ImageRpcModel v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasPreviewImg() => $_has(0);
  @$pb.TagNumber(9)
  void clearPreviewImg() => clearField(9);
  @$pb.TagNumber(9)
  ImageRpcModel ensurePreviewImg() => $_ensure(0);

  @$pb.TagNumber(10)
  $core.String get target => $_getSZ(1);
  @$pb.TagNumber(10)
  set target($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(10)
  $core.bool hasTarget() => $_has(1);
  @$pb.TagNumber(10)
  void clearTarget() => clearField(10);
}

class GalleryRpcModel extends $pb.GeneratedMessage {
  factory GalleryRpcModel() => create();
  GalleryRpcModel._() : super();
  factory GalleryRpcModel.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GalleryRpcModel.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GalleryRpcModel', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'title')
    ..aOS(2, _omitFieldNames ? '' : 'subtitle')
    ..aOS(3, _omitFieldNames ? '' : 'language')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'imageCount', $pb.PbFieldType.O3)
    ..aOS(5, _omitFieldNames ? '' : 'uploadTime')
    ..a<$core.int>(6, _omitFieldNames ? '' : 'countPrePage', $pb.PbFieldType.O3)
    ..aOS(7, _omitFieldNames ? '' : 'description')
    ..a<$core.double>(8, _omitFieldNames ? '' : 'star', $pb.PbFieldType.OD)
    ..pc<GalleryRpcModel_Item>(9, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM, subBuilder: GalleryRpcModel_Item.create)
    ..aOM<ImageRpcModel>(10, _omitFieldNames ? '' : 'coverImg', subBuilder: ImageRpcModel.create)
    ..aOM<TagRpcModel>(20, _omitFieldNames ? '' : 'tag', subBuilder: TagRpcModel.create)
    ..pc<TagRpcModel>(21, _omitFieldNames ? '' : 'badges', $pb.PbFieldType.PM, subBuilder: TagRpcModel.create)
    ..pc<GalleryRpcModel_Comment>(22, _omitFieldNames ? '' : 'comments', $pb.PbFieldType.PM, subBuilder: GalleryRpcModel_Comment.create)
    ..aOS(23, _omitFieldNames ? '' : 'nextPage')
    ..m<$core.String, $core.String>(30, _omitFieldNames ? '' : 'localEnv', protoName: 'localEnv', entryClassName: 'GalleryRpcModel.LocalEnvEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS)
    ..m<$core.String, $core.String>(31, _omitFieldNames ? '' : 'globalEnv', protoName: 'globalEnv', entryClassName: 'GalleryRpcModel.GlobalEnvEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS)
    ..aOB(40, _omitFieldNames ? '' : 'enableSuccess')
    ..aOB(41, _omitFieldNames ? '' : 'enableFail')
    ..aOB(42, _omitFieldNames ? '' : 'isSuccess')
    ..aOS(43, _omitFieldNames ? '' : 'failedMessage')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GalleryRpcModel clone() => GalleryRpcModel()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GalleryRpcModel copyWith(void Function(GalleryRpcModel) updates) => super.copyWith((message) => updates(message as GalleryRpcModel)) as GalleryRpcModel;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GalleryRpcModel create() => GalleryRpcModel._();
  GalleryRpcModel createEmptyInstance() => create();
  static $pb.PbList<GalleryRpcModel> createRepeated() => $pb.PbList<GalleryRpcModel>();
  @$core.pragma('dart2js:noInline')
  static GalleryRpcModel getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GalleryRpcModel>(create);
  static GalleryRpcModel? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get subtitle => $_getSZ(1);
  @$pb.TagNumber(2)
  set subtitle($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSubtitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearSubtitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get language => $_getSZ(2);
  @$pb.TagNumber(3)
  set language($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLanguage() => $_has(2);
  @$pb.TagNumber(3)
  void clearLanguage() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get imageCount => $_getIZ(3);
  @$pb.TagNumber(4)
  set imageCount($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasImageCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearImageCount() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get uploadTime => $_getSZ(4);
  @$pb.TagNumber(5)
  set uploadTime($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasUploadTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearUploadTime() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get countPrePage => $_getIZ(5);
  @$pb.TagNumber(6)
  set countPrePage($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCountPrePage() => $_has(5);
  @$pb.TagNumber(6)
  void clearCountPrePage() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get description => $_getSZ(6);
  @$pb.TagNumber(7)
  set description($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasDescription() => $_has(6);
  @$pb.TagNumber(7)
  void clearDescription() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get star => $_getN(7);
  @$pb.TagNumber(8)
  set star($core.double v) { $_setDouble(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasStar() => $_has(7);
  @$pb.TagNumber(8)
  void clearStar() => clearField(8);

  @$pb.TagNumber(9)
  $core.List<GalleryRpcModel_Item> get items => $_getList(8);

  @$pb.TagNumber(10)
  ImageRpcModel get coverImg => $_getN(9);
  @$pb.TagNumber(10)
  set coverImg(ImageRpcModel v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasCoverImg() => $_has(9);
  @$pb.TagNumber(10)
  void clearCoverImg() => clearField(10);
  @$pb.TagNumber(10)
  ImageRpcModel ensureCoverImg() => $_ensure(9);

  @$pb.TagNumber(20)
  TagRpcModel get tag => $_getN(10);
  @$pb.TagNumber(20)
  set tag(TagRpcModel v) { setField(20, v); }
  @$pb.TagNumber(20)
  $core.bool hasTag() => $_has(10);
  @$pb.TagNumber(20)
  void clearTag() => clearField(20);
  @$pb.TagNumber(20)
  TagRpcModel ensureTag() => $_ensure(10);

  @$pb.TagNumber(21)
  $core.List<TagRpcModel> get badges => $_getList(11);

  @$pb.TagNumber(22)
  $core.List<GalleryRpcModel_Comment> get comments => $_getList(12);

  @$pb.TagNumber(23)
  $core.String get nextPage => $_getSZ(13);
  @$pb.TagNumber(23)
  set nextPage($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(23)
  $core.bool hasNextPage() => $_has(13);
  @$pb.TagNumber(23)
  void clearNextPage() => clearField(23);

  @$pb.TagNumber(30)
  $core.Map<$core.String, $core.String> get localEnv => $_getMap(14);

  @$pb.TagNumber(31)
  $core.Map<$core.String, $core.String> get globalEnv => $_getMap(15);

  @$pb.TagNumber(40)
  $core.bool get enableSuccess => $_getBF(16);
  @$pb.TagNumber(40)
  set enableSuccess($core.bool v) { $_setBool(16, v); }
  @$pb.TagNumber(40)
  $core.bool hasEnableSuccess() => $_has(16);
  @$pb.TagNumber(40)
  void clearEnableSuccess() => clearField(40);

  @$pb.TagNumber(41)
  $core.bool get enableFail => $_getBF(17);
  @$pb.TagNumber(41)
  set enableFail($core.bool v) { $_setBool(17, v); }
  @$pb.TagNumber(41)
  $core.bool hasEnableFail() => $_has(17);
  @$pb.TagNumber(41)
  void clearEnableFail() => clearField(41);

  @$pb.TagNumber(42)
  $core.bool get isSuccess => $_getBF(18);
  @$pb.TagNumber(42)
  set isSuccess($core.bool v) { $_setBool(18, v); }
  @$pb.TagNumber(42)
  $core.bool hasIsSuccess() => $_has(18);
  @$pb.TagNumber(42)
  void clearIsSuccess() => clearField(42);

  @$pb.TagNumber(43)
  $core.String get failedMessage => $_getSZ(19);
  @$pb.TagNumber(43)
  set failedMessage($core.String v) { $_setString(19, v); }
  @$pb.TagNumber(43)
  $core.bool hasFailedMessage() => $_has(19);
  @$pb.TagNumber(43)
  void clearFailedMessage() => clearField(43);
}

class ImageReaderRpcModel extends $pb.GeneratedMessage {
  factory ImageReaderRpcModel() => create();
  ImageReaderRpcModel._() : super();
  factory ImageReaderRpcModel.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ImageReaderRpcModel.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ImageReaderRpcModel', createEmptyInstance: create)
    ..aOM<ImageRpcModel>(1, _omitFieldNames ? '' : 'image', subBuilder: ImageRpcModel.create)
    ..aOS(2, _omitFieldNames ? '' : 'largerImageUrl')
    ..aOS(3, _omitFieldNames ? '' : 'rawImageUrl')
    ..aOS(4, _omitFieldNames ? '' : 'uploadTime')
    ..aOS(5, _omitFieldNames ? '' : 'source')
    ..aOS(6, _omitFieldNames ? '' : 'rating')
    ..aOS(7, _omitFieldNames ? '' : 'score')
    ..pc<TagRpcModel>(10, _omitFieldNames ? '' : 'badges', $pb.PbFieldType.PM, subBuilder: TagRpcModel.create)
    ..m<$core.String, $core.String>(20, _omitFieldNames ? '' : 'localEnv', protoName: 'localEnv', entryClassName: 'ImageReaderRpcModel.LocalEnvEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS)
    ..m<$core.String, $core.String>(21, _omitFieldNames ? '' : 'globalEnv', protoName: 'globalEnv', entryClassName: 'ImageReaderRpcModel.GlobalEnvEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS)
    ..aOB(30, _omitFieldNames ? '' : 'enableSuccess')
    ..aOB(31, _omitFieldNames ? '' : 'enableFail')
    ..aOB(32, _omitFieldNames ? '' : 'isSuccess')
    ..aOS(33, _omitFieldNames ? '' : 'failedMessage')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ImageReaderRpcModel clone() => ImageReaderRpcModel()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ImageReaderRpcModel copyWith(void Function(ImageReaderRpcModel) updates) => super.copyWith((message) => updates(message as ImageReaderRpcModel)) as ImageReaderRpcModel;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ImageReaderRpcModel create() => ImageReaderRpcModel._();
  ImageReaderRpcModel createEmptyInstance() => create();
  static $pb.PbList<ImageReaderRpcModel> createRepeated() => $pb.PbList<ImageReaderRpcModel>();
  @$core.pragma('dart2js:noInline')
  static ImageReaderRpcModel getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ImageReaderRpcModel>(create);
  static ImageReaderRpcModel? _defaultInstance;

  @$pb.TagNumber(1)
  ImageRpcModel get image => $_getN(0);
  @$pb.TagNumber(1)
  set image(ImageRpcModel v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasImage() => $_has(0);
  @$pb.TagNumber(1)
  void clearImage() => clearField(1);
  @$pb.TagNumber(1)
  ImageRpcModel ensureImage() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get largerImageUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set largerImageUrl($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLargerImageUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearLargerImageUrl() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get rawImageUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set rawImageUrl($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRawImageUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearRawImageUrl() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get uploadTime => $_getSZ(3);
  @$pb.TagNumber(4)
  set uploadTime($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUploadTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearUploadTime() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get source => $_getSZ(4);
  @$pb.TagNumber(5)
  set source($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSource() => $_has(4);
  @$pb.TagNumber(5)
  void clearSource() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get rating => $_getSZ(5);
  @$pb.TagNumber(6)
  set rating($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasRating() => $_has(5);
  @$pb.TagNumber(6)
  void clearRating() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get score => $_getSZ(6);
  @$pb.TagNumber(7)
  set score($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasScore() => $_has(6);
  @$pb.TagNumber(7)
  void clearScore() => clearField(7);

  @$pb.TagNumber(10)
  $core.List<TagRpcModel> get badges => $_getList(7);

  @$pb.TagNumber(20)
  $core.Map<$core.String, $core.String> get localEnv => $_getMap(8);

  @$pb.TagNumber(21)
  $core.Map<$core.String, $core.String> get globalEnv => $_getMap(9);

  @$pb.TagNumber(30)
  $core.bool get enableSuccess => $_getBF(10);
  @$pb.TagNumber(30)
  set enableSuccess($core.bool v) { $_setBool(10, v); }
  @$pb.TagNumber(30)
  $core.bool hasEnableSuccess() => $_has(10);
  @$pb.TagNumber(30)
  void clearEnableSuccess() => clearField(30);

  @$pb.TagNumber(31)
  $core.bool get enableFail => $_getBF(11);
  @$pb.TagNumber(31)
  set enableFail($core.bool v) { $_setBool(11, v); }
  @$pb.TagNumber(31)
  $core.bool hasEnableFail() => $_has(11);
  @$pb.TagNumber(31)
  void clearEnableFail() => clearField(31);

  @$pb.TagNumber(32)
  $core.bool get isSuccess => $_getBF(12);
  @$pb.TagNumber(32)
  set isSuccess($core.bool v) { $_setBool(12, v); }
  @$pb.TagNumber(32)
  $core.bool hasIsSuccess() => $_has(12);
  @$pb.TagNumber(32)
  void clearIsSuccess() => clearField(32);

  @$pb.TagNumber(33)
  $core.String get failedMessage => $_getSZ(13);
  @$pb.TagNumber(33)
  set failedMessage($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(33)
  $core.bool hasFailedMessage() => $_has(13);
  @$pb.TagNumber(33)
  void clearFailedMessage() => clearField(33);
}

class AutoCompleteRpcModel_Item extends $pb.GeneratedMessage {
  factory AutoCompleteRpcModel_Item() => create();
  AutoCompleteRpcModel_Item._() : super();
  factory AutoCompleteRpcModel_Item.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AutoCompleteRpcModel_Item.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AutoCompleteRpcModel.Item', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'title')
    ..aOS(2, _omitFieldNames ? '' : 'subtitle')
    ..aOS(3, _omitFieldNames ? '' : 'complete')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AutoCompleteRpcModel_Item clone() => AutoCompleteRpcModel_Item()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AutoCompleteRpcModel_Item copyWith(void Function(AutoCompleteRpcModel_Item) updates) => super.copyWith((message) => updates(message as AutoCompleteRpcModel_Item)) as AutoCompleteRpcModel_Item;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AutoCompleteRpcModel_Item create() => AutoCompleteRpcModel_Item._();
  AutoCompleteRpcModel_Item createEmptyInstance() => create();
  static $pb.PbList<AutoCompleteRpcModel_Item> createRepeated() => $pb.PbList<AutoCompleteRpcModel_Item>();
  @$core.pragma('dart2js:noInline')
  static AutoCompleteRpcModel_Item getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AutoCompleteRpcModel_Item>(create);
  static AutoCompleteRpcModel_Item? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get subtitle => $_getSZ(1);
  @$pb.TagNumber(2)
  set subtitle($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSubtitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearSubtitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get complete => $_getSZ(2);
  @$pb.TagNumber(3)
  set complete($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasComplete() => $_has(2);
  @$pb.TagNumber(3)
  void clearComplete() => clearField(3);
}

class AutoCompleteRpcModel extends $pb.GeneratedMessage {
  factory AutoCompleteRpcModel() => create();
  AutoCompleteRpcModel._() : super();
  factory AutoCompleteRpcModel.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AutoCompleteRpcModel.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AutoCompleteRpcModel', createEmptyInstance: create)
    ..pc<AutoCompleteRpcModel_Item>(1, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM, subBuilder: AutoCompleteRpcModel_Item.create)
    ..m<$core.String, $core.String>(10, _omitFieldNames ? '' : 'localEnv', protoName: 'localEnv', entryClassName: 'AutoCompleteRpcModel.LocalEnvEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS)
    ..m<$core.String, $core.String>(11, _omitFieldNames ? '' : 'globalEnv', protoName: 'globalEnv', entryClassName: 'AutoCompleteRpcModel.GlobalEnvEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS)
    ..aOB(20, _omitFieldNames ? '' : 'enableSuccess')
    ..aOB(21, _omitFieldNames ? '' : 'enableFail')
    ..aOB(22, _omitFieldNames ? '' : 'isSuccess')
    ..aOS(23, _omitFieldNames ? '' : 'failedMessage')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AutoCompleteRpcModel clone() => AutoCompleteRpcModel()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AutoCompleteRpcModel copyWith(void Function(AutoCompleteRpcModel) updates) => super.copyWith((message) => updates(message as AutoCompleteRpcModel)) as AutoCompleteRpcModel;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AutoCompleteRpcModel create() => AutoCompleteRpcModel._();
  AutoCompleteRpcModel createEmptyInstance() => create();
  static $pb.PbList<AutoCompleteRpcModel> createRepeated() => $pb.PbList<AutoCompleteRpcModel>();
  @$core.pragma('dart2js:noInline')
  static AutoCompleteRpcModel getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AutoCompleteRpcModel>(create);
  static AutoCompleteRpcModel? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<AutoCompleteRpcModel_Item> get items => $_getList(0);

  @$pb.TagNumber(10)
  $core.Map<$core.String, $core.String> get localEnv => $_getMap(1);

  @$pb.TagNumber(11)
  $core.Map<$core.String, $core.String> get globalEnv => $_getMap(2);

  @$pb.TagNumber(20)
  $core.bool get enableSuccess => $_getBF(3);
  @$pb.TagNumber(20)
  set enableSuccess($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(20)
  $core.bool hasEnableSuccess() => $_has(3);
  @$pb.TagNumber(20)
  void clearEnableSuccess() => clearField(20);

  @$pb.TagNumber(21)
  $core.bool get enableFail => $_getBF(4);
  @$pb.TagNumber(21)
  set enableFail($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(21)
  $core.bool hasEnableFail() => $_has(4);
  @$pb.TagNumber(21)
  void clearEnableFail() => clearField(21);

  @$pb.TagNumber(22)
  $core.bool get isSuccess => $_getBF(5);
  @$pb.TagNumber(22)
  set isSuccess($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(22)
  $core.bool hasIsSuccess() => $_has(5);
  @$pb.TagNumber(22)
  void clearIsSuccess() => clearField(22);

  @$pb.TagNumber(23)
  $core.String get failedMessage => $_getSZ(6);
  @$pb.TagNumber(23)
  set failedMessage($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(23)
  $core.bool hasFailedMessage() => $_has(6);
  @$pb.TagNumber(23)
  void clearFailedMessage() => clearField(23);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
