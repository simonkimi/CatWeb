///
//  Generated code. Do not modify.
//  source: template.proto
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
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.TemplateListSearchData.FilterItem',
      '10': 'filterItem'
    },
    const {'1': 'script', '3': 2, '4': 1, '5': 9, '10': 'script'},
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
  '4': const [TemplateListSearchData_FilterType$json],
};

@$core.Deprecated('Use templateListSearchDataDescriptor instead')
const TemplateListSearchData_FilterItem$json = const {
  '1': 'FilterItem',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'key', '3': 2, '4': 1, '5': 9, '10': 'key'},
    const {
      '1': 'type',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.TemplateListSearchData.FilterType',
      '10': 'type'
    },
    const {'1': 'defaultValue', '3': 4, '4': 1, '5': 9, '10': 'defaultValue'},
  ],
};

@$core.Deprecated('Use templateListSearchDataDescriptor instead')
const TemplateListSearchData_FilterType$json = const {
  '1': 'FilterType',
  '2': const [
    const {'1': 'FILTER_TYPE_NUMBER', '2': 0},
    const {'1': 'FILTER_TYPE_STRING', '2': 1},
    const {'1': 'FILTER_TYPE_BOOL', '2': 2},
  ],
};

/// Descriptor for `TemplateListSearchData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List templateListSearchDataDescriptor =
    $convert.base64Decode(
        'ChZUZW1wbGF0ZUxpc3RTZWFyY2hEYXRhEkMKC2ZpbHRlcl9pdGVtGAEgAygLMiIuVGVtcGxhdGVMaXN0U2VhcmNoRGF0YS5GaWx0ZXJJdGVtUgpmaWx0ZXJJdGVtEhYKBnNjcmlwdBgCIAEoCVIGc2NyaXB0Eh8KC3RhcmdldF9pdGVtGAogASgJUgp0YXJnZXRJdGVtEjAKFHRhcmdldF9hdXRvX2NvbXBsZXRlGAsgASgJUhJ0YXJnZXRBdXRvQ29tcGxldGUajgEKCkZpbHRlckl0ZW0SEgoEbmFtZRgBIAEoCVIEbmFtZRIQCgNrZXkYAiABKAlSA2tleRI2CgR0eXBlGAMgASgOMiIuVGVtcGxhdGVMaXN0U2VhcmNoRGF0YS5GaWx0ZXJUeXBlUgR0eXBlEiIKDGRlZmF1bHRWYWx1ZRgEIAEoCVIMZGVmYXVsdFZhbHVlIlIKCkZpbHRlclR5cGUSFgoSRklMVEVSX1RZUEVfTlVNQkVSEAASFgoSRklMVEVSX1RZUEVfU1RSSU5HEAESFAoQRklMVEVSX1RZUEVfQk9PTBAC');
@$core.Deprecated('Use templateEmptyDescriptor instead')
const TemplateEmpty$json = const {
  '1': 'TemplateEmpty',
};

/// Descriptor for `TemplateEmpty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List templateEmptyDescriptor =
    $convert.base64Decode('Cg1UZW1wbGF0ZUVtcHR5');
