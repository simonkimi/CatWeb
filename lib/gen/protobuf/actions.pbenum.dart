///
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class NetWorkActionType extends $pb.ProtobufEnum {
  static const NetWorkActionType get = NetWorkActionType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'get');
  static const NetWorkActionType post = NetWorkActionType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'post');
  static const NetWorkActionType put = NetWorkActionType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'put');
  static const NetWorkActionType delete = NetWorkActionType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'delete');

  static const $core.List<NetWorkActionType> values = <NetWorkActionType> [
    get,
    post,
    put,
    delete,
  ];

  static final $core.Map<$core.int, NetWorkActionType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static NetWorkActionType? valueOf($core.int value) => _byValue[value];

  const NetWorkActionType._($core.int v, $core.String n) : super(v, n);
}

class InputActionType extends $pb.ProtobufEnum {
  static const InputActionType string = InputActionType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'string');
  static const InputActionType num = InputActionType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'num');

  static const $core.List<InputActionType> values = <InputActionType> [
    string,
    num,
  ];

  static final $core.Map<$core.int, InputActionType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static InputActionType? valueOf($core.int value) => _byValue[value];

  const InputActionType._($core.int v, $core.String n) : super(v, n);
}

