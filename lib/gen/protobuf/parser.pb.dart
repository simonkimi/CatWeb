//
//  Generated code. Do not modify.
//  source: parser.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'selector.pb.dart' as $0;

export 'parser.pbenum.dart';

class ImageReaderParser extends $pb.GeneratedMessage {
  factory ImageReaderParser() => create();
  ImageReaderParser._() : super();
  factory ImageReaderParser.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ImageReaderParser.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ImageReaderParser', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'uuid')
    ..aOM<$0.Selector>(3, _omitFieldNames ? '' : 'id', subBuilder: $0.Selector.create)
    ..aOM<$0.ImageSelector>(4, _omitFieldNames ? '' : 'image', subBuilder: $0.ImageSelector.create)
    ..aOM<$0.Selector>(5, _omitFieldNames ? '' : 'largerImage', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(6, _omitFieldNames ? '' : 'rawImage', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(7, _omitFieldNames ? '' : 'uploadTime', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(8, _omitFieldNames ? '' : 'source', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(9, _omitFieldNames ? '' : 'rating', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(10, _omitFieldNames ? '' : 'score', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(20, _omitFieldNames ? '' : 'badgeSelector', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(21, _omitFieldNames ? '' : 'badgeText', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(22, _omitFieldNames ? '' : 'badgeCategory', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(30, _omitFieldNames ? '' : 'successSelector', protoName: 'successSelector', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(31, _omitFieldNames ? '' : 'failedSelector', protoName: 'failedSelector', subBuilder: $0.Selector.create)
    ..pc<$0.ExtraSelector>(99, _omitFieldNames ? '' : 'extraSelector', $pb.PbFieldType.PM, subBuilder: $0.ExtraSelector.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ImageReaderParser clone() => ImageReaderParser()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ImageReaderParser copyWith(void Function(ImageReaderParser) updates) => super.copyWith((message) => updates(message as ImageReaderParser)) as ImageReaderParser;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ImageReaderParser create() => ImageReaderParser._();
  ImageReaderParser createEmptyInstance() => create();
  static $pb.PbList<ImageReaderParser> createRepeated() => $pb.PbList<ImageReaderParser>();
  @$core.pragma('dart2js:noInline')
  static ImageReaderParser getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ImageReaderParser>(create);
  static ImageReaderParser? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get uuid => $_getSZ(1);
  @$pb.TagNumber(2)
  set uuid($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUuid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUuid() => clearField(2);

  @$pb.TagNumber(3)
  $0.Selector get id => $_getN(2);
  @$pb.TagNumber(3)
  set id($0.Selector v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasId() => $_has(2);
  @$pb.TagNumber(3)
  void clearId() => clearField(3);
  @$pb.TagNumber(3)
  $0.Selector ensureId() => $_ensure(2);

  @$pb.TagNumber(4)
  $0.ImageSelector get image => $_getN(3);
  @$pb.TagNumber(4)
  set image($0.ImageSelector v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasImage() => $_has(3);
  @$pb.TagNumber(4)
  void clearImage() => clearField(4);
  @$pb.TagNumber(4)
  $0.ImageSelector ensureImage() => $_ensure(3);

  @$pb.TagNumber(5)
  $0.Selector get largerImage => $_getN(4);
  @$pb.TagNumber(5)
  set largerImage($0.Selector v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasLargerImage() => $_has(4);
  @$pb.TagNumber(5)
  void clearLargerImage() => clearField(5);
  @$pb.TagNumber(5)
  $0.Selector ensureLargerImage() => $_ensure(4);

  @$pb.TagNumber(6)
  $0.Selector get rawImage => $_getN(5);
  @$pb.TagNumber(6)
  set rawImage($0.Selector v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasRawImage() => $_has(5);
  @$pb.TagNumber(6)
  void clearRawImage() => clearField(6);
  @$pb.TagNumber(6)
  $0.Selector ensureRawImage() => $_ensure(5);

  @$pb.TagNumber(7)
  $0.Selector get uploadTime => $_getN(6);
  @$pb.TagNumber(7)
  set uploadTime($0.Selector v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasUploadTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearUploadTime() => clearField(7);
  @$pb.TagNumber(7)
  $0.Selector ensureUploadTime() => $_ensure(6);

  @$pb.TagNumber(8)
  $0.Selector get source => $_getN(7);
  @$pb.TagNumber(8)
  set source($0.Selector v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasSource() => $_has(7);
  @$pb.TagNumber(8)
  void clearSource() => clearField(8);
  @$pb.TagNumber(8)
  $0.Selector ensureSource() => $_ensure(7);

  @$pb.TagNumber(9)
  $0.Selector get rating => $_getN(8);
  @$pb.TagNumber(9)
  set rating($0.Selector v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasRating() => $_has(8);
  @$pb.TagNumber(9)
  void clearRating() => clearField(9);
  @$pb.TagNumber(9)
  $0.Selector ensureRating() => $_ensure(8);

  @$pb.TagNumber(10)
  $0.Selector get score => $_getN(9);
  @$pb.TagNumber(10)
  set score($0.Selector v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasScore() => $_has(9);
  @$pb.TagNumber(10)
  void clearScore() => clearField(10);
  @$pb.TagNumber(10)
  $0.Selector ensureScore() => $_ensure(9);

  @$pb.TagNumber(20)
  $0.Selector get badgeSelector => $_getN(10);
  @$pb.TagNumber(20)
  set badgeSelector($0.Selector v) { setField(20, v); }
  @$pb.TagNumber(20)
  $core.bool hasBadgeSelector() => $_has(10);
  @$pb.TagNumber(20)
  void clearBadgeSelector() => clearField(20);
  @$pb.TagNumber(20)
  $0.Selector ensureBadgeSelector() => $_ensure(10);

  @$pb.TagNumber(21)
  $0.Selector get badgeText => $_getN(11);
  @$pb.TagNumber(21)
  set badgeText($0.Selector v) { setField(21, v); }
  @$pb.TagNumber(21)
  $core.bool hasBadgeText() => $_has(11);
  @$pb.TagNumber(21)
  void clearBadgeText() => clearField(21);
  @$pb.TagNumber(21)
  $0.Selector ensureBadgeText() => $_ensure(11);

  @$pb.TagNumber(22)
  $0.Selector get badgeCategory => $_getN(12);
  @$pb.TagNumber(22)
  set badgeCategory($0.Selector v) { setField(22, v); }
  @$pb.TagNumber(22)
  $core.bool hasBadgeCategory() => $_has(12);
  @$pb.TagNumber(22)
  void clearBadgeCategory() => clearField(22);
  @$pb.TagNumber(22)
  $0.Selector ensureBadgeCategory() => $_ensure(12);

  @$pb.TagNumber(30)
  $0.Selector get successSelector => $_getN(13);
  @$pb.TagNumber(30)
  set successSelector($0.Selector v) { setField(30, v); }
  @$pb.TagNumber(30)
  $core.bool hasSuccessSelector() => $_has(13);
  @$pb.TagNumber(30)
  void clearSuccessSelector() => clearField(30);
  @$pb.TagNumber(30)
  $0.Selector ensureSuccessSelector() => $_ensure(13);

  @$pb.TagNumber(31)
  $0.Selector get failedSelector => $_getN(14);
  @$pb.TagNumber(31)
  set failedSelector($0.Selector v) { setField(31, v); }
  @$pb.TagNumber(31)
  $core.bool hasFailedSelector() => $_has(14);
  @$pb.TagNumber(31)
  void clearFailedSelector() => clearField(31);
  @$pb.TagNumber(31)
  $0.Selector ensureFailedSelector() => $_ensure(14);

  @$pb.TagNumber(99)
  $core.List<$0.ExtraSelector> get extraSelector => $_getList(15);
}

class ListViewParser extends $pb.GeneratedMessage {
  factory ListViewParser() => create();
  ListViewParser._() : super();
  factory ListViewParser.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListViewParser.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListViewParser', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'uuid')
    ..aOM<$0.Selector>(3, _omitFieldNames ? '' : 'successSelector', protoName: 'successSelector', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(4, _omitFieldNames ? '' : 'failedSelector', protoName: 'failedSelector', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(10, _omitFieldNames ? '' : 'itemSelector', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(11, _omitFieldNames ? '' : 'title', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(12, _omitFieldNames ? '' : 'subtitle', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(13, _omitFieldNames ? '' : 'uploadTime', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(14, _omitFieldNames ? '' : 'star', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(15, _omitFieldNames ? '' : 'imgCount', subBuilder: $0.Selector.create)
    ..aOM<$0.ImageSelector>(16, _omitFieldNames ? '' : 'previewImg', subBuilder: $0.ImageSelector.create)
    ..aOM<$0.Selector>(17, _omitFieldNames ? '' : 'language', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(20, _omitFieldNames ? '' : 'tag', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(21, _omitFieldNames ? '' : 'tagColor', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(22, _omitFieldNames ? '' : 'badgeSelector', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(23, _omitFieldNames ? '' : 'badgeText', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(24, _omitFieldNames ? '' : 'badgeColor', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(25, _omitFieldNames ? '' : 'paper', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(26, _omitFieldNames ? '' : 'target', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(30, _omitFieldNames ? '' : 'nextPage', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(31, _omitFieldNames ? '' : 'idCode', subBuilder: $0.Selector.create)
    ..pc<$0.ExtraSelector>(99, _omitFieldNames ? '' : 'extraSelector', $pb.PbFieldType.PM, subBuilder: $0.ExtraSelector.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListViewParser clone() => ListViewParser()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListViewParser copyWith(void Function(ListViewParser) updates) => super.copyWith((message) => updates(message as ListViewParser)) as ListViewParser;

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
  $core.String get uuid => $_getSZ(1);
  @$pb.TagNumber(2)
  set uuid($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUuid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUuid() => clearField(2);

  @$pb.TagNumber(3)
  $0.Selector get successSelector => $_getN(2);
  @$pb.TagNumber(3)
  set successSelector($0.Selector v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasSuccessSelector() => $_has(2);
  @$pb.TagNumber(3)
  void clearSuccessSelector() => clearField(3);
  @$pb.TagNumber(3)
  $0.Selector ensureSuccessSelector() => $_ensure(2);

  @$pb.TagNumber(4)
  $0.Selector get failedSelector => $_getN(3);
  @$pb.TagNumber(4)
  set failedSelector($0.Selector v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasFailedSelector() => $_has(3);
  @$pb.TagNumber(4)
  void clearFailedSelector() => clearField(4);
  @$pb.TagNumber(4)
  $0.Selector ensureFailedSelector() => $_ensure(3);

  @$pb.TagNumber(10)
  $0.Selector get itemSelector => $_getN(4);
  @$pb.TagNumber(10)
  set itemSelector($0.Selector v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasItemSelector() => $_has(4);
  @$pb.TagNumber(10)
  void clearItemSelector() => clearField(10);
  @$pb.TagNumber(10)
  $0.Selector ensureItemSelector() => $_ensure(4);

  @$pb.TagNumber(11)
  $0.Selector get title => $_getN(5);
  @$pb.TagNumber(11)
  set title($0.Selector v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasTitle() => $_has(5);
  @$pb.TagNumber(11)
  void clearTitle() => clearField(11);
  @$pb.TagNumber(11)
  $0.Selector ensureTitle() => $_ensure(5);

  @$pb.TagNumber(12)
  $0.Selector get subtitle => $_getN(6);
  @$pb.TagNumber(12)
  set subtitle($0.Selector v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasSubtitle() => $_has(6);
  @$pb.TagNumber(12)
  void clearSubtitle() => clearField(12);
  @$pb.TagNumber(12)
  $0.Selector ensureSubtitle() => $_ensure(6);

  @$pb.TagNumber(13)
  $0.Selector get uploadTime => $_getN(7);
  @$pb.TagNumber(13)
  set uploadTime($0.Selector v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasUploadTime() => $_has(7);
  @$pb.TagNumber(13)
  void clearUploadTime() => clearField(13);
  @$pb.TagNumber(13)
  $0.Selector ensureUploadTime() => $_ensure(7);

  @$pb.TagNumber(14)
  $0.Selector get star => $_getN(8);
  @$pb.TagNumber(14)
  set star($0.Selector v) { setField(14, v); }
  @$pb.TagNumber(14)
  $core.bool hasStar() => $_has(8);
  @$pb.TagNumber(14)
  void clearStar() => clearField(14);
  @$pb.TagNumber(14)
  $0.Selector ensureStar() => $_ensure(8);

  @$pb.TagNumber(15)
  $0.Selector get imgCount => $_getN(9);
  @$pb.TagNumber(15)
  set imgCount($0.Selector v) { setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasImgCount() => $_has(9);
  @$pb.TagNumber(15)
  void clearImgCount() => clearField(15);
  @$pb.TagNumber(15)
  $0.Selector ensureImgCount() => $_ensure(9);

  @$pb.TagNumber(16)
  $0.ImageSelector get previewImg => $_getN(10);
  @$pb.TagNumber(16)
  set previewImg($0.ImageSelector v) { setField(16, v); }
  @$pb.TagNumber(16)
  $core.bool hasPreviewImg() => $_has(10);
  @$pb.TagNumber(16)
  void clearPreviewImg() => clearField(16);
  @$pb.TagNumber(16)
  $0.ImageSelector ensurePreviewImg() => $_ensure(10);

  @$pb.TagNumber(17)
  $0.Selector get language => $_getN(11);
  @$pb.TagNumber(17)
  set language($0.Selector v) { setField(17, v); }
  @$pb.TagNumber(17)
  $core.bool hasLanguage() => $_has(11);
  @$pb.TagNumber(17)
  void clearLanguage() => clearField(17);
  @$pb.TagNumber(17)
  $0.Selector ensureLanguage() => $_ensure(11);

  @$pb.TagNumber(20)
  $0.Selector get tag => $_getN(12);
  @$pb.TagNumber(20)
  set tag($0.Selector v) { setField(20, v); }
  @$pb.TagNumber(20)
  $core.bool hasTag() => $_has(12);
  @$pb.TagNumber(20)
  void clearTag() => clearField(20);
  @$pb.TagNumber(20)
  $0.Selector ensureTag() => $_ensure(12);

  @$pb.TagNumber(21)
  $0.Selector get tagColor => $_getN(13);
  @$pb.TagNumber(21)
  set tagColor($0.Selector v) { setField(21, v); }
  @$pb.TagNumber(21)
  $core.bool hasTagColor() => $_has(13);
  @$pb.TagNumber(21)
  void clearTagColor() => clearField(21);
  @$pb.TagNumber(21)
  $0.Selector ensureTagColor() => $_ensure(13);

  @$pb.TagNumber(22)
  $0.Selector get badgeSelector => $_getN(14);
  @$pb.TagNumber(22)
  set badgeSelector($0.Selector v) { setField(22, v); }
  @$pb.TagNumber(22)
  $core.bool hasBadgeSelector() => $_has(14);
  @$pb.TagNumber(22)
  void clearBadgeSelector() => clearField(22);
  @$pb.TagNumber(22)
  $0.Selector ensureBadgeSelector() => $_ensure(14);

  @$pb.TagNumber(23)
  $0.Selector get badgeText => $_getN(15);
  @$pb.TagNumber(23)
  set badgeText($0.Selector v) { setField(23, v); }
  @$pb.TagNumber(23)
  $core.bool hasBadgeText() => $_has(15);
  @$pb.TagNumber(23)
  void clearBadgeText() => clearField(23);
  @$pb.TagNumber(23)
  $0.Selector ensureBadgeText() => $_ensure(15);

  @$pb.TagNumber(24)
  $0.Selector get badgeColor => $_getN(16);
  @$pb.TagNumber(24)
  set badgeColor($0.Selector v) { setField(24, v); }
  @$pb.TagNumber(24)
  $core.bool hasBadgeColor() => $_has(16);
  @$pb.TagNumber(24)
  void clearBadgeColor() => clearField(24);
  @$pb.TagNumber(24)
  $0.Selector ensureBadgeColor() => $_ensure(16);

  @$pb.TagNumber(25)
  $0.Selector get paper => $_getN(17);
  @$pb.TagNumber(25)
  set paper($0.Selector v) { setField(25, v); }
  @$pb.TagNumber(25)
  $core.bool hasPaper() => $_has(17);
  @$pb.TagNumber(25)
  void clearPaper() => clearField(25);
  @$pb.TagNumber(25)
  $0.Selector ensurePaper() => $_ensure(17);

  @$pb.TagNumber(26)
  $0.Selector get target => $_getN(18);
  @$pb.TagNumber(26)
  set target($0.Selector v) { setField(26, v); }
  @$pb.TagNumber(26)
  $core.bool hasTarget() => $_has(18);
  @$pb.TagNumber(26)
  void clearTarget() => clearField(26);
  @$pb.TagNumber(26)
  $0.Selector ensureTarget() => $_ensure(18);

  @$pb.TagNumber(30)
  $0.Selector get nextPage => $_getN(19);
  @$pb.TagNumber(30)
  set nextPage($0.Selector v) { setField(30, v); }
  @$pb.TagNumber(30)
  $core.bool hasNextPage() => $_has(19);
  @$pb.TagNumber(30)
  void clearNextPage() => clearField(30);
  @$pb.TagNumber(30)
  $0.Selector ensureNextPage() => $_ensure(19);

  @$pb.TagNumber(31)
  $0.Selector get idCode => $_getN(20);
  @$pb.TagNumber(31)
  set idCode($0.Selector v) { setField(31, v); }
  @$pb.TagNumber(31)
  $core.bool hasIdCode() => $_has(20);
  @$pb.TagNumber(31)
  void clearIdCode() => clearField(31);
  @$pb.TagNumber(31)
  $0.Selector ensureIdCode() => $_ensure(20);

  @$pb.TagNumber(99)
  $core.List<$0.ExtraSelector> get extraSelector => $_getList(21);
}

class GalleryParser extends $pb.GeneratedMessage {
  factory GalleryParser() => create();
  GalleryParser._() : super();
  factory GalleryParser.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GalleryParser.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GalleryParser', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'uuid')
    ..aOM<$0.Selector>(3, _omitFieldNames ? '' : 'title', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(4, _omitFieldNames ? '' : 'subtitle', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(5, _omitFieldNames ? '' : 'uploadTime', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(6, _omitFieldNames ? '' : 'star', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(7, _omitFieldNames ? '' : 'imgCount', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(8, _omitFieldNames ? '' : 'pageCount', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(9, _omitFieldNames ? '' : 'language', subBuilder: $0.Selector.create)
    ..aOM<$0.ImageSelector>(10, _omitFieldNames ? '' : 'coverImg', subBuilder: $0.ImageSelector.create)
    ..aOM<$0.Selector>(11, _omitFieldNames ? '' : 'description', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(20, _omitFieldNames ? '' : 'thumbnailSelector', subBuilder: $0.Selector.create)
    ..aOM<$0.ImageSelector>(21, _omitFieldNames ? '' : 'thumbnail', subBuilder: $0.ImageSelector.create)
    ..aOM<$0.Selector>(22, _omitFieldNames ? '' : 'target', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(30, _omitFieldNames ? '' : 'commentSelector', subBuilder: $0.Selector.create)
    ..aOM<$0.CommentSelector>(31, _omitFieldNames ? '' : 'comment', subBuilder: $0.CommentSelector.create)
    ..aOM<$0.Selector>(40, _omitFieldNames ? '' : 'tag', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(41, _omitFieldNames ? '' : 'tagColor', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(50, _omitFieldNames ? '' : 'badgeSelector', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(51, _omitFieldNames ? '' : 'badgeText', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(52, _omitFieldNames ? '' : 'badgeCategory', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(60, _omitFieldNames ? '' : 'chapterSelector', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(61, _omitFieldNames ? '' : 'chapterTitle', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(62, _omitFieldNames ? '' : 'chapterSubtitle', subBuilder: $0.Selector.create)
    ..aOM<$0.ImageSelector>(63, _omitFieldNames ? '' : 'chapterCover', subBuilder: $0.ImageSelector.create)
    ..aOM<$0.Selector>(70, _omitFieldNames ? '' : 'nextPage', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(71, _omitFieldNames ? '' : 'countPrePage', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(72, _omitFieldNames ? '' : 'successSelector', protoName: 'successSelector', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(73, _omitFieldNames ? '' : 'failedSelector', protoName: 'failedSelector', subBuilder: $0.Selector.create)
    ..pc<$0.ExtraSelector>(99, _omitFieldNames ? '' : 'extraSelector', $pb.PbFieldType.PM, subBuilder: $0.ExtraSelector.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GalleryParser clone() => GalleryParser()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GalleryParser copyWith(void Function(GalleryParser) updates) => super.copyWith((message) => updates(message as GalleryParser)) as GalleryParser;

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
  $core.String get uuid => $_getSZ(1);
  @$pb.TagNumber(2)
  set uuid($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUuid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUuid() => clearField(2);

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
  $0.Selector get pageCount => $_getN(7);
  @$pb.TagNumber(8)
  set pageCount($0.Selector v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasPageCount() => $_has(7);
  @$pb.TagNumber(8)
  void clearPageCount() => clearField(8);
  @$pb.TagNumber(8)
  $0.Selector ensurePageCount() => $_ensure(7);

  @$pb.TagNumber(9)
  $0.Selector get language => $_getN(8);
  @$pb.TagNumber(9)
  set language($0.Selector v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasLanguage() => $_has(8);
  @$pb.TagNumber(9)
  void clearLanguage() => clearField(9);
  @$pb.TagNumber(9)
  $0.Selector ensureLanguage() => $_ensure(8);

  @$pb.TagNumber(10)
  $0.ImageSelector get coverImg => $_getN(9);
  @$pb.TagNumber(10)
  set coverImg($0.ImageSelector v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasCoverImg() => $_has(9);
  @$pb.TagNumber(10)
  void clearCoverImg() => clearField(10);
  @$pb.TagNumber(10)
  $0.ImageSelector ensureCoverImg() => $_ensure(9);

  @$pb.TagNumber(11)
  $0.Selector get description => $_getN(10);
  @$pb.TagNumber(11)
  set description($0.Selector v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasDescription() => $_has(10);
  @$pb.TagNumber(11)
  void clearDescription() => clearField(11);
  @$pb.TagNumber(11)
  $0.Selector ensureDescription() => $_ensure(10);

  @$pb.TagNumber(20)
  $0.Selector get thumbnailSelector => $_getN(11);
  @$pb.TagNumber(20)
  set thumbnailSelector($0.Selector v) { setField(20, v); }
  @$pb.TagNumber(20)
  $core.bool hasThumbnailSelector() => $_has(11);
  @$pb.TagNumber(20)
  void clearThumbnailSelector() => clearField(20);
  @$pb.TagNumber(20)
  $0.Selector ensureThumbnailSelector() => $_ensure(11);

  @$pb.TagNumber(21)
  $0.ImageSelector get thumbnail => $_getN(12);
  @$pb.TagNumber(21)
  set thumbnail($0.ImageSelector v) { setField(21, v); }
  @$pb.TagNumber(21)
  $core.bool hasThumbnail() => $_has(12);
  @$pb.TagNumber(21)
  void clearThumbnail() => clearField(21);
  @$pb.TagNumber(21)
  $0.ImageSelector ensureThumbnail() => $_ensure(12);

  @$pb.TagNumber(22)
  $0.Selector get target => $_getN(13);
  @$pb.TagNumber(22)
  set target($0.Selector v) { setField(22, v); }
  @$pb.TagNumber(22)
  $core.bool hasTarget() => $_has(13);
  @$pb.TagNumber(22)
  void clearTarget() => clearField(22);
  @$pb.TagNumber(22)
  $0.Selector ensureTarget() => $_ensure(13);

  @$pb.TagNumber(30)
  $0.Selector get commentSelector => $_getN(14);
  @$pb.TagNumber(30)
  set commentSelector($0.Selector v) { setField(30, v); }
  @$pb.TagNumber(30)
  $core.bool hasCommentSelector() => $_has(14);
  @$pb.TagNumber(30)
  void clearCommentSelector() => clearField(30);
  @$pb.TagNumber(30)
  $0.Selector ensureCommentSelector() => $_ensure(14);

  @$pb.TagNumber(31)
  $0.CommentSelector get comment => $_getN(15);
  @$pb.TagNumber(31)
  set comment($0.CommentSelector v) { setField(31, v); }
  @$pb.TagNumber(31)
  $core.bool hasComment() => $_has(15);
  @$pb.TagNumber(31)
  void clearComment() => clearField(31);
  @$pb.TagNumber(31)
  $0.CommentSelector ensureComment() => $_ensure(15);

  @$pb.TagNumber(40)
  $0.Selector get tag => $_getN(16);
  @$pb.TagNumber(40)
  set tag($0.Selector v) { setField(40, v); }
  @$pb.TagNumber(40)
  $core.bool hasTag() => $_has(16);
  @$pb.TagNumber(40)
  void clearTag() => clearField(40);
  @$pb.TagNumber(40)
  $0.Selector ensureTag() => $_ensure(16);

  @$pb.TagNumber(41)
  $0.Selector get tagColor => $_getN(17);
  @$pb.TagNumber(41)
  set tagColor($0.Selector v) { setField(41, v); }
  @$pb.TagNumber(41)
  $core.bool hasTagColor() => $_has(17);
  @$pb.TagNumber(41)
  void clearTagColor() => clearField(41);
  @$pb.TagNumber(41)
  $0.Selector ensureTagColor() => $_ensure(17);

  @$pb.TagNumber(50)
  $0.Selector get badgeSelector => $_getN(18);
  @$pb.TagNumber(50)
  set badgeSelector($0.Selector v) { setField(50, v); }
  @$pb.TagNumber(50)
  $core.bool hasBadgeSelector() => $_has(18);
  @$pb.TagNumber(50)
  void clearBadgeSelector() => clearField(50);
  @$pb.TagNumber(50)
  $0.Selector ensureBadgeSelector() => $_ensure(18);

  @$pb.TagNumber(51)
  $0.Selector get badgeText => $_getN(19);
  @$pb.TagNumber(51)
  set badgeText($0.Selector v) { setField(51, v); }
  @$pb.TagNumber(51)
  $core.bool hasBadgeText() => $_has(19);
  @$pb.TagNumber(51)
  void clearBadgeText() => clearField(51);
  @$pb.TagNumber(51)
  $0.Selector ensureBadgeText() => $_ensure(19);

  @$pb.TagNumber(52)
  $0.Selector get badgeCategory => $_getN(20);
  @$pb.TagNumber(52)
  set badgeCategory($0.Selector v) { setField(52, v); }
  @$pb.TagNumber(52)
  $core.bool hasBadgeCategory() => $_has(20);
  @$pb.TagNumber(52)
  void clearBadgeCategory() => clearField(52);
  @$pb.TagNumber(52)
  $0.Selector ensureBadgeCategory() => $_ensure(20);

  @$pb.TagNumber(60)
  $0.Selector get chapterSelector => $_getN(21);
  @$pb.TagNumber(60)
  set chapterSelector($0.Selector v) { setField(60, v); }
  @$pb.TagNumber(60)
  $core.bool hasChapterSelector() => $_has(21);
  @$pb.TagNumber(60)
  void clearChapterSelector() => clearField(60);
  @$pb.TagNumber(60)
  $0.Selector ensureChapterSelector() => $_ensure(21);

  @$pb.TagNumber(61)
  $0.Selector get chapterTitle => $_getN(22);
  @$pb.TagNumber(61)
  set chapterTitle($0.Selector v) { setField(61, v); }
  @$pb.TagNumber(61)
  $core.bool hasChapterTitle() => $_has(22);
  @$pb.TagNumber(61)
  void clearChapterTitle() => clearField(61);
  @$pb.TagNumber(61)
  $0.Selector ensureChapterTitle() => $_ensure(22);

  @$pb.TagNumber(62)
  $0.Selector get chapterSubtitle => $_getN(23);
  @$pb.TagNumber(62)
  set chapterSubtitle($0.Selector v) { setField(62, v); }
  @$pb.TagNumber(62)
  $core.bool hasChapterSubtitle() => $_has(23);
  @$pb.TagNumber(62)
  void clearChapterSubtitle() => clearField(62);
  @$pb.TagNumber(62)
  $0.Selector ensureChapterSubtitle() => $_ensure(23);

  @$pb.TagNumber(63)
  $0.ImageSelector get chapterCover => $_getN(24);
  @$pb.TagNumber(63)
  set chapterCover($0.ImageSelector v) { setField(63, v); }
  @$pb.TagNumber(63)
  $core.bool hasChapterCover() => $_has(24);
  @$pb.TagNumber(63)
  void clearChapterCover() => clearField(63);
  @$pb.TagNumber(63)
  $0.ImageSelector ensureChapterCover() => $_ensure(24);

  @$pb.TagNumber(70)
  $0.Selector get nextPage => $_getN(25);
  @$pb.TagNumber(70)
  set nextPage($0.Selector v) { setField(70, v); }
  @$pb.TagNumber(70)
  $core.bool hasNextPage() => $_has(25);
  @$pb.TagNumber(70)
  void clearNextPage() => clearField(70);
  @$pb.TagNumber(70)
  $0.Selector ensureNextPage() => $_ensure(25);

  @$pb.TagNumber(71)
  $0.Selector get countPrePage => $_getN(26);
  @$pb.TagNumber(71)
  set countPrePage($0.Selector v) { setField(71, v); }
  @$pb.TagNumber(71)
  $core.bool hasCountPrePage() => $_has(26);
  @$pb.TagNumber(71)
  void clearCountPrePage() => clearField(71);
  @$pb.TagNumber(71)
  $0.Selector ensureCountPrePage() => $_ensure(26);

  @$pb.TagNumber(72)
  $0.Selector get successSelector => $_getN(27);
  @$pb.TagNumber(72)
  set successSelector($0.Selector v) { setField(72, v); }
  @$pb.TagNumber(72)
  $core.bool hasSuccessSelector() => $_has(27);
  @$pb.TagNumber(72)
  void clearSuccessSelector() => clearField(72);
  @$pb.TagNumber(72)
  $0.Selector ensureSuccessSelector() => $_ensure(27);

  @$pb.TagNumber(73)
  $0.Selector get failedSelector => $_getN(28);
  @$pb.TagNumber(73)
  set failedSelector($0.Selector v) { setField(73, v); }
  @$pb.TagNumber(73)
  $core.bool hasFailedSelector() => $_has(28);
  @$pb.TagNumber(73)
  void clearFailedSelector() => clearField(73);
  @$pb.TagNumber(73)
  $0.Selector ensureFailedSelector() => $_ensure(28);

  @$pb.TagNumber(99)
  $core.List<$0.ExtraSelector> get extraSelector => $_getList(29);
}

class AutoCompleteParser extends $pb.GeneratedMessage {
  factory AutoCompleteParser() => create();
  AutoCompleteParser._() : super();
  factory AutoCompleteParser.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AutoCompleteParser.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AutoCompleteParser', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'uuid')
    ..aOM<$0.Selector>(11, _omitFieldNames ? '' : 'itemSelector', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(12, _omitFieldNames ? '' : 'itemComplete', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(13, _omitFieldNames ? '' : 'itemSubtitle', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(14, _omitFieldNames ? '' : 'itemTitle', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(20, _omitFieldNames ? '' : 'successSelector', protoName: 'successSelector', subBuilder: $0.Selector.create)
    ..aOM<$0.Selector>(21, _omitFieldNames ? '' : 'failedSelector', protoName: 'failedSelector', subBuilder: $0.Selector.create)
    ..pc<$0.ExtraSelector>(99, _omitFieldNames ? '' : 'extraSelector', $pb.PbFieldType.PM, subBuilder: $0.ExtraSelector.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AutoCompleteParser clone() => AutoCompleteParser()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AutoCompleteParser copyWith(void Function(AutoCompleteParser) updates) => super.copyWith((message) => updates(message as AutoCompleteParser)) as AutoCompleteParser;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AutoCompleteParser create() => AutoCompleteParser._();
  AutoCompleteParser createEmptyInstance() => create();
  static $pb.PbList<AutoCompleteParser> createRepeated() => $pb.PbList<AutoCompleteParser>();
  @$core.pragma('dart2js:noInline')
  static AutoCompleteParser getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AutoCompleteParser>(create);
  static AutoCompleteParser? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get uuid => $_getSZ(1);
  @$pb.TagNumber(2)
  set uuid($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUuid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUuid() => clearField(2);

  @$pb.TagNumber(11)
  $0.Selector get itemSelector => $_getN(2);
  @$pb.TagNumber(11)
  set itemSelector($0.Selector v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasItemSelector() => $_has(2);
  @$pb.TagNumber(11)
  void clearItemSelector() => clearField(11);
  @$pb.TagNumber(11)
  $0.Selector ensureItemSelector() => $_ensure(2);

  @$pb.TagNumber(12)
  $0.Selector get itemComplete => $_getN(3);
  @$pb.TagNumber(12)
  set itemComplete($0.Selector v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasItemComplete() => $_has(3);
  @$pb.TagNumber(12)
  void clearItemComplete() => clearField(12);
  @$pb.TagNumber(12)
  $0.Selector ensureItemComplete() => $_ensure(3);

  @$pb.TagNumber(13)
  $0.Selector get itemSubtitle => $_getN(4);
  @$pb.TagNumber(13)
  set itemSubtitle($0.Selector v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasItemSubtitle() => $_has(4);
  @$pb.TagNumber(13)
  void clearItemSubtitle() => clearField(13);
  @$pb.TagNumber(13)
  $0.Selector ensureItemSubtitle() => $_ensure(4);

  @$pb.TagNumber(14)
  $0.Selector get itemTitle => $_getN(5);
  @$pb.TagNumber(14)
  set itemTitle($0.Selector v) { setField(14, v); }
  @$pb.TagNumber(14)
  $core.bool hasItemTitle() => $_has(5);
  @$pb.TagNumber(14)
  void clearItemTitle() => clearField(14);
  @$pb.TagNumber(14)
  $0.Selector ensureItemTitle() => $_ensure(5);

  @$pb.TagNumber(20)
  $0.Selector get successSelector => $_getN(6);
  @$pb.TagNumber(20)
  set successSelector($0.Selector v) { setField(20, v); }
  @$pb.TagNumber(20)
  $core.bool hasSuccessSelector() => $_has(6);
  @$pb.TagNumber(20)
  void clearSuccessSelector() => clearField(20);
  @$pb.TagNumber(20)
  $0.Selector ensureSuccessSelector() => $_ensure(6);

  @$pb.TagNumber(21)
  $0.Selector get failedSelector => $_getN(7);
  @$pb.TagNumber(21)
  set failedSelector($0.Selector v) { setField(21, v); }
  @$pb.TagNumber(21)
  $core.bool hasFailedSelector() => $_has(7);
  @$pb.TagNumber(21)
  void clearFailedSelector() => clearField(21);
  @$pb.TagNumber(21)
  $0.Selector ensureFailedSelector() => $_ensure(7);

  @$pb.TagNumber(99)
  $core.List<$0.ExtraSelector> get extraSelector => $_getList(8);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
