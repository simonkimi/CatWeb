///
//  Generated code. Do not modify.
//  source: actions.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'actions.pbenum.dart';

export 'actions.pbenum.dart';

class InputAction extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'InputAction', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..e<InputActionType>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: InputActionType.NUM, valueOf: InputActionType.valueOf, enumValues: InputActionType.values)
    ..aOB(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'global')
    ..hasRequiredFields = false
  ;

  InputAction._() : super();
  factory InputAction({
    $core.String? name,
    $core.String? id,
    InputActionType? type,
    $core.bool? global,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (id != null) {
      _result.id = id;
    }
    if (type != null) {
      _result.type = type;
    }
    if (global != null) {
      _result.global = global;
    }
    return _result;
  }
  factory InputAction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InputAction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InputAction clone() => InputAction()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InputAction copyWith(void Function(InputAction) updates) => super.copyWith((message) => updates(message as InputAction)) as InputAction; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static InputAction create() => InputAction._();
  InputAction createEmptyInstance() => create();
  static $pb.PbList<InputAction> createRepeated() => $pb.PbList<InputAction>();
  @$core.pragma('dart2js:noInline')
  static InputAction getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InputAction>(create);
  static InputAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get id => $_getSZ(1);
  @$pb.TagNumber(2)
  set id($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

  @$pb.TagNumber(3)
  InputActionType get type => $_getN(2);
  @$pb.TagNumber(3)
  set type(InputActionType v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get global => $_getBF(3);
  @$pb.TagNumber(4)
  set global($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasGlobal() => $_has(3);
  @$pb.TagNumber(4)
  void clearGlobal() => clearField(4);
}

class NetWorkAction extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NetWorkAction', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..e<NetWorkActionType>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: NetWorkActionType.GET, valueOf: NetWorkActionType.valueOf, enumValues: NetWorkActionType.values)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'url')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data')
    ..hasRequiredFields = false
  ;

  NetWorkAction._() : super();
  factory NetWorkAction({
    $core.String? name,
    NetWorkActionType? type,
    $core.String? url,
    $core.String? data,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (type != null) {
      _result.type = type;
    }
    if (url != null) {
      _result.url = url;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory NetWorkAction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NetWorkAction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NetWorkAction clone() => NetWorkAction()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NetWorkAction copyWith(void Function(NetWorkAction) updates) => super.copyWith((message) => updates(message as NetWorkAction)) as NetWorkAction; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NetWorkAction create() => NetWorkAction._();
  NetWorkAction createEmptyInstance() => create();
  static $pb.PbList<NetWorkAction> createRepeated() => $pb.PbList<NetWorkAction>();
  @$core.pragma('dart2js:noInline')
  static NetWorkAction getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NetWorkAction>(create);
  static NetWorkAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  NetWorkActionType get type => $_getN(1);
  @$pb.TagNumber(2)
  set type(NetWorkActionType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get url => $_getSZ(2);
  @$pb.TagNumber(3)
  set url($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearUrl() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get data => $_getSZ(3);
  @$pb.TagNumber(4)
  set data($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasData() => $_has(3);
  @$pb.TagNumber(4)
  void clearData() => clearField(4);
}

class SetIdAction extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SetIdAction', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'reg')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'replace')
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'global')
    ..hasRequiredFields = false
  ;

  SetIdAction._() : super();
  factory SetIdAction({
    $core.String? name,
    $core.String? id,
    $core.String? reg,
    $core.String? replace,
    $core.bool? global,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (id != null) {
      _result.id = id;
    }
    if (reg != null) {
      _result.reg = reg;
    }
    if (replace != null) {
      _result.replace = replace;
    }
    if (global != null) {
      _result.global = global;
    }
    return _result;
  }
  factory SetIdAction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetIdAction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SetIdAction clone() => SetIdAction()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SetIdAction copyWith(void Function(SetIdAction) updates) => super.copyWith((message) => updates(message as SetIdAction)) as SetIdAction; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SetIdAction create() => SetIdAction._();
  SetIdAction createEmptyInstance() => create();
  static $pb.PbList<SetIdAction> createRepeated() => $pb.PbList<SetIdAction>();
  @$core.pragma('dart2js:noInline')
  static SetIdAction getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetIdAction>(create);
  static SetIdAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get id => $_getSZ(1);
  @$pb.TagNumber(2)
  set id($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get reg => $_getSZ(2);
  @$pb.TagNumber(3)
  set reg($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasReg() => $_has(2);
  @$pb.TagNumber(3)
  void clearReg() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get replace => $_getSZ(3);
  @$pb.TagNumber(4)
  set replace($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasReplace() => $_has(3);
  @$pb.TagNumber(4)
  void clearReplace() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get global => $_getBF(4);
  @$pb.TagNumber(5)
  set global($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasGlobal() => $_has(4);
  @$pb.TagNumber(5)
  void clearGlobal() => clearField(5);
}

class OpenPageAction extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'OpenPageAction', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'target')
    ..hasRequiredFields = false
  ;

  OpenPageAction._() : super();
  factory OpenPageAction({
    $core.String? name,
    $core.String? target,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (target != null) {
      _result.target = target;
    }
    return _result;
  }
  factory OpenPageAction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OpenPageAction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  OpenPageAction clone() => OpenPageAction()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  OpenPageAction copyWith(void Function(OpenPageAction) updates) => super.copyWith((message) => updates(message as OpenPageAction)) as OpenPageAction; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OpenPageAction create() => OpenPageAction._();
  OpenPageAction createEmptyInstance() => create();
  static $pb.PbList<OpenPageAction> createRepeated() => $pb.PbList<OpenPageAction>();
  @$core.pragma('dart2js:noInline')
  static OpenPageAction getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OpenPageAction>(create);
  static OpenPageAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get target => $_getSZ(1);
  @$pb.TagNumber(2)
  set target($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTarget() => $_has(1);
  @$pb.TagNumber(2)
  void clearTarget() => clearField(2);
}

class ActionCombine extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ActionCombine', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..pPS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'actions')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'icon')
    ..hasRequiredFields = false
  ;

  ActionCombine._() : super();
  factory ActionCombine({
    $core.String? name,
    $core.Iterable<$core.String>? actions,
    $core.String? icon,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (actions != null) {
      _result.actions.addAll(actions);
    }
    if (icon != null) {
      _result.icon = icon;
    }
    return _result;
  }
  factory ActionCombine.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ActionCombine.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ActionCombine clone() => ActionCombine()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ActionCombine copyWith(void Function(ActionCombine) updates) => super.copyWith((message) => updates(message as ActionCombine)) as ActionCombine; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ActionCombine create() => ActionCombine._();
  ActionCombine createEmptyInstance() => create();
  static $pb.PbList<ActionCombine> createRepeated() => $pb.PbList<ActionCombine>();
  @$core.pragma('dart2js:noInline')
  static ActionCombine getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ActionCombine>(create);
  static ActionCombine? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get actions => $_getList(1);

  @$pb.TagNumber(5)
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(5)
  set icon($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(5)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(5)
  void clearIcon() => clearField(5);
}

