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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Selector',
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'selector')
    ..e<SelectorFunction>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'function',
        $pb.PbFieldType.OE,
        defaultOrMaker: SelectorFunction.SELECTOR_FUNCTION_AUTO,
        valueOf: SelectorFunction.valueOf,
        enumValues: SelectorFunction.values)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'param')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'regex')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'replace')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'js')
    ..aOB(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'computed')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'defaultValue')
    ..hasRequiredFields = false;

  Selector._() : super();
  factory Selector({
    $core.String? selector,
    SelectorFunction? function,
    $core.String? param,
    $core.String? regex,
    $core.String? replace,
    $core.String? js,
    $core.bool? computed,
    $core.String? defaultValue,
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
    if (js != null) {
      _result.js = js;
    }
    if (computed != null) {
      _result.computed = computed;
    }
    if (defaultValue != null) {
      _result.defaultValue = defaultValue;
    }
    return _result;
  }
  factory Selector.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Selector.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Selector clone() => Selector()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Selector copyWith(void Function(Selector) updates) =>
      super.copyWith((message) => updates(message as Selector))
          as Selector; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Selector create() => Selector._();
  Selector createEmptyInstance() => create();
  static $pb.PbList<Selector> createRepeated() => $pb.PbList<Selector>();
  @$core.pragma('dart2js:noInline')
  static Selector getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Selector>(create);
  static Selector? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get selector => $_getSZ(0);
  @$pb.TagNumber(1)
  set selector($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSelector() => $_has(0);
  @$pb.TagNumber(1)
  void clearSelector() => clearField(1);

  @$pb.TagNumber(2)
  SelectorFunction get function => $_getN(1);
  @$pb.TagNumber(2)
  set function(SelectorFunction v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasFunction() => $_has(1);
  @$pb.TagNumber(2)
  void clearFunction() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get param => $_getSZ(2);
  @$pb.TagNumber(3)
  set param($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasParam() => $_has(2);
  @$pb.TagNumber(3)
  void clearParam() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get regex => $_getSZ(3);
  @$pb.TagNumber(4)
  set regex($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRegex() => $_has(3);
  @$pb.TagNumber(4)
  void clearRegex() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get replace => $_getSZ(4);
  @$pb.TagNumber(5)
  set replace($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasReplace() => $_has(4);
  @$pb.TagNumber(5)
  void clearReplace() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get js => $_getSZ(5);
  @$pb.TagNumber(6)
  set js($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasJs() => $_has(5);
  @$pb.TagNumber(6)
  void clearJs() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get computed => $_getBF(6);
  @$pb.TagNumber(7)
  set computed($core.bool v) {
    $_setBool(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasComputed() => $_has(6);
  @$pb.TagNumber(7)
  void clearComputed() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get defaultValue => $_getSZ(7);
  @$pb.TagNumber(8)
  set defaultValue($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasDefaultValue() => $_has(7);
  @$pb.TagNumber(8)
  void clearDefaultValue() => clearField(8);
}

class ExtraSelector extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ExtraSelector',
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id')
    ..aOM<Selector>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'selector',
        subBuilder: Selector.create)
    ..aOB(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'global')
    ..e<ExtraSelectorType>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type',
        $pb.PbFieldType.OE,
        defaultOrMaker: ExtraSelectorType.EXTRA_SELECTOR_TYPE_NONE,
        valueOf: ExtraSelectorType.valueOf,
        enumValues: ExtraSelectorType.values)
    ..hasRequiredFields = false;

  ExtraSelector._() : super();
  factory ExtraSelector({
    $core.String? id,
    Selector? selector,
    $core.bool? global,
    ExtraSelectorType? type,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (selector != null) {
      _result.selector = selector;
    }
    if (global != null) {
      _result.global = global;
    }
    if (type != null) {
      _result.type = type;
    }
    return _result;
  }
  factory ExtraSelector.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ExtraSelector.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ExtraSelector clone() => ExtraSelector()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ExtraSelector copyWith(void Function(ExtraSelector) updates) =>
      super.copyWith((message) => updates(message as ExtraSelector))
          as ExtraSelector; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ExtraSelector create() => ExtraSelector._();
  ExtraSelector createEmptyInstance() => create();
  static $pb.PbList<ExtraSelector> createRepeated() =>
      $pb.PbList<ExtraSelector>();
  @$core.pragma('dart2js:noInline')
  static ExtraSelector getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ExtraSelector>(create);
  static ExtraSelector? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  Selector get selector => $_getN(1);
  @$pb.TagNumber(2)
  set selector(Selector v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSelector() => $_has(1);
  @$pb.TagNumber(2)
  void clearSelector() => clearField(2);
  @$pb.TagNumber(2)
  Selector ensureSelector() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.bool get global => $_getBF(2);
  @$pb.TagNumber(3)
  set global($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasGlobal() => $_has(2);
  @$pb.TagNumber(3)
  void clearGlobal() => clearField(3);

  @$pb.TagNumber(4)
  ExtraSelectorType get type => $_getN(3);
  @$pb.TagNumber(4)
  set type(ExtraSelectorType v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => clearField(4);
}

class ImageSelector extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ImageSelector',
      createEmptyInstance: create)
    ..aOM<Selector>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'imgUrl',
        subBuilder: Selector.create)
    ..aOM<Selector>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'imgWidth',
        subBuilder: Selector.create)
    ..aOM<Selector>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'imgHeight',
        subBuilder: Selector.create)
    ..aOM<Selector>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'imgX',
        subBuilder: Selector.create)
    ..aOM<Selector>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'imgY',
        subBuilder: Selector.create)
    ..aOM<Selector>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'target',
        subBuilder: Selector.create)
    ..hasRequiredFields = false;

  ImageSelector._() : super();
  factory ImageSelector({
    Selector? imgUrl,
    Selector? imgWidth,
    Selector? imgHeight,
    Selector? imgX,
    Selector? imgY,
    Selector? target,
  }) {
    final _result = create();
    if (imgUrl != null) {
      _result.imgUrl = imgUrl;
    }
    if (imgWidth != null) {
      _result.imgWidth = imgWidth;
    }
    if (imgHeight != null) {
      _result.imgHeight = imgHeight;
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
  factory ImageSelector.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ImageSelector.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ImageSelector clone() => ImageSelector()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ImageSelector copyWith(void Function(ImageSelector) updates) =>
      super.copyWith((message) => updates(message as ImageSelector))
          as ImageSelector; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ImageSelector create() => ImageSelector._();
  ImageSelector createEmptyInstance() => create();
  static $pb.PbList<ImageSelector> createRepeated() =>
      $pb.PbList<ImageSelector>();
  @$core.pragma('dart2js:noInline')
  static ImageSelector getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ImageSelector>(create);
  static ImageSelector? _defaultInstance;

  @$pb.TagNumber(1)
  Selector get imgUrl => $_getN(0);
  @$pb.TagNumber(1)
  set imgUrl(Selector v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasImgUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearImgUrl() => clearField(1);
  @$pb.TagNumber(1)
  Selector ensureImgUrl() => $_ensure(0);

  @$pb.TagNumber(2)
  Selector get imgWidth => $_getN(1);
  @$pb.TagNumber(2)
  set imgWidth(Selector v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasImgWidth() => $_has(1);
  @$pb.TagNumber(2)
  void clearImgWidth() => clearField(2);
  @$pb.TagNumber(2)
  Selector ensureImgWidth() => $_ensure(1);

  @$pb.TagNumber(3)
  Selector get imgHeight => $_getN(2);
  @$pb.TagNumber(3)
  set imgHeight(Selector v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasImgHeight() => $_has(2);
  @$pb.TagNumber(3)
  void clearImgHeight() => clearField(3);
  @$pb.TagNumber(3)
  Selector ensureImgHeight() => $_ensure(2);

  @$pb.TagNumber(4)
  Selector get imgX => $_getN(3);
  @$pb.TagNumber(4)
  set imgX(Selector v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasImgX() => $_has(3);
  @$pb.TagNumber(4)
  void clearImgX() => clearField(4);
  @$pb.TagNumber(4)
  Selector ensureImgX() => $_ensure(3);

  @$pb.TagNumber(5)
  Selector get imgY => $_getN(4);
  @$pb.TagNumber(5)
  set imgY(Selector v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasImgY() => $_has(4);
  @$pb.TagNumber(5)
  void clearImgY() => clearField(5);
  @$pb.TagNumber(5)
  Selector ensureImgY() => $_ensure(4);

  @$pb.TagNumber(6)
  Selector get target => $_getN(5);
  @$pb.TagNumber(6)
  set target(Selector v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasTarget() => $_has(5);
  @$pb.TagNumber(6)
  void clearTarget() => clearField(6);
  @$pb.TagNumber(6)
  Selector ensureTarget() => $_ensure(5);
}

class CommentSelector extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CommentSelector',
      createEmptyInstance: create)
    ..aOM<Selector>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'username',
        subBuilder: Selector.create)
    ..aOM<Selector>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'time',
        subBuilder: Selector.create)
    ..aOM<Selector>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        subBuilder: Selector.create)
    ..aOM<Selector>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'content',
        subBuilder: Selector.create)
    ..aOM<ImageSelector>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'avatar',
        subBuilder: ImageSelector.create)
    ..hasRequiredFields = false;

  CommentSelector._() : super();
  factory CommentSelector({
    Selector? username,
    Selector? time,
    Selector? score,
    Selector? content,
    ImageSelector? avatar,
  }) {
    final _result = create();
    if (username != null) {
      _result.username = username;
    }
    if (time != null) {
      _result.time = time;
    }
    if (score != null) {
      _result.score = score;
    }
    if (content != null) {
      _result.content = content;
    }
    if (avatar != null) {
      _result.avatar = avatar;
    }
    return _result;
  }
  factory CommentSelector.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CommentSelector.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CommentSelector clone() => CommentSelector()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CommentSelector copyWith(void Function(CommentSelector) updates) =>
      super.copyWith((message) => updates(message as CommentSelector))
          as CommentSelector; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CommentSelector create() => CommentSelector._();
  CommentSelector createEmptyInstance() => create();
  static $pb.PbList<CommentSelector> createRepeated() =>
      $pb.PbList<CommentSelector>();
  @$core.pragma('dart2js:noInline')
  static CommentSelector getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CommentSelector>(create);
  static CommentSelector? _defaultInstance;

  @$pb.TagNumber(1)
  Selector get username => $_getN(0);
  @$pb.TagNumber(1)
  set username(Selector v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUsername() => $_has(0);
  @$pb.TagNumber(1)
  void clearUsername() => clearField(1);
  @$pb.TagNumber(1)
  Selector ensureUsername() => $_ensure(0);

  @$pb.TagNumber(2)
  Selector get time => $_getN(1);
  @$pb.TagNumber(2)
  set time(Selector v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearTime() => clearField(2);
  @$pb.TagNumber(2)
  Selector ensureTime() => $_ensure(1);

  @$pb.TagNumber(3)
  Selector get score => $_getN(2);
  @$pb.TagNumber(3)
  set score(Selector v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasScore() => $_has(2);
  @$pb.TagNumber(3)
  void clearScore() => clearField(3);
  @$pb.TagNumber(3)
  Selector ensureScore() => $_ensure(2);

  @$pb.TagNumber(4)
  Selector get content => $_getN(3);
  @$pb.TagNumber(4)
  set content(Selector v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasContent() => $_has(3);
  @$pb.TagNumber(4)
  void clearContent() => clearField(4);
  @$pb.TagNumber(4)
  Selector ensureContent() => $_ensure(3);

  @$pb.TagNumber(5)
  ImageSelector get avatar => $_getN(4);
  @$pb.TagNumber(5)
  set avatar(ImageSelector v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasAvatar() => $_has(4);
  @$pb.TagNumber(5)
  void clearAvatar() => clearField(5);
  @$pb.TagNumber(5)
  ImageSelector ensureAvatar() => $_ensure(4);
}
