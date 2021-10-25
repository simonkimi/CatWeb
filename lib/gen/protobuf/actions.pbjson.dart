///
//  Generated code. Do not modify.
//  source: actions.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use actionTypeDescriptor instead')
const ActionType$json = const {
  '1': 'ActionType',
  '2': const [
    const {'1': 'GET', '2': 0},
    const {'1': 'POST', '2': 1},
    const {'1': 'PUT', '2': 2},
    const {'1': 'DELETE', '2': 3},
  ],
};

/// Descriptor for `ActionType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List actionTypeDescriptor = $convert.base64Decode('CgpBY3Rpb25UeXBlEgcKA0dFVBAAEggKBFBPU1QQARIHCgNQVVQQAhIKCgZERUxFVEUQAw==');
@$core.Deprecated('Use actionDescriptor instead')
const Action$json = const {
  '1': 'Action',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'label', '3': 2, '4': 1, '5': 9, '10': 'label'},
    const {'1': 'url', '3': 3, '4': 1, '5': 9, '10': 'url'},
    const {'1': 'data', '3': 4, '4': 1, '5': 9, '10': 'data'},
    const {'1': 'icon', '3': 5, '4': 1, '5': 9, '10': 'icon'},
  ],
};

/// Descriptor for `Action`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List actionDescriptor = $convert.base64Decode('CgZBY3Rpb24SEgoEbmFtZRgBIAEoCVIEbmFtZRIUCgVsYWJlbBgCIAEoCVIFbGFiZWwSEAoDdXJsGAMgASgJUgN1cmwSEgoEZGF0YRgEIAEoCVIEZGF0YRISCgRpY29uGAUgASgJUgRpY29u');
