///
//  Generated code. Do not modify.
//  source: parser.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'selector.pb.dart' as $0;

class ImageParser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ImageParser', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOM<$0.Selector>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', subBuilder: $0.Selector.create)
    ..aOM<$0.ImageSelector>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'image', subBuilder: $0.ImageSelector.create)
    ..aOM<$0.Selector>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'largerImage', protoName: 'largerImage', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rawImage', protoName: 'rawImage', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uploadTime', protoName: 'uploadTime', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'source', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rating', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'score', subBuilder: $0.Selector.create)
    ..aOM<$0.ImageSelector>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uploaderAvatar', protoName: 'uploaderAvatar', subBuilder: $0.ImageSelector.create)
    ..pc<$0.ExtraSelector>(99, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'extraSelector', $pb.PbFieldType.PM, protoName: 'extraSelector', subBuilder: $0.ExtraSelector.create)
    ..hasRequiredFields = false
  ;

  ImageParser._() : super();
  factory ImageParser({
    $core.String? name,
    $0.Selector? id,
    $0.ImageSelector? image,
    $0.Selector? largerImage,
    $0.Selector? rawImage,
    $0.Selector? uploadTime,
    $0.Selector? source,
    $0.Selector? rating,
    $0.Selector? score,
    $0.ImageSelector? uploaderAvatar,
    $core.Iterable<$0.ExtraSelector>? extraSelector,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (id != null) {
      _result.id = id;
    }
    if (image != null) {
      _result.image = image;
    }
    if (largerImage != null) {
      _result.largerImage = largerImage;
    }
    if (rawImage != null) {
      _result.rawImage = rawImage;
    }
    if (uploadTime != null) {
      _result.uploadTime = uploadTime;
    }
    if (source != null) {
      _result.source = source;
    }
    if (rating != null) {
      _result.rating = rating;
    }
    if (score != null) {
      _result.score = score;
    }
    if (uploaderAvatar != null) {
      _result.uploaderAvatar = uploaderAvatar;
    }
    if (extraSelector != null) {
      _result.extraSelector.addAll(extraSelector);
    }
    return _result;
  }
  factory ImageParser.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ImageParser.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ImageParser clone() => ImageParser()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ImageParser copyWith(void Function(ImageParser) updates) => super.copyWith((message) => updates(message as ImageParser)) as ImageParser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ImageParser create() => ImageParser._();
  ImageParser createEmptyInstance() => create();
  static $pb.PbList<ImageParser> createRepeated() => $pb.PbList<ImageParser>();
  @$core.pragma('dart2js:noInline')
  static ImageParser getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ImageParser>(create);
  static ImageParser? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $0.Selector get id => $_getN(1);
  @$pb.TagNumber(2)
  set id($0.Selector v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);
  @$pb.TagNumber(2)
  $0.Selector ensureId() => $_ensure(1);

  @$pb.TagNumber(3)
  $0.ImageSelector get image => $_getN(2);
  @$pb.TagNumber(3)
  set image($0.ImageSelector v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasImage() => $_has(2);
  @$pb.TagNumber(3)
  void clearImage() => clearField(3);
  @$pb.TagNumber(3)
  $0.ImageSelector ensureImage() => $_ensure(2);

  @$pb.TagNumber(4)
  $0.Selector get largerImage => $_getN(3);
  @$pb.TagNumber(4)
  set largerImage($0.Selector v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasLargerImage() => $_has(3);
  @$pb.TagNumber(4)
  void clearLargerImage() => clearField(4);
  @$pb.TagNumber(4)
  $0.Selector ensureLargerImage() => $_ensure(3);

  @$pb.TagNumber(5)
  $0.Selector get rawImage => $_getN(4);
  @$pb.TagNumber(5)
  set rawImage($0.Selector v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasRawImage() => $_has(4);
  @$pb.TagNumber(5)
  void clearRawImage() => clearField(5);
  @$pb.TagNumber(5)
  $0.Selector ensureRawImage() => $_ensure(4);

  @$pb.TagNumber(6)
  $0.Selector get uploadTime => $_getN(5);
  @$pb.TagNumber(6)
  set uploadTime($0.Selector v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasUploadTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearUploadTime() => clearField(6);
  @$pb.TagNumber(6)
  $0.Selector ensureUploadTime() => $_ensure(5);

  @$pb.TagNumber(7)
  $0.Selector get source => $_getN(6);
  @$pb.TagNumber(7)
  set source($0.Selector v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasSource() => $_has(6);
  @$pb.TagNumber(7)
  void clearSource() => clearField(7);
  @$pb.TagNumber(7)
  $0.Selector ensureSource() => $_ensure(6);

  @$pb.TagNumber(8)
  $0.Selector get rating => $_getN(7);
  @$pb.TagNumber(8)
  set rating($0.Selector v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasRating() => $_has(7);
  @$pb.TagNumber(8)
  void clearRating() => clearField(8);
  @$pb.TagNumber(8)
  $0.Selector ensureRating() => $_ensure(7);

  @$pb.TagNumber(9)
  $0.Selector get score => $_getN(8);
  @$pb.TagNumber(9)
  set score($0.Selector v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasScore() => $_has(8);
  @$pb.TagNumber(9)
  void clearScore() => clearField(9);
  @$pb.TagNumber(9)
  $0.Selector ensureScore() => $_ensure(8);

  @$pb.TagNumber(10)
  $0.ImageSelector get uploaderAvatar => $_getN(9);
  @$pb.TagNumber(10)
  set uploaderAvatar($0.ImageSelector v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasUploaderAvatar() => $_has(9);
  @$pb.TagNumber(10)
  void clearUploaderAvatar() => clearField(10);
  @$pb.TagNumber(10)
  $0.ImageSelector ensureUploaderAvatar() => $_ensure(9);

  @$pb.TagNumber(99)
  $core.List<$0.ExtraSelector> get extraSelector => $_getList(10);
}

class ListViewParser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListViewParser', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOM<$0.Selector>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'itemSelector', protoName: 'itemSelector', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'subtitle', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uploadTime', protoName: 'uploadTime', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'star', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'imgCount', protoName: 'imgCount', subBuilder: $0.Selector.create)
    ..aOM<$0.ImageSelector>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'previewImg', protoName: 'previewImg', subBuilder: $0.ImageSelector.create)
    ..aOM<$0.Selector>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tag', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tagColor', protoName: 'tagColor', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'badgeSelector', protoName: 'badgeSelector', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'badgeText', protoName: 'badgeText', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'badgeColor', protoName: 'badgeColor', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'paper', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(96, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nextPage', protoName: 'nextPage', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(97, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'idCode', protoName: 'idCode', subBuilder: $0.Selector.create)
    ..pc<$0.ExtraSelector>(99, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'extraSelector', $pb.PbFieldType.PM, protoName: 'extraSelector', subBuilder: $0.ExtraSelector.create)
    ..hasRequiredFields = false
  ;

  ListViewParser._() : super();
  factory ListViewParser({
    $core.String? name,
    $0.Selector? itemSelector,
    $0.Selector? title,
    $0.Selector? subtitle,
    $0.Selector? uploadTime,
    $0.Selector? star,
    $0.Selector? imgCount,
    $0.ImageSelector? previewImg,
    $0.Selector? tag,
    $0.Selector? tagColor,
    $0.Selector? badgeSelector,
    $0.Selector? badgeText,
    $0.Selector? badgeColor,
    $0.Selector? paper,
    $0.Selector? nextPage,
    $0.Selector? idCode,
    $core.Iterable<$0.ExtraSelector>? extraSelector,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (itemSelector != null) {
      _result.itemSelector = itemSelector;
    }
    if (title != null) {
      _result.title = title;
    }
    if (subtitle != null) {
      _result.subtitle = subtitle;
    }
    if (uploadTime != null) {
      _result.uploadTime = uploadTime;
    }
    if (star != null) {
      _result.star = star;
    }
    if (imgCount != null) {
      _result.imgCount = imgCount;
    }
    if (previewImg != null) {
      _result.previewImg = previewImg;
    }
    if (tag != null) {
      _result.tag = tag;
    }
    if (tagColor != null) {
      _result.tagColor = tagColor;
    }
    if (badgeSelector != null) {
      _result.badgeSelector = badgeSelector;
    }
    if (badgeText != null) {
      _result.badgeText = badgeText;
    }
    if (badgeColor != null) {
      _result.badgeColor = badgeColor;
    }
    if (paper != null) {
      _result.paper = paper;
    }
    if (nextPage != null) {
      _result.nextPage = nextPage;
    }
    if (idCode != null) {
      _result.idCode = idCode;
    }
    if (extraSelector != null) {
      _result.extraSelector.addAll(extraSelector);
    }
    return _result;
  }
  factory ListViewParser.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListViewParser.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListViewParser clone() => ListViewParser()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListViewParser copyWith(void Function(ListViewParser) updates) => super.copyWith((message) => updates(message as ListViewParser)) as ListViewParser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListViewParser create() => ListViewParser._();
  ListViewParser createEmptyInstance() => create();
  static $pb.PbList<ListViewParser> createRepeated() => $pb.PbList<ListViewParser>();
  @$core.pragma('dart2js:noInline')
  static ListViewParser getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListViewParser>(create);
  static ListViewParser? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $0.Selector get itemSelector => $_getN(1);
  @$pb.TagNumber(2)
  set itemSelector($0.Selector v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasItemSelector() => $_has(1);
  @$pb.TagNumber(2)
  void clearItemSelector() => clearField(2);
  @$pb.TagNumber(2)
  $0.Selector ensureItemSelector() => $_ensure(1);

  @$pb.TagNumber(3)
  $0.Selector get title => $_getN(2);
  @$pb.TagNumber(3)
  set title($0.Selector v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearTitle() => clearField(3);
  @$pb.TagNumber(3)
  $0.Selector ensureTitle() => $_ensure(2);

  @$pb.TagNumber(4)
  $0.Selector get subtitle => $_getN(3);
  @$pb.TagNumber(4)
  set subtitle($0.Selector v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasSubtitle() => $_has(3);
  @$pb.TagNumber(4)
  void clearSubtitle() => clearField(4);
  @$pb.TagNumber(4)
  $0.Selector ensureSubtitle() => $_ensure(3);

  @$pb.TagNumber(5)
  $0.Selector get uploadTime => $_getN(4);
  @$pb.TagNumber(5)
  set uploadTime($0.Selector v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasUploadTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearUploadTime() => clearField(5);
  @$pb.TagNumber(5)
  $0.Selector ensureUploadTime() => $_ensure(4);

  @$pb.TagNumber(6)
  $0.Selector get star => $_getN(5);
  @$pb.TagNumber(6)
  set star($0.Selector v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasStar() => $_has(5);
  @$pb.TagNumber(6)
  void clearStar() => clearField(6);
  @$pb.TagNumber(6)
  $0.Selector ensureStar() => $_ensure(5);

  @$pb.TagNumber(7)
  $0.Selector get imgCount => $_getN(6);
  @$pb.TagNumber(7)
  set imgCount($0.Selector v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasImgCount() => $_has(6);
  @$pb.TagNumber(7)
  void clearImgCount() => clearField(7);
  @$pb.TagNumber(7)
  $0.Selector ensureImgCount() => $_ensure(6);

  @$pb.TagNumber(8)
  $0.ImageSelector get previewImg => $_getN(7);
  @$pb.TagNumber(8)
  set previewImg($0.ImageSelector v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasPreviewImg() => $_has(7);
  @$pb.TagNumber(8)
  void clearPreviewImg() => clearField(8);
  @$pb.TagNumber(8)
  $0.ImageSelector ensurePreviewImg() => $_ensure(7);

  @$pb.TagNumber(9)
  $0.Selector get tag => $_getN(8);
  @$pb.TagNumber(9)
  set tag($0.Selector v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasTag() => $_has(8);
  @$pb.TagNumber(9)
  void clearTag() => clearField(9);
  @$pb.TagNumber(9)
  $0.Selector ensureTag() => $_ensure(8);

  @$pb.TagNumber(10)
  $0.Selector get tagColor => $_getN(9);
  @$pb.TagNumber(10)
  set tagColor($0.Selector v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasTagColor() => $_has(9);
  @$pb.TagNumber(10)
  void clearTagColor() => clearField(10);
  @$pb.TagNumber(10)
  $0.Selector ensureTagColor() => $_ensure(9);

  @$pb.TagNumber(11)
  $0.Selector get badgeSelector => $_getN(10);
  @$pb.TagNumber(11)
  set badgeSelector($0.Selector v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasBadgeSelector() => $_has(10);
  @$pb.TagNumber(11)
  void clearBadgeSelector() => clearField(11);
  @$pb.TagNumber(11)
  $0.Selector ensureBadgeSelector() => $_ensure(10);

  @$pb.TagNumber(12)
  $0.Selector get badgeText => $_getN(11);
  @$pb.TagNumber(12)
  set badgeText($0.Selector v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasBadgeText() => $_has(11);
  @$pb.TagNumber(12)
  void clearBadgeText() => clearField(12);
  @$pb.TagNumber(12)
  $0.Selector ensureBadgeText() => $_ensure(11);

  @$pb.TagNumber(13)
  $0.Selector get badgeColor => $_getN(12);
  @$pb.TagNumber(13)
  set badgeColor($0.Selector v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasBadgeColor() => $_has(12);
  @$pb.TagNumber(13)
  void clearBadgeColor() => clearField(13);
  @$pb.TagNumber(13)
  $0.Selector ensureBadgeColor() => $_ensure(12);

  @$pb.TagNumber(14)
  $0.Selector get paper => $_getN(13);
  @$pb.TagNumber(14)
  set paper($0.Selector v) { setField(14, v); }
  @$pb.TagNumber(14)
  $core.bool hasPaper() => $_has(13);
  @$pb.TagNumber(14)
  void clearPaper() => clearField(14);
  @$pb.TagNumber(14)
  $0.Selector ensurePaper() => $_ensure(13);

  @$pb.TagNumber(96)
  $0.Selector get nextPage => $_getN(14);
  @$pb.TagNumber(96)
  set nextPage($0.Selector v) { setField(96, v); }
  @$pb.TagNumber(96)
  $core.bool hasNextPage() => $_has(14);
  @$pb.TagNumber(96)
  void clearNextPage() => clearField(96);
  @$pb.TagNumber(96)
  $0.Selector ensureNextPage() => $_ensure(14);

  @$pb.TagNumber(97)
  $0.Selector get idCode => $_getN(15);
  @$pb.TagNumber(97)
  set idCode($0.Selector v) { setField(97, v); }
  @$pb.TagNumber(97)
  $core.bool hasIdCode() => $_has(15);
  @$pb.TagNumber(97)
  void clearIdCode() => clearField(97);
  @$pb.TagNumber(97)
  $0.Selector ensureIdCode() => $_ensure(15);

  @$pb.TagNumber(99)
  $core.List<$0.ExtraSelector> get extraSelector => $_getList(16);
}

class GalleryParser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GalleryParser', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOM<$0.Selector>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'subtitle', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uploadTime', protoName: 'uploadTime', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'star', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'imgCount', protoName: 'imgCount', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pageCount', protoName: 'pageCount', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'language', subBuilder: $0.Selector.create)
    ..aOM<$0.ImageSelector>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'coverImg', protoName: 'coverImg', subBuilder: $0.ImageSelector.create)
    ..aOM<$0.Selector>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'thumbnailSelector', protoName: 'thumbnailSelector', subBuilder: $0.Selector.create)
    ..aOM<$0.ImageSelector>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'thumbnail', subBuilder: $0.ImageSelector.create)
    ..aOM<$0.Selector>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'thumbnailUrl', protoName: 'thumbnailUrl', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'commentSelector', protoName: 'commentSelector', subBuilder: $0.Selector.create)
    ..aOM<$0.CommentSelector>(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'comments', subBuilder: $0.CommentSelector.create)
    ..aOM<$0.Selector>(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tag', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tagColor', protoName: 'tagColor', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(18, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'badgeSelector', protoName: 'badgeSelector', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(19, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'badgeText', protoName: 'badgeText', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(20, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'badgeColor', protoName: 'badgeColor', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(21, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'badgeType', protoName: 'badgeType', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(22, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nextPage', protoName: 'nextPage', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(23, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'chapterSelector', protoName: 'chapterSelector', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(24, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'chapterTitle', protoName: 'chapterTitle', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(25, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'chapterSubtitle', protoName: 'chapterSubtitle', subBuilder: $0.Selector.create)
    ..aOM<$0.ImageSelector>(26, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'chapterCover', protoName: 'chapterCover', subBuilder: $0.ImageSelector.create)
    ..aOM<$0.Selector>(27, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'prePageImageCount', protoName: 'prePageImageCount', subBuilder: $0.Selector.create)
    ..pc<$0.ExtraSelector>(99, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'extraSelector', $pb.PbFieldType.PM, protoName: 'extraSelector', subBuilder: $0.ExtraSelector.create)
    ..hasRequiredFields = false
  ;

  GalleryParser._() : super();
  factory GalleryParser({
    $core.String? name,
    $0.Selector? title,
    $0.Selector? subtitle,
    $0.Selector? uploadTime,
    $0.Selector? star,
    $0.Selector? imgCount,
    $0.Selector? pageCount,
    $0.Selector? language,
    $0.ImageSelector? coverImg,
    $0.Selector? description,
    $0.Selector? thumbnailSelector,
    $0.ImageSelector? thumbnail,
    $0.Selector? thumbnailUrl,
    $0.Selector? commentSelector,
    $0.CommentSelector? comments,
    $0.Selector? tag,
    $0.Selector? tagColor,
    $0.Selector? badgeSelector,
    $0.Selector? badgeText,
    $0.Selector? badgeColor,
    $0.Selector? badgeType,
    $0.Selector? nextPage,
    $0.Selector? chapterSelector,
    $0.Selector? chapterTitle,
    $0.Selector? chapterSubtitle,
    $0.ImageSelector? chapterCover,
    $0.Selector? prePageImageCount,
    $core.Iterable<$0.ExtraSelector>? extraSelector,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (title != null) {
      _result.title = title;
    }
    if (subtitle != null) {
      _result.subtitle = subtitle;
    }
    if (uploadTime != null) {
      _result.uploadTime = uploadTime;
    }
    if (star != null) {
      _result.star = star;
    }
    if (imgCount != null) {
      _result.imgCount = imgCount;
    }
    if (pageCount != null) {
      _result.pageCount = pageCount;
    }
    if (language != null) {
      _result.language = language;
    }
    if (coverImg != null) {
      _result.coverImg = coverImg;
    }
    if (description != null) {
      _result.description = description;
    }
    if (thumbnailSelector != null) {
      _result.thumbnailSelector = thumbnailSelector;
    }
    if (thumbnail != null) {
      _result.thumbnail = thumbnail;
    }
    if (thumbnailUrl != null) {
      _result.thumbnailUrl = thumbnailUrl;
    }
    if (commentSelector != null) {
      _result.commentSelector = commentSelector;
    }
    if (comments != null) {
      _result.comments = comments;
    }
    if (tag != null) {
      _result.tag = tag;
    }
    if (tagColor != null) {
      _result.tagColor = tagColor;
    }
    if (badgeSelector != null) {
      _result.badgeSelector = badgeSelector;
    }
    if (badgeText != null) {
      _result.badgeText = badgeText;
    }
    if (badgeColor != null) {
      _result.badgeColor = badgeColor;
    }
    if (badgeType != null) {
      _result.badgeType = badgeType;
    }
    if (nextPage != null) {
      _result.nextPage = nextPage;
    }
    if (chapterSelector != null) {
      _result.chapterSelector = chapterSelector;
    }
    if (chapterTitle != null) {
      _result.chapterTitle = chapterTitle;
    }
    if (chapterSubtitle != null) {
      _result.chapterSubtitle = chapterSubtitle;
    }
    if (chapterCover != null) {
      _result.chapterCover = chapterCover;
    }
    if (prePageImageCount != null) {
      _result.prePageImageCount = prePageImageCount;
    }
    if (extraSelector != null) {
      _result.extraSelector.addAll(extraSelector);
    }
    return _result;
  }
  factory GalleryParser.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GalleryParser.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GalleryParser clone() => GalleryParser()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GalleryParser copyWith(void Function(GalleryParser) updates) => super.copyWith((message) => updates(message as GalleryParser)) as GalleryParser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GalleryParser create() => GalleryParser._();
  GalleryParser createEmptyInstance() => create();
  static $pb.PbList<GalleryParser> createRepeated() => $pb.PbList<GalleryParser>();
  @$core.pragma('dart2js:noInline')
  static GalleryParser getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GalleryParser>(create);
  static GalleryParser? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $0.Selector get title => $_getN(1);
  @$pb.TagNumber(2)
  set title($0.Selector v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);
  @$pb.TagNumber(2)
  $0.Selector ensureTitle() => $_ensure(1);

  @$pb.TagNumber(3)
  $0.Selector get subtitle => $_getN(2);
  @$pb.TagNumber(3)
  set subtitle($0.Selector v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasSubtitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearSubtitle() => clearField(3);
  @$pb.TagNumber(3)
  $0.Selector ensureSubtitle() => $_ensure(2);

  @$pb.TagNumber(4)
  $0.Selector get uploadTime => $_getN(3);
  @$pb.TagNumber(4)
  set uploadTime($0.Selector v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasUploadTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearUploadTime() => clearField(4);
  @$pb.TagNumber(4)
  $0.Selector ensureUploadTime() => $_ensure(3);

  @$pb.TagNumber(5)
  $0.Selector get star => $_getN(4);
  @$pb.TagNumber(5)
  set star($0.Selector v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasStar() => $_has(4);
  @$pb.TagNumber(5)
  void clearStar() => clearField(5);
  @$pb.TagNumber(5)
  $0.Selector ensureStar() => $_ensure(4);

  @$pb.TagNumber(6)
  $0.Selector get imgCount => $_getN(5);
  @$pb.TagNumber(6)
  set imgCount($0.Selector v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasImgCount() => $_has(5);
  @$pb.TagNumber(6)
  void clearImgCount() => clearField(6);
  @$pb.TagNumber(6)
  $0.Selector ensureImgCount() => $_ensure(5);

  @$pb.TagNumber(7)
  $0.Selector get pageCount => $_getN(6);
  @$pb.TagNumber(7)
  set pageCount($0.Selector v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasPageCount() => $_has(6);
  @$pb.TagNumber(7)
  void clearPageCount() => clearField(7);
  @$pb.TagNumber(7)
  $0.Selector ensurePageCount() => $_ensure(6);

  @$pb.TagNumber(8)
  $0.Selector get language => $_getN(7);
  @$pb.TagNumber(8)
  set language($0.Selector v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasLanguage() => $_has(7);
  @$pb.TagNumber(8)
  void clearLanguage() => clearField(8);
  @$pb.TagNumber(8)
  $0.Selector ensureLanguage() => $_ensure(7);

  @$pb.TagNumber(9)
  $0.ImageSelector get coverImg => $_getN(8);
  @$pb.TagNumber(9)
  set coverImg($0.ImageSelector v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasCoverImg() => $_has(8);
  @$pb.TagNumber(9)
  void clearCoverImg() => clearField(9);
  @$pb.TagNumber(9)
  $0.ImageSelector ensureCoverImg() => $_ensure(8);

  @$pb.TagNumber(10)
  $0.Selector get description => $_getN(9);
  @$pb.TagNumber(10)
  set description($0.Selector v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasDescription() => $_has(9);
  @$pb.TagNumber(10)
  void clearDescription() => clearField(10);
  @$pb.TagNumber(10)
  $0.Selector ensureDescription() => $_ensure(9);

  @$pb.TagNumber(11)
  $0.Selector get thumbnailSelector => $_getN(10);
  @$pb.TagNumber(11)
  set thumbnailSelector($0.Selector v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasThumbnailSelector() => $_has(10);
  @$pb.TagNumber(11)
  void clearThumbnailSelector() => clearField(11);
  @$pb.TagNumber(11)
  $0.Selector ensureThumbnailSelector() => $_ensure(10);

  @$pb.TagNumber(12)
  $0.ImageSelector get thumbnail => $_getN(11);
  @$pb.TagNumber(12)
  set thumbnail($0.ImageSelector v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasThumbnail() => $_has(11);
  @$pb.TagNumber(12)
  void clearThumbnail() => clearField(12);
  @$pb.TagNumber(12)
  $0.ImageSelector ensureThumbnail() => $_ensure(11);

  @$pb.TagNumber(13)
  $0.Selector get thumbnailUrl => $_getN(12);
  @$pb.TagNumber(13)
  set thumbnailUrl($0.Selector v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasThumbnailUrl() => $_has(12);
  @$pb.TagNumber(13)
  void clearThumbnailUrl() => clearField(13);
  @$pb.TagNumber(13)
  $0.Selector ensureThumbnailUrl() => $_ensure(12);

  @$pb.TagNumber(14)
  $0.Selector get commentSelector => $_getN(13);
  @$pb.TagNumber(14)
  set commentSelector($0.Selector v) { setField(14, v); }
  @$pb.TagNumber(14)
  $core.bool hasCommentSelector() => $_has(13);
  @$pb.TagNumber(14)
  void clearCommentSelector() => clearField(14);
  @$pb.TagNumber(14)
  $0.Selector ensureCommentSelector() => $_ensure(13);

  @$pb.TagNumber(15)
  $0.CommentSelector get comments => $_getN(14);
  @$pb.TagNumber(15)
  set comments($0.CommentSelector v) { setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasComments() => $_has(14);
  @$pb.TagNumber(15)
  void clearComments() => clearField(15);
  @$pb.TagNumber(15)
  $0.CommentSelector ensureComments() => $_ensure(14);

  @$pb.TagNumber(16)
  $0.Selector get tag => $_getN(15);
  @$pb.TagNumber(16)
  set tag($0.Selector v) { setField(16, v); }
  @$pb.TagNumber(16)
  $core.bool hasTag() => $_has(15);
  @$pb.TagNumber(16)
  void clearTag() => clearField(16);
  @$pb.TagNumber(16)
  $0.Selector ensureTag() => $_ensure(15);

  @$pb.TagNumber(17)
  $0.Selector get tagColor => $_getN(16);
  @$pb.TagNumber(17)
  set tagColor($0.Selector v) { setField(17, v); }
  @$pb.TagNumber(17)
  $core.bool hasTagColor() => $_has(16);
  @$pb.TagNumber(17)
  void clearTagColor() => clearField(17);
  @$pb.TagNumber(17)
  $0.Selector ensureTagColor() => $_ensure(16);

  @$pb.TagNumber(18)
  $0.Selector get badgeSelector => $_getN(17);
  @$pb.TagNumber(18)
  set badgeSelector($0.Selector v) { setField(18, v); }
  @$pb.TagNumber(18)
  $core.bool hasBadgeSelector() => $_has(17);
  @$pb.TagNumber(18)
  void clearBadgeSelector() => clearField(18);
  @$pb.TagNumber(18)
  $0.Selector ensureBadgeSelector() => $_ensure(17);

  @$pb.TagNumber(19)
  $0.Selector get badgeText => $_getN(18);
  @$pb.TagNumber(19)
  set badgeText($0.Selector v) { setField(19, v); }
  @$pb.TagNumber(19)
  $core.bool hasBadgeText() => $_has(18);
  @$pb.TagNumber(19)
  void clearBadgeText() => clearField(19);
  @$pb.TagNumber(19)
  $0.Selector ensureBadgeText() => $_ensure(18);

  @$pb.TagNumber(20)
  $0.Selector get badgeColor => $_getN(19);
  @$pb.TagNumber(20)
  set badgeColor($0.Selector v) { setField(20, v); }
  @$pb.TagNumber(20)
  $core.bool hasBadgeColor() => $_has(19);
  @$pb.TagNumber(20)
  void clearBadgeColor() => clearField(20);
  @$pb.TagNumber(20)
  $0.Selector ensureBadgeColor() => $_ensure(19);

  @$pb.TagNumber(21)
  $0.Selector get badgeType => $_getN(20);
  @$pb.TagNumber(21)
  set badgeType($0.Selector v) { setField(21, v); }
  @$pb.TagNumber(21)
  $core.bool hasBadgeType() => $_has(20);
  @$pb.TagNumber(21)
  void clearBadgeType() => clearField(21);
  @$pb.TagNumber(21)
  $0.Selector ensureBadgeType() => $_ensure(20);

  @$pb.TagNumber(22)
  $0.Selector get nextPage => $_getN(21);
  @$pb.TagNumber(22)
  set nextPage($0.Selector v) { setField(22, v); }
  @$pb.TagNumber(22)
  $core.bool hasNextPage() => $_has(21);
  @$pb.TagNumber(22)
  void clearNextPage() => clearField(22);
  @$pb.TagNumber(22)
  $0.Selector ensureNextPage() => $_ensure(21);

  @$pb.TagNumber(23)
  $0.Selector get chapterSelector => $_getN(22);
  @$pb.TagNumber(23)
  set chapterSelector($0.Selector v) { setField(23, v); }
  @$pb.TagNumber(23)
  $core.bool hasChapterSelector() => $_has(22);
  @$pb.TagNumber(23)
  void clearChapterSelector() => clearField(23);
  @$pb.TagNumber(23)
  $0.Selector ensureChapterSelector() => $_ensure(22);

  @$pb.TagNumber(24)
  $0.Selector get chapterTitle => $_getN(23);
  @$pb.TagNumber(24)
  set chapterTitle($0.Selector v) { setField(24, v); }
  @$pb.TagNumber(24)
  $core.bool hasChapterTitle() => $_has(23);
  @$pb.TagNumber(24)
  void clearChapterTitle() => clearField(24);
  @$pb.TagNumber(24)
  $0.Selector ensureChapterTitle() => $_ensure(23);

  @$pb.TagNumber(25)
  $0.Selector get chapterSubtitle => $_getN(24);
  @$pb.TagNumber(25)
  set chapterSubtitle($0.Selector v) { setField(25, v); }
  @$pb.TagNumber(25)
  $core.bool hasChapterSubtitle() => $_has(24);
  @$pb.TagNumber(25)
  void clearChapterSubtitle() => clearField(25);
  @$pb.TagNumber(25)
  $0.Selector ensureChapterSubtitle() => $_ensure(24);

  @$pb.TagNumber(26)
  $0.ImageSelector get chapterCover => $_getN(25);
  @$pb.TagNumber(26)
  set chapterCover($0.ImageSelector v) { setField(26, v); }
  @$pb.TagNumber(26)
  $core.bool hasChapterCover() => $_has(25);
  @$pb.TagNumber(26)
  void clearChapterCover() => clearField(26);
  @$pb.TagNumber(26)
  $0.ImageSelector ensureChapterCover() => $_ensure(25);

  @$pb.TagNumber(27)
  $0.Selector get prePageImageCount => $_getN(26);
  @$pb.TagNumber(27)
  set prePageImageCount($0.Selector v) { setField(27, v); }
  @$pb.TagNumber(27)
  $core.bool hasPrePageImageCount() => $_has(26);
  @$pb.TagNumber(27)
  void clearPrePageImageCount() => clearField(27);
  @$pb.TagNumber(27)
  $0.Selector ensurePrePageImageCount() => $_ensure(26);

  @$pb.TagNumber(99)
  $core.List<$0.ExtraSelector> get extraSelector => $_getList(27);
}

