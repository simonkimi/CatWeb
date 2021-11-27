///
//  Generated code. Do not modify.
//  source: page.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'page.pbenum.dart';

export 'page.pbenum.dart';

class SitePage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SitePage', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'url')
    ..e<SitePageType>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: SitePageType.imageList, valueOf: SitePageType.valueOf, enumValues: SitePageType.values)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rule')
    ..hasRequiredFields = false
  ;

  SitePage._() : super();
  factory SitePage({
    $core.String? name,
    $core.String? url,
    SitePageType? type,
    $core.String? rule,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (url != null) {
      _result.url = url;
    }
    if (type != null) {
      _result.type = type;
    }
    if (rule != null) {
      _result.rule = rule;
    }
    return _result;
  }
  factory SitePage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SitePage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SitePage clone() => SitePage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SitePage copyWith(void Function(SitePage) updates) => super.copyWith((message) => updates(message as SitePage)) as SitePage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SitePage create() => SitePage._();
  SitePage createEmptyInstance() => create();
  static $pb.PbList<SitePage> createRepeated() => $pb.PbList<SitePage>();
  @$core.pragma('dart2js:noInline')
  static SitePage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SitePage>(create);
  static SitePage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get url => $_getSZ(1);
  @$pb.TagNumber(2)
  set url($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearUrl() => clearField(2);

  @$pb.TagNumber(3)
  SitePageType get type => $_getN(2);
  @$pb.TagNumber(3)
  set type(SitePageType v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get rule => $_getSZ(3);
  @$pb.TagNumber(4)
  set rule($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRule() => $_has(3);
  @$pb.TagNumber(4)
  void clearRule() => clearField(4);
}

