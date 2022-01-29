///
//  Generated code. Do not modify.
//  source: rpc.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use rpcTypeDescriptor instead')
const RpcType$json = const {
  '1': 'RpcType',
  '2': const [
    const {'1': 'RPC_TYPE_IMAGE_PARSER', '2': 0},
    const {'1': 'RPC_TYPE_LIST_VIEW_PARSER', '2': 1},
    const {'1': 'RPC_TYPE_GALLERY_PARSER', '2': 2},
  ],
};

/// Descriptor for `RpcType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List rpcTypeDescriptor = $convert.base64Decode(
    'CgdScGNUeXBlEhkKFVJQQ19UWVBFX0lNQUdFX1BBUlNFUhAAEh0KGVJQQ19UWVBFX0xJU1RfVklFV19QQVJTRVIQARIbChdSUENfVFlQRV9HQUxMRVJZX1BBUlNFUhAC');
@$core.Deprecated('Use rpcRequestDescriptor instead')
const RpcRequest$json = const {
  '1': 'RpcRequest',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.RpcType', '10': 'type'},
    const {'1': 'data', '3': 2, '4': 1, '5': 9, '10': 'data'},
    const {'1': 'parser_data', '3': 3, '4': 1, '5': 12, '10': 'parserData'},
  ],
};

/// Descriptor for `RpcRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rpcRequestDescriptor = $convert.base64Decode(
    'CgpScGNSZXF1ZXN0EhwKBHR5cGUYASABKA4yCC5ScGNUeXBlUgR0eXBlEhIKBGRhdGEYAiABKAlSBGRhdGESHwoLcGFyc2VyX2RhdGEYAyABKAxSCnBhcnNlckRhdGE=');
