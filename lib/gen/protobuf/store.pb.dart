///
//  Generated code. Do not modify.
//  source: store.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'parser.pb.dart' as $0;
import 'actions.pb.dart' as $1;

class Header extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Header', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'reg')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'headers')
    ..hasRequiredFields = false
  ;

  Header._() : super();
  factory Header({
    $core.String? reg,
    $core.String? headers,
  }) {
    final _result = create();
    if (reg != null) {
      _result.reg = reg;
    }
    if (headers != null) {
      _result.headers = headers;
    }
    return _result;
  }
  factory Header.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Header.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Header clone() => Header()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Header copyWith(void Function(Header) updates) => super.copyWith((message) => updates(message as Header)) as Header; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Header create() => Header._();
  Header createEmptyInstance() => create();
  static $pb.PbList<Header> createRepeated() => $pb.PbList<Header>();
  @$core.pragma('dart2js:noInline')
  static Header getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Header>(create);
  static Header? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get reg => $_getSZ(0);
  @$pb.TagNumber(1)
  set reg($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasReg() => $_has(0);
  @$pb.TagNumber(1)
  void clearReg() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get headers => $_getSZ(1);
  @$pb.TagNumber(2)
  set headers($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHeaders() => $_has(1);
  @$pb.TagNumber(2)
  void clearHeaders() => clearField(2);
}

class RulesProtocol extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RulesProtocol', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'baseUrl', protoName: 'baseUrl')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cookies')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'extraCookies', protoName: 'extraCookies')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'loginUrl', protoName: 'loginUrl')
    ..pc<Header>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'headers', $pb.PbFieldType.PM, subBuilder: Header.create)
    ..pc<$0.GalleryParser>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'galleryParsers', $pb.PbFieldType.PM, protoName: 'galleryParsers', subBuilder: $0.GalleryParser.create)
    ..pc<$0.ListViewParser>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'listViewParser', $pb.PbFieldType.PM, protoName: 'listViewParser', subBuilder: $0.ListViewParser.create)
    ..pc<$1.ActionCombine>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'actionList', $pb.PbFieldType.PM, protoName: 'actionList', subBuilder: $1.ActionCombine.create)
    ..hasRequiredFields = false
  ;

  RulesProtocol._() : super();
  factory RulesProtocol({
    $core.String? name,
    $core.String? baseUrl,
    $core.String? cookies,
    $core.String? extraCookies,
    $core.String? loginUrl,
    $core.Iterable<Header>? headers,
    $core.Iterable<$0.GalleryParser>? galleryParsers,
    $core.Iterable<$0.ListViewParser>? listViewParser,
    $core.Iterable<$1.ActionCombine>? actionList,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (baseUrl != null) {
      _result.baseUrl = baseUrl;
    }
    if (cookies != null) {
      _result.cookies = cookies;
    }
    if (extraCookies != null) {
      _result.extraCookies = extraCookies;
    }
    if (loginUrl != null) {
      _result.loginUrl = loginUrl;
    }
    if (headers != null) {
      _result.headers.addAll(headers);
    }
    if (galleryParsers != null) {
      _result.galleryParsers.addAll(galleryParsers);
    }
    if (listViewParser != null) {
      _result.listViewParser.addAll(listViewParser);
    }
    if (actionList != null) {
      _result.actionList.addAll(actionList);
    }
    return _result;
  }
  factory RulesProtocol.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RulesProtocol.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RulesProtocol clone() => RulesProtocol()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RulesProtocol copyWith(void Function(RulesProtocol) updates) => super.copyWith((message) => updates(message as RulesProtocol)) as RulesProtocol; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RulesProtocol create() => RulesProtocol._();
  RulesProtocol createEmptyInstance() => create();
  static $pb.PbList<RulesProtocol> createRepeated() => $pb.PbList<RulesProtocol>();
  @$core.pragma('dart2js:noInline')
  static RulesProtocol getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RulesProtocol>(create);
  static RulesProtocol? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get baseUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set baseUrl($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBaseUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearBaseUrl() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get cookies => $_getSZ(2);
  @$pb.TagNumber(3)
  set cookies($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCookies() => $_has(2);
  @$pb.TagNumber(3)
  void clearCookies() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get extraCookies => $_getSZ(3);
  @$pb.TagNumber(4)
  set extraCookies($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasExtraCookies() => $_has(3);
  @$pb.TagNumber(4)
  void clearExtraCookies() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get loginUrl => $_getSZ(4);
  @$pb.TagNumber(5)
  set loginUrl($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLoginUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearLoginUrl() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<Header> get headers => $_getList(5);

  @$pb.TagNumber(10)
  $core.List<$0.GalleryParser> get galleryParsers => $_getList(6);

  @$pb.TagNumber(11)
  $core.List<$0.ListViewParser> get listViewParser => $_getList(7);

  @$pb.TagNumber(12)
  $core.List<$1.ActionCombine> get actionList => $_getList(8);
}

