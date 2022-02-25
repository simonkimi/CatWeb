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
    const {'1': 'TEMPLATE_IMAGE_WATERFALL', '2': 1},
    const {'1': 'TEMPLATE_GALLERY', '2': 2},
    const {'1': 'TEMPLATE_IMAGE_VIEWER', '2': 3},
    const {'1': 'TEMPLATE_AUTO_COMPLETE', '2': 4},
  ],
};

/// Descriptor for `Template`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List templateDescriptor = $convert.base64Decode(
    'CghUZW1wbGF0ZRIXChNURU1QTEFURV9JTUFHRV9MSVNUEAASHAoYVEVNUExBVEVfSU1BR0VfV0FURVJGQUxMEAESFAoQVEVNUExBVEVfR0FMTEVSWRACEhkKFVRFTVBMQVRFX0lNQUdFX1ZJRVdFUhADEhoKFlRFTVBMQVRFX0FVVE9fQ09NUExFVEUQBA==');
@$core.Deprecated('Use templateListDataDescriptor instead')
const TemplateListData$json = const {
  '1': 'TemplateListData',
  '2': const [
    const {
      '1': 'sub_pages',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.TemplateListData.SubPage',
      '10': 'subPages'
    },
    const {
      '1': 'filter_item',
      '3': 22,
      '4': 3,
      '5': 11,
      '6': '.TemplateListData.FilterItem',
      '10': 'filterItem'
    },
    const {'1': 'script', '3': 3, '4': 1, '5': 9, '10': 'script'},
    const {
      '1': 'disable_unchanged',
      '3': 4,
      '4': 1,
      '5': 8,
      '10': 'disableUnchanged'
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
  '3': const [TemplateListData_SubPage$json, TemplateListData_FilterItem$json],
  '4': const [TemplateListData_FilterType$json],
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

@$core.Deprecated('Use templateListDataDescriptor instead')
const TemplateListData_FilterItem$json = const {
  '1': 'FilterItem',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'key', '3': 2, '4': 1, '5': 9, '10': 'key'},
    const {
      '1': 'type',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.TemplateListData.FilterType',
      '10': 'type'
    },
    const {'1': 'value', '3': 4, '4': 1, '5': 9, '10': 'value'},
    const {
      '1': 'color',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.ColorRpcModel',
      '10': 'color'
    },
  ],
};

@$core.Deprecated('Use templateListDataDescriptor instead')
const TemplateListData_FilterType$json = const {
  '1': 'FilterType',
  '2': const [
    const {'1': 'FILTER_TYPE_NUMBER', '2': 0},
    const {'1': 'FILTER_TYPE_STRING', '2': 1},
    const {'1': 'FILTER_TYPE_BOOL', '2': 2},
    const {'1': 'FILTER_TYPE_BOOL_CARD', '2': 3},
  ],
};

/// Descriptor for `TemplateListData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List templateListDataDescriptor = $convert.base64Decode(
    'ChBUZW1wbGF0ZUxpc3REYXRhEjYKCXN1Yl9wYWdlcxgBIAMoCzIZLlRlbXBsYXRlTGlzdERhdGEuU3ViUGFnZVIIc3ViUGFnZXMSPQoLZmlsdGVyX2l0ZW0YFiADKAsyHC5UZW1wbGF0ZUxpc3REYXRhLkZpbHRlckl0ZW1SCmZpbHRlckl0ZW0SFgoGc2NyaXB0GAMgASgJUgZzY3JpcHQSKwoRZGlzYWJsZV91bmNoYW5nZWQYBCABKAhSEGRpc2FibGVVbmNoYW5nZWQSHwoLdGFyZ2V0X2l0ZW0YCiABKAlSCnRhcmdldEl0ZW0SMAoUdGFyZ2V0X2F1dG9fY29tcGxldGUYCyABKAlSEnRhcmdldEF1dG9Db21wbGV0ZRpFCgdTdWJQYWdlEhIKBG5hbWUYASABKAlSBG5hbWUSEAoDa2V5GAIgASgJUgNrZXkSFAoFdmFsdWUYAyABKAlSBXZhbHVlGqABCgpGaWx0ZXJJdGVtEhIKBG5hbWUYASABKAlSBG5hbWUSEAoDa2V5GAIgASgJUgNrZXkSMAoEdHlwZRgDIAEoDjIcLlRlbXBsYXRlTGlzdERhdGEuRmlsdGVyVHlwZVIEdHlwZRIUCgV2YWx1ZRgEIAEoCVIFdmFsdWUSJAoFY29sb3IYBSABKAsyDi5Db2xvclJwY01vZGVsUgVjb2xvciJtCgpGaWx0ZXJUeXBlEhYKEkZJTFRFUl9UWVBFX05VTUJFUhAAEhYKEkZJTFRFUl9UWVBFX1NUUklORxABEhQKEEZJTFRFUl9UWVBFX0JPT0wQAhIZChVGSUxURVJfVFlQRV9CT09MX0NBUkQQAw==');
@$core.Deprecated('Use templateAutoCompleteDescriptor instead')
const TemplateAutoComplete$json = const {
  '1': 'TemplateAutoComplete',
  '2': const [
    const {'1': 'split_char', '3': 1, '4': 1, '5': 9, '10': 'splitChar'},
    const {'1': 'timeout', '3': 2, '4': 1, '5': 5, '10': 'timeout'},
  ],
};

/// Descriptor for `TemplateAutoComplete`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List templateAutoCompleteDescriptor = $convert.base64Decode(
    'ChRUZW1wbGF0ZUF1dG9Db21wbGV0ZRIdCgpzcGxpdF9jaGFyGAEgASgJUglzcGxpdENoYXISGAoHdGltZW91dBgCIAEoBVIHdGltZW91dA==');
@$core.Deprecated('Use templateEmptyDescriptor instead')
const TemplateEmpty$json = const {
  '1': 'TemplateEmpty',
};

/// Descriptor for `TemplateEmpty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List templateEmptyDescriptor =
    $convert.base64Decode('Cg1UZW1wbGF0ZUVtcHR5');
