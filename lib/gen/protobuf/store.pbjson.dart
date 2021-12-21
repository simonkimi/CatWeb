///
import 'dart:convert' as $convert;
import 'dart:core' as $core;
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
    const {'1': 'upgradeUrl', '3': 8, '4': 1, '5': 9, '10': 'upgradeUrl'},
    const {'1': 'headers', '3': 6, '4': 3, '5': 11, '6': '.RegField', '10': 'headers'},
    const {'1': 'cookies', '3': 7, '4': 3, '5': 11, '6': '.RegField', '10': 'cookies'},
    const {'1': 'galleryParsers', '3': 10, '4': 3, '5': 11, '6': '.GalleryParser', '10': 'galleryParsers'},
    const {'1': 'listViewParser', '3': 11, '4': 3, '5': 11, '6': '.ListViewParser', '10': 'listViewParser'},
    const {'1': 'imageParsers', '3': 14, '4': 3, '5': 11, '6': '.ImageParser', '10': 'imageParsers'},
    const {'1': 'actionList', '3': 12, '4': 3, '5': 11, '6': '.ActionCombine', '10': 'actionList'},
    const {'1': 'pageList', '3': 13, '4': 3, '5': 11, '6': '.SitePage', '10': 'pageList'},
  ],
};

/// Descriptor for `SiteConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List siteConfigDescriptor = $convert.base64Decode('CgpTaXRlQ29uZmlnEhIKBG5hbWUYASABKAlSBG5hbWUSGAoHYmFzZVVybBgCIAEoCVIHYmFzZVVybBIaCghsb2dpblVybBgDIAEoCVIIbG9naW5VcmwSKwoLbG9naW5Db29raWUYBCABKAsyCS5SZWdGaWVsZFILbG9naW5Db29raWUSGAoHdmVyc2lvbhgFIAEoCVIHdmVyc2lvbhIeCgp1cGdyYWRlVXJsGAggASgJUgp1cGdyYWRlVXJsEiMKB2hlYWRlcnMYBiADKAsyCS5SZWdGaWVsZFIHaGVhZGVycxIjCgdjb29raWVzGAcgAygLMgkuUmVnRmllbGRSB2Nvb2tpZXMSNgoOZ2FsbGVyeVBhcnNlcnMYCiADKAsyDi5HYWxsZXJ5UGFyc2VyUg5nYWxsZXJ5UGFyc2VycxI3Cg5saXN0Vmlld1BhcnNlchgLIAMoCzIPLkxpc3RWaWV3UGFyc2VyUg5saXN0Vmlld1BhcnNlchIwCgxpbWFnZVBhcnNlcnMYDiADKAsyDC5JbWFnZVBhcnNlclIMaW1hZ2VQYXJzZXJzEi4KCmFjdGlvbkxpc3QYDCADKAsyDi5BY3Rpb25Db21iaW5lUgphY3Rpb25MaXN0EiUKCHBhZ2VMaXN0GA0gAygLMgkuU2l0ZVBhZ2VSCHBhZ2VMaXN0');
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
