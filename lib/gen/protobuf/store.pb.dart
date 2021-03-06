///
//  Generated code. Do not modify.
//  source: store.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'actions.pb.dart' as $1;
import 'page.pb.dart' as $3;

import 'parser.pbenum.dart' as $4;

class RegField extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RegField', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'reg')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value')
    ..hasRequiredFields = false
  ;

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
  factory RegField.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegField.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RegField clone() => RegField()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RegField copyWith(void Function(RegField) updates) => super.copyWith((message) => updates(message as RegField)) as RegField; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RegField create() => RegField._();
  RegField createEmptyInstance() => create();
  static $pb.PbList<RegField> createRepeated() => $pb.PbList<RegField>();
  @$core.pragma('dart2js:noInline')
  static RegField getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegField>(create);
  static RegField? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get reg => $_getSZ(0);
  @$pb.TagNumber(1)
  set reg($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasReg() => $_has(0);
  @$pb.TagNumber(1)
  void clearReg() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get value => $_getSZ(1);
  @$pb.TagNumber(2)
  set value($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
}

class SiteBlueprint extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SiteBlueprint', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'baseUrl')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'loginUrl')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'loginCookieReg')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'loginCookieDescription')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'version')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'upgradeUrl')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'flag')
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'readme')
    ..pc<RegField>(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'headers', $pb.PbFieldType.PM, subBuilder: RegField.create)
    ..pc<RegField>(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cookies', $pb.PbFieldType.PM, subBuilder: RegField.create)
    ..pc<ParserStore>(20, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'parsers', $pb.PbFieldType.PM, subBuilder: ParserStore.create)
    ..pc<$1.ActionCombine>(30, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'actions', $pb.PbFieldType.PM, subBuilder: $1.ActionCombine.create)
    ..pc<$3.SitePage>(31, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pages', $pb.PbFieldType.PM, subBuilder: $3.SitePage.create)
    ..hasRequiredFields = false
  ;

  SiteBlueprint._() : super();
  factory SiteBlueprint({
    $core.String? name,
    $core.String? baseUrl,
    $core.String? loginUrl,
    $core.String? loginCookieReg,
    $core.String? loginCookieDescription,
    $core.String? version,
    $core.String? upgradeUrl,
    $core.String? flag,
    $core.String? readme,
    $core.Iterable<RegField>? headers,
    $core.Iterable<RegField>? cookies,
    $core.Iterable<ParserStore>? parsers,
    $core.Iterable<$1.ActionCombine>? actions,
    $core.Iterable<$3.SitePage>? pages,
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
    if (loginCookieReg != null) {
      _result.loginCookieReg = loginCookieReg;
    }
    if (loginCookieDescription != null) {
      _result.loginCookieDescription = loginCookieDescription;
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
    if (parsers != null) {
      _result.parsers.addAll(parsers);
    }
    if (actions != null) {
      _result.actions.addAll(actions);
    }
    if (pages != null) {
      _result.pages.addAll(pages);
    }
    return _result;
  }
  factory SiteBlueprint.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SiteBlueprint.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SiteBlueprint clone() => SiteBlueprint()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SiteBlueprint copyWith(void Function(SiteBlueprint) updates) => super.copyWith((message) => updates(message as SiteBlueprint)) as SiteBlueprint; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SiteBlueprint create() => SiteBlueprint._();
  SiteBlueprint createEmptyInstance() => create();
  static $pb.PbList<SiteBlueprint> createRepeated() => $pb.PbList<SiteBlueprint>();
  @$core.pragma('dart2js:noInline')
  static SiteBlueprint getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SiteBlueprint>(create);
  static SiteBlueprint? _defaultInstance;

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
  $core.String get loginUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set loginUrl($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLoginUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearLoginUrl() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get loginCookieReg => $_getSZ(3);
  @$pb.TagNumber(4)
  set loginCookieReg($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLoginCookieReg() => $_has(3);
  @$pb.TagNumber(4)
  void clearLoginCookieReg() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get loginCookieDescription => $_getSZ(4);
  @$pb.TagNumber(5)
  set loginCookieDescription($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLoginCookieDescription() => $_has(4);
  @$pb.TagNumber(5)
  void clearLoginCookieDescription() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get version => $_getSZ(5);
  @$pb.TagNumber(6)
  set version($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasVersion() => $_has(5);
  @$pb.TagNumber(6)
  void clearVersion() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get upgradeUrl => $_getSZ(6);
  @$pb.TagNumber(7)
  set upgradeUrl($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasUpgradeUrl() => $_has(6);
  @$pb.TagNumber(7)
  void clearUpgradeUrl() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get flag => $_getSZ(7);
  @$pb.TagNumber(8)
  set flag($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasFlag() => $_has(7);
  @$pb.TagNumber(8)
  void clearFlag() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get readme => $_getSZ(8);
  @$pb.TagNumber(9)
  set readme($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasReadme() => $_has(8);
  @$pb.TagNumber(9)
  void clearReadme() => clearField(9);

  @$pb.TagNumber(15)
  $core.List<RegField> get headers => $_getList(9);

  @$pb.TagNumber(16)
  $core.List<RegField> get cookies => $_getList(10);

  @$pb.TagNumber(20)
  $core.List<ParserStore> get parsers => $_getList(11);

  @$pb.TagNumber(30)
  $core.List<$1.ActionCombine> get actions => $_getList(12);

  @$pb.TagNumber(31)
  $core.List<$3.SitePage> get pages => $_getList(13);
}

class ParserStore extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ParserStore', createEmptyInstance: create)
    ..e<$4.ParserType>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: $4.ParserType.PARSER_TYPE_IMAGE, valueOf: $4.ParserType.valueOf, enumValues: $4.ParserType.values)
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'parser', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  ParserStore._() : super();
  factory ParserStore({
    $4.ParserType? type,
    $core.List<$core.int>? parser,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (parser != null) {
      _result.parser = parser;
    }
    return _result;
  }
  factory ParserStore.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ParserStore.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ParserStore clone() => ParserStore()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ParserStore copyWith(void Function(ParserStore) updates) => super.copyWith((message) => updates(message as ParserStore)) as ParserStore; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ParserStore create() => ParserStore._();
  ParserStore createEmptyInstance() => create();
  static $pb.PbList<ParserStore> createRepeated() => $pb.PbList<ParserStore>();
  @$core.pragma('dart2js:noInline')
  static ParserStore getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ParserStore>(create);
  static ParserStore? _defaultInstance;

  @$pb.TagNumber(1)
  $4.ParserType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type($4.ParserType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get parser => $_getN(1);
  @$pb.TagNumber(2)
  set parser($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasParser() => $_has(1);
  @$pb.TagNumber(2)
  void clearParser() => clearField(2);
}

class EnvStore extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EnvStore', createEmptyInstance: create)
    ..m<$core.String, $core.String>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'env', entryClassName: 'EnvStore.EnvEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS)
    ..hasRequiredFields = false
  ;

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
  factory EnvStore.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EnvStore.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EnvStore clone() => EnvStore()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EnvStore copyWith(void Function(EnvStore) updates) => super.copyWith((message) => updates(message as EnvStore)) as EnvStore; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EnvStore create() => EnvStore._();
  EnvStore createEmptyInstance() => create();
  static $pb.PbList<EnvStore> createRepeated() => $pb.PbList<EnvStore>();
  @$core.pragma('dart2js:noInline')
  static EnvStore getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EnvStore>(create);
  static EnvStore? _defaultInstance;

  @$pb.TagNumber(1)
  $core.Map<$core.String, $core.String> get env => $_getMap(0);
}

class CookieJarMessage_SerializableCookie extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CookieJarMessage.SerializableCookie', createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createTime')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cookie')
    ..hasRequiredFields = false
  ;

  CookieJarMessage_SerializableCookie._() : super();
  factory CookieJarMessage_SerializableCookie({
    $fixnum.Int64? createTime,
    $core.String? cookie,
  }) {
    final _result = create();
    if (createTime != null) {
      _result.createTime = createTime;
    }
    if (cookie != null) {
      _result.cookie = cookie;
    }
    return _result;
  }
  factory CookieJarMessage_SerializableCookie.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CookieJarMessage_SerializableCookie.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CookieJarMessage_SerializableCookie clone() => CookieJarMessage_SerializableCookie()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CookieJarMessage_SerializableCookie copyWith(void Function(CookieJarMessage_SerializableCookie) updates) => super.copyWith((message) => updates(message as CookieJarMessage_SerializableCookie)) as CookieJarMessage_SerializableCookie; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CookieJarMessage_SerializableCookie create() => CookieJarMessage_SerializableCookie._();
  CookieJarMessage_SerializableCookie createEmptyInstance() => create();
  static $pb.PbList<CookieJarMessage_SerializableCookie> createRepeated() => $pb.PbList<CookieJarMessage_SerializableCookie>();
  @$core.pragma('dart2js:noInline')
  static CookieJarMessage_SerializableCookie getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CookieJarMessage_SerializableCookie>(create);
  static CookieJarMessage_SerializableCookie? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get createTime => $_getI64(0);
  @$pb.TagNumber(1)
  set createTime($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCreateTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearCreateTime() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get cookie => $_getSZ(1);
  @$pb.TagNumber(2)
  set cookie($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCookie() => $_has(1);
  @$pb.TagNumber(2)
  void clearCookie() => clearField(2);
}

class CookieJarMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CookieJarMessage', createEmptyInstance: create)
    ..pc<CookieJarMessage_SerializableCookie>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cookies', $pb.PbFieldType.PM, subBuilder: CookieJarMessage_SerializableCookie.create)
    ..hasRequiredFields = false
  ;

  CookieJarMessage._() : super();
  factory CookieJarMessage({
    $core.Iterable<CookieJarMessage_SerializableCookie>? cookies,
  }) {
    final _result = create();
    if (cookies != null) {
      _result.cookies.addAll(cookies);
    }
    return _result;
  }
  factory CookieJarMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CookieJarMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CookieJarMessage clone() => CookieJarMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CookieJarMessage copyWith(void Function(CookieJarMessage) updates) => super.copyWith((message) => updates(message as CookieJarMessage)) as CookieJarMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CookieJarMessage create() => CookieJarMessage._();
  CookieJarMessage createEmptyInstance() => create();
  static $pb.PbList<CookieJarMessage> createRepeated() => $pb.PbList<CookieJarMessage>();
  @$core.pragma('dart2js:noInline')
  static CookieJarMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CookieJarMessage>(create);
  static CookieJarMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<CookieJarMessage_SerializableCookie> get cookies => $_getList(0);
}

