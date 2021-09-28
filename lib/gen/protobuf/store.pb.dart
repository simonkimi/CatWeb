///
//  Generated code. Do not modify.
//  source: store.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RulesProtocol extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RulesProtocol', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'baseUrl', protoName: 'baseUrl')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cookies')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'headers')
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'needCookies', protoName: 'needCookies')
    ..hasRequiredFields = false
  ;

  RulesProtocol._() : super();
  factory RulesProtocol({
    $core.String? name,
    $core.String? baseUrl,
    $core.String? cookies,
    $core.String? headers,
    $core.bool? needCookies,
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
    if (headers != null) {
      _result.headers = headers;
    }
    if (needCookies != null) {
      _result.needCookies = needCookies;
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
  $core.String get headers => $_getSZ(3);
  @$pb.TagNumber(4)
  set headers($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasHeaders() => $_has(3);
  @$pb.TagNumber(4)
  void clearHeaders() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get needCookies => $_getBF(4);
  @$pb.TagNumber(5)
  set needCookies($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasNeedCookies() => $_has(4);
  @$pb.TagNumber(5)
  void clearNeedCookies() => clearField(5);
}

