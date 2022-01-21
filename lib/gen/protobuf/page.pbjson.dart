///
//  Generated code. Do not modify.
//  source: page.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use templateDescriptor instead')
const Template$json = const {
  '1': 'Template',
  '2': const [
    const {'1': 'TEMPLATE_IMAGE_LIST', '2': 0},
    const {'1': 'TEMPLATE_IMAGE_WATERFALL', '2': 1},
    const {'1': 'TEMPLATE_DETAIL', '2': 2},
    const {'1': 'TEMPLATE_IMAGE_VIEWER', '2': 3},
    const {'1': 'TEMPLATE_AUTO_COMPLETE', '2': 4},
  ],
};

/// Descriptor for `Template`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List templateDescriptor = $convert.base64Decode(
    'CghUZW1wbGF0ZRIXChNURU1QTEFURV9JTUFHRV9MSVNUEAASHAoYVEVNUExBVEVfSU1BR0VfV0FURVJGQUxMEAESEwoPVEVNUExBVEVfREVUQUlMEAISGQoVVEVNUExBVEVfSU1BR0VfVklFV0VSEAMSGgoWVEVNUExBVEVfQVVUT19DT01QTEVURRAE');
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
@$core.Deprecated('Use siteSubPageDescriptor instead')
const SiteSubPage$json = const {
  '1': 'SiteSubPage',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'key', '3': 2, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 3, '4': 1, '5': 9, '10': 'value'},
  ],
};

/// Descriptor for `SiteSubPage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List siteSubPageDescriptor = $convert.base64Decode(
    'CgtTaXRlU3ViUGFnZRISCgRuYW1lGAEgASgJUgRuYW1lEhAKA2tleRgCIAEoCVIDa2V5EhQKBXZhbHVlGAMgASgJUgV2YWx1ZQ==');
@$core.Deprecated('Use sitePageDescriptor instead')
const SitePage$json = const {
  '1': 'SitePage',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'uuid', '3': 2, '4': 1, '5': 9, '10': 'uuid'},
    const {'1': 'url', '3': 3, '4': 1, '5': 9, '10': 'url'},
    const {
      '1': 'template',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.Template',
      '10': 'template'
    },
    const {'1': 'parser', '3': 5, '4': 1, '5': 9, '10': 'parser'},
    const {
      '1': 'sub_page',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.SiteSubPage',
      '10': 'subPage'
    },
    const {'1': 'icon', '3': 7, '4': 1, '5': 9, '10': 'icon'},
    const {
      '1': 'display',
      '3': 8,
      '4': 1,
      '5': 14,
      '6': '.SiteDisplayType',
      '10': 'display'
    },
    const {
      '1': 'open_page',
      '3': 9,
      '4': 3,
      '5': 11,
      '6': '.OpenPage',
      '10': 'openPage'
    },
  ],
};

/// Descriptor for `SitePage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sitePageDescriptor = $convert.base64Decode(
    'CghTaXRlUGFnZRISCgRuYW1lGAEgASgJUgRuYW1lEhIKBHV1aWQYAiABKAlSBHV1aWQSEAoDdXJsGAMgASgJUgN1cmwSJQoIdGVtcGxhdGUYBCABKA4yCS5UZW1wbGF0ZVIIdGVtcGxhdGUSFgoGcGFyc2VyGAUgASgJUgZwYXJzZXISJwoIc3ViX3BhZ2UYBiADKAsyDC5TaXRlU3ViUGFnZVIHc3ViUGFnZRISCgRpY29uGAcgASgJUgRpY29uEioKB2Rpc3BsYXkYCCABKA4yEC5TaXRlRGlzcGxheVR5cGVSB2Rpc3BsYXkSJgoJb3Blbl9wYWdlGAkgAygLMgkuT3BlblBhZ2VSCG9wZW5QYWdl');
@$core.Deprecated('Use openPageDescriptor instead')
const OpenPage$json = const {
  '1': 'OpenPage',
  '2': const [
    const {'1': 'target', '3': 1, '4': 1, '5': 9, '10': 'target'},
    const {'1': 'inherit', '3': 2, '4': 1, '5': 8, '10': 'inherit'},
  ],
};

/// Descriptor for `OpenPage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List openPageDescriptor = $convert.base64Decode(
    'CghPcGVuUGFnZRIWCgZ0YXJnZXQYASABKAlSBnRhcmdldBIYCgdpbmhlcml0GAIgASgIUgdpbmhlcml0');
