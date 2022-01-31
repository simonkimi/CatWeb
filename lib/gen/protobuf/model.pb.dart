///
//  Generated code. Do not modify.
//  source: model.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ImageRpcModel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ImageRpcModel',
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'url')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cacheKey',
        protoName: 'cacheKey')
    ..a<$core.double>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'width',
        $pb.PbFieldType.OD)
    ..a<$core.double>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'height',
        $pb.PbFieldType.OD)
    ..a<$core.double>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'imgX',
        $pb.PbFieldType.OD,
        protoName: 'imgX')
    ..a<$core.double>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'imgY',
        $pb.PbFieldType.OD,
        protoName: 'imgY')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'target')
    ..hasRequiredFields = false;

  ImageRpcModel._() : super();
  factory ImageRpcModel({
    $core.String? url,
    $core.String? cacheKey,
    $core.double? width,
    $core.double? height,
    $core.double? imgX,
    $core.double? imgY,
    $core.String? target,
  }) {
    final _result = create();
    if (url != null) {
      _result.url = url;
    }
    if (cacheKey != null) {
      _result.cacheKey = cacheKey;
    }
    if (width != null) {
      _result.width = width;
    }
    if (height != null) {
      _result.height = height;
    }
    if (imgX != null) {
      _result.imgX = imgX;
    }
    if (imgY != null) {
      _result.imgY = imgY;
    }
    if (target != null) {
      _result.target = target;
    }
    return _result;
  }
  factory ImageRpcModel.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ImageRpcModel.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ImageRpcModel clone() => ImageRpcModel()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ImageRpcModel copyWith(void Function(ImageRpcModel) updates) =>
      super.copyWith((message) => updates(message as ImageRpcModel))
          as ImageRpcModel; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ImageRpcModel create() => ImageRpcModel._();
  ImageRpcModel createEmptyInstance() => create();
  static $pb.PbList<ImageRpcModel> createRepeated() =>
      $pb.PbList<ImageRpcModel>();
  @$core.pragma('dart2js:noInline')
  static ImageRpcModel getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ImageRpcModel>(create);
  static ImageRpcModel? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get cacheKey => $_getSZ(1);
  @$pb.TagNumber(2)
  set cacheKey($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCacheKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearCacheKey() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get width => $_getN(2);
  @$pb.TagNumber(3)
  set width($core.double v) {
    $_setDouble(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasWidth() => $_has(2);
  @$pb.TagNumber(3)
  void clearWidth() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get height => $_getN(3);
  @$pb.TagNumber(4)
  set height($core.double v) {
    $_setDouble(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasHeight() => $_has(3);
  @$pb.TagNumber(4)
  void clearHeight() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get imgX => $_getN(4);
  @$pb.TagNumber(5)
  set imgX($core.double v) {
    $_setDouble(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasImgX() => $_has(4);
  @$pb.TagNumber(5)
  void clearImgX() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get imgY => $_getN(5);
  @$pb.TagNumber(6)
  set imgY($core.double v) {
    $_setDouble(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasImgY() => $_has(5);
  @$pb.TagNumber(6)
  void clearImgY() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get target => $_getSZ(6);
  @$pb.TagNumber(7)
  set target($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasTarget() => $_has(6);
  @$pb.TagNumber(7)
  void clearTarget() => clearField(7);
}

class ColorRpcModel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ColorRpcModel',
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'a',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'r',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'g',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'b',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  ColorRpcModel._() : super();
  factory ColorRpcModel({
    $core.int? a,
    $core.int? r,
    $core.int? g,
    $core.int? b,
  }) {
    final _result = create();
    if (a != null) {
      _result.a = a;
    }
    if (r != null) {
      _result.r = r;
    }
    if (g != null) {
      _result.g = g;
    }
    if (b != null) {
      _result.b = b;
    }
    return _result;
  }
  factory ColorRpcModel.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ColorRpcModel.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ColorRpcModel clone() => ColorRpcModel()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ColorRpcModel copyWith(void Function(ColorRpcModel) updates) =>
      super.copyWith((message) => updates(message as ColorRpcModel))
          as ColorRpcModel; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ColorRpcModel create() => ColorRpcModel._();
  ColorRpcModel createEmptyInstance() => create();
  static $pb.PbList<ColorRpcModel> createRepeated() =>
      $pb.PbList<ColorRpcModel>();
  @$core.pragma('dart2js:noInline')
  static ColorRpcModel getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ColorRpcModel>(create);
  static ColorRpcModel? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get a => $_getIZ(0);
  @$pb.TagNumber(1)
  set a($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasA() => $_has(0);
  @$pb.TagNumber(1)
  void clearA() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get r => $_getIZ(1);
  @$pb.TagNumber(2)
  set r($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasR() => $_has(1);
  @$pb.TagNumber(2)
  void clearR() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get g => $_getIZ(2);
  @$pb.TagNumber(3)
  set g($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasG() => $_has(2);
  @$pb.TagNumber(3)
  void clearG() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get b => $_getIZ(3);
  @$pb.TagNumber(4)
  set b($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasB() => $_has(3);
  @$pb.TagNumber(4)
  void clearB() => clearField(4);
}

class ListRpcModel_Tag extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ListRpcModel.Tag',
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'text')
    ..aOM<ColorRpcModel>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'color',
        subBuilder: ColorRpcModel.create)
    ..hasRequiredFields = false;

  ListRpcModel_Tag._() : super();
  factory ListRpcModel_Tag({
    $core.String? text,
    ColorRpcModel? color,
  }) {
    final _result = create();
    if (text != null) {
      _result.text = text;
    }
    if (color != null) {
      _result.color = color;
    }
    return _result;
  }
  factory ListRpcModel_Tag.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ListRpcModel_Tag.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ListRpcModel_Tag clone() => ListRpcModel_Tag()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ListRpcModel_Tag copyWith(void Function(ListRpcModel_Tag) updates) =>
      super.copyWith((message) => updates(message as ListRpcModel_Tag))
          as ListRpcModel_Tag; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListRpcModel_Tag create() => ListRpcModel_Tag._();
  ListRpcModel_Tag createEmptyInstance() => create();
  static $pb.PbList<ListRpcModel_Tag> createRepeated() =>
      $pb.PbList<ListRpcModel_Tag>();
  @$core.pragma('dart2js:noInline')
  static ListRpcModel_Tag getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListRpcModel_Tag>(create);
  static ListRpcModel_Tag? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get text => $_getSZ(0);
  @$pb.TagNumber(1)
  set text($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasText() => $_has(0);
  @$pb.TagNumber(1)
  void clearText() => clearField(1);

  @$pb.TagNumber(2)
  ColorRpcModel get color => $_getN(1);
  @$pb.TagNumber(2)
  set color(ColorRpcModel v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasColor() => $_has(1);
  @$pb.TagNumber(2)
  void clearColor() => clearField(2);
  @$pb.TagNumber(2)
  ColorRpcModel ensureColor() => $_ensure(1);
}

class ListRpcModel_Item extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ListRpcModel.Item',
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subtitle')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uploadTime')
    ..a<$core.double>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'star',
        $pb.PbFieldType.OD)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'imgCount',
        $pb.PbFieldType.O3)
    ..aOM<ImageRpcModel>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'previewImg',
        subBuilder: ImageRpcModel.create)
    ..aOM<ListRpcModel_Tag>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tag',
        subBuilder: ListRpcModel_Tag.create)
    ..pc<ListRpcModel_Tag>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'badges',
        $pb.PbFieldType.PM,
        subBuilder: ListRpcModel_Tag.create)
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'paper')
    ..aOS(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nextPage')
    ..aOS(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'idCode')
    ..m<$core.String, $core.String>(
        30,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'env',
        entryClassName: 'ListRpcModel.Item.EnvEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS)
    ..hasRequiredFields = false;

  ListRpcModel_Item._() : super();
  factory ListRpcModel_Item({
    $core.String? title,
    $core.String? subtitle,
    $core.String? uploadTime,
    $core.double? star,
    $core.int? imgCount,
    ImageRpcModel? previewImg,
    ListRpcModel_Tag? tag,
    $core.Iterable<ListRpcModel_Tag>? badges,
    $core.String? paper,
    $core.String? nextPage,
    $core.String? idCode,
    $core.Map<$core.String, $core.String>? env,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (subtitle != null) {
      _result.subtitle = subtitle;
    }
    if (uploadTime != null) {
      _result.uploadTime = uploadTime;
    }
    if (star != null) {
      _result.star = star;
    }
    if (imgCount != null) {
      _result.imgCount = imgCount;
    }
    if (previewImg != null) {
      _result.previewImg = previewImg;
    }
    if (tag != null) {
      _result.tag = tag;
    }
    if (badges != null) {
      _result.badges.addAll(badges);
    }
    if (paper != null) {
      _result.paper = paper;
    }
    if (nextPage != null) {
      _result.nextPage = nextPage;
    }
    if (idCode != null) {
      _result.idCode = idCode;
    }
    if (env != null) {
      _result.env.addAll(env);
    }
    return _result;
  }
  factory ListRpcModel_Item.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ListRpcModel_Item.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ListRpcModel_Item clone() => ListRpcModel_Item()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ListRpcModel_Item copyWith(void Function(ListRpcModel_Item) updates) =>
      super.copyWith((message) => updates(message as ListRpcModel_Item))
          as ListRpcModel_Item; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListRpcModel_Item create() => ListRpcModel_Item._();
  ListRpcModel_Item createEmptyInstance() => create();
  static $pb.PbList<ListRpcModel_Item> createRepeated() =>
      $pb.PbList<ListRpcModel_Item>();
  @$core.pragma('dart2js:noInline')
  static ListRpcModel_Item getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListRpcModel_Item>(create);
  static ListRpcModel_Item? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get subtitle => $_getSZ(1);
  @$pb.TagNumber(2)
  set subtitle($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSubtitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearSubtitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get uploadTime => $_getSZ(2);
  @$pb.TagNumber(3)
  set uploadTime($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUploadTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearUploadTime() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get star => $_getN(3);
  @$pb.TagNumber(4)
  set star($core.double v) {
    $_setDouble(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasStar() => $_has(3);
  @$pb.TagNumber(4)
  void clearStar() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get imgCount => $_getIZ(4);
  @$pb.TagNumber(5)
  set imgCount($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasImgCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearImgCount() => clearField(5);

  @$pb.TagNumber(6)
  ImageRpcModel get previewImg => $_getN(5);
  @$pb.TagNumber(6)
  set previewImg(ImageRpcModel v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasPreviewImg() => $_has(5);
  @$pb.TagNumber(6)
  void clearPreviewImg() => clearField(6);
  @$pb.TagNumber(6)
  ImageRpcModel ensurePreviewImg() => $_ensure(5);

  @$pb.TagNumber(10)
  ListRpcModel_Tag get tag => $_getN(6);
  @$pb.TagNumber(10)
  set tag(ListRpcModel_Tag v) {
    setField(10, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasTag() => $_has(6);
  @$pb.TagNumber(10)
  void clearTag() => clearField(10);
  @$pb.TagNumber(10)
  ListRpcModel_Tag ensureTag() => $_ensure(6);

  @$pb.TagNumber(11)
  $core.List<ListRpcModel_Tag> get badges => $_getList(7);

  @$pb.TagNumber(12)
  $core.String get paper => $_getSZ(8);
  @$pb.TagNumber(12)
  set paper($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasPaper() => $_has(8);
  @$pb.TagNumber(12)
  void clearPaper() => clearField(12);

  @$pb.TagNumber(20)
  $core.String get nextPage => $_getSZ(9);
  @$pb.TagNumber(20)
  set nextPage($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasNextPage() => $_has(9);
  @$pb.TagNumber(20)
  void clearNextPage() => clearField(20);

  @$pb.TagNumber(21)
  $core.String get idCode => $_getSZ(10);
  @$pb.TagNumber(21)
  set idCode($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasIdCode() => $_has(10);
  @$pb.TagNumber(21)
  void clearIdCode() => clearField(21);

  @$pb.TagNumber(30)
  $core.Map<$core.String, $core.String> get env => $_getMap(11);
}

class ListRpcModel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ListRpcModel',
      createEmptyInstance: create)
    ..pc<ListRpcModel_Item>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'items',
        $pb.PbFieldType.PM,
        subBuilder: ListRpcModel_Item.create)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nextPage')
    ..m<$core.String, $core.String>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'localEnv',
        protoName: 'localEnv',
        entryClassName: 'ListRpcModel.LocalEnvEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS)
    ..m<$core.String, $core.String>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'globalEnv',
        protoName: 'globalEnv',
        entryClassName: 'ListRpcModel.GlobalEnvEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS)
    ..hasRequiredFields = false;

  ListRpcModel._() : super();
  factory ListRpcModel({
    $core.Iterable<ListRpcModel_Item>? items,
    $core.String? nextPage,
    $core.Map<$core.String, $core.String>? localEnv,
    $core.Map<$core.String, $core.String>? globalEnv,
  }) {
    final _result = create();
    if (items != null) {
      _result.items.addAll(items);
    }
    if (nextPage != null) {
      _result.nextPage = nextPage;
    }
    if (localEnv != null) {
      _result.localEnv.addAll(localEnv);
    }
    if (globalEnv != null) {
      _result.globalEnv.addAll(globalEnv);
    }
    return _result;
  }
  factory ListRpcModel.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ListRpcModel.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ListRpcModel clone() => ListRpcModel()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ListRpcModel copyWith(void Function(ListRpcModel) updates) =>
      super.copyWith((message) => updates(message as ListRpcModel))
          as ListRpcModel; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListRpcModel create() => ListRpcModel._();
  ListRpcModel createEmptyInstance() => create();
  static $pb.PbList<ListRpcModel> createRepeated() =>
      $pb.PbList<ListRpcModel>();
  @$core.pragma('dart2js:noInline')
  static ListRpcModel getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListRpcModel>(create);
  static ListRpcModel? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ListRpcModel_Item> get items => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get nextPage => $_getSZ(1);
  @$pb.TagNumber(2)
  set nextPage($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasNextPage() => $_has(1);
  @$pb.TagNumber(2)
  void clearNextPage() => clearField(2);

  @$pb.TagNumber(10)
  $core.Map<$core.String, $core.String> get localEnv => $_getMap(2);

  @$pb.TagNumber(11)
  $core.Map<$core.String, $core.String> get globalEnv => $_getMap(3);
}

class DetailRpcModel_Tag extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DetailRpcModel.Tag',
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'text')
    ..aOM<ColorRpcModel>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'color',
        subBuilder: ColorRpcModel.create)
    ..m<$core.String, $core.String>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'env',
        entryClassName: 'DetailRpcModel.Tag.EnvEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS)
    ..hasRequiredFields = false;

  DetailRpcModel_Tag._() : super();
  factory DetailRpcModel_Tag({
    $core.String? text,
    ColorRpcModel? color,
    $core.Map<$core.String, $core.String>? env,
  }) {
    final _result = create();
    if (text != null) {
      _result.text = text;
    }
    if (color != null) {
      _result.color = color;
    }
    if (env != null) {
      _result.env.addAll(env);
    }
    return _result;
  }
  factory DetailRpcModel_Tag.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DetailRpcModel_Tag.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DetailRpcModel_Tag clone() => DetailRpcModel_Tag()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DetailRpcModel_Tag copyWith(void Function(DetailRpcModel_Tag) updates) =>
      super.copyWith((message) => updates(message as DetailRpcModel_Tag))
          as DetailRpcModel_Tag; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DetailRpcModel_Tag create() => DetailRpcModel_Tag._();
  DetailRpcModel_Tag createEmptyInstance() => create();
  static $pb.PbList<DetailRpcModel_Tag> createRepeated() =>
      $pb.PbList<DetailRpcModel_Tag>();
  @$core.pragma('dart2js:noInline')
  static DetailRpcModel_Tag getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DetailRpcModel_Tag>(create);
  static DetailRpcModel_Tag? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get text => $_getSZ(0);
  @$pb.TagNumber(1)
  set text($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasText() => $_has(0);
  @$pb.TagNumber(1)
  void clearText() => clearField(1);

  @$pb.TagNumber(2)
  ColorRpcModel get color => $_getN(1);
  @$pb.TagNumber(2)
  set color(ColorRpcModel v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasColor() => $_has(1);
  @$pb.TagNumber(2)
  void clearColor() => clearField(2);
  @$pb.TagNumber(2)
  ColorRpcModel ensureColor() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.Map<$core.String, $core.String> get env => $_getMap(2);
}

class DetailRpcModel_Badge extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DetailRpcModel.Badge',
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'text')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'category')
    ..hasRequiredFields = false;

  DetailRpcModel_Badge._() : super();
  factory DetailRpcModel_Badge({
    $core.String? text,
    $core.String? category,
  }) {
    final _result = create();
    if (text != null) {
      _result.text = text;
    }
    if (category != null) {
      _result.category = category;
    }
    return _result;
  }
  factory DetailRpcModel_Badge.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DetailRpcModel_Badge.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DetailRpcModel_Badge clone() =>
      DetailRpcModel_Badge()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DetailRpcModel_Badge copyWith(void Function(DetailRpcModel_Badge) updates) =>
      super.copyWith((message) => updates(message as DetailRpcModel_Badge))
          as DetailRpcModel_Badge; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DetailRpcModel_Badge create() => DetailRpcModel_Badge._();
  DetailRpcModel_Badge createEmptyInstance() => create();
  static $pb.PbList<DetailRpcModel_Badge> createRepeated() =>
      $pb.PbList<DetailRpcModel_Badge>();
  @$core.pragma('dart2js:noInline')
  static DetailRpcModel_Badge getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DetailRpcModel_Badge>(create);
  static DetailRpcModel_Badge? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get text => $_getSZ(0);
  @$pb.TagNumber(1)
  set text($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasText() => $_has(0);
  @$pb.TagNumber(1)
  void clearText() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get category => $_getSZ(1);
  @$pb.TagNumber(2)
  set category($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCategory() => $_has(1);
  @$pb.TagNumber(2)
  void clearCategory() => clearField(2);
}

class DetailRpcModel_Comment extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DetailRpcModel.Comment',
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'username')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'content')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'time')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score')
    ..aOM<ImageRpcModel>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'avatar',
        subBuilder: ImageRpcModel.create)
    ..hasRequiredFields = false;

  DetailRpcModel_Comment._() : super();
  factory DetailRpcModel_Comment({
    $core.String? username,
    $core.String? content,
    $core.String? time,
    $core.String? score,
    ImageRpcModel? avatar,
  }) {
    final _result = create();
    if (username != null) {
      _result.username = username;
    }
    if (content != null) {
      _result.content = content;
    }
    if (time != null) {
      _result.time = time;
    }
    if (score != null) {
      _result.score = score;
    }
    if (avatar != null) {
      _result.avatar = avatar;
    }
    return _result;
  }
  factory DetailRpcModel_Comment.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DetailRpcModel_Comment.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DetailRpcModel_Comment clone() =>
      DetailRpcModel_Comment()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DetailRpcModel_Comment copyWith(
          void Function(DetailRpcModel_Comment) updates) =>
      super.copyWith((message) => updates(message as DetailRpcModel_Comment))
          as DetailRpcModel_Comment; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DetailRpcModel_Comment create() => DetailRpcModel_Comment._();
  DetailRpcModel_Comment createEmptyInstance() => create();
  static $pb.PbList<DetailRpcModel_Comment> createRepeated() =>
      $pb.PbList<DetailRpcModel_Comment>();
  @$core.pragma('dart2js:noInline')
  static DetailRpcModel_Comment getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DetailRpcModel_Comment>(create);
  static DetailRpcModel_Comment? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get username => $_getSZ(0);
  @$pb.TagNumber(1)
  set username($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUsername() => $_has(0);
  @$pb.TagNumber(1)
  void clearUsername() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get time => $_getSZ(2);
  @$pb.TagNumber(3)
  set time($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearTime() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get score => $_getSZ(3);
  @$pb.TagNumber(4)
  set score($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasScore() => $_has(3);
  @$pb.TagNumber(4)
  void clearScore() => clearField(4);

  @$pb.TagNumber(5)
  ImageRpcModel get avatar => $_getN(4);
  @$pb.TagNumber(5)
  set avatar(ImageRpcModel v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasAvatar() => $_has(4);
  @$pb.TagNumber(5)
  void clearAvatar() => clearField(5);
  @$pb.TagNumber(5)
  ImageRpcModel ensureAvatar() => $_ensure(4);
}

class DetailRpcModel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DetailRpcModel',
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subtitle')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'language')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'imageCount',
        $pb.PbFieldType.O3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uploadTime')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'countPrePage',
        $pb.PbFieldType.O3)
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'description')
    ..a<$core.double>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'star',
        $pb.PbFieldType.OD)
    ..pc<ImageRpcModel>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'previewImg',
        $pb.PbFieldType.PM,
        subBuilder: ImageRpcModel.create)
    ..aOM<DetailRpcModel_Tag>(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tag',
        subBuilder: DetailRpcModel_Tag.create)
    ..pc<DetailRpcModel_Badge>(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'badges',
        $pb.PbFieldType.PM,
        subBuilder: DetailRpcModel_Badge.create)
    ..pc<DetailRpcModel_Comment>(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'comments',
        $pb.PbFieldType.PM,
        subBuilder: DetailRpcModel_Comment.create)
    ..m<$core.String, $core.String>(
        30,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'localEnv',
        protoName: 'localEnv',
        entryClassName: 'DetailRpcModel.LocalEnvEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS)
    ..m<$core.String, $core.String>(
        31,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'globalEnv',
        protoName: 'globalEnv',
        entryClassName: 'DetailRpcModel.GlobalEnvEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS)
    ..hasRequiredFields = false;

  DetailRpcModel._() : super();
  factory DetailRpcModel({
    $core.String? title,
    $core.String? subtitle,
    $core.String? language,
    $core.int? imageCount,
    $core.String? uploadTime,
    $core.int? countPrePage,
    $core.String? description,
    $core.double? star,
    $core.Iterable<ImageRpcModel>? previewImg,
    DetailRpcModel_Tag? tag,
    $core.Iterable<DetailRpcModel_Badge>? badges,
    $core.Iterable<DetailRpcModel_Comment>? comments,
    $core.Map<$core.String, $core.String>? localEnv,
    $core.Map<$core.String, $core.String>? globalEnv,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (subtitle != null) {
      _result.subtitle = subtitle;
    }
    if (language != null) {
      _result.language = language;
    }
    if (imageCount != null) {
      _result.imageCount = imageCount;
    }
    if (uploadTime != null) {
      _result.uploadTime = uploadTime;
    }
    if (countPrePage != null) {
      _result.countPrePage = countPrePage;
    }
    if (description != null) {
      _result.description = description;
    }
    if (star != null) {
      _result.star = star;
    }
    if (previewImg != null) {
      _result.previewImg.addAll(previewImg);
    }
    if (tag != null) {
      _result.tag = tag;
    }
    if (badges != null) {
      _result.badges.addAll(badges);
    }
    if (comments != null) {
      _result.comments.addAll(comments);
    }
    if (localEnv != null) {
      _result.localEnv.addAll(localEnv);
    }
    if (globalEnv != null) {
      _result.globalEnv.addAll(globalEnv);
    }
    return _result;
  }
  factory DetailRpcModel.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DetailRpcModel.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DetailRpcModel clone() => DetailRpcModel()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DetailRpcModel copyWith(void Function(DetailRpcModel) updates) =>
      super.copyWith((message) => updates(message as DetailRpcModel))
          as DetailRpcModel; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DetailRpcModel create() => DetailRpcModel._();
  DetailRpcModel createEmptyInstance() => create();
  static $pb.PbList<DetailRpcModel> createRepeated() =>
      $pb.PbList<DetailRpcModel>();
  @$core.pragma('dart2js:noInline')
  static DetailRpcModel getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DetailRpcModel>(create);
  static DetailRpcModel? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get subtitle => $_getSZ(1);
  @$pb.TagNumber(2)
  set subtitle($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSubtitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearSubtitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get language => $_getSZ(2);
  @$pb.TagNumber(3)
  set language($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLanguage() => $_has(2);
  @$pb.TagNumber(3)
  void clearLanguage() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get imageCount => $_getIZ(3);
  @$pb.TagNumber(4)
  set imageCount($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasImageCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearImageCount() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get uploadTime => $_getSZ(4);
  @$pb.TagNumber(5)
  set uploadTime($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasUploadTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearUploadTime() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get countPrePage => $_getIZ(5);
  @$pb.TagNumber(6)
  set countPrePage($core.int v) {
    $_setSignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasCountPrePage() => $_has(5);
  @$pb.TagNumber(6)
  void clearCountPrePage() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get description => $_getSZ(6);
  @$pb.TagNumber(7)
  set description($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasDescription() => $_has(6);
  @$pb.TagNumber(7)
  void clearDescription() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get star => $_getN(7);
  @$pb.TagNumber(8)
  set star($core.double v) {
    $_setDouble(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasStar() => $_has(7);
  @$pb.TagNumber(8)
  void clearStar() => clearField(8);

  @$pb.TagNumber(9)
  $core.List<ImageRpcModel> get previewImg => $_getList(8);

  @$pb.TagNumber(20)
  DetailRpcModel_Tag get tag => $_getN(9);
  @$pb.TagNumber(20)
  set tag(DetailRpcModel_Tag v) {
    setField(20, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasTag() => $_has(9);
  @$pb.TagNumber(20)
  void clearTag() => clearField(20);
  @$pb.TagNumber(20)
  DetailRpcModel_Tag ensureTag() => $_ensure(9);

  @$pb.TagNumber(21)
  $core.List<DetailRpcModel_Badge> get badges => $_getList(10);

  @$pb.TagNumber(22)
  $core.List<DetailRpcModel_Comment> get comments => $_getList(11);

  @$pb.TagNumber(30)
  $core.Map<$core.String, $core.String> get localEnv => $_getMap(12);

  @$pb.TagNumber(31)
  $core.Map<$core.String, $core.String> get globalEnv => $_getMap(13);
}
