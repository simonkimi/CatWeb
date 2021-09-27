///
//  Generated code. Do not modify.
//  source: parser.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'selector.pb.dart' as $0;

class StarSelector extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'StarSelector', createEmptyInstance: create)
    ..aOM<$0.Selector>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'selector', subBuilder: $0.Selector.create)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'maxStar', $pb.PbFieldType.O3, protoName: 'maxStar')
    ..hasRequiredFields = false
  ;

  StarSelector._() : super();
  factory StarSelector({
    $0.Selector? selector,
    $core.int? maxStar,
  }) {
    final _result = create();
    if (selector != null) {
      _result.selector = selector;
    }
    if (maxStar != null) {
      _result.maxStar = maxStar;
    }
    return _result;
  }
  factory StarSelector.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StarSelector.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StarSelector clone() => StarSelector()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StarSelector copyWith(void Function(StarSelector) updates) => super.copyWith((message) => updates(message as StarSelector)) as StarSelector; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StarSelector create() => StarSelector._();
  StarSelector createEmptyInstance() => create();
  static $pb.PbList<StarSelector> createRepeated() => $pb.PbList<StarSelector>();
  @$core.pragma('dart2js:noInline')
  static StarSelector getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StarSelector>(create);
  static StarSelector? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Selector get selector => $_getN(0);
  @$pb.TagNumber(1)
  set selector($0.Selector v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSelector() => $_has(0);
  @$pb.TagNumber(1)
  void clearSelector() => clearField(1);
  @$pb.TagNumber(1)
  $0.Selector ensureSelector() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get maxStar => $_getIZ(1);
  @$pb.TagNumber(2)
  set maxStar($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMaxStar() => $_has(1);
  @$pb.TagNumber(2)
  void clearMaxStar() => clearField(2);
}

class TagSelector extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TagSelector', createEmptyInstance: create)
    ..aOM<$0.Selector>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'selector', subBuilder: $0.Selector.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'color')
    ..hasRequiredFields = false
  ;

  TagSelector._() : super();
  factory TagSelector({
    $0.Selector? selector,
    $core.String? color,
  }) {
    final _result = create();
    if (selector != null) {
      _result.selector = selector;
    }
    if (color != null) {
      _result.color = color;
    }
    return _result;
  }
  factory TagSelector.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TagSelector.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TagSelector clone() => TagSelector()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TagSelector copyWith(void Function(TagSelector) updates) => super.copyWith((message) => updates(message as TagSelector)) as TagSelector; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TagSelector create() => TagSelector._();
  TagSelector createEmptyInstance() => create();
  static $pb.PbList<TagSelector> createRepeated() => $pb.PbList<TagSelector>();
  @$core.pragma('dart2js:noInline')
  static TagSelector getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TagSelector>(create);
  static TagSelector? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Selector get selector => $_getN(0);
  @$pb.TagNumber(1)
  set selector($0.Selector v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSelector() => $_has(0);
  @$pb.TagNumber(1)
  void clearSelector() => clearField(1);
  @$pb.TagNumber(1)
  $0.Selector ensureSelector() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get color => $_getSZ(1);
  @$pb.TagNumber(2)
  set color($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasColor() => $_has(1);
  @$pb.TagNumber(2)
  void clearColor() => clearField(2);
}

class ListViewParser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListViewParser', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isJson', protoName: 'isJson')
    ..pc<$0.Selector>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'list', $pb.PbFieldType.PM, subBuilder: $0.Selector.create)
    ..pc<$0.Selector>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title', $pb.PbFieldType.PM, subBuilder: $0.Selector.create)
    ..pc<$0.Selector>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'subtitle', $pb.PbFieldType.PM, subBuilder: $0.Selector.create)
    ..pc<$0.Selector>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uploadTIme', $pb.PbFieldType.PM, protoName: 'uploadTIme', subBuilder: $0.Selector.create)
    ..pc<StarSelector>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'star', $pb.PbFieldType.PM, subBuilder: StarSelector.create)
    ..pc<$0.Selector>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pageCount', $pb.PbFieldType.PM, protoName: 'pageCount', subBuilder: $0.Selector.create)
    ..pc<$0.Selector>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'imgUrl', $pb.PbFieldType.PM, protoName: 'imgUrl', subBuilder: $0.Selector.create)
    ..pc<$0.Selector>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'imgWidth', $pb.PbFieldType.PM, protoName: 'imgWidth', subBuilder: $0.Selector.create)
    ..pc<$0.Selector>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'imgHeight', $pb.PbFieldType.PM, protoName: 'imgHeight', subBuilder: $0.Selector.create)
    ..pc<TagSelector>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'largeTag', $pb.PbFieldType.PM, protoName: 'largeTag', subBuilder: TagSelector.create)
    ..pc<TagSelector>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'smallTag', $pb.PbFieldType.PM, protoName: 'smallTag', subBuilder: TagSelector.create)
    ..hasRequiredFields = false
  ;

  ListViewParser._() : super();
  factory ListViewParser({
    $core.bool? isJson,
    $core.Iterable<$0.Selector>? list,
    $core.Iterable<$0.Selector>? title,
    $core.Iterable<$0.Selector>? subtitle,
    $core.Iterable<$0.Selector>? uploadTIme,
    $core.Iterable<StarSelector>? star,
    $core.Iterable<$0.Selector>? pageCount,
    $core.Iterable<$0.Selector>? imgUrl,
    $core.Iterable<$0.Selector>? imgWidth,
    $core.Iterable<$0.Selector>? imgHeight,
    $core.Iterable<TagSelector>? largeTag,
    $core.Iterable<TagSelector>? smallTag,
  }) {
    final _result = create();
    if (isJson != null) {
      _result.isJson = isJson;
    }
    if (list != null) {
      _result.list.addAll(list);
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
    if (pageCount != null) {
      _result.pageCount.addAll(pageCount);
    }
    if (imgUrl != null) {
      _result.imgUrl.addAll(imgUrl);
    }
    if (imgWidth != null) {
      _result.imgWidth.addAll(imgWidth);
    }
    if (imgHeight != null) {
      _result.imgHeight.addAll(imgHeight);
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
  $core.List<$0.Selector> get list => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<$0.Selector> get title => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<$0.Selector> get subtitle => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<$0.Selector> get uploadTIme => $_getList(4);

  @$pb.TagNumber(6)
  $core.List<StarSelector> get star => $_getList(5);

  @$pb.TagNumber(7)
  $core.List<$0.Selector> get pageCount => $_getList(6);

  @$pb.TagNumber(8)
  $core.List<$0.Selector> get imgUrl => $_getList(7);

  @$pb.TagNumber(9)
  $core.List<$0.Selector> get imgWidth => $_getList(8);

  @$pb.TagNumber(10)
  $core.List<$0.Selector> get imgHeight => $_getList(9);

  @$pb.TagNumber(11)
  $core.List<TagSelector> get largeTag => $_getList(10);

  @$pb.TagNumber(12)
  $core.List<TagSelector> get smallTag => $_getList(11);
}

