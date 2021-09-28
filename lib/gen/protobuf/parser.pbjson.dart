///
//  Generated code. Do not modify.
//  source: parser.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use listViewParserDescriptor instead')
const ListViewParser$json = const {
  '1': 'ListViewParser',
  '2': const [
    const {'1': 'isJson', '3': 1, '4': 1, '5': 8, '10': 'isJson'},
    const {'1': 'item', '3': 2, '4': 3, '5': 11, '6': '.Selector', '10': 'item'},
    const {'1': 'title', '3': 3, '4': 3, '5': 11, '6': '.Selector', '10': 'title'},
    const {'1': 'subtitle', '3': 4, '4': 3, '5': 11, '6': '.Selector', '10': 'subtitle'},
    const {'1': 'uploadTIme', '3': 5, '4': 3, '5': 11, '6': '.Selector', '10': 'uploadTIme'},
    const {'1': 'star', '3': 6, '4': 3, '5': 11, '6': '.StarSelector', '10': 'star'},
    const {'1': 'imgCount', '3': 7, '4': 3, '5': 11, '6': '.Selector', '10': 'imgCount'},
    const {'1': 'img', '3': 8, '4': 3, '5': 11, '6': '.ImageSelector', '10': 'img'},
    const {'1': 'largeTag', '3': 9, '4': 3, '5': 11, '6': '.TagSelector', '10': 'largeTag'},
    const {'1': 'smallTag', '3': 10, '4': 3, '5': 11, '6': '.TagSelector', '10': 'smallTag'},
  ],
};

/// Descriptor for `ListViewParser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listViewParserDescriptor = $convert.base64Decode('Cg5MaXN0Vmlld1BhcnNlchIWCgZpc0pzb24YASABKAhSBmlzSnNvbhIdCgRpdGVtGAIgAygLMgkuU2VsZWN0b3JSBGl0ZW0SHwoFdGl0bGUYAyADKAsyCS5TZWxlY3RvclIFdGl0bGUSJQoIc3VidGl0bGUYBCADKAsyCS5TZWxlY3RvclIIc3VidGl0bGUSKQoKdXBsb2FkVEltZRgFIAMoCzIJLlNlbGVjdG9yUgp1cGxvYWRUSW1lEiEKBHN0YXIYBiADKAsyDS5TdGFyU2VsZWN0b3JSBHN0YXISJQoIaW1nQ291bnQYByADKAsyCS5TZWxlY3RvclIIaW1nQ291bnQSIAoDaW1nGAggAygLMg4uSW1hZ2VTZWxlY3RvclIDaW1nEigKCGxhcmdlVGFnGAkgAygLMgwuVGFnU2VsZWN0b3JSCGxhcmdlVGFnEigKCHNtYWxsVGFnGAogAygLMgwuVGFnU2VsZWN0b3JSCHNtYWxsVGFn');
@$core.Deprecated('Use galleryParserDescriptor instead')
const GalleryParser$json = const {
  '1': 'GalleryParser',
  '2': const [
    const {'1': 'title', '3': 1, '4': 3, '5': 11, '6': '.Selector', '10': 'title'},
    const {'1': 'subtitle', '3': 2, '4': 3, '5': 11, '6': '.Selector', '10': 'subtitle'},
    const {'1': 'uploadTIme', '3': 3, '4': 3, '5': 11, '6': '.Selector', '10': 'uploadTIme'},
    const {'1': 'star', '3': 4, '4': 3, '5': 11, '6': '.StarSelector', '10': 'star'},
    const {'1': 'imgCount', '3': 5, '4': 3, '5': 11, '6': '.Selector', '10': 'imgCount'},
    const {'1': 'prePageImg', '3': 6, '4': 3, '5': 11, '6': '.Selector', '10': 'prePageImg'},
    const {'1': 'favorited', '3': 7, '4': 3, '5': 11, '6': '.Selector', '10': 'favorited'},
    const {'1': 'language', '3': 8, '4': 3, '5': 11, '6': '.Selector', '10': 'language'},
    const {'1': 'coverImg', '3': 9, '4': 3, '5': 11, '6': '.ImageSelector', '10': 'coverImg'},
    const {'1': 'description', '3': 10, '4': 3, '5': 11, '6': '.Selector', '10': 'description'},
    const {'1': 'thumbnailItem', '3': 11, '4': 3, '5': 11, '6': '.Selector', '10': 'thumbnailItem'},
    const {'1': 'thumbnail', '3': 12, '4': 3, '5': 11, '6': '.ImageSelector', '10': 'thumbnail'},
    const {'1': 'commentItem', '3': 13, '4': 3, '5': 11, '6': '.Selector', '10': 'commentItem'},
    const {'1': 'comments', '3': 14, '4': 3, '5': 11, '6': '.CommentSelector', '10': 'comments'},
  ],
};

/// Descriptor for `GalleryParser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List galleryParserDescriptor = $convert.base64Decode('Cg1HYWxsZXJ5UGFyc2VyEh8KBXRpdGxlGAEgAygLMgkuU2VsZWN0b3JSBXRpdGxlEiUKCHN1YnRpdGxlGAIgAygLMgkuU2VsZWN0b3JSCHN1YnRpdGxlEikKCnVwbG9hZFRJbWUYAyADKAsyCS5TZWxlY3RvclIKdXBsb2FkVEltZRIhCgRzdGFyGAQgAygLMg0uU3RhclNlbGVjdG9yUgRzdGFyEiUKCGltZ0NvdW50GAUgAygLMgkuU2VsZWN0b3JSCGltZ0NvdW50EikKCnByZVBhZ2VJbWcYBiADKAsyCS5TZWxlY3RvclIKcHJlUGFnZUltZxInCglmYXZvcml0ZWQYByADKAsyCS5TZWxlY3RvclIJZmF2b3JpdGVkEiUKCGxhbmd1YWdlGAggAygLMgkuU2VsZWN0b3JSCGxhbmd1YWdlEioKCGNvdmVySW1nGAkgAygLMg4uSW1hZ2VTZWxlY3RvclIIY292ZXJJbWcSKwoLZGVzY3JpcHRpb24YCiADKAsyCS5TZWxlY3RvclILZGVzY3JpcHRpb24SLwoNdGh1bWJuYWlsSXRlbRgLIAMoCzIJLlNlbGVjdG9yUg10aHVtYm5haWxJdGVtEiwKCXRodW1ibmFpbBgMIAMoCzIOLkltYWdlU2VsZWN0b3JSCXRodW1ibmFpbBIrCgtjb21tZW50SXRlbRgNIAMoCzIJLlNlbGVjdG9yUgtjb21tZW50SXRlbRIsCghjb21tZW50cxgOIAMoCzIQLkNvbW1lbnRTZWxlY3RvclIIY29tbWVudHM=');
