///
//  Generated code. Do not modify.
//  source: parser.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use starSelectorDescriptor instead')
const StarSelector$json = const {
  '1': 'StarSelector',
  '2': const [
    const {'1': 'selector', '3': 1, '4': 1, '5': 11, '6': '.Selector', '10': 'selector'},
    const {'1': 'maxStar', '3': 2, '4': 1, '5': 5, '10': 'maxStar'},
  ],
};

/// Descriptor for `StarSelector`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List starSelectorDescriptor = $convert.base64Decode('CgxTdGFyU2VsZWN0b3ISJQoIc2VsZWN0b3IYASABKAsyCS5TZWxlY3RvclIIc2VsZWN0b3ISGAoHbWF4U3RhchgCIAEoBVIHbWF4U3Rhcg==');
@$core.Deprecated('Use tagSelectorDescriptor instead')
const TagSelector$json = const {
  '1': 'TagSelector',
  '2': const [
    const {'1': 'selector', '3': 1, '4': 1, '5': 11, '6': '.Selector', '10': 'selector'},
    const {'1': 'color', '3': 2, '4': 1, '5': 9, '10': 'color'},
  ],
};

/// Descriptor for `TagSelector`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tagSelectorDescriptor = $convert.base64Decode('CgtUYWdTZWxlY3RvchIlCghzZWxlY3RvchgBIAEoCzIJLlNlbGVjdG9yUghzZWxlY3RvchIUCgVjb2xvchgCIAEoCVIFY29sb3I=');
@$core.Deprecated('Use listViewParserDescriptor instead')
const ListViewParser$json = const {
  '1': 'ListViewParser',
  '2': const [
    const {'1': 'isJson', '3': 1, '4': 1, '5': 8, '10': 'isJson'},
    const {'1': 'list', '3': 2, '4': 3, '5': 11, '6': '.Selector', '10': 'list'},
    const {'1': 'title', '3': 3, '4': 3, '5': 11, '6': '.Selector', '10': 'title'},
    const {'1': 'subtitle', '3': 4, '4': 3, '5': 11, '6': '.Selector', '10': 'subtitle'},
    const {'1': 'uploadTIme', '3': 5, '4': 3, '5': 11, '6': '.Selector', '10': 'uploadTIme'},
    const {'1': 'star', '3': 6, '4': 3, '5': 11, '6': '.StarSelector', '10': 'star'},
    const {'1': 'pageCount', '3': 7, '4': 3, '5': 11, '6': '.Selector', '10': 'pageCount'},
    const {'1': 'imgUrl', '3': 8, '4': 3, '5': 11, '6': '.Selector', '10': 'imgUrl'},
    const {'1': 'imgWidth', '3': 9, '4': 3, '5': 11, '6': '.Selector', '10': 'imgWidth'},
    const {'1': 'imgHeight', '3': 10, '4': 3, '5': 11, '6': '.Selector', '10': 'imgHeight'},
    const {'1': 'largeTag', '3': 11, '4': 3, '5': 11, '6': '.TagSelector', '10': 'largeTag'},
    const {'1': 'smallTag', '3': 12, '4': 3, '5': 11, '6': '.TagSelector', '10': 'smallTag'},
  ],
};

/// Descriptor for `ListViewParser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listViewParserDescriptor = $convert.base64Decode('Cg5MaXN0Vmlld1BhcnNlchIWCgZpc0pzb24YASABKAhSBmlzSnNvbhIdCgRsaXN0GAIgAygLMgkuU2VsZWN0b3JSBGxpc3QSHwoFdGl0bGUYAyADKAsyCS5TZWxlY3RvclIFdGl0bGUSJQoIc3VidGl0bGUYBCADKAsyCS5TZWxlY3RvclIIc3VidGl0bGUSKQoKdXBsb2FkVEltZRgFIAMoCzIJLlNlbGVjdG9yUgp1cGxvYWRUSW1lEiEKBHN0YXIYBiADKAsyDS5TdGFyU2VsZWN0b3JSBHN0YXISJwoJcGFnZUNvdW50GAcgAygLMgkuU2VsZWN0b3JSCXBhZ2VDb3VudBIhCgZpbWdVcmwYCCADKAsyCS5TZWxlY3RvclIGaW1nVXJsEiUKCGltZ1dpZHRoGAkgAygLMgkuU2VsZWN0b3JSCGltZ1dpZHRoEicKCWltZ0hlaWdodBgKIAMoCzIJLlNlbGVjdG9yUglpbWdIZWlnaHQSKAoIbGFyZ2VUYWcYCyADKAsyDC5UYWdTZWxlY3RvclIIbGFyZ2VUYWcSKAoIc21hbGxUYWcYDCADKAsyDC5UYWdTZWxlY3RvclIIc21hbGxUYWc=');
