///
//  Generated code. Do not modify.
//  source: page.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use siteDisplayTypeDescriptor instead')
const SiteDisplayType$json = const {
  '1': 'SiteDisplayType',
  '2': const [
    const {'1': 'show', '2': 0},
    const {'1': 'shrink', '2': 1},
    const {'1': 'hide', '2': 2},
  ],
};

/// Descriptor for `SiteDisplayType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List siteDisplayTypeDescriptor = $convert.base64Decode(
    'Cg9TaXRlRGlzcGxheVR5cGUSCAoEc2hvdxAAEgoKBnNocmluaxABEggKBGhpZGUQAg==');
@$core.Deprecated('Use sitePageDescriptor instead')
const SitePage$json = const {
  '1': 'SitePage',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'uuid', '3': 2, '4': 1, '5': 9, '10': 'uuid'},
    const {'1': 'url', '3': 3, '4': 1, '5': 9, '10': 'url'},
    const {
      '1': 'net_action',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.NetActionType',
      '10': 'netAction'
    },
    const {'1': 'form_data', '3': 5, '4': 1, '5': 9, '10': 'formData'},
    const {'1': 'icon', '3': 10, '4': 1, '5': 9, '10': 'icon'},
    const {
      '1': 'display',
      '3': 11,
      '4': 1,
      '5': 14,
      '6': '.SiteDisplayType',
      '10': 'display'
    },
    const {'1': 'flag', '3': 12, '4': 1, '5': 9, '10': 'flag'},
    const {'1': 'base_parser', '3': 13, '4': 1, '5': 9, '10': 'baseParser'},
    const {
      '1': 'template',
      '3': 20,
      '4': 1,
      '5': 14,
      '6': '.Template',
      '10': 'template'
    },
    const {
      '1': 'template_data',
      '3': 21,
      '4': 1,
      '5': 12,
      '10': 'templateData'
    },
  ],
};

/// Descriptor for `SitePage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sitePageDescriptor = $convert.base64Decode(
    'CghTaXRlUGFnZRISCgRuYW1lGAEgASgJUgRuYW1lEhIKBHV1aWQYAiABKAlSBHV1aWQSEAoDdXJsGAMgASgJUgN1cmwSLQoKbmV0X2FjdGlvbhgEIAEoDjIOLk5ldEFjdGlvblR5cGVSCW5ldEFjdGlvbhIbCglmb3JtX2RhdGEYBSABKAlSCGZvcm1EYXRhEhIKBGljb24YCiABKAlSBGljb24SKgoHZGlzcGxheRgLIAEoDjIQLlNpdGVEaXNwbGF5VHlwZVIHZGlzcGxheRISCgRmbGFnGAwgASgJUgRmbGFnEh8KC2Jhc2VfcGFyc2VyGA0gASgJUgpiYXNlUGFyc2VyEiUKCHRlbXBsYXRlGBQgASgOMgkuVGVtcGxhdGVSCHRlbXBsYXRlEiMKDXRlbXBsYXRlX2RhdGEYFSABKAxSDHRlbXBsYXRlRGF0YQ==');
