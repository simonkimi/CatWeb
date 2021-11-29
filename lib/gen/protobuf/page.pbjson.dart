///
//  Generated code. Do not modify.
//  source: page.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use pageTemplateDescriptor instead')
const PageTemplate$json = const {
  '1': 'PageTemplate',
  '2': const [
    const {'1': 'imageList', '2': 0},
    const {'1': 'imageWaterfall', '2': 1},
    const {'1': 'detail', '2': 2},
  ],
};

/// Descriptor for `PageTemplate`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List pageTemplateDescriptor = $convert.base64Decode(
    'CgxQYWdlVGVtcGxhdGUSDQoJaW1hZ2VMaXN0EAASEgoOaW1hZ2VXYXRlcmZhbGwQARIKCgZkZXRhaWwQAg==');
@$core.Deprecated('Use sitePageDescriptor instead')
const SitePage$json = const {
  '1': 'SitePage',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'url', '3': 2, '4': 1, '5': 9, '10': 'url'},
    const {
      '1': 'type',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.PageTemplate',
      '10': 'type'
    },
    const {'1': 'parser', '3': 4, '4': 1, '5': 9, '10': 'parser'},
  ],
};

/// Descriptor for `SitePage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sitePageDescriptor = $convert.base64Decode(
    'CghTaXRlUGFnZRISCgRuYW1lGAEgASgJUgRuYW1lEhAKA3VybBgCIAEoCVIDdXJsEiEKBHR5cGUYAyABKA4yDS5QYWdlVGVtcGxhdGVSBHR5cGUSFgoGcGFyc2VyGAQgASgJUgZwYXJzZXI=');
