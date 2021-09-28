///
//  Generated code. Do not modify.
//  source: selector.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'selector.pbenum.dart';

export 'selector.pbenum.dart';

class Selector extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Selector', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'selector')
    ..e<SelectorFunction>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'function', $pb.PbFieldType.OE, defaultOrMaker: SelectorFunction.HTML, valueOf: SelectorFunction.valueOf, enumValues: SelectorFunction.values)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'param')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'regex')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'replace')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'js')
    ..hasRequiredFields = false
  ;

  Selector._() : super();
  factory Selector({
    $core.String? selector,
    SelectorFunction? function,
    $core.String? param,
    $core.String? regex,
    $core.String? replace,
    $core.String? js,
  }) {
    final _result = create();
    if (selector != null) {
      _result.selector = selector;
    }
    if (function != null) {
      _result.function = function;
    }
    if (param != null) {
      _result.param = param;
    }
    if (regex != null) {
      _result.regex = regex;
    }
    if (replace != null) {
      _result.replace = replace;
    }
    if (js != null) {
      _result.js = js;
    }
    return _result;
  }
  factory Selector.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Selector.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Selector clone() => Selector()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Selector copyWith(void Function(Selector) updates) => super.copyWith((message) => updates(message as Selector)) as Selector; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Selector create() => Selector._();
  Selector createEmptyInstance() => create();
  static $pb.PbList<Selector> createRepeated() => $pb.PbList<Selector>();
  @$core.pragma('dart2js:noInline')
  static Selector getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Selector>(create);
  static Selector? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get selector => $_getSZ(0);
  @$pb.TagNumber(1)
  set selector($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSelector() => $_has(0);
  @$pb.TagNumber(1)
  void clearSelector() => clearField(1);

  @$pb.TagNumber(2)
  SelectorFunction get function => $_getN(1);
  @$pb.TagNumber(2)
  set function(SelectorFunction v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasFunction() => $_has(1);
  @$pb.TagNumber(2)
  void clearFunction() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get param => $_getSZ(2);
  @$pb.TagNumber(3)
  set param($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasParam() => $_has(2);
  @$pb.TagNumber(3)
  void clearParam() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get regex => $_getSZ(3);
  @$pb.TagNumber(4)
  set regex($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRegex() => $_has(3);
  @$pb.TagNumber(4)
  void clearRegex() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get replace => $_getSZ(4);
  @$pb.TagNumber(5)
  set replace($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasReplace() => $_has(4);
  @$pb.TagNumber(5)
  void clearReplace() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get js => $_getSZ(5);
  @$pb.TagNumber(6)
  set js($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasJs() => $_has(5);
  @$pb.TagNumber(6)
  void clearJs() => clearField(6);
}

class StarSelector extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'StarSelector', createEmptyInstance: create)
    ..aOM<Selector>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'selector', subBuilder: Selector.create)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'maxStar', $pb.PbFieldType.O3, protoName: 'maxStar')
    ..hasRequiredFields = false
  ;

  StarSelector._() : super();
  factory StarSelector({
    Selector? selector,
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
  Selector get selector => $_getN(0);
  @$pb.TagNumber(1)
  set selector(Selector v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSelector() => $_has(0);
  @$pb.TagNumber(1)
  void clearSelector() => clearField(1);
  @$pb.TagNumber(1)
  Selector ensureSelector() => $_ensure(0);

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
    ..aOM<Selector>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'selector', subBuilder: Selector.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'color')
    ..hasRequiredFields = false
  ;

  TagSelector._() : super();
  factory TagSelector({
    Selector? selector,
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
  Selector get selector => $_getN(0);
  @$pb.TagNumber(1)
  set selector(Selector v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSelector() => $_has(0);
  @$pb.TagNumber(1)
  void clearSelector() => clearField(1);
  @$pb.TagNumber(1)
  Selector ensureSelector() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get color => $_getSZ(1);
  @$pb.TagNumber(2)
  set color($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasColor() => $_has(1);
  @$pb.TagNumber(2)
  void clearColor() => clearField(2);
}

class ImageSelector extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ImageSelector', createEmptyInstance: create)
    ..pc<Selector>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'imgUrl', $pb.PbFieldType.PM, protoName: 'imgUrl', subBuilder: Selector.create)
    ..pc<Selector>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'imgWidth', $pb.PbFieldType.PM, protoName: 'imgWidth', subBuilder: Selector.create)
    ..pc<Selector>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'imgHeight', $pb.PbFieldType.PM, protoName: 'imgHeight', subBuilder: Selector.create)
    ..pc<Selector>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'imgX', $pb.PbFieldType.PM, protoName: 'imgX', subBuilder: Selector.create)
    ..pc<Selector>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'imgY', $pb.PbFieldType.PM, protoName: 'imgY', subBuilder: Selector.create)
    ..hasRequiredFields = false
  ;

  ImageSelector._() : super();
  factory ImageSelector({
    $core.Iterable<Selector>? imgUrl,
    $core.Iterable<Selector>? imgWidth,
    $core.Iterable<Selector>? imgHeight,
    $core.Iterable<Selector>? imgX,
    $core.Iterable<Selector>? imgY,
  }) {
    final _result = create();
    if (imgUrl != null) {
      _result.imgUrl.addAll(imgUrl);
    }
    if (imgWidth != null) {
      _result.imgWidth.addAll(imgWidth);
    }
    if (imgHeight != null) {
      _result.imgHeight.addAll(imgHeight);
    }
    if (imgX != null) {
      _result.imgX.addAll(imgX);
    }
    if (imgY != null) {
      _result.imgY.addAll(imgY);
    }
    return _result;
  }
  factory ImageSelector.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ImageSelector.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ImageSelector clone() => ImageSelector()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ImageSelector copyWith(void Function(ImageSelector) updates) => super.copyWith((message) => updates(message as ImageSelector)) as ImageSelector; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ImageSelector create() => ImageSelector._();
  ImageSelector createEmptyInstance() => create();
  static $pb.PbList<ImageSelector> createRepeated() => $pb.PbList<ImageSelector>();
  @$core.pragma('dart2js:noInline')
  static ImageSelector getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ImageSelector>(create);
  static ImageSelector? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Selector> get imgUrl => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<Selector> get imgWidth => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<Selector> get imgHeight => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<Selector> get imgX => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<Selector> get imgY => $_getList(4);
}

class CommentSelector extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CommentSelector', createEmptyInstance: create)
    ..pc<Selector>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'username', $pb.PbFieldType.PM, subBuilder: Selector.create)
    ..pc<Selector>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'postTime', $pb.PbFieldType.PM, protoName: 'postTime', subBuilder: Selector.create)
    ..pc<Selector>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'vote', $pb.PbFieldType.PM, subBuilder: Selector.create)
    ..hasRequiredFields = false
  ;

  CommentSelector._() : super();
  factory CommentSelector({
    $core.Iterable<Selector>? username,
    $core.Iterable<Selector>? postTime,
    $core.Iterable<Selector>? vote,
  }) {
    final _result = create();
    if (username != null) {
      _result.username.addAll(username);
    }
    if (postTime != null) {
      _result.postTime.addAll(postTime);
    }
    if (vote != null) {
      _result.vote.addAll(vote);
    }
    return _result;
  }
  factory CommentSelector.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CommentSelector.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CommentSelector clone() => CommentSelector()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CommentSelector copyWith(void Function(CommentSelector) updates) => super.copyWith((message) => updates(message as CommentSelector)) as CommentSelector; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CommentSelector create() => CommentSelector._();
  CommentSelector createEmptyInstance() => create();
  static $pb.PbList<CommentSelector> createRepeated() => $pb.PbList<CommentSelector>();
  @$core.pragma('dart2js:noInline')
  static CommentSelector getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CommentSelector>(create);
  static CommentSelector? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Selector> get username => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<Selector> get postTime => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<Selector> get vote => $_getList(2);
}

