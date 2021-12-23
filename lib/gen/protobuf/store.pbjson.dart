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
final $typed_data.Uint8List regFieldDescriptor = $convert.base64Decode('CghSZWdGaWVsZBIQCgNyZWcYASABKAlSA3JlZxIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU=');
@$core.Deprecated('Use siteConfigDescriptor instead')
const SiteConfig$json = const {
  '1': 'SiteConfig',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'baseUrl', '3': 2, '4': 1, '5': 9, '10': 'baseUrl'},
    const {'1': 'loginUrl', '3': 3, '4': 1, '5': 9, '10': 'loginUrl'},
    const {'1': 'loginCookie', '3': 4, '4': 1, '5': 11, '6': '.RegField', '10': 'loginCookie'},
    const {'1': 'version', '3': 5, '4': 1, '5': 9, '10': 'version'},
    const {'1': 'upgradeUrl', '3': 6, '4': 1, '5': 9, '10': 'upgradeUrl'},
    const {'1': 'flag', '3': 7, '4': 1, '5': 9, '10': 'flag'},
    const {'1': 'headers', '3': 8, '4': 3, '5': 11, '6': '.RegField', '10': 'headers'},
    const {'1': 'cookies', '3': 9, '4': 3, '5': 11, '6': '.RegField', '10': 'cookies'},
    const {'1': 'galleryParsers', '3': 10, '4': 3, '5': 11, '6': '.GalleryParser', '10': 'galleryParsers'},
    const {'1': 'listViewParser', '3': 11, '4': 3, '5': 11, '6': '.ListViewParser', '10': 'listViewParser'},
    const {'1': 'imageParsers', '3': 14, '4': 3, '5': 11, '6': '.ImageParser', '10': 'imageParsers'},
    const {'1': 'actionList', '3': 12, '4': 3, '5': 11, '6': '.ActionCombine', '10': 'actionList'},
    const {'1': 'pageList', '3': 13, '4': 3, '5': 11, '6': '.SitePage', '10': 'pageList'},
  ],
};

/// Descriptor for `SiteConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List siteConfigDescriptor = $convert.base64Decode('CgpTaXRlQ29uZmlnEhIKBG5hbWUYASABKAlSBG5hbWUSGAoHYmFzZVVybBgCIAEoCVIHYmFzZVVybBIaCghsb2dpblVybBgDIAEoCVIIbG9naW5VcmwSKwoLbG9naW5Db29raWUYBCABKAsyCS5SZWdGaWVsZFILbG9naW5Db29raWUSGAoHdmVyc2lvbhgFIAEoCVIHdmVyc2lvbhIeCgp1cGdyYWRlVXJsGAYgASgJUgp1cGdyYWRlVXJsEhIKBGZsYWcYByABKAlSBGZsYWcSIwoHaGVhZGVycxgIIAMoCzIJLlJlZ0ZpZWxkUgdoZWFkZXJzEiMKB2Nvb2tpZXMYCSADKAsyCS5SZWdGaWVsZFIHY29va2llcxI2Cg5nYWxsZXJ5UGFyc2VycxgKIAMoCzIOLkdhbGxlcnlQYXJzZXJSDmdhbGxlcnlQYXJzZXJzEjcKDmxpc3RWaWV3UGFyc2VyGAsgAygLMg8uTGlzdFZpZXdQYXJzZXJSDmxpc3RWaWV3UGFyc2VyEjAKDGltYWdlUGFyc2VycxgOIAMoCzIMLkltYWdlUGFyc2VyUgxpbWFnZVBhcnNlcnMSLgoKYWN0aW9uTGlzdBgMIAMoCzIOLkFjdGlvbkNvbWJpbmVSCmFjdGlvbkxpc3QSJQoIcGFnZUxpc3QYDSADKAsyCS5TaXRlUGFnZVIIcGFnZUxpc3Q=');
@$core.Deprecated('Use envStoreDescriptor instead')
const EnvStore$json = const {
  '1': 'EnvStore',
  '2': const [
    const {'1': 'env', '3': 1, '4': 3, '5': 11, '6': '.EnvStore.EnvEntry', '10': 'env'},
  ],
  '3': const [EnvStore_EnvEntry$json],
};

@$core.Deprecated('Use envStoreDescriptor instead')
const EnvStore_EnvEntry$json = const {
  '1': 'EnvEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `EnvStore`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List envStoreDescriptor = $convert.base64Decode('CghFbnZTdG9yZRIkCgNlbnYYASADKAsyEi5FbnZTdG9yZS5FbnZFbnRyeVIDZW52GjYKCEVudkVudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgJUgV2YWx1ZToCOAE=');
