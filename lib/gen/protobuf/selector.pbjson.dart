//
//  Generated code. Do not modify.
//  source: selector.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use selectorFunctionDescriptor instead')
const SelectorFunction$json = {
  '1': 'SelectorFunction',
  '2': [
    {'1': 'SELECTOR_FUNCTION_AUTO', '2': 0},
    {'1': 'SELECTOR_FUNCTION_TEXT', '2': 1},
    {'1': 'SELECTOR_FUNCTION_ATTR', '2': 2},
    {'1': 'SELECTOR_FUNCTION_RAW', '2': 3},
  ],
};

/// Descriptor for `SelectorFunction`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List selectorFunctionDescriptor = $convert.base64Decode(
    'ChBTZWxlY3RvckZ1bmN0aW9uEhoKFlNFTEVDVE9SX0ZVTkNUSU9OX0FVVE8QABIaChZTRUxFQ1'
    'RPUl9GVU5DVElPTl9URVhUEAESGgoWU0VMRUNUT1JfRlVOQ1RJT05fQVRUUhACEhkKFVNFTEVD'
    'VE9SX0ZVTkNUSU9OX1JBVxAD');

@$core.Deprecated('Use extraSelectorTypeDescriptor instead')
const ExtraSelectorType$json = {
  '1': 'ExtraSelectorType',
  '2': [
    {'1': 'EXTRA_SELECTOR_TYPE_NONE', '2': 0},
    {'1': 'EXTRA_SELECTOR_TYPE_LIST_ITEM', '2': 1},
    {'1': 'EXTRA_SELECTOR_TYPE_GALLERY_THUMBNAIL', '2': 2},
    {'1': 'EXTRA_SELECTOR_TYPE_GALLERY_COMMENT', '2': 3},
    {'1': 'EXTRA_SELECTOR_TYPE_GALLERY_BADGE', '2': 4},
    {'1': 'EXTRA_SELECTOR_TYPE_GALLERY_CHAPTER', '2': 5},
  ],
};

/// Descriptor for `ExtraSelectorType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List extraSelectorTypeDescriptor = $convert.base64Decode(
    'ChFFeHRyYVNlbGVjdG9yVHlwZRIcChhFWFRSQV9TRUxFQ1RPUl9UWVBFX05PTkUQABIhCh1FWF'
    'RSQV9TRUxFQ1RPUl9UWVBFX0xJU1RfSVRFTRABEikKJUVYVFJBX1NFTEVDVE9SX1RZUEVfR0FM'
    'TEVSWV9USFVNQk5BSUwQAhInCiNFWFRSQV9TRUxFQ1RPUl9UWVBFX0dBTExFUllfQ09NTUVOVB'
    'ADEiUKIUVYVFJBX1NFTEVDVE9SX1RZUEVfR0FMTEVSWV9CQURHRRAEEicKI0VYVFJBX1NFTEVD'
    'VE9SX1RZUEVfR0FMTEVSWV9DSEFQVEVSEAU=');

@$core.Deprecated('Use selectorDescriptor instead')
const Selector$json = {
  '1': 'Selector',
  '2': [
    {'1': 'selector', '3': 1, '4': 1, '5': 9, '10': 'selector'},
    {'1': 'function', '3': 2, '4': 1, '5': 14, '6': '.SelectorFunction', '10': 'function'},
    {'1': 'param', '3': 3, '4': 1, '5': 9, '10': 'param'},
    {'1': 'regex', '3': 4, '4': 1, '5': 9, '10': 'regex'},
    {'1': 'replace', '3': 5, '4': 1, '5': 9, '10': 'replace'},
    {'1': 'script', '3': 6, '4': 1, '5': 9, '10': 'script'},
    {'1': 'computed', '3': 7, '4': 1, '5': 8, '10': 'computed'},
    {'1': 'default_value', '3': 8, '4': 1, '5': 9, '10': 'defaultValue'},
  ],
};

/// Descriptor for `Selector`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List selectorDescriptor = $convert.base64Decode(
    'CghTZWxlY3RvchIaCghzZWxlY3RvchgBIAEoCVIIc2VsZWN0b3ISLQoIZnVuY3Rpb24YAiABKA'
    '4yES5TZWxlY3RvckZ1bmN0aW9uUghmdW5jdGlvbhIUCgVwYXJhbRgDIAEoCVIFcGFyYW0SFAoF'
    'cmVnZXgYBCABKAlSBXJlZ2V4EhgKB3JlcGxhY2UYBSABKAlSB3JlcGxhY2USFgoGc2NyaXB0GA'
    'YgASgJUgZzY3JpcHQSGgoIY29tcHV0ZWQYByABKAhSCGNvbXB1dGVkEiMKDWRlZmF1bHRfdmFs'
    'dWUYCCABKAlSDGRlZmF1bHRWYWx1ZQ==');

@$core.Deprecated('Use extraSelectorDescriptor instead')
const ExtraSelector$json = {
  '1': 'ExtraSelector',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'selector', '3': 2, '4': 1, '5': 11, '6': '.Selector', '10': 'selector'},
    {'1': 'global', '3': 3, '4': 1, '5': 8, '10': 'global'},
    {'1': 'type', '3': 4, '4': 1, '5': 14, '6': '.ExtraSelectorType', '10': 'type'},
  ],
};

/// Descriptor for `ExtraSelector`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List extraSelectorDescriptor = $convert.base64Decode(
    'Cg1FeHRyYVNlbGVjdG9yEg4KAmlkGAEgASgJUgJpZBIlCghzZWxlY3RvchgCIAEoCzIJLlNlbG'
    'VjdG9yUghzZWxlY3RvchIWCgZnbG9iYWwYAyABKAhSBmdsb2JhbBImCgR0eXBlGAQgASgOMhIu'
    'RXh0cmFTZWxlY3RvclR5cGVSBHR5cGU=');

@$core.Deprecated('Use imageSelectorDescriptor instead')
const ImageSelector$json = {
  '1': 'ImageSelector',
  '2': [
    {'1': 'img_url', '3': 1, '4': 1, '5': 11, '6': '.Selector', '10': 'imgUrl'},
    {'1': 'img_width', '3': 2, '4': 1, '5': 11, '6': '.Selector', '10': 'imgWidth'},
    {'1': 'img_height', '3': 3, '4': 1, '5': 11, '6': '.Selector', '10': 'imgHeight'},
    {'1': 'img_x', '3': 4, '4': 1, '5': 11, '6': '.Selector', '10': 'imgX'},
    {'1': 'img_y', '3': 5, '4': 1, '5': 11, '6': '.Selector', '10': 'imgY'},
  ],
};

/// Descriptor for `ImageSelector`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageSelectorDescriptor = $convert.base64Decode(
    'Cg1JbWFnZVNlbGVjdG9yEiIKB2ltZ191cmwYASABKAsyCS5TZWxlY3RvclIGaW1nVXJsEiYKCW'
    'ltZ193aWR0aBgCIAEoCzIJLlNlbGVjdG9yUghpbWdXaWR0aBIoCgppbWdfaGVpZ2h0GAMgASgL'
    'MgkuU2VsZWN0b3JSCWltZ0hlaWdodBIeCgVpbWdfeBgEIAEoCzIJLlNlbGVjdG9yUgRpbWdYEh'
    '4KBWltZ195GAUgASgLMgkuU2VsZWN0b3JSBGltZ1k=');

@$core.Deprecated('Use commentSelectorDescriptor instead')
const CommentSelector$json = {
  '1': 'CommentSelector',
  '2': [
    {'1': 'username', '3': 1, '4': 1, '5': 11, '6': '.Selector', '10': 'username'},
    {'1': 'time', '3': 2, '4': 1, '5': 11, '6': '.Selector', '10': 'time'},
    {'1': 'score', '3': 3, '4': 1, '5': 11, '6': '.Selector', '10': 'score'},
    {'1': 'content', '3': 4, '4': 1, '5': 11, '6': '.Selector', '10': 'content'},
    {'1': 'avatar', '3': 5, '4': 1, '5': 11, '6': '.ImageSelector', '10': 'avatar'},
  ],
};

/// Descriptor for `CommentSelector`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List commentSelectorDescriptor = $convert.base64Decode(
    'Cg9Db21tZW50U2VsZWN0b3ISJQoIdXNlcm5hbWUYASABKAsyCS5TZWxlY3RvclIIdXNlcm5hbW'
    'USHQoEdGltZRgCIAEoCzIJLlNlbGVjdG9yUgR0aW1lEh8KBXNjb3JlGAMgASgLMgkuU2VsZWN0'
    'b3JSBXNjb3JlEiMKB2NvbnRlbnQYBCABKAsyCS5TZWxlY3RvclIHY29udGVudBImCgZhdmF0YX'
    'IYBSABKAsyDi5JbWFnZVNlbGVjdG9yUgZhdmF0YXI=');

