///
//  Generated code. Do not modify.
//  source: parser.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class ParserType extends $pb.ProtobufEnum {
  static const ParserType PARSER_TYPE_IMAGE = ParserType._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'PARSER_TYPE_IMAGE');
  static const ParserType PARSER_TYPE_LIST_VIEW = ParserType._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'PARSER_TYPE_LIST_VIEW');
  static const ParserType PARSER_TYPE_GALLERY = ParserType._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'PARSER_TYPE_GALLERY');
  static const ParserType PARSER_TYPE_AUTO_COMPLETE = ParserType._(
      3,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'PARSER_TYPE_AUTO_COMPLETE');

  static const $core.List<ParserType> values = <ParserType>[
    PARSER_TYPE_IMAGE,
    PARSER_TYPE_LIST_VIEW,
    PARSER_TYPE_GALLERY,
    PARSER_TYPE_AUTO_COMPLETE,
  ];

  static final $core.Map<$core.int, ParserType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static ParserType? valueOf($core.int value) => _byValue[value];

  const ParserType._($core.int v, $core.String n) : super(v, n);
}
