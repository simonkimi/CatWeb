///
//  Generated code. Do not modify.
//  source: selector.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use selectorFunctionDescriptor instead')
const SelectorFunction$json = const {
  '1': 'SelectorFunction',
  '2': const [
    const {'1': 'HTML', '2': 0},
    const {'1': 'TEXT', '2': 1},
    const {'1': 'ATTR', '2': 2},
  ],
};

/// Descriptor for `SelectorFunction`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List selectorFunctionDescriptor = $convert.base64Decode('ChBTZWxlY3RvckZ1bmN0aW9uEggKBEhUTUwQABIICgRURVhUEAESCAoEQVRUUhAC');
@$core.Deprecated('Use selectorDescriptor instead')
const Selector$json = const {
  '1': 'Selector',
  '2': const [
    const {'1': 'selector', '3': 1, '4': 1, '5': 9, '10': 'selector'},
    const {'1': 'function', '3': 2, '4': 1, '5': 14, '6': '.SelectorFunction', '10': 'function'},
    const {'1': 'param', '3': 3, '4': 1, '5': 9, '10': 'param'},
    const {'1': 'regex', '3': 4, '4': 1, '5': 9, '10': 'regex'},
    const {'1': 'replace', '3': 5, '4': 1, '5': 9, '10': 'replace'},
    const {'1': 'hint', '3': 6, '4': 1, '5': 9, '10': 'hint'},
    const {'1': 'js', '3': 7, '4': 1, '5': 9, '10': 'js'},
  ],
};

/// Descriptor for `Selector`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List selectorDescriptor = $convert.base64Decode('CghTZWxlY3RvchIaCghzZWxlY3RvchgBIAEoCVIIc2VsZWN0b3ISLQoIZnVuY3Rpb24YAiABKA4yES5TZWxlY3RvckZ1bmN0aW9uUghmdW5jdGlvbhIUCgVwYXJhbRgDIAEoCVIFcGFyYW0SFAoFcmVnZXgYBCABKAlSBXJlZ2V4EhgKB3JlcGxhY2UYBSABKAlSB3JlcGxhY2USEgoEaGludBgGIAEoCVIEaGludBIOCgJqcxgHIAEoCVICanM=');
