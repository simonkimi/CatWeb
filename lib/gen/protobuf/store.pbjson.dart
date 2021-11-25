///
//  Generated code. Do not modify.
//  source: store.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use regFieldDescriptor instead')
const RegField$json = const {
  '1': 'RegField',
  '2': const [
    const {'1': 'reg', '3': 1, '4': 1, '5': 9, '10': 'reg'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
};

/// Descriptor for `RegField`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List regFieldDescriptor = $convert.base64Decode(
    'CghSZWdGaWVsZBIQCgNyZWcYASABKAlSA3JlZxIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU=');
@$core.Deprecated('Use rulesProtocolDescriptor instead')
const RulesProtocol$json = const {
  '1': 'RulesProtocol',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'baseUrl', '3': 2, '4': 1, '5': 9, '10': 'baseUrl'},
    const {'1': 'extraCookies', '3': 3, '4': 1, '5': 9, '10': 'extraCookies'},
    const {'1': 'loginUrl', '3': 4, '4': 1, '5': 9, '10': 'loginUrl'},
    const {
      '1': 'loginCookieReg',
      '3': 5,
      '4': 1,
      '5': 9,
      '10': 'loginCookieReg'
    },
    const {'1': 'version', '3': 8, '4': 1, '5': 9, '10': 'version'},
    const {
      '1': 'headers',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.RegField',
      '10': 'headers'
    },
    const {
      '1': 'cookies',
      '3': 7,
      '4': 3,
      '5': 11,
      '6': '.RegField',
      '10': 'cookies'
    },
    const {
      '1': 'galleryParsers',
      '3': 10,
      '4': 3,
      '5': 11,
      '6': '.GalleryParser',
      '10': 'galleryParsers'
    },
    const {
      '1': 'listViewParser',
      '3': 11,
      '4': 3,
      '5': 11,
      '6': '.ListViewParser',
      '10': 'listViewParser'
    },
    const {
      '1': 'actionList',
      '3': 12,
      '4': 3,
      '5': 11,
      '6': '.ActionCombine',
      '10': 'actionList'
    },
  ],
};

/// Descriptor for `RulesProtocol`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rulesProtocolDescriptor = $convert.base64Decode(
    'Cg1SdWxlc1Byb3RvY29sEhIKBG5hbWUYASABKAlSBG5hbWUSGAoHYmFzZVVybBgCIAEoCVIHYmFzZVVybBIiCgxleHRyYUNvb2tpZXMYAyABKAlSDGV4dHJhQ29va2llcxIaCghsb2dpblVybBgEIAEoCVIIbG9naW5VcmwSJgoObG9naW5Db29raWVSZWcYBSABKAlSDmxvZ2luQ29va2llUmVnEhgKB3ZlcnNpb24YCCABKAlSB3ZlcnNpb24SIwoHaGVhZGVycxgGIAMoCzIJLlJlZ0ZpZWxkUgdoZWFkZXJzEiMKB2Nvb2tpZXMYByADKAsyCS5SZWdGaWVsZFIHY29va2llcxI2Cg5nYWxsZXJ5UGFyc2VycxgKIAMoCzIOLkdhbGxlcnlQYXJzZXJSDmdhbGxlcnlQYXJzZXJzEjcKDmxpc3RWaWV3UGFyc2VyGAsgAygLMg8uTGlzdFZpZXdQYXJzZXJSDmxpc3RWaWV3UGFyc2VyEi4KCmFjdGlvbkxpc3QYDCADKAsyDi5BY3Rpb25Db21iaW5lUgphY3Rpb25MaXN0');
