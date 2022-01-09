///
//  Generated code. Do not modify.
//  source: selector.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class SelectorFunction extends $pb.ProtobufEnum {
  static const SelectorFunction auto = SelectorFunction._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'auto');
  static const SelectorFunction text = SelectorFunction._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'text');
  static const SelectorFunction attr = SelectorFunction._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'attr');
  static const SelectorFunction raw = SelectorFunction._(
      3,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'raw');

  static const $core.List<SelectorFunction> values = <SelectorFunction>[
    auto,
    text,
    attr,
    raw,
  ];

  static final $core.Map<$core.int, SelectorFunction> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static SelectorFunction? valueOf($core.int value) => _byValue[value];

  const SelectorFunction._($core.int v, $core.String n) : super(v, n);
}

class ExtraSelectorType extends $pb.ProtobufEnum {
  static const ExtraSelectorType none = ExtraSelectorType._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'none');
  static const ExtraSelectorType listItem = ExtraSelectorType._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'listItem');
  static const ExtraSelectorType galleryThumbnail = ExtraSelectorType._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'galleryThumbnail');
  static const ExtraSelectorType galleryComment = ExtraSelectorType._(
      3,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'galleryComment');
  static const ExtraSelectorType galleryBadge = ExtraSelectorType._(
      4,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'galleryBadge');
  static const ExtraSelectorType galleryChapter = ExtraSelectorType._(
      5,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'galleryChapter');

  static const $core.List<ExtraSelectorType> values = <ExtraSelectorType>[
    none,
    listItem,
    galleryThumbnail,
    galleryComment,
    galleryBadge,
    galleryChapter,
  ];

  static final $core.Map<$core.int, ExtraSelectorType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static ExtraSelectorType? valueOf($core.int value) => _byValue[value];

  const ExtraSelectorType._($core.int v, $core.String n) : super(v, n);
}
