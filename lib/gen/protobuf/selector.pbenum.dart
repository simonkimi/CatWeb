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
  static const SelectorFunction HTML = SelectorFunction._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'HTML');
  static const SelectorFunction TEXT = SelectorFunction._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TEXT');
  static const SelectorFunction ATTR = SelectorFunction._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ATTR');

  static const $core.List<SelectorFunction> values = <SelectorFunction> [
    HTML,
    TEXT,
    ATTR,
  ];

  static final $core.Map<$core.int, SelectorFunction> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SelectorFunction? valueOf($core.int value) => _byValue[value];

  const SelectorFunction._($core.int v, $core.String n) : super(v, n);
}

