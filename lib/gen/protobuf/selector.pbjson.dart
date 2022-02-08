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
    const {'1': 'SELECTOR_FUNCTION_AUTO', '2': 0},
    const {'1': 'SELECTOR_FUNCTION_TEXT', '2': 1},
    const {'1': 'SELECTOR_FUNCTION_ATTR', '2': 2},
    const {'1': 'SELECTOR_FUNCTION_RAW', '2': 3},
  ],
};

/// Descriptor for `SelectorFunction`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List selectorFunctionDescriptor = $convert.base64Decode(
    'ChBTZWxlY3RvckZ1bmN0aW9uEhoKFlNFTEVDVE9SX0ZVTkNUSU9OX0FVVE8QABIaChZTRUxFQ1RPUl9GVU5DVElPTl9URVhUEAESGgoWU0VMRUNUT1JfRlVOQ1RJT05fQVRUUhACEhkKFVNFTEVDVE9SX0ZVTkNUSU9OX1JBVxAD');
@$core.Deprecated('Use extraSelectorTypeDescriptor instead')
const ExtraSelectorType$json = const {
  '1': 'ExtraSelectorType',
  '2': const [
    const {'1': 'EXTRA_SELECTOR_TYPE_NONE', '2': 0},
    const {'1': 'EXTRA_SELECTOR_TYPE_LIST_ITEM', '2': 1},
    const {'1': 'EXTRA_SELECTOR_TYPE_GALLERY_THUMBNAIL', '2': 2},
    const {'1': 'EXTRA_SELECTOR_TYPE_GALLERY_COMMENT', '2': 3},
    const {'1': 'EXTRA_SELECTOR_TYPE_GALLERY_BADGE', '2': 4},
    const {'1': 'EXTRA_SELECTOR_TYPE_GALLERY_CHAPTER', '2': 5},
  ],
};

/// Descriptor for `ExtraSelectorType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List extraSelectorTypeDescriptor = $convert.base64Decode(
    'ChFFeHRyYVNlbGVjdG9yVHlwZRIcChhFWFRSQV9TRUxFQ1RPUl9UWVBFX05PTkUQABIhCh1FWFRSQV9TRUxFQ1RPUl9UWVBFX0xJU1RfSVRFTRABEikKJUVYVFJBX1NFTEVDVE9SX1RZUEVfR0FMTEVSWV9USFVNQk5BSUwQAhInCiNFWFRSQV9TRUxFQ1RPUl9UWVBFX0dBTExFUllfQ09NTUVOVBADEiUKIUVYVFJBX1NFTEVDVE9SX1RZUEVfR0FMTEVSWV9CQURHRRAEEicKI0VYVFJBX1NFTEVDVE9SX1RZUEVfR0FMTEVSWV9DSEFQVEVSEAU=');
@$core.Deprecated('Use selectorDescriptor instead')
const Selector$json = const {
  '1': 'Selector',
  '2': const [
    const {'1': 'selector', '3': 1, '4': 1, '5': 9, '10': 'selector'},
    const {
      '1': 'function',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.SelectorFunction',
      '10': 'function'
    },
    const {'1': 'param', '3': 3, '4': 1, '5': 9, '10': 'param'},
    const {'1': 'regex', '3': 4, '4': 1, '5': 9, '10': 'regex'},
    const {'1': 'replace', '3': 5, '4': 1, '5': 9, '10': 'replace'},
    const {'1': 'js', '3': 6, '4': 1, '5': 9, '10': 'js'},
    const {'1': 'computed', '3': 7, '4': 1, '5': 8, '10': 'computed'},
    const {'1': 'default_value', '3': 8, '4': 1, '5': 9, '10': 'defaultValue'},
  ],
};

/// Descriptor for `Selector`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List selectorDescriptor = $convert.base64Decode(
    'CghTZWxlY3RvchIaCghzZWxlY3RvchgBIAEoCVIIc2VsZWN0b3ISLQoIZnVuY3Rpb24YAiABKA4yES5TZWxlY3RvckZ1bmN0aW9uUghmdW5jdGlvbhIUCgVwYXJhbRgDIAEoCVIFcGFyYW0SFAoFcmVnZXgYBCABKAlSBXJlZ2V4EhgKB3JlcGxhY2UYBSABKAlSB3JlcGxhY2USDgoCanMYBiABKAlSAmpzEhoKCGNvbXB1dGVkGAcgASgIUghjb21wdXRlZBIjCg1kZWZhdWx0X3ZhbHVlGAggASgJUgxkZWZhdWx0VmFsdWU=');
@$core.Deprecated('Use extraSelectorDescriptor instead')
const ExtraSelector$json = const {
  '1': 'ExtraSelector',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {
      '1': 'selector',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'selector'
    },
    const {'1': 'global', '3': 3, '4': 1, '5': 8, '10': 'global'},
    const {
      '1': 'type',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.ExtraSelectorType',
      '10': 'type'
    },
  ],
};

/// Descriptor for `ExtraSelector`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List extraSelectorDescriptor = $convert.base64Decode(
    'Cg1FeHRyYVNlbGVjdG9yEg4KAmlkGAEgASgJUgJpZBIlCghzZWxlY3RvchgCIAEoCzIJLlNlbGVjdG9yUghzZWxlY3RvchIWCgZnbG9iYWwYAyABKAhSBmdsb2JhbBImCgR0eXBlGAQgASgOMhIuRXh0cmFTZWxlY3RvclR5cGVSBHR5cGU=');
@$core.Deprecated('Use imageSelectorDescriptor instead')
const ImageSelector$json = const {
  '1': 'ImageSelector',
  '2': const [
    const {
      '1': 'img_url',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'imgUrl'
    },
    const {
      '1': 'img_width',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'imgWidth'
    },
    const {
      '1': 'img_height',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'imgHeight'
    },
    const {
      '1': 'img_x',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'imgX'
    },
    const {
      '1': 'img_y',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'imgY'
    },
    const {
      '1': 'target',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'target'
    },
  ],
};

/// Descriptor for `ImageSelector`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageSelectorDescriptor = $convert.base64Decode(
    'Cg1JbWFnZVNlbGVjdG9yEiIKB2ltZ191cmwYASABKAsyCS5TZWxlY3RvclIGaW1nVXJsEiYKCWltZ193aWR0aBgCIAEoCzIJLlNlbGVjdG9yUghpbWdXaWR0aBIoCgppbWdfaGVpZ2h0GAMgASgLMgkuU2VsZWN0b3JSCWltZ0hlaWdodBIeCgVpbWdfeBgEIAEoCzIJLlNlbGVjdG9yUgRpbWdYEh4KBWltZ195GAUgASgLMgkuU2VsZWN0b3JSBGltZ1kSIQoGdGFyZ2V0GAYgASgLMgkuU2VsZWN0b3JSBnRhcmdldA==');
@$core.Deprecated('Use commentSelectorDescriptor instead')
const CommentSelector$json = const {
  '1': 'CommentSelector',
  '2': const [
    const {
      '1': 'username',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'username'
    },
    const {
      '1': 'time',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'time'
    },
    const {
      '1': 'score',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'score'
    },
    const {
      '1': 'content',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'content'
    },
    const {
      '1': 'avatar',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.ImageSelector',
      '10': 'avatar'
    },
  ],
};

/// Descriptor for `CommentSelector`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List commentSelectorDescriptor = $convert.base64Decode(
    'Cg9Db21tZW50U2VsZWN0b3ISJQoIdXNlcm5hbWUYASABKAsyCS5TZWxlY3RvclIIdXNlcm5hbWUSHQoEdGltZRgCIAEoCzIJLlNlbGVjdG9yUgR0aW1lEh8KBXNjb3JlGAMgASgLMgkuU2VsZWN0b3JSBXNjb3JlEiMKB2NvbnRlbnQYBCABKAsyCS5TZWxlY3RvclIHY29udGVudBImCgZhdmF0YXIYBSABKAsyDi5JbWFnZVNlbGVjdG9yUgZhdmF0YXI=');
