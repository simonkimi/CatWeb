///
//  Generated code. Do not modify.
//  source: actions.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class NetWorkActionType extends $pb.ProtobufEnum {
  static const NetWorkActionType GET = NetWorkActionType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GET');
  static const NetWorkActionType POST = NetWorkActionType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'POST');
  static const NetWorkActionType PUT = NetWorkActionType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PUT');
  static const NetWorkActionType DELETE = NetWorkActionType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DELETE');

  static const $core.List<NetWorkActionType> values = <NetWorkActionType> [
    GET,
    POST,
    PUT,
    DELETE,
  ];

  static final $core.Map<$core.int, NetWorkActionType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static NetWorkActionType? valueOf($core.int value) => _byValue[value];

  const NetWorkActionType._($core.int v, $core.String n) : super(v, n);
}

class InputActionType extends $pb.ProtobufEnum {
  static const InputActionType NUM = InputActionType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NUM');
  static const InputActionType STRING = InputActionType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'STRING');

  static const $core.List<InputActionType> values = <InputActionType> [
    NUM,
    STRING,
  ];

  static final $core.Map<$core.int, InputActionType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static InputActionType? valueOf($core.int value) => _byValue[value];

  const InputActionType._($core.int v, $core.String n) : super(v, n);
}

