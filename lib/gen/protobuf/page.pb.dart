///
//  Generated code. Do not modify.
//  source: page.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'page.pbenum.dart';
import 'template.pbenum.dart' as $0;

export 'page.pbenum.dart';

class SitePage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SitePage',
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uuid')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'url')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..e<SiteDisplayType>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'display',
        $pb.PbFieldType.OE,
        defaultOrMaker: SiteDisplayType.show,
        valueOf: SiteDisplayType.valueOf,
        enumValues: SiteDisplayType.values)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'flag')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'baseParser')
    ..e<$0.Template>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'template',
        $pb.PbFieldType.OE,
        defaultOrMaker: $0.Template.TEMPLATE_IMAGE_LIST,
        valueOf: $0.Template.valueOf,
        enumValues: $0.Template.values)
    ..a<$core.List<$core.int>>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'templateData',
        $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  SitePage._() : super();
  factory SitePage({
    $core.String? name,
    $core.String? uuid,
    $core.String? url,
    $core.String? icon,
    SiteDisplayType? display,
    $core.String? flag,
    $core.String? baseParser,
    $0.Template? template,
    $core.List<$core.int>? templateData,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (uuid != null) {
      _result.uuid = uuid;
    }
    if (url != null) {
      _result.url = url;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (display != null) {
      _result.display = display;
    }
    if (flag != null) {
      _result.flag = flag;
    }
    if (baseParser != null) {
      _result.baseParser = baseParser;
    }
    if (template != null) {
      _result.template = template;
    }
    if (templateData != null) {
      _result.templateData = templateData;
    }
    return _result;
  }
  factory SitePage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SitePage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SitePage clone() => SitePage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SitePage copyWith(void Function(SitePage) updates) =>
      super.copyWith((message) => updates(message as SitePage))
          as SitePage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SitePage create() => SitePage._();
  SitePage createEmptyInstance() => create();
  static $pb.PbList<SitePage> createRepeated() => $pb.PbList<SitePage>();
  @$core.pragma('dart2js:noInline')
  static SitePage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SitePage>(create);
  static SitePage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get uuid => $_getSZ(1);
  @$pb.TagNumber(2)
  set uuid($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUuid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUuid() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get url => $_getSZ(2);
  @$pb.TagNumber(3)
  set url($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearUrl() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get icon => $_getSZ(3);
  @$pb.TagNumber(4)
  set icon($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearIcon() => clearField(4);

  @$pb.TagNumber(5)
  SiteDisplayType get display => $_getN(4);
  @$pb.TagNumber(5)
  set display(SiteDisplayType v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDisplay() => $_has(4);
  @$pb.TagNumber(5)
  void clearDisplay() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get flag => $_getSZ(5);
  @$pb.TagNumber(6)
  set flag($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasFlag() => $_has(5);
  @$pb.TagNumber(6)
  void clearFlag() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get baseParser => $_getSZ(6);
  @$pb.TagNumber(7)
  set baseParser($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasBaseParser() => $_has(6);
  @$pb.TagNumber(7)
  void clearBaseParser() => clearField(7);

  @$pb.TagNumber(8)
  $0.Template get template => $_getN(7);
  @$pb.TagNumber(8)
  set template($0.Template v) {
    setField(8, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasTemplate() => $_has(7);
  @$pb.TagNumber(8)
  void clearTemplate() => clearField(8);

  @$pb.TagNumber(9)
  $core.List<$core.int> get templateData => $_getN(8);
  @$pb.TagNumber(9)
  set templateData($core.List<$core.int> v) {
    $_setBytes(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasTemplateData() => $_has(8);
  @$pb.TagNumber(9)
  void clearTemplateData() => clearField(9);
}
