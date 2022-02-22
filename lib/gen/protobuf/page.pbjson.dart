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
    const {'1': 'TEMPLATE_IMAGE_LIST_WITH_SEARCH', '2': 1},
    const {'1': 'TEMPLATE_IMAGE_WATERFALL', '2': 2},
    const {'1': 'TEMPLATE_IMAGE_WATERFALL_WITH_SEARCH', '2': 3},
    const {'1': 'TEMPLATE_GALLERY', '2': 4},
    const {'1': 'TEMPLATE_IMAGE_VIEWER', '2': 5},
    const {'1': 'TEMPLATE_AUTO_COMPLETE', '2': 6},
  ],
};

/// Descriptor for `Template`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List templateDescriptor = $convert.base64Decode(
    'CghUZW1wbGF0ZRIXChNURU1QTEFURV9JTUFHRV9MSVNUEAASIwofVEVNUExBVEVfSU1BR0VfTElTVF9XSVRIX1NFQVJDSBABEhwKGFRFTVBMQVRFX0lNQUdFX1dBVEVSRkFMTBACEigKJFRFTVBMQVRFX0lNQUdFX1dBVEVSRkFMTF9XSVRIX1NFQVJDSBADEhQKEFRFTVBMQVRFX0dBTExFUlkQBBIZChVURU1QTEFURV9JTUFHRV9WSUVXRVIQBRIaChZURU1QTEFURV9BVVRPX0NPTVBMRVRFEAY=');
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
@$core.Deprecated('Use templateListDataDescriptor instead')
const TemplateListData$json = const {
  '1': 'TemplateListData',
  '2': const [
    const {
      '1': 'sub_pages',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.TemplateListData.SubPage',
      '10': 'subPages'
    },
    const {'1': 'target_item', '3': 10, '4': 1, '5': 9, '10': 'targetItem'},
  ],
  '3': const [TemplateListData_SubPage$json],
};

@$core.Deprecated('Use templateListDataDescriptor instead')
const TemplateListData_SubPage$json = const {
  '1': 'SubPage',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'key', '3': 2, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 3, '4': 1, '5': 9, '10': 'value'},
  ],
};

/// Descriptor for `TemplateListData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List templateListDataDescriptor = $convert.base64Decode(
    'ChBUZW1wbGF0ZUxpc3REYXRhEjYKCXN1Yl9wYWdlcxgCIAMoCzIZLlRlbXBsYXRlTGlzdERhdGEuU3ViUGFnZVIIc3ViUGFnZXMSHwoLdGFyZ2V0X2l0ZW0YCiABKAlSCnRhcmdldEl0ZW0aRQoHU3ViUGFnZRISCgRuYW1lGAEgASgJUgRuYW1lEhAKA2tleRgCIAEoCVIDa2V5EhQKBXZhbHVlGAMgASgJUgV2YWx1ZQ==');
@$core.Deprecated('Use templateListSearchDataDescriptor instead')
const TemplateListSearchData$json = const {
  '1': 'TemplateListSearchData',
  '2': const [
    const {
      '1': 'filter_item',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.TemplateListSearchData.FilterItem',
      '10': 'filterItem'
    },
    const {'1': 'target_item', '3': 10, '4': 1, '5': 9, '10': 'targetItem'},
    const {
      '1': 'target_auto_complete',
      '3': 11,
      '4': 1,
      '5': 9,
      '10': 'targetAutoComplete'
    },
  ],
  '3': const [TemplateListSearchData_FilterItem$json],
};

@$core.Deprecated('Use templateListSearchDataDescriptor instead')
const TemplateListSearchData_FilterItem$json = const {
  '1': 'FilterItem',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'key', '3': 2, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 3, '4': 1, '5': 8, '10': 'value'},
  ],
};

/// Descriptor for `TemplateListSearchData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List templateListSearchDataDescriptor =
    $convert.base64Decode(
        'ChZUZW1wbGF0ZUxpc3RTZWFyY2hEYXRhEkMKC2ZpbHRlcl9pdGVtGAIgAygLMiIuVGVtcGxhdGVMaXN0U2VhcmNoRGF0YS5GaWx0ZXJJdGVtUgpmaWx0ZXJJdGVtEh8KC3RhcmdldF9pdGVtGAogASgJUgp0YXJnZXRJdGVtEjAKFHRhcmdldF9hdXRvX2NvbXBsZXRlGAsgASgJUhJ0YXJnZXRBdXRvQ29tcGxldGUaSAoKRmlsdGVySXRlbRISCgRuYW1lGAEgASgJUgRuYW1lEhAKA2tleRgCIAEoCVIDa2V5EhQKBXZhbHVlGAMgASgIUgV2YWx1ZQ==');
@$core.Deprecated('Use templateEmptyDescriptor instead')
const TemplateEmpty$json = const {
  '1': 'TemplateEmpty',
};

/// Descriptor for `TemplateEmpty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List templateEmptyDescriptor =
    $convert.base64Decode('Cg1UZW1wbGF0ZUVtcHR5');
@$core.Deprecated('Use sitePageDescriptor instead')
const SitePage$json = const {
  '1': 'SitePage',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'uuid', '3': 2, '4': 1, '5': 9, '10': 'uuid'},
    const {'1': 'url', '3': 3, '4': 1, '5': 9, '10': 'url'},
    const {'1': 'icon', '3': 4, '4': 1, '5': 9, '10': 'icon'},
    const {
      '1': 'display',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.SiteDisplayType',
      '10': 'display'
    },
    const {'1': 'flag', '3': 6, '4': 1, '5': 9, '10': 'flag'},
    const {'1': 'base_parser', '3': 7, '4': 1, '5': 9, '10': 'baseParser'},
    const {
      '1': 'template',
      '3': 8,
      '4': 1,
      '5': 14,
      '6': '.Template',
      '10': 'template'
    },
    const {'1': 'template_data', '3': 9, '4': 1, '5': 12, '10': 'templateData'},
  ],
};

/// Descriptor for `SitePage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sitePageDescriptor = $convert.base64Decode(
    'CghTaXRlUGFnZRISCgRuYW1lGAEgASgJUgRuYW1lEhIKBHV1aWQYAiABKAlSBHV1aWQSEAoDdXJsGAMgASgJUgN1cmwSEgoEaWNvbhgEIAEoCVIEaWNvbhIqCgdkaXNwbGF5GAUgASgOMhAuU2l0ZURpc3BsYXlUeXBlUgdkaXNwbGF5EhIKBGZsYWcYBiABKAlSBGZsYWcSHwoLYmFzZV9wYXJzZXIYByABKAlSCmJhc2VQYXJzZXISJQoIdGVtcGxhdGUYCCABKA4yCS5UZW1wbGF0ZVIIdGVtcGxhdGUSIwoNdGVtcGxhdGVfZGF0YRgJIAEoDFIMdGVtcGxhdGVEYXRh');
