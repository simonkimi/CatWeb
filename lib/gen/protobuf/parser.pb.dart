///
//  Generated code. Do not modify.
//  source: parser.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'selector.pb.dart' as $0;

class ListViewParser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListViewParser', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isJson', protoName: 'isJson')
    ..pc<$0.Selector>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'item', $pb.PbFieldType.PM, subBuilder: $0.Selector.create)
    ..pc<$0.Selector>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title', $pb.PbFieldType.PM, subBuilder: $0.Selector.create)
    ..pc<$0.Selector>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'subtitle', $pb.PbFieldType.PM, subBuilder: $0.Selector.create)
    ..pc<$0.Selector>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uploadTIme', $pb.PbFieldType.PM, protoName: 'uploadTIme', subBuilder: $0.Selector.create)
    ..pc<$0.StarSelector>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'star', $pb.PbFieldType.PM, subBuilder: $0.StarSelector.create)
    ..pc<$0.Selector>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'imgCount', $pb.PbFieldType.PM, protoName: 'imgCount', subBuilder: $0.Selector.create)
    ..pc<$0.ImageSelector>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'img', $pb.PbFieldType.PM, subBuilder: $0.ImageSelector.create)
    ..pc<$0.TagSelector>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'largeTag', $pb.PbFieldType.PM, protoName: 'largeTag', subBuilder: $0.TagSelector.create)
    ..pc<$0.TagSelector>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'smallTag', $pb.PbFieldType.PM, protoName: 'smallTag', subBuilder: $0.TagSelector.create)
    ..hasRequiredFields = false
  ;

  ListViewParser._() : super();
  factory ListViewParser({
    $core.bool? isJson,
    $core.Iterable<$0.Selector>? item,
    $core.Iterable<$0.Selector>? title,
    $core.Iterable<$0.Selector>? subtitle,
    $core.Iterable<$0.Selector>? uploadTIme,
    $core.Iterable<$0.StarSelector>? star,
    $core.Iterable<$0.Selector>? imgCount,
    $core.Iterable<$0.ImageSelector>? img,
    $core.Iterable<$0.TagSelector>? largeTag,
    $core.Iterable<$0.TagSelector>? smallTag,
  }) {
    final _result = create();
    if (isJson != null) {
      _result.isJson = isJson;
    }
    if (item != null) {
      _result.item.addAll(item);
    }
    if (title != null) {
      _result.title.addAll(title);
    }
    if (subtitle != null) {
      _result.subtitle.addAll(subtitle);
    }
    if (uploadTIme != null) {
      _result.uploadTIme.addAll(uploadTIme);
    }
    if (star != null) {
      _result.star.addAll(star);
    }
    if (imgCount != null) {
      _result.imgCount.addAll(imgCount);
    }
    if (img != null) {
      _result.img.addAll(img);
    }
    if (largeTag != null) {
      _result.largeTag.addAll(largeTag);
    }
    if (smallTag != null) {
      _result.smallTag.addAll(smallTag);
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
  $core.bool get isJson => $_getBF(0);
  @$pb.TagNumber(1)
  set isJson($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsJson() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsJson() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$0.Selector> get item => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<$0.Selector> get title => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<$0.Selector> get subtitle => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<$0.Selector> get uploadTIme => $_getList(4);

  @$pb.TagNumber(6)
  $core.List<$0.StarSelector> get star => $_getList(5);

  @$pb.TagNumber(7)
  $core.List<$0.Selector> get imgCount => $_getList(6);

  @$pb.TagNumber(8)
  $core.List<$0.ImageSelector> get img => $_getList(7);

  @$pb.TagNumber(9)
  $core.List<$0.TagSelector> get largeTag => $_getList(8);

  @$pb.TagNumber(10)
  $core.List<$0.TagSelector> get smallTag => $_getList(9);
}

class GalleryParser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GalleryParser', createEmptyInstance: create)
    ..pc<$0.Selector>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title', $pb.PbFieldType.PM, subBuilder: $0.Selector.create)
    ..pc<$0.Selector>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'subtitle', $pb.PbFieldType.PM, subBuilder: $0.Selector.create)
    ..pc<$0.Selector>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uploadTIme', $pb.PbFieldType.PM, protoName: 'uploadTIme', subBuilder: $0.Selector.create)
    ..pc<$0.StarSelector>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'star', $pb.PbFieldType.PM, subBuilder: $0.StarSelector.create)
    ..pc<$0.Selector>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'imgCount', $pb.PbFieldType.PM, protoName: 'imgCount', subBuilder: $0.Selector.create)
    ..pc<$0.Selector>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'prePageImg', $pb.PbFieldType.PM, protoName: 'prePageImg', subBuilder: $0.Selector.create)
    ..pc<$0.Selector>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'favorited', $pb.PbFieldType.PM, subBuilder: $0.Selector.create)
    ..pc<$0.Selector>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'language', $pb.PbFieldType.PM, subBuilder: $0.Selector.create)
    ..pc<$0.ImageSelector>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'coverImg', $pb.PbFieldType.PM, protoName: 'coverImg', subBuilder: $0.ImageSelector.create)
    ..pc<$0.Selector>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description', $pb.PbFieldType.PM, subBuilder: $0.Selector.create)
    ..pc<$0.Selector>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'thumbnailItem', $pb.PbFieldType.PM, protoName: 'thumbnailItem', subBuilder: $0.Selector.create)
    ..pc<$0.ImageSelector>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'thumbnail', $pb.PbFieldType.PM, subBuilder: $0.ImageSelector.create)
    ..pc<$0.Selector>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'commentItem', $pb.PbFieldType.PM, protoName: 'commentItem', subBuilder: $0.Selector.create)
    ..pc<$0.CommentSelector>(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'comments', $pb.PbFieldType.PM, subBuilder: $0.CommentSelector.create)
    ..hasRequiredFields = false
  ;

  GalleryParser._() : super();
  factory GalleryParser({
    $core.Iterable<$0.Selector>? title,
    $core.Iterable<$0.Selector>? subtitle,
    $core.Iterable<$0.Selector>? uploadTIme,
    $core.Iterable<$0.StarSelector>? star,
    $core.Iterable<$0.Selector>? imgCount,
    $core.Iterable<$0.Selector>? prePageImg,
    $core.Iterable<$0.Selector>? favorited,
    $core.Iterable<$0.Selector>? language,
    $core.Iterable<$0.ImageSelector>? coverImg,
    $core.Iterable<$0.Selector>? description,
    $core.Iterable<$0.Selector>? thumbnailItem,
    $core.Iterable<$0.ImageSelector>? thumbnail,
    $core.Iterable<$0.Selector>? commentItem,
    $core.Iterable<$0.CommentSelector>? comments,
  }) {
    final _result = create();
    if (title != null) {
      _result.title.addAll(title);
    }
    if (subtitle != null) {
      _result.subtitle.addAll(subtitle);
    }
    if (uploadTIme != null) {
      _result.uploadTIme.addAll(uploadTIme);
    }
    if (star != null) {
      _result.star.addAll(star);
    }
    if (imgCount != null) {
      _result.imgCount.addAll(imgCount);
    }
    if (prePageImg != null) {
      _result.prePageImg.addAll(prePageImg);
    }
    if (favorited != null) {
      _result.favorited.addAll(favorited);
    }
    if (language != null) {
      _result.language.addAll(language);
    }
    if (coverImg != null) {
      _result.coverImg.addAll(coverImg);
    }
    if (description != null) {
      _result.description.addAll(description);
    }
    if (thumbnailItem != null) {
      _result.thumbnailItem.addAll(thumbnailItem);
    }
    if (thumbnail != null) {
      _result.thumbnail.addAll(thumbnail);
    }
    if (commentItem != null) {
      _result.commentItem.addAll(commentItem);
    }
    if (comments != null) {
      _result.comments.addAll(comments);
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
  $core.List<$0.Selector> get title => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$0.Selector> get subtitle => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<$0.Selector> get uploadTIme => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<$0.StarSelector> get star => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<$0.Selector> get imgCount => $_getList(4);

  @$pb.TagNumber(6)
  $core.List<$0.Selector> get prePageImg => $_getList(5);

  @$pb.TagNumber(7)
  $core.List<$0.Selector> get favorited => $_getList(6);

  @$pb.TagNumber(8)
  $core.List<$0.Selector> get language => $_getList(7);

  @$pb.TagNumber(9)
  $core.List<$0.ImageSelector> get coverImg => $_getList(8);

  @$pb.TagNumber(10)
  $core.List<$0.Selector> get description => $_getList(9);

  @$pb.TagNumber(11)
  $core.List<$0.Selector> get thumbnailItem => $_getList(10);

  @$pb.TagNumber(12)
  $core.List<$0.ImageSelector> get thumbnail => $_getList(11);

  @$pb.TagNumber(13)
  $core.List<$0.Selector> get commentItem => $_getList(12);

  @$pb.TagNumber(14)
  $core.List<$0.CommentSelector> get comments => $_getList(13);
}

