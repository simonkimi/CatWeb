///
//  Generated code. Do not modify.
//  source: template.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'template.pbenum.dart';

export 'template.pbenum.dart';

class TemplateListData_SubPage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TemplateListData.SubPage',
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
            : 'key')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'value')
    ..hasRequiredFields = false;

  TemplateListData_SubPage._() : super();
  factory TemplateListData_SubPage({
    $core.String? name,
    $core.String? key,
    $core.String? value,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (key != null) {
      _result.key = key;
    }
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory TemplateListData_SubPage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TemplateListData_SubPage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TemplateListData_SubPage clone() =>
      TemplateListData_SubPage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TemplateListData_SubPage copyWith(
          void Function(TemplateListData_SubPage) updates) =>
      super.copyWith((message) => updates(message as TemplateListData_SubPage))
          as TemplateListData_SubPage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TemplateListData_SubPage create() => TemplateListData_SubPage._();
  TemplateListData_SubPage createEmptyInstance() => create();
  static $pb.PbList<TemplateListData_SubPage> createRepeated() =>
      $pb.PbList<TemplateListData_SubPage>();
  @$core.pragma('dart2js:noInline')
  static TemplateListData_SubPage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TemplateListData_SubPage>(create);
  static TemplateListData_SubPage? _defaultInstance;

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
  $core.String get key => $_getSZ(1);
  @$pb.TagNumber(2)
  set key($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearKey() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get value => $_getSZ(2);
  @$pb.TagNumber(3)
  set value($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearValue() => clearField(3);
}

class TemplateListData_FilterItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TemplateListData.FilterItem',
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
            : 'key')
    ..e<TemplateListData_FilterType>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type',
        $pb.PbFieldType.OE,
        defaultOrMaker: TemplateListData_FilterType.FILTER_TYPE_NUMBER,
        valueOf: TemplateListData_FilterType.valueOf,
        enumValues: TemplateListData_FilterType.values)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'value')
    ..hasRequiredFields = false;

  TemplateListData_FilterItem._() : super();
  factory TemplateListData_FilterItem({
    $core.String? name,
    $core.String? key,
    TemplateListData_FilterType? type,
    $core.String? value,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (key != null) {
      _result.key = key;
    }
    if (type != null) {
      _result.type = type;
    }
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory TemplateListData_FilterItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TemplateListData_FilterItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TemplateListData_FilterItem clone() =>
      TemplateListData_FilterItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TemplateListData_FilterItem copyWith(
          void Function(TemplateListData_FilterItem) updates) =>
      super.copyWith(
              (message) => updates(message as TemplateListData_FilterItem))
          as TemplateListData_FilterItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TemplateListData_FilterItem create() =>
      TemplateListData_FilterItem._();
  TemplateListData_FilterItem createEmptyInstance() => create();
  static $pb.PbList<TemplateListData_FilterItem> createRepeated() =>
      $pb.PbList<TemplateListData_FilterItem>();
  @$core.pragma('dart2js:noInline')
  static TemplateListData_FilterItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TemplateListData_FilterItem>(create);
  static TemplateListData_FilterItem? _defaultInstance;

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
  $core.String get key => $_getSZ(1);
  @$pb.TagNumber(2)
  set key($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearKey() => clearField(2);

  @$pb.TagNumber(3)
  TemplateListData_FilterType get type => $_getN(2);
  @$pb.TagNumber(3)
  set type(TemplateListData_FilterType v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get value => $_getSZ(3);
  @$pb.TagNumber(4)
  set value($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasValue() => $_has(3);
  @$pb.TagNumber(4)
  void clearValue() => clearField(4);
}

class TemplateListData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TemplateListData',
      createEmptyInstance: create)
    ..pc<TemplateListData_SubPage>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subPages',
        $pb.PbFieldType.PM,
        subBuilder: TemplateListData_SubPage.create)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'script')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'targetItem')
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'targetAutoComplete')
    ..pc<TemplateListData_FilterItem>(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'filterItem',
        $pb.PbFieldType.PM,
        subBuilder: TemplateListData_FilterItem.create)
    ..hasRequiredFields = false;

  TemplateListData._() : super();
  factory TemplateListData({
    $core.Iterable<TemplateListData_SubPage>? subPages,
    $core.String? script,
    $core.String? targetItem,
    $core.String? targetAutoComplete,
    $core.Iterable<TemplateListData_FilterItem>? filterItem,
  }) {
    final _result = create();
    if (subPages != null) {
      _result.subPages.addAll(subPages);
    }
    if (script != null) {
      _result.script = script;
    }
    if (targetItem != null) {
      _result.targetItem = targetItem;
    }
    if (targetAutoComplete != null) {
      _result.targetAutoComplete = targetAutoComplete;
    }
    if (filterItem != null) {
      _result.filterItem.addAll(filterItem);
    }
    return _result;
  }
  factory TemplateListData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TemplateListData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TemplateListData clone() => TemplateListData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TemplateListData copyWith(void Function(TemplateListData) updates) =>
      super.copyWith((message) => updates(message as TemplateListData))
          as TemplateListData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TemplateListData create() => TemplateListData._();
  TemplateListData createEmptyInstance() => create();
  static $pb.PbList<TemplateListData> createRepeated() =>
      $pb.PbList<TemplateListData>();
  @$core.pragma('dart2js:noInline')
  static TemplateListData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TemplateListData>(create);
  static TemplateListData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<TemplateListData_SubPage> get subPages => $_getList(0);

  @$pb.TagNumber(3)
  $core.String get script => $_getSZ(1);
  @$pb.TagNumber(3)
  set script($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasScript() => $_has(1);
  @$pb.TagNumber(3)
  void clearScript() => clearField(3);

  @$pb.TagNumber(10)
  $core.String get targetItem => $_getSZ(2);
  @$pb.TagNumber(10)
  set targetItem($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasTargetItem() => $_has(2);
  @$pb.TagNumber(10)
  void clearTargetItem() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get targetAutoComplete => $_getSZ(3);
  @$pb.TagNumber(11)
  set targetAutoComplete($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasTargetAutoComplete() => $_has(3);
  @$pb.TagNumber(11)
  void clearTargetAutoComplete() => clearField(11);

  @$pb.TagNumber(22)
  $core.List<TemplateListData_FilterItem> get filterItem => $_getList(4);
}

class TemplateAutoComplete extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TemplateAutoComplete',
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'splitChar')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'timeout',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  TemplateAutoComplete._() : super();
  factory TemplateAutoComplete({
    $core.String? splitChar,
    $core.int? timeout,
  }) {
    final _result = create();
    if (splitChar != null) {
      _result.splitChar = splitChar;
    }
    if (timeout != null) {
      _result.timeout = timeout;
    }
    return _result;
  }
  factory TemplateAutoComplete.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TemplateAutoComplete.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TemplateAutoComplete clone() =>
      TemplateAutoComplete()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TemplateAutoComplete copyWith(void Function(TemplateAutoComplete) updates) =>
      super.copyWith((message) => updates(message as TemplateAutoComplete))
          as TemplateAutoComplete; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TemplateAutoComplete create() => TemplateAutoComplete._();
  TemplateAutoComplete createEmptyInstance() => create();
  static $pb.PbList<TemplateAutoComplete> createRepeated() =>
      $pb.PbList<TemplateAutoComplete>();
  @$core.pragma('dart2js:noInline')
  static TemplateAutoComplete getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TemplateAutoComplete>(create);
  static TemplateAutoComplete? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get splitChar => $_getSZ(0);
  @$pb.TagNumber(1)
  set splitChar($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSplitChar() => $_has(0);
  @$pb.TagNumber(1)
  void clearSplitChar() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get timeout => $_getIZ(1);
  @$pb.TagNumber(2)
  set timeout($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTimeout() => $_has(1);
  @$pb.TagNumber(2)
  void clearTimeout() => clearField(2);
}

class TemplateEmpty extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TemplateEmpty',
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  TemplateEmpty._() : super();
  factory TemplateEmpty() => create();
  factory TemplateEmpty.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TemplateEmpty.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TemplateEmpty clone() => TemplateEmpty()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TemplateEmpty copyWith(void Function(TemplateEmpty) updates) =>
      super.copyWith((message) => updates(message as TemplateEmpty))
          as TemplateEmpty; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TemplateEmpty create() => TemplateEmpty._();
  TemplateEmpty createEmptyInstance() => create();
  static $pb.PbList<TemplateEmpty> createRepeated() =>
      $pb.PbList<TemplateEmpty>();
  @$core.pragma('dart2js:noInline')
  static TemplateEmpty getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TemplateEmpty>(create);
  static TemplateEmpty? _defaultInstance;
}
