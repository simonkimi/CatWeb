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
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hint')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'js')
    ..hasRequiredFields = false
  ;

  Selector._() : super();
  factory Selector({
    $core.String? selector,
    SelectorFunction? function,
    $core.String? param,
    $core.String? regex,
    $core.String? replace,
    $core.String? hint,
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
    if (hint != null) {
      _result.hint = hint;
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
  $core.String get hint => $_getSZ(5);
  @$pb.TagNumber(6)
  set hint($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasHint() => $_has(5);
  @$pb.TagNumber(6)
  void clearHint() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get js => $_getSZ(6);
  @$pb.TagNumber(7)
  set js($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasJs() => $_has(6);
  @$pb.TagNumber(7)
  void clearJs() => clearField(7);
}

