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

class TemplateListData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TemplateListData',
      createEmptyInstance: create)
    ..pc<TemplateListData_SubPage>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subPages',
        $pb.PbFieldType.PM,
        subBuilder: TemplateListData_SubPage.create)
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'targetItem')
    ..hasRequiredFields = false;

  TemplateListData._() : super();
  factory TemplateListData({
    $core.Iterable<TemplateListData_SubPage>? subPages,
    $core.String? targetItem,
  }) {
    final _result = create();
    if (subPages != null) {
      _result.subPages.addAll(subPages);
    }
    if (targetItem != null) {
      _result.targetItem = targetItem;
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

  @$pb.TagNumber(2)
  $core.List<TemplateListData_SubPage> get subPages => $_getList(0);

  @$pb.TagNumber(10)
  $core.String get targetItem => $_getSZ(1);
  @$pb.TagNumber(10)
  set targetItem($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasTargetItem() => $_has(1);
  @$pb.TagNumber(10)
  void clearTargetItem() => clearField(10);
}

class TemplateListSearchData_FilterItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TemplateListSearchData.FilterItem',
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
    ..aOB(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'value')
    ..hasRequiredFields = false;

  TemplateListSearchData_FilterItem._() : super();
  factory TemplateListSearchData_FilterItem({
    $core.String? name,
    $core.String? key,
    $core.bool? value,
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
  factory TemplateListSearchData_FilterItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TemplateListSearchData_FilterItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TemplateListSearchData_FilterItem clone() =>
      TemplateListSearchData_FilterItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TemplateListSearchData_FilterItem copyWith(
          void Function(TemplateListSearchData_FilterItem) updates) =>
      super.copyWith((message) =>
              updates(message as TemplateListSearchData_FilterItem))
          as TemplateListSearchData_FilterItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TemplateListSearchData_FilterItem create() =>
      TemplateListSearchData_FilterItem._();
  TemplateListSearchData_FilterItem createEmptyInstance() => create();
  static $pb.PbList<TemplateListSearchData_FilterItem> createRepeated() =>
      $pb.PbList<TemplateListSearchData_FilterItem>();
  @$core.pragma('dart2js:noInline')
  static TemplateListSearchData_FilterItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TemplateListSearchData_FilterItem>(
          create);
  static TemplateListSearchData_FilterItem? _defaultInstance;

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
  $core.bool get value => $_getBF(2);
  @$pb.TagNumber(3)
  set value($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearValue() => clearField(3);
}

class TemplateListSearchData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TemplateListSearchData',
      createEmptyInstance: create)
    ..pc<TemplateListSearchData_FilterItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'filterItem',
        $pb.PbFieldType.PM,
        subBuilder: TemplateListSearchData_FilterItem.create)
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
    ..hasRequiredFields = false;

  TemplateListSearchData._() : super();
  factory TemplateListSearchData({
    $core.Iterable<TemplateListSearchData_FilterItem>? filterItem,
    $core.String? targetItem,
    $core.String? targetAutoComplete,
  }) {
    final _result = create();
    if (filterItem != null) {
      _result.filterItem.addAll(filterItem);
    }
    if (targetItem != null) {
      _result.targetItem = targetItem;
    }
    if (targetAutoComplete != null) {
      _result.targetAutoComplete = targetAutoComplete;
    }
    return _result;
  }
  factory TemplateListSearchData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TemplateListSearchData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TemplateListSearchData clone() =>
      TemplateListSearchData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TemplateListSearchData copyWith(
          void Function(TemplateListSearchData) updates) =>
      super.copyWith((message) => updates(message as TemplateListSearchData))
          as TemplateListSearchData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TemplateListSearchData create() => TemplateListSearchData._();
  TemplateListSearchData createEmptyInstance() => create();
  static $pb.PbList<TemplateListSearchData> createRepeated() =>
      $pb.PbList<TemplateListSearchData>();
  @$core.pragma('dart2js:noInline')
  static TemplateListSearchData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TemplateListSearchData>(create);
  static TemplateListSearchData? _defaultInstance;

  @$pb.TagNumber(2)
  $core.List<TemplateListSearchData_FilterItem> get filterItem => $_getList(0);

  @$pb.TagNumber(10)
  $core.String get targetItem => $_getSZ(1);
  @$pb.TagNumber(10)
  set targetItem($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasTargetItem() => $_has(1);
  @$pb.TagNumber(10)
  void clearTargetItem() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get targetAutoComplete => $_getSZ(2);
  @$pb.TagNumber(11)
  set targetAutoComplete($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasTargetAutoComplete() => $_has(2);
  @$pb.TagNumber(11)
  void clearTargetAutoComplete() => clearField(11);
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
    ..e<Template>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'template',
        $pb.PbFieldType.OE,
        defaultOrMaker: Template.TEMPLATE_IMAGE_LIST,
        valueOf: Template.valueOf,
        enumValues: Template.values)
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
    Template? template,
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
  Template get template => $_getN(7);
  @$pb.TagNumber(8)
  set template(Template v) {
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
