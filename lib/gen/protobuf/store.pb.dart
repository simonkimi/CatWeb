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
import 'page.pb.dart' as $2;

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

class SiteBlueprint extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SiteBlueprint',
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
            : 'baseUrl')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'loginUrl')
    ..aOM<RegField>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'loginCookie',
        subBuilder: RegField.create)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'version')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'upgradeUrl')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'flag')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'readme')
    ..pc<RegField>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'headers',
        $pb.PbFieldType.PM,
        subBuilder: RegField.create)
    ..pc<RegField>(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cookies',
        $pb.PbFieldType.PM,
        subBuilder: RegField.create)
    ..pc<$0.GalleryParser>(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'galleryParsers',
        $pb.PbFieldType.PM,
        subBuilder: $0.GalleryParser.create)
    ..pc<$0.ListViewParser>(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'listViewParsers',
        $pb.PbFieldType.PM,
        subBuilder: $0.ListViewParser.create)
    ..pc<$0.ImageReaderParser>(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'imageParsers',
        $pb.PbFieldType.PM,
        subBuilder: $0.ImageReaderParser.create)
    ..pc<$0.AutoCompleteParser>(
        23,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'autoCompleteParsers',
        $pb.PbFieldType.PM,
        subBuilder: $0.AutoCompleteParser.create)
    ..pc<$1.ActionCombine>(
        30,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'actions',
        $pb.PbFieldType.PM,
        subBuilder: $1.ActionCombine.create)
    ..pc<$2.SitePage>(
        31,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pages',
        $pb.PbFieldType.PM,
        subBuilder: $2.SitePage.create)
    ..hasRequiredFields = false;

  SiteBlueprint._() : super();
  factory SiteBlueprint({
    $core.String? name,
    $core.String? baseUrl,
    $core.String? loginUrl,
    RegField? loginCookie,
    $core.String? version,
    $core.String? upgradeUrl,
    $core.String? flag,
    $core.String? readme,
    $core.Iterable<RegField>? headers,
    $core.Iterable<RegField>? cookies,
    $core.Iterable<$0.GalleryParser>? galleryParsers,
    $core.Iterable<$0.ListViewParser>? listViewParsers,
    $core.Iterable<$0.ImageReaderParser>? imageParsers,
    $core.Iterable<$0.AutoCompleteParser>? autoCompleteParsers,
    $core.Iterable<$1.ActionCombine>? actions,
    $core.Iterable<$2.SitePage>? pages,
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
    if (upgradeUrl != null) {
      _result.upgradeUrl = upgradeUrl;
    }
    if (flag != null) {
      _result.flag = flag;
    }
    if (readme != null) {
      _result.readme = readme;
    }
    if (headers != null) {
      _result.headers.addAll(headers);
    }
    if (cookies != null) {
      _result.cookies.addAll(cookies);
    }
    if (galleryParsers != null) {
      _result.galleryParsers.addAll(galleryParsers);
    }
    if (listViewParsers != null) {
      _result.listViewParsers.addAll(listViewParsers);
    }
    if (imageParsers != null) {
      _result.imageParsers.addAll(imageParsers);
    }
    if (autoCompleteParsers != null) {
      _result.autoCompleteParsers.addAll(autoCompleteParsers);
    }
    if (actions != null) {
      _result.actions.addAll(actions);
    }
    if (pages != null) {
      _result.pages.addAll(pages);
    }
    return _result;
  }
  factory SiteBlueprint.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SiteBlueprint.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SiteBlueprint clone() => SiteBlueprint()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SiteBlueprint copyWith(void Function(SiteBlueprint) updates) =>
      super.copyWith((message) => updates(message as SiteBlueprint))
          as SiteBlueprint; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SiteBlueprint create() => SiteBlueprint._();
  SiteBlueprint createEmptyInstance() => create();
  static $pb.PbList<SiteBlueprint> createRepeated() =>
      $pb.PbList<SiteBlueprint>();
  @$core.pragma('dart2js:noInline')
  static SiteBlueprint getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SiteBlueprint>(create);
  static SiteBlueprint? _defaultInstance;

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
  $core.String get upgradeUrl => $_getSZ(5);
  @$pb.TagNumber(6)
  set upgradeUrl($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasUpgradeUrl() => $_has(5);
  @$pb.TagNumber(6)
  void clearUpgradeUrl() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get flag => $_getSZ(6);
  @$pb.TagNumber(7)
  set flag($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasFlag() => $_has(6);
  @$pb.TagNumber(7)
  void clearFlag() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get readme => $_getSZ(7);
  @$pb.TagNumber(8)
  set readme($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasReadme() => $_has(7);
  @$pb.TagNumber(8)
  void clearReadme() => clearField(8);

  @$pb.TagNumber(15)
  $core.List<RegField> get headers => $_getList(8);

  @$pb.TagNumber(16)
  $core.List<RegField> get cookies => $_getList(9);

  @$pb.TagNumber(20)
  $core.List<$0.GalleryParser> get galleryParsers => $_getList(10);

  @$pb.TagNumber(21)
  $core.List<$0.ListViewParser> get listViewParsers => $_getList(11);

  @$pb.TagNumber(22)
  $core.List<$0.ImageReaderParser> get imageParsers => $_getList(12);

  @$pb.TagNumber(23)
  $core.List<$0.AutoCompleteParser> get autoCompleteParsers => $_getList(13);

  @$pb.TagNumber(30)
  $core.List<$1.ActionCombine> get actions => $_getList(14);

  @$pb.TagNumber(31)
  $core.List<$2.SitePage> get pages => $_getList(15);
}

class EnvStore extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'EnvStore',
      createEmptyInstance: create)
    ..m<$core.String, $core.String>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'env',
        entryClassName: 'EnvStore.EnvEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS)
    ..hasRequiredFields = false;

  EnvStore._() : super();
  factory EnvStore({
    $core.Map<$core.String, $core.String>? env,
  }) {
    final _result = create();
    if (env != null) {
      _result.env.addAll(env);
    }
    return _result;
  }
  factory EnvStore.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory EnvStore.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  EnvStore clone() => EnvStore()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  EnvStore copyWith(void Function(EnvStore) updates) =>
      super.copyWith((message) => updates(message as EnvStore))
          as EnvStore; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EnvStore create() => EnvStore._();
  EnvStore createEmptyInstance() => create();
  static $pb.PbList<EnvStore> createRepeated() => $pb.PbList<EnvStore>();
  @$core.pragma('dart2js:noInline')
  static EnvStore getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EnvStore>(create);
  static EnvStore? _defaultInstance;

  @$pb.TagNumber(1)
  $core.Map<$core.String, $core.String> get env => $_getMap(0);
}
