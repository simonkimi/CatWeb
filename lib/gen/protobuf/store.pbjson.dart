///
//  Generated code. Do not modify.
//  source: store.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use headerDescriptor instead')
const Header$json = const {
  '1': 'Header',
  '2': const [
    const {'1': 'reg', '3': 1, '4': 1, '5': 9, '10': 'reg'},
    const {'1': 'headers', '3': 2, '4': 1, '5': 9, '10': 'headers'},
  ],
};

/// Descriptor for `Header`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List headerDescriptor = $convert.base64Decode('CgZIZWFkZXISEAoDcmVnGAEgASgJUgNyZWcSGAoHaGVhZGVycxgCIAEoCVIHaGVhZGVycw==');
@$core.Deprecated('Use rulesProtocolDescriptor instead')
const RulesProtocol$json = const {
  '1': 'RulesProtocol',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'baseUrl', '3': 2, '4': 1, '5': 9, '10': 'baseUrl'},
    const {'1': 'cookies', '3': 3, '4': 1, '5': 9, '10': 'cookies'},
    const {'1': 'extraCookies', '3': 4, '4': 1, '5': 9, '10': 'extraCookies'},
    const {'1': 'loginUrl', '3': 5, '4': 1, '5': 9, '10': 'loginUrl'},
    const {'1': 'headers', '3': 6, '4': 3, '5': 11, '6': '.Header', '10': 'headers'},
    const {'1': 'galleryParsers', '3': 10, '4': 3, '5': 11, '6': '.GalleryParser', '10': 'galleryParsers'},
    const {'1': 'listViewParser', '3': 11, '4': 3, '5': 11, '6': '.ListViewParser', '10': 'listViewParser'},
    const {'1': 'actionList', '3': 12, '4': 3, '5': 11, '6': '.ActionCombine', '10': 'actionList'},
  ],
};

/// Descriptor for `RulesProtocol`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rulesProtocolDescriptor = $convert.base64Decode('Cg1SdWxlc1Byb3RvY29sEhIKBG5hbWUYASABKAlSBG5hbWUSGAoHYmFzZVVybBgCIAEoCVIHYmFzZVVybBIYCgdjb29raWVzGAMgASgJUgdjb29raWVzEiIKDGV4dHJhQ29va2llcxgEIAEoCVIMZXh0cmFDb29raWVzEhoKCGxvZ2luVXJsGAUgASgJUghsb2dpblVybBIhCgdoZWFkZXJzGAYgAygLMgcuSGVhZGVyUgdoZWFkZXJzEjYKDmdhbGxlcnlQYXJzZXJzGAogAygLMg4uR2FsbGVyeVBhcnNlclIOZ2FsbGVyeVBhcnNlcnMSNwoObGlzdFZpZXdQYXJzZXIYCyADKAsyDy5MaXN0Vmlld1BhcnNlclIObGlzdFZpZXdQYXJzZXISLgoKYWN0aW9uTGlzdBgMIAMoCzIOLkFjdGlvbkNvbWJpbmVSCmFjdGlvbkxpc3Q=');
