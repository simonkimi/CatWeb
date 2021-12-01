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
    const {'1': 'auto', '2': 0},
    const {'1': 'text', '2': 1},
    const {'1': 'attr', '2': 2},
    const {'1': 'raw', '2': 3},
  ],
};

/// Descriptor for `SelectorFunction`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List selectorFunctionDescriptor = $convert.base64Decode('ChBTZWxlY3RvckZ1bmN0aW9uEggKBGF1dG8QABIICgR0ZXh0EAESCAoEYXR0chACEgcKA3JhdxAD');
@$core.Deprecated('Use selectorDescriptor instead')
const Selector$json = const {
  '1': 'Selector',
  '2': const [
    const {'1': 'selector', '3': 1, '4': 1, '5': 9, '10': 'selector'},
    const {'1': 'function', '3': 2, '4': 1, '5': 14, '6': '.SelectorFunction', '10': 'function'},
    const {'1': 'param', '3': 3, '4': 1, '5': 9, '10': 'param'},
    const {'1': 'regex', '3': 4, '4': 1, '5': 9, '10': 'regex'},
    const {'1': 'replace', '3': 5, '4': 1, '5': 9, '10': 'replace'},
    const {'1': 'js', '3': 6, '4': 1, '5': 9, '10': 'js'},
    const {'1': 'computed', '3': 7, '4': 1, '5': 8, '10': 'computed'},
    const {'1': 'defaultValue', '3': 8, '4': 1, '5': 9, '10': 'defaultValue'},
  ],
};

/// Descriptor for `Selector`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List selectorDescriptor = $convert.base64Decode('CghTZWxlY3RvchIaCghzZWxlY3RvchgBIAEoCVIIc2VsZWN0b3ISLQoIZnVuY3Rpb24YAiABKA4yES5TZWxlY3RvckZ1bmN0aW9uUghmdW5jdGlvbhIUCgVwYXJhbRgDIAEoCVIFcGFyYW0SFAoFcmVnZXgYBCABKAlSBXJlZ2V4EhgKB3JlcGxhY2UYBSABKAlSB3JlcGxhY2USDgoCanMYBiABKAlSAmpzEhoKCGNvbXB1dGVkGAcgASgIUghjb21wdXRlZBIiCgxkZWZhdWx0VmFsdWUYCCABKAlSDGRlZmF1bHRWYWx1ZQ==');
@$core.Deprecated('Use extraSelectorDescriptor instead')
const ExtraSelector$json = const {
  '1': 'ExtraSelector',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'selector', '3': 2, '4': 1, '5': 11, '6': '.Selector', '10': 'selector'},
    const {'1': 'global', '3': 3, '4': 1, '5': 8, '10': 'global'},
  ],
};

/// Descriptor for `ExtraSelector`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List extraSelectorDescriptor = $convert.base64Decode('Cg1FeHRyYVNlbGVjdG9yEg4KAmlkGAEgASgJUgJpZBIlCghzZWxlY3RvchgCIAEoCzIJLlNlbGVjdG9yUghzZWxlY3RvchIWCgZnbG9iYWwYAyABKAhSBmdsb2JhbA==');
@$core.Deprecated('Use imageSelectorDescriptor instead')
const ImageSelector$json = const {
  '1': 'ImageSelector',
  '2': const [
    const {'1': 'imgUrl', '3': 1, '4': 1, '5': 11, '6': '.Selector', '10': 'imgUrl'},
    const {'1': 'imgWidth', '3': 2, '4': 1, '5': 11, '6': '.Selector', '10': 'imgWidth'},
    const {'1': 'imgHeight', '3': 3, '4': 1, '5': 11, '6': '.Selector', '10': 'imgHeight'},
    const {'1': 'imgX', '3': 4, '4': 1, '5': 11, '6': '.Selector', '10': 'imgX'},
    const {'1': 'imgY', '3': 5, '4': 1, '5': 11, '6': '.Selector', '10': 'imgY'},
  ],
};

/// Descriptor for `ImageSelector`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageSelectorDescriptor = $convert.base64Decode('Cg1JbWFnZVNlbGVjdG9yEiEKBmltZ1VybBgBIAEoCzIJLlNlbGVjdG9yUgZpbWdVcmwSJQoIaW1nV2lkdGgYAiABKAsyCS5TZWxlY3RvclIIaW1nV2lkdGgSJwoJaW1nSGVpZ2h0GAMgASgLMgkuU2VsZWN0b3JSCWltZ0hlaWdodBIdCgRpbWdYGAQgASgLMgkuU2VsZWN0b3JSBGltZ1gSHQoEaW1nWRgFIAEoCzIJLlNlbGVjdG9yUgRpbWdZ');
@$core.Deprecated('Use commentSelectorDescriptor instead')
const CommentSelector$json = const {
  '1': 'CommentSelector',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 11, '6': '.Selector', '10': 'username'},
    const {'1': 'postTime', '3': 2, '4': 1, '5': 11, '6': '.Selector', '10': 'postTime'},
    const {'1': 'vote', '3': 3, '4': 1, '5': 11, '6': '.Selector', '10': 'vote'},
    const {'1': 'content', '3': 4, '4': 1, '5': 11, '6': '.Selector', '10': 'content'},
  ],
};

/// Descriptor for `CommentSelector`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List commentSelectorDescriptor = $convert.base64Decode('Cg9Db21tZW50U2VsZWN0b3ISJQoIdXNlcm5hbWUYASABKAsyCS5TZWxlY3RvclIIdXNlcm5hbWUSJQoIcG9zdFRpbWUYAiABKAsyCS5TZWxlY3RvclIIcG9zdFRpbWUSHQoEdm90ZRgDIAEoCzIJLlNlbGVjdG9yUgR2b3RlEiMKB2NvbnRlbnQYBCABKAsyCS5TZWxlY3RvclIHY29udGVudA==');
