//
//  Generated code. Do not modify.
//  source: selector.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SelectorFunction extends $pb.ProtobufEnum {
  static const SelectorFunction SELECTOR_FUNCTION_AUTO = SelectorFunction._(0, _omitEnumNames ? '' : 'SELECTOR_FUNCTION_AUTO');
  static const SelectorFunction SELECTOR_FUNCTION_TEXT = SelectorFunction._(1, _omitEnumNames ? '' : 'SELECTOR_FUNCTION_TEXT');
  static const SelectorFunction SELECTOR_FUNCTION_ATTR = SelectorFunction._(2, _omitEnumNames ? '' : 'SELECTOR_FUNCTION_ATTR');
  static const SelectorFunction SELECTOR_FUNCTION_RAW = SelectorFunction._(3, _omitEnumNames ? '' : 'SELECTOR_FUNCTION_RAW');

  static const $core.List<SelectorFunction> values = <SelectorFunction> [
    SELECTOR_FUNCTION_AUTO,
    SELECTOR_FUNCTION_TEXT,
    SELECTOR_FUNCTION_ATTR,
    SELECTOR_FUNCTION_RAW,
  ];

  static final $core.Map<$core.int, SelectorFunction> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SelectorFunction? valueOf($core.int value) => _byValue[value];

  const SelectorFunction._($core.int v, $core.String n) : super(v, n);
}

class ExtraSelectorType extends $pb.ProtobufEnum {
  static const ExtraSelectorType EXTRA_SELECTOR_TYPE_NONE = ExtraSelectorType._(0, _omitEnumNames ? '' : 'EXTRA_SELECTOR_TYPE_NONE');
  static const ExtraSelectorType EXTRA_SELECTOR_TYPE_LIST_ITEM = ExtraSelectorType._(1, _omitEnumNames ? '' : 'EXTRA_SELECTOR_TYPE_LIST_ITEM');
  static const ExtraSelectorType EXTRA_SELECTOR_TYPE_GALLERY_THUMBNAIL = ExtraSelectorType._(2, _omitEnumNames ? '' : 'EXTRA_SELECTOR_TYPE_GALLERY_THUMBNAIL');
  static const ExtraSelectorType EXTRA_SELECTOR_TYPE_GALLERY_COMMENT = ExtraSelectorType._(3, _omitEnumNames ? '' : 'EXTRA_SELECTOR_TYPE_GALLERY_COMMENT');
  static const ExtraSelectorType EXTRA_SELECTOR_TYPE_GALLERY_BADGE = ExtraSelectorType._(4, _omitEnumNames ? '' : 'EXTRA_SELECTOR_TYPE_GALLERY_BADGE');
  static const ExtraSelectorType EXTRA_SELECTOR_TYPE_GALLERY_CHAPTER = ExtraSelectorType._(5, _omitEnumNames ? '' : 'EXTRA_SELECTOR_TYPE_GALLERY_CHAPTER');

  static const $core.List<ExtraSelectorType> values = <ExtraSelectorType> [
    EXTRA_SELECTOR_TYPE_NONE,
    EXTRA_SELECTOR_TYPE_LIST_ITEM,
    EXTRA_SELECTOR_TYPE_GALLERY_THUMBNAIL,
    EXTRA_SELECTOR_TYPE_GALLERY_COMMENT,
    EXTRA_SELECTOR_TYPE_GALLERY_BADGE,
    EXTRA_SELECTOR_TYPE_GALLERY_CHAPTER,
  ];

  static final $core.Map<$core.int, ExtraSelectorType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ExtraSelectorType? valueOf($core.int value) => _byValue[value];

  const ExtraSelectorType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
