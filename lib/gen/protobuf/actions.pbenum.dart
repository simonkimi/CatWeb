///
//  Generated code. Do not modify.
//  source: actions.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class NetActionType extends $pb.ProtobufEnum {
  static const NetActionType NET_ACTION_TYPE_GET = NetActionType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NET_ACTION_TYPE_GET');
  static const NetActionType NET_ACTION_TYPE_POST = NetActionType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NET_ACTION_TYPE_POST');
  static const NetActionType NET_ACTION_TYPE_PUT = NetActionType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NET_ACTION_TYPE_PUT');
  static const NetActionType NET_ACTION_TYPE_DELETE = NetActionType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NET_ACTION_TYPE_DELETE');

  static const $core.List<NetActionType> values = <NetActionType> [
    NET_ACTION_TYPE_GET,
    NET_ACTION_TYPE_POST,
    NET_ACTION_TYPE_PUT,
    NET_ACTION_TYPE_DELETE,
  ];

  static final $core.Map<$core.int, NetActionType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static NetActionType? valueOf($core.int value) => _byValue[value];

  const NetActionType._($core.int v, $core.String n) : super(v, n);
}

class InputActionType extends $pb.ProtobufEnum {
  static const InputActionType INPUT_ACTION_TYPE_STRING = InputActionType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INPUT_ACTION_TYPE_STRING');
  static const InputActionType INPUT_ACTION_TYPE_NUM = InputActionType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INPUT_ACTION_TYPE_NUM');

  static const $core.List<InputActionType> values = <InputActionType> [
    INPUT_ACTION_TYPE_STRING,
    INPUT_ACTION_TYPE_NUM,
  ];

  static final $core.Map<$core.int, InputActionType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static InputActionType? valueOf($core.int value) => _byValue[value];

  const InputActionType._($core.int v, $core.String n) : super(v, n);
}

