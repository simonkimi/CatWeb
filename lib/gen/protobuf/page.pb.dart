///
//  Generated code. Do not modify.
//  source: page.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'actions.pbenum.dart' as $0;
import 'page.pbenum.dart';
import 'template.pbenum.dart' as $1;

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
    ..e<$0.NetActionType>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'netAction',
        $pb.PbFieldType.OE,
        defaultOrMaker: $0.NetActionType.NET_ACTION_TYPE_GET,
        valueOf: $0.NetActionType.valueOf,
        enumValues: $0.NetActionType.values)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'formData')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..e<SiteDisplayType>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'display',
        $pb.PbFieldType.OE,
        defaultOrMaker: SiteDisplayType.show,
        valueOf: SiteDisplayType.valueOf,
        enumValues: SiteDisplayType.values)
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'flag')
    ..aOS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'baseParser')
    ..e<$1.Template>(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'template',
        $pb.PbFieldType.OE,
        defaultOrMaker: $1.Template.TEMPLATE_IMAGE_LIST,
        valueOf: $1.Template.valueOf,
        enumValues: $1.Template.values)
    ..a<$core.List<$core.int>>(
        21,
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
    $0.NetActionType? netAction,
    $core.String? formData,
    $core.String? icon,
    SiteDisplayType? display,
    $core.String? flag,
    $core.String? baseParser,
    $1.Template? template,
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
    if (netAction != null) {
      _result.netAction = netAction;
    }
    if (formData != null) {
      _result.formData = formData;
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
  $0.NetActionType get netAction => $_getN(3);
  @$pb.TagNumber(4)
  set netAction($0.NetActionType v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasNetAction() => $_has(3);
  @$pb.TagNumber(4)
  void clearNetAction() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get formData => $_getSZ(4);
  @$pb.TagNumber(5)
  set formData($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasFormData() => $_has(4);
  @$pb.TagNumber(5)
  void clearFormData() => clearField(5);

  @$pb.TagNumber(10)
  $core.String get icon => $_getSZ(5);
  @$pb.TagNumber(10)
  set icon($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasIcon() => $_has(5);
  @$pb.TagNumber(10)
  void clearIcon() => clearField(10);

  @$pb.TagNumber(11)
  SiteDisplayType get display => $_getN(6);
  @$pb.TagNumber(11)
  set display(SiteDisplayType v) {
    setField(11, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasDisplay() => $_has(6);
  @$pb.TagNumber(11)
  void clearDisplay() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get flag => $_getSZ(7);
  @$pb.TagNumber(12)
  set flag($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasFlag() => $_has(7);
  @$pb.TagNumber(12)
  void clearFlag() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get baseParser => $_getSZ(8);
  @$pb.TagNumber(13)
  set baseParser($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasBaseParser() => $_has(8);
  @$pb.TagNumber(13)
  void clearBaseParser() => clearField(13);

  @$pb.TagNumber(20)
  $1.Template get template => $_getN(9);
  @$pb.TagNumber(20)
  set template($1.Template v) {
    setField(20, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasTemplate() => $_has(9);
  @$pb.TagNumber(20)
  void clearTemplate() => clearField(20);

  @$pb.TagNumber(21)
  $core.List<$core.int> get templateData => $_getN(10);
  @$pb.TagNumber(21)
  set templateData($core.List<$core.int> v) {
    $_setBytes(10, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasTemplateData() => $_has(10);
  @$pb.TagNumber(21)
  void clearTemplateData() => clearField(21);
}
