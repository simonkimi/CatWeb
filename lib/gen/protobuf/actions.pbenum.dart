///
//  Generated code. Do not modify.
//  source: actions.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class ActionType extends $pb.ProtobufEnum {
  static const ActionType GET = ActionType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GET');
  static const ActionType POST = ActionType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'POST');
  static const ActionType PUT = ActionType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PUT');
  static const ActionType DELETE = ActionType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DELETE');

  static const $core.List<ActionType> values = <ActionType> [
    GET,
    POST,
    PUT,
    DELETE,
  ];

  static final $core.Map<$core.int, ActionType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ActionType? valueOf($core.int value) => _byValue[value];

  const ActionType._($core.int v, $core.String n) : super(v, n);
}

