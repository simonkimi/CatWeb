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
@$core.Deprecated('Use siteBlueprintDescriptor instead')
const SiteBlueprint$json = const {
  '1': 'SiteBlueprint',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'base_url', '3': 2, '4': 1, '5': 9, '10': 'baseUrl'},
    const {'1': 'login_url', '3': 3, '4': 1, '5': 9, '10': 'loginUrl'},
    const {
      '1': 'login_cookie_reg',
      '3': 4,
      '4': 1,
      '5': 9,
      '10': 'loginCookieReg'
    },
    const {
      '1': 'login_cookie_description',
      '3': 5,
      '4': 1,
      '5': 9,
      '10': 'loginCookieDescription'
    },
    const {'1': 'version', '3': 6, '4': 1, '5': 9, '10': 'version'},
    const {'1': 'upgrade_url', '3': 7, '4': 1, '5': 9, '10': 'upgradeUrl'},
    const {'1': 'flag', '3': 8, '4': 1, '5': 9, '10': 'flag'},
    const {'1': 'readme', '3': 9, '4': 1, '5': 9, '10': 'readme'},
    const {
      '1': 'headers',
      '3': 15,
      '4': 3,
      '5': 11,
      '6': '.RegField',
      '10': 'headers'
    },
    const {
      '1': 'cookies',
      '3': 16,
      '4': 3,
      '5': 11,
      '6': '.RegField',
      '10': 'cookies'
    },
    const {
      '1': 'parsers',
      '3': 20,
      '4': 3,
      '5': 11,
      '6': '.ParserStore',
      '10': 'parsers'
    },
    const {
      '1': 'actions',
      '3': 30,
      '4': 3,
      '5': 11,
      '6': '.ActionCombine',
      '10': 'actions'
    },
    const {
      '1': 'pages',
      '3': 31,
      '4': 3,
      '5': 11,
      '6': '.SitePage',
      '10': 'pages'
    },
  ],
};

/// Descriptor for `SiteBlueprint`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List siteBlueprintDescriptor = $convert.base64Decode(
    'Cg1TaXRlQmx1ZXByaW50EhIKBG5hbWUYASABKAlSBG5hbWUSGQoIYmFzZV91cmwYAiABKAlSB2Jhc2VVcmwSGwoJbG9naW5fdXJsGAMgASgJUghsb2dpblVybBIoChBsb2dpbl9jb29raWVfcmVnGAQgASgJUg5sb2dpbkNvb2tpZVJlZxI4Chhsb2dpbl9jb29raWVfZGVzY3JpcHRpb24YBSABKAlSFmxvZ2luQ29va2llRGVzY3JpcHRpb24SGAoHdmVyc2lvbhgGIAEoCVIHdmVyc2lvbhIfCgt1cGdyYWRlX3VybBgHIAEoCVIKdXBncmFkZVVybBISCgRmbGFnGAggASgJUgRmbGFnEhYKBnJlYWRtZRgJIAEoCVIGcmVhZG1lEiMKB2hlYWRlcnMYDyADKAsyCS5SZWdGaWVsZFIHaGVhZGVycxIjCgdjb29raWVzGBAgAygLMgkuUmVnRmllbGRSB2Nvb2tpZXMSJgoHcGFyc2VycxgUIAMoCzIMLlBhcnNlclN0b3JlUgdwYXJzZXJzEigKB2FjdGlvbnMYHiADKAsyDi5BY3Rpb25Db21iaW5lUgdhY3Rpb25zEh8KBXBhZ2VzGB8gAygLMgkuU2l0ZVBhZ2VSBXBhZ2Vz');
@$core.Deprecated('Use parserStoreDescriptor instead')
const ParserStore$json = const {
  '1': 'ParserStore',
  '2': const [
    const {
      '1': 'type',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.ParserType',
      '10': 'type'
    },
    const {'1': 'parser', '3': 2, '4': 1, '5': 12, '10': 'parser'},
  ],
};

/// Descriptor for `ParserStore`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List parserStoreDescriptor = $convert.base64Decode(
    'CgtQYXJzZXJTdG9yZRIfCgR0eXBlGAEgASgOMgsuUGFyc2VyVHlwZVIEdHlwZRIWCgZwYXJzZXIYAiABKAxSBnBhcnNlcg==');
@$core.Deprecated('Use envStoreDescriptor instead')
const EnvStore$json = const {
  '1': 'EnvStore',
  '2': const [
    const {
      '1': 'env',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.EnvStore.EnvEntry',
      '10': 'env'
    },
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
final $typed_data.Uint8List envStoreDescriptor = $convert.base64Decode(
    'CghFbnZTdG9yZRIkCgNlbnYYASADKAsyEi5FbnZTdG9yZS5FbnZFbnRyeVIDZW52GjYKCEVudkVudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgJUgV2YWx1ZToCOAE=');
@$core.Deprecated('Use cookieJarMessageDescriptor instead')
const CookieJarMessage$json = const {
  '1': 'CookieJarMessage',
  '2': const [
    const {
      '1': 'cookies',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.CookieJarMessage.SerializableCookie',
      '10': 'cookies'
    },
  ],
  '3': const [CookieJarMessage_SerializableCookie$json],
};

@$core.Deprecated('Use cookieJarMessageDescriptor instead')
const CookieJarMessage_SerializableCookie$json = const {
  '1': 'SerializableCookie',
  '2': const [
    const {'1': 'create_time', '3': 1, '4': 1, '5': 3, '10': 'createTime'},
    const {'1': 'cookie', '3': 2, '4': 1, '5': 9, '10': 'cookie'},
  ],
};

/// Descriptor for `CookieJarMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cookieJarMessageDescriptor = $convert.base64Decode(
    'ChBDb29raWVKYXJNZXNzYWdlEj4KB2Nvb2tpZXMYASADKAsyJC5Db29raWVKYXJNZXNzYWdlLlNlcmlhbGl6YWJsZUNvb2tpZVIHY29va2llcxpNChJTZXJpYWxpemFibGVDb29raWUSHwoLY3JlYXRlX3RpbWUYASABKANSCmNyZWF0ZVRpbWUSFgoGY29va2llGAIgASgJUgZjb29raWU=');
