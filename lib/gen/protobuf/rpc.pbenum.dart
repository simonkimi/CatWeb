//
//  Generated code. Do not modify.
//  source: rpc.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RpcType extends $pb.ProtobufEnum {
  static const RpcType RPC_TYPE_IMAGE_PARSER = RpcType._(0, _omitEnumNames ? '' : 'RPC_TYPE_IMAGE_PARSER');
  static const RpcType RPC_TYPE_LIST_VIEW_PARSER = RpcType._(1, _omitEnumNames ? '' : 'RPC_TYPE_LIST_VIEW_PARSER');
  static const RpcType RPC_TYPE_GALLERY_PARSER = RpcType._(2, _omitEnumNames ? '' : 'RPC_TYPE_GALLERY_PARSER');
  static const RpcType RPC_TYPE_AUTO_COMPLETE = RpcType._(3, _omitEnumNames ? '' : 'RPC_TYPE_AUTO_COMPLETE');

  static const $core.List<RpcType> values = <RpcType> [
    RPC_TYPE_IMAGE_PARSER,
    RPC_TYPE_LIST_VIEW_PARSER,
    RPC_TYPE_GALLERY_PARSER,
    RPC_TYPE_AUTO_COMPLETE,
  ];

  static final $core.Map<$core.int, RpcType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static RpcType? valueOf($core.int value) => _byValue[value];

  const RpcType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
