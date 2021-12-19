///
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'actions.pb.dart' as $1;
import 'page.pb.dart' as $2;
import 'parser.pb.dart' as $0;

class RegField extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RegField',
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'reg')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'value')
    ..hasRequiredFields = false;

  RegField._() : super();
  factory RegField({
    $core.String? reg,
    $core.String? value,
  }) {
    final _result = create();
    if (reg != null) {
      _result.reg = reg;
    }
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory RegField.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RegField.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RegField clone() => RegField()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RegField copyWith(void Function(RegField) updates) =>
      super.copyWith((message) => updates(message as RegField))
          as RegField; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RegField create() => RegField._();
  RegField createEmptyInstance() => create();
  static $pb.PbList<RegField> createRepeated() => $pb.PbList<RegField>();
  @$core.pragma('dart2js:noInline')
  static RegField getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegField>(create);
  static RegField? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get reg => $_getSZ(0);
  @$pb.TagNumber(1)
  set reg($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasReg() => $_has(0);
  @$pb.TagNumber(1)
  void clearReg() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get value => $_getSZ(1);
  @$pb.TagNumber(2)
  set value($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
}

class SiteConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SiteConfig',
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
            : 'baseUrl',
        protoName: 'baseUrl')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'loginUrl',
        protoName: 'loginUrl')
    ..aOM<RegField>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'loginCookie',
        protoName: 'loginCookie',
        subBuilder: RegField.create)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'version')
    ..pc<RegField>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'headers',
        $pb.PbFieldType.PM,
        subBuilder: RegField.create)
    ..pc<RegField>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cookies',
        $pb.PbFieldType.PM,
        subBuilder: RegField.create)
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'upgradeUrl',
        protoName: 'upgradeUrl')
    ..pc<$0.GalleryParser>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'galleryParsers',
        $pb.PbFieldType.PM,
        protoName: 'galleryParsers',
        subBuilder: $0.GalleryParser.create)
    ..pc<$0.ListViewParser>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'listViewParser',
        $pb.PbFieldType.PM,
        protoName: 'listViewParser',
        subBuilder: $0.ListViewParser.create)
    ..pc<$1.ActionCombine>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'actionList',
        $pb.PbFieldType.PM,
        protoName: 'actionList',
        subBuilder: $1.ActionCombine.create)
    ..pc<$2.SitePage>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pageList',
        $pb.PbFieldType.PM,
        protoName: 'pageList',
        subBuilder: $2.SitePage.create)..pc<$0.ImageParser>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'imageParsers',
        $pb.PbFieldType.PM,
        protoName: 'imageParsers',
        subBuilder: $0.ImageParser.create)
    ..hasRequiredFields = false;

  SiteConfig._() : super();

  factory SiteConfig({
    $core.String? name,
    $core.String? baseUrl,
    $core.String? loginUrl,
    RegField? loginCookie,
    $core.String? version,
    $core.Iterable<RegField>? headers,
    $core.Iterable<RegField>? cookies,
    $core.String? upgradeUrl,
    $core.Iterable<$0.GalleryParser>? galleryParsers,
    $core.Iterable<$0.ListViewParser>? listViewParser,
    $core.Iterable<$1.ActionCombine>? actionList,
    $core.Iterable<$2.SitePage>? pageList,
    $core.Iterable<$0.ImageParser>? imageParsers,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (baseUrl != null) {
      _result.baseUrl = baseUrl;
    }
    if (loginUrl != null) {
      _result.loginUrl = loginUrl;
    }
    if (loginCookie != null) {
      _result.loginCookie = loginCookie;
    }
    if (version != null) {
      _result.version = version;
    }
    if (headers != null) {
      _result.headers.addAll(headers);
    }
    if (cookies != null) {
      _result.cookies.addAll(cookies);
    }
    if (upgradeUrl != null) {
      _result.upgradeUrl = upgradeUrl;
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
    if (pageList != null) {
      _result.pageList.addAll(pageList);
    }
    if (imageParsers != null) {
      _result.imageParsers.addAll(imageParsers);
    }
    return _result;
  }

  factory SiteConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory SiteConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SiteConfig clone() => SiteConfig()..mergeFromMessage(this);

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SiteConfig copyWith(void Function(SiteConfig) updates) =>
      super.copyWith((message) => updates(message as SiteConfig))
          as SiteConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SiteConfig create() => SiteConfig._();

  SiteConfig createEmptyInstance() => create();

  static $pb.PbList<SiteConfig> createRepeated() => $pb.PbList<SiteConfig>();

  @$core.pragma('dart2js:noInline')
  static SiteConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SiteConfig>(create);
  static SiteConfig? _defaultInstance;

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
  $core.String get baseUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set baseUrl($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasBaseUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearBaseUrl() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get loginUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set loginUrl($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLoginUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearLoginUrl() => clearField(3);

  @$pb.TagNumber(4)
  RegField get loginCookie => $_getN(3);
  @$pb.TagNumber(4)
  set loginCookie(RegField v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLoginCookie() => $_has(3);
  @$pb.TagNumber(4)
  void clearLoginCookie() => clearField(4);
  @$pb.TagNumber(4)
  RegField ensureLoginCookie() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get version => $_getSZ(4);
  @$pb.TagNumber(5)
  set version($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasVersion() => $_has(4);
  @$pb.TagNumber(5)
  void clearVersion() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<RegField> get headers => $_getList(5);

  @$pb.TagNumber(7)
  $core.List<RegField> get cookies => $_getList(6);

  @$pb.TagNumber(8)
  $core.String get upgradeUrl => $_getSZ(7);
  @$pb.TagNumber(8)
  set upgradeUrl($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasUpgradeUrl() => $_has(7);
  @$pb.TagNumber(8)
  void clearUpgradeUrl() => clearField(8);

  @$pb.TagNumber(10)
  $core.List<$0.GalleryParser> get galleryParsers => $_getList(8);

  @$pb.TagNumber(11)
  $core.List<$0.ListViewParser> get listViewParser => $_getList(9);

  @$pb.TagNumber(12)
  $core.List<$1.ActionCombine> get actionList => $_getList(10);

  @$pb.TagNumber(13)
  $core.List<$2.SitePage> get pageList => $_getList(11);

  @$pb.TagNumber(14)
  $core.List<$0.ImageParser> get imageParsers => $_getList(12);
}
