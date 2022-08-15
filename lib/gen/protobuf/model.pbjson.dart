///
//  Generated code. Do not modify.
//  source: model.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use imageRpcModelDescriptor instead')
const ImageRpcModel$json = const {
  '1': 'ImageRpcModel',
  '2': const [
    const {'1': 'url', '3': 1, '4': 1, '5': 9, '10': 'url'},
    const {'1': 'cacheKey', '3': 2, '4': 1, '5': 9, '10': 'cacheKey'},
    const {'1': 'width', '3': 3, '4': 1, '5': 1, '10': 'width'},
    const {'1': 'height', '3': 4, '4': 1, '5': 1, '10': 'height'},
    const {'1': 'imgX', '3': 5, '4': 1, '5': 1, '10': 'imgX'},
    const {'1': 'imgY', '3': 6, '4': 1, '5': 1, '10': 'imgY'},
  ],
};

/// Descriptor for `ImageRpcModel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageRpcModelDescriptor = $convert.base64Decode('Cg1JbWFnZVJwY01vZGVsEhAKA3VybBgBIAEoCVIDdXJsEhoKCGNhY2hlS2V5GAIgASgJUghjYWNoZUtleRIUCgV3aWR0aBgDIAEoAVIFd2lkdGgSFgoGaGVpZ2h0GAQgASgBUgZoZWlnaHQSEgoEaW1nWBgFIAEoAVIEaW1nWBISCgRpbWdZGAYgASgBUgRpbWdZ');
@$core.Deprecated('Use colorRpcModelDescriptor instead')
const ColorRpcModel$json = const {
  '1': 'ColorRpcModel',
  '2': const [
    const {'1': 'a', '3': 1, '4': 1, '5': 5, '10': 'a'},
    const {'1': 'r', '3': 2, '4': 1, '5': 5, '10': 'r'},
    const {'1': 'g', '3': 3, '4': 1, '5': 5, '10': 'g'},
    const {'1': 'b', '3': 4, '4': 1, '5': 5, '10': 'b'},
  ],
};

/// Descriptor for `ColorRpcModel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List colorRpcModelDescriptor = $convert.base64Decode('Cg1Db2xvclJwY01vZGVsEgwKAWEYASABKAVSAWESDAoBchgCIAEoBVIBchIMCgFnGAMgASgFUgFnEgwKAWIYBCABKAVSAWI=');
@$core.Deprecated('Use tagRpcModelDescriptor instead')
const TagRpcModel$json = const {
  '1': 'TagRpcModel',
  '2': const [
    const {'1': 'text', '3': 1, '4': 1, '5': 9, '10': 'text'},
    const {'1': 'color', '3': 2, '4': 1, '5': 11, '6': '.ColorRpcModel', '10': 'color'},
    const {'1': 'category', '3': 3, '4': 1, '5': 9, '10': 'category'},
    const {'1': 'env', '3': 4, '4': 3, '5': 11, '6': '.TagRpcModel.EnvEntry', '10': 'env'},
  ],
  '3': const [TagRpcModel_EnvEntry$json],
};

@$core.Deprecated('Use tagRpcModelDescriptor instead')
const TagRpcModel_EnvEntry$json = const {
  '1': 'EnvEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `TagRpcModel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tagRpcModelDescriptor = $convert.base64Decode('CgtUYWdScGNNb2RlbBISCgR0ZXh0GAEgASgJUgR0ZXh0EiQKBWNvbG9yGAIgASgLMg4uQ29sb3JScGNNb2RlbFIFY29sb3ISGgoIY2F0ZWdvcnkYAyABKAlSCGNhdGVnb3J5EicKA2VudhgEIAMoCzIVLlRhZ1JwY01vZGVsLkVudkVudHJ5UgNlbnYaNgoIRW52RW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4AQ==');
@$core.Deprecated('Use listRpcModelDescriptor instead')
const ListRpcModel$json = const {
  '1': 'ListRpcModel',
  '2': const [
    const {'1': 'enable_success', '3': 20, '4': 1, '5': 8, '10': 'enableSuccess'},
    const {'1': 'enable_fail', '3': 21, '4': 1, '5': 8, '10': 'enableFail'},
    const {'1': 'is_success', '3': 22, '4': 1, '5': 8, '10': 'isSuccess'},
    const {'1': 'failed_message', '3': 23, '4': 1, '5': 9, '10': 'failedMessage'},
    const {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.ListRpcModel.Item', '10': 'items'},
    const {'1': 'next_page', '3': 2, '4': 1, '5': 9, '10': 'nextPage'},
    const {'1': 'localEnv', '3': 10, '4': 3, '5': 11, '6': '.ListRpcModel.LocalEnvEntry', '10': 'localEnv'},
    const {'1': 'globalEnv', '3': 11, '4': 3, '5': 11, '6': '.ListRpcModel.GlobalEnvEntry', '10': 'globalEnv'},
  ],
  '3': const [ListRpcModel_Item$json, ListRpcModel_LocalEnvEntry$json, ListRpcModel_GlobalEnvEntry$json],
};

@$core.Deprecated('Use listRpcModelDescriptor instead')
const ListRpcModel_Item$json = const {
  '1': 'Item',
  '2': const [
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'subtitle', '3': 2, '4': 1, '5': 9, '10': 'subtitle'},
    const {'1': 'upload_time', '3': 3, '4': 1, '5': 9, '10': 'uploadTime'},
    const {'1': 'star', '3': 4, '4': 1, '5': 1, '10': 'star'},
    const {'1': 'img_count', '3': 5, '4': 1, '5': 5, '10': 'imgCount'},
    const {'1': 'preview_img', '3': 6, '4': 1, '5': 11, '6': '.ImageRpcModel', '10': 'previewImg'},
    const {'1': 'language', '3': 7, '4': 1, '5': 9, '10': 'language'},
    const {'1': 'tag', '3': 10, '4': 1, '5': 11, '6': '.TagRpcModel', '10': 'tag'},
    const {'1': 'badges', '3': 11, '4': 3, '5': 11, '6': '.TagRpcModel', '10': 'badges'},
    const {'1': 'paper', '3': 12, '4': 1, '5': 9, '10': 'paper'},
    const {'1': 'target', '3': 13, '4': 1, '5': 9, '10': 'target'},
    const {'1': 'next_page', '3': 20, '4': 1, '5': 9, '10': 'nextPage'},
    const {'1': 'env', '3': 30, '4': 3, '5': 11, '6': '.ListRpcModel.Item.EnvEntry', '10': 'env'},
  ],
  '3': const [ListRpcModel_Item_EnvEntry$json],
};

@$core.Deprecated('Use listRpcModelDescriptor instead')
const ListRpcModel_Item_EnvEntry$json = const {
  '1': 'EnvEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': const {'7': true},
};

@$core.Deprecated('Use listRpcModelDescriptor instead')
const ListRpcModel_LocalEnvEntry$json = const {
  '1': 'LocalEnvEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': const {'7': true},
};

@$core.Deprecated('Use listRpcModelDescriptor instead')
const ListRpcModel_GlobalEnvEntry$json = const {
  '1': 'GlobalEnvEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `ListRpcModel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listRpcModelDescriptor = $convert.base64Decode('CgxMaXN0UnBjTW9kZWwSJQoOZW5hYmxlX3N1Y2Nlc3MYFCABKAhSDWVuYWJsZVN1Y2Nlc3MSHwoLZW5hYmxlX2ZhaWwYFSABKAhSCmVuYWJsZUZhaWwSHQoKaXNfc3VjY2VzcxgWIAEoCFIJaXNTdWNjZXNzEiUKDmZhaWxlZF9tZXNzYWdlGBcgASgJUg1mYWlsZWRNZXNzYWdlEigKBWl0ZW1zGAEgAygLMhIuTGlzdFJwY01vZGVsLkl0ZW1SBWl0ZW1zEhsKCW5leHRfcGFnZRgCIAEoCVIIbmV4dFBhZ2USNwoIbG9jYWxFbnYYCiADKAsyGy5MaXN0UnBjTW9kZWwuTG9jYWxFbnZFbnRyeVIIbG9jYWxFbnYSOgoJZ2xvYmFsRW52GAsgAygLMhwuTGlzdFJwY01vZGVsLkdsb2JhbEVudkVudHJ5UglnbG9iYWxFbnYazwMKBEl0ZW0SFAoFdGl0bGUYASABKAlSBXRpdGxlEhoKCHN1YnRpdGxlGAIgASgJUghzdWJ0aXRsZRIfCgt1cGxvYWRfdGltZRgDIAEoCVIKdXBsb2FkVGltZRISCgRzdGFyGAQgASgBUgRzdGFyEhsKCWltZ19jb3VudBgFIAEoBVIIaW1nQ291bnQSLwoLcHJldmlld19pbWcYBiABKAsyDi5JbWFnZVJwY01vZGVsUgpwcmV2aWV3SW1nEhoKCGxhbmd1YWdlGAcgASgJUghsYW5ndWFnZRIeCgN0YWcYCiABKAsyDC5UYWdScGNNb2RlbFIDdGFnEiQKBmJhZGdlcxgLIAMoCzIMLlRhZ1JwY01vZGVsUgZiYWRnZXMSFAoFcGFwZXIYDCABKAlSBXBhcGVyEhYKBnRhcmdldBgNIAEoCVIGdGFyZ2V0EhsKCW5leHRfcGFnZRgUIAEoCVIIbmV4dFBhZ2USLQoDZW52GB4gAygLMhsuTGlzdFJwY01vZGVsLkl0ZW0uRW52RW50cnlSA2Vudho2CghFbnZFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6AjgBGjsKDUxvY2FsRW52RW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4ARo8Cg5HbG9iYWxFbnZFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6AjgB');
@$core.Deprecated('Use galleryRpcModelDescriptor instead')
const GalleryRpcModel$json = const {
  '1': 'GalleryRpcModel',
  '2': const [
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'subtitle', '3': 2, '4': 1, '5': 9, '10': 'subtitle'},
    const {'1': 'language', '3': 3, '4': 1, '5': 9, '10': 'language'},
    const {'1': 'image_count', '3': 4, '4': 1, '5': 5, '10': 'imageCount'},
    const {'1': 'upload_time', '3': 5, '4': 1, '5': 9, '10': 'uploadTime'},
    const {'1': 'count_pre_page', '3': 6, '4': 1, '5': 5, '10': 'countPrePage'},
    const {'1': 'description', '3': 7, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'star', '3': 8, '4': 1, '5': 1, '10': 'star'},
    const {'1': 'items', '3': 9, '4': 3, '5': 11, '6': '.GalleryRpcModel.Item', '10': 'items'},
    const {'1': 'cover_img', '3': 10, '4': 1, '5': 11, '6': '.ImageRpcModel', '10': 'coverImg'},
    const {'1': 'tag', '3': 20, '4': 1, '5': 11, '6': '.TagRpcModel', '10': 'tag'},
    const {'1': 'badges', '3': 21, '4': 3, '5': 11, '6': '.TagRpcModel', '10': 'badges'},
    const {'1': 'comments', '3': 22, '4': 3, '5': 11, '6': '.GalleryRpcModel.Comment', '10': 'comments'},
    const {'1': 'next_page', '3': 23, '4': 1, '5': 9, '10': 'nextPage'},
    const {'1': 'localEnv', '3': 30, '4': 3, '5': 11, '6': '.GalleryRpcModel.LocalEnvEntry', '10': 'localEnv'},
    const {'1': 'globalEnv', '3': 31, '4': 3, '5': 11, '6': '.GalleryRpcModel.GlobalEnvEntry', '10': 'globalEnv'},
    const {'1': 'enable_success', '3': 40, '4': 1, '5': 8, '10': 'enableSuccess'},
    const {'1': 'enable_fail', '3': 41, '4': 1, '5': 8, '10': 'enableFail'},
    const {'1': 'is_success', '3': 42, '4': 1, '5': 8, '10': 'isSuccess'},
    const {'1': 'failed_message', '3': 43, '4': 1, '5': 9, '10': 'failedMessage'},
  ],
  '3': const [GalleryRpcModel_Comment$json, GalleryRpcModel_Item$json, GalleryRpcModel_LocalEnvEntry$json, GalleryRpcModel_GlobalEnvEntry$json],
};

@$core.Deprecated('Use galleryRpcModelDescriptor instead')
const GalleryRpcModel_Comment$json = const {
  '1': 'Comment',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'content', '3': 2, '4': 1, '5': 9, '10': 'content'},
    const {'1': 'time', '3': 3, '4': 1, '5': 9, '10': 'time'},
    const {'1': 'score', '3': 4, '4': 1, '5': 9, '10': 'score'},
    const {'1': 'avatar', '3': 5, '4': 1, '5': 11, '6': '.ImageRpcModel', '10': 'avatar'},
  ],
};

@$core.Deprecated('Use galleryRpcModelDescriptor instead')
const GalleryRpcModel_Item$json = const {
  '1': 'Item',
  '2': const [
    const {'1': 'preview_img', '3': 9, '4': 1, '5': 11, '6': '.ImageRpcModel', '10': 'previewImg'},
    const {'1': 'target', '3': 10, '4': 1, '5': 9, '10': 'target'},
  ],
};

@$core.Deprecated('Use galleryRpcModelDescriptor instead')
const GalleryRpcModel_LocalEnvEntry$json = const {
  '1': 'LocalEnvEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': const {'7': true},
};

@$core.Deprecated('Use galleryRpcModelDescriptor instead')
const GalleryRpcModel_GlobalEnvEntry$json = const {
  '1': 'GlobalEnvEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `GalleryRpcModel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List galleryRpcModelDescriptor = $convert.base64Decode('Cg9HYWxsZXJ5UnBjTW9kZWwSFAoFdGl0bGUYASABKAlSBXRpdGxlEhoKCHN1YnRpdGxlGAIgASgJUghzdWJ0aXRsZRIaCghsYW5ndWFnZRgDIAEoCVIIbGFuZ3VhZ2USHwoLaW1hZ2VfY291bnQYBCABKAVSCmltYWdlQ291bnQSHwoLdXBsb2FkX3RpbWUYBSABKAlSCnVwbG9hZFRpbWUSJAoOY291bnRfcHJlX3BhZ2UYBiABKAVSDGNvdW50UHJlUGFnZRIgCgtkZXNjcmlwdGlvbhgHIAEoCVILZGVzY3JpcHRpb24SEgoEc3RhchgIIAEoAVIEc3RhchIrCgVpdGVtcxgJIAMoCzIVLkdhbGxlcnlScGNNb2RlbC5JdGVtUgVpdGVtcxIrCgljb3Zlcl9pbWcYCiABKAsyDi5JbWFnZVJwY01vZGVsUghjb3ZlckltZxIeCgN0YWcYFCABKAsyDC5UYWdScGNNb2RlbFIDdGFnEiQKBmJhZGdlcxgVIAMoCzIMLlRhZ1JwY01vZGVsUgZiYWRnZXMSNAoIY29tbWVudHMYFiADKAsyGC5HYWxsZXJ5UnBjTW9kZWwuQ29tbWVudFIIY29tbWVudHMSGwoJbmV4dF9wYWdlGBcgASgJUghuZXh0UGFnZRI6Cghsb2NhbEVudhgeIAMoCzIeLkdhbGxlcnlScGNNb2RlbC5Mb2NhbEVudkVudHJ5Ughsb2NhbEVudhI9CglnbG9iYWxFbnYYHyADKAsyHy5HYWxsZXJ5UnBjTW9kZWwuR2xvYmFsRW52RW50cnlSCWdsb2JhbEVudhIlCg5lbmFibGVfc3VjY2VzcxgoIAEoCFINZW5hYmxlU3VjY2VzcxIfCgtlbmFibGVfZmFpbBgpIAEoCFIKZW5hYmxlRmFpbBIdCgppc19zdWNjZXNzGCogASgIUglpc1N1Y2Nlc3MSJQoOZmFpbGVkX21lc3NhZ2UYKyABKAlSDWZhaWxlZE1lc3NhZ2UakQEKB0NvbW1lbnQSGgoIdXNlcm5hbWUYASABKAlSCHVzZXJuYW1lEhgKB2NvbnRlbnQYAiABKAlSB2NvbnRlbnQSEgoEdGltZRgDIAEoCVIEdGltZRIUCgVzY29yZRgEIAEoCVIFc2NvcmUSJgoGYXZhdGFyGAUgASgLMg4uSW1hZ2VScGNNb2RlbFIGYXZhdGFyGk8KBEl0ZW0SLwoLcHJldmlld19pbWcYCSABKAsyDi5JbWFnZVJwY01vZGVsUgpwcmV2aWV3SW1nEhYKBnRhcmdldBgKIAEoCVIGdGFyZ2V0GjsKDUxvY2FsRW52RW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4ARo8Cg5HbG9iYWxFbnZFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6AjgB');
@$core.Deprecated('Use imageReaderRpcModelDescriptor instead')
const ImageReaderRpcModel$json = const {
  '1': 'ImageReaderRpcModel',
  '2': const [
    const {'1': 'image', '3': 1, '4': 1, '5': 11, '6': '.ImageRpcModel', '10': 'image'},
    const {'1': 'larger_image_url', '3': 2, '4': 1, '5': 9, '10': 'largerImageUrl'},
    const {'1': 'raw_image_url', '3': 3, '4': 1, '5': 9, '10': 'rawImageUrl'},
    const {'1': 'upload_time', '3': 4, '4': 1, '5': 9, '10': 'uploadTime'},
    const {'1': 'source', '3': 5, '4': 1, '5': 9, '10': 'source'},
    const {'1': 'rating', '3': 6, '4': 1, '5': 9, '10': 'rating'},
    const {'1': 'score', '3': 7, '4': 1, '5': 9, '10': 'score'},
    const {'1': 'badges', '3': 10, '4': 3, '5': 11, '6': '.TagRpcModel', '10': 'badges'},
    const {'1': 'localEnv', '3': 20, '4': 3, '5': 11, '6': '.ImageReaderRpcModel.LocalEnvEntry', '10': 'localEnv'},
    const {'1': 'globalEnv', '3': 21, '4': 3, '5': 11, '6': '.ImageReaderRpcModel.GlobalEnvEntry', '10': 'globalEnv'},
    const {'1': 'enable_success', '3': 30, '4': 1, '5': 8, '10': 'enableSuccess'},
    const {'1': 'enable_fail', '3': 31, '4': 1, '5': 8, '10': 'enableFail'},
    const {'1': 'is_success', '3': 32, '4': 1, '5': 8, '10': 'isSuccess'},
    const {'1': 'failed_message', '3': 33, '4': 1, '5': 9, '10': 'failedMessage'},
  ],
  '3': const [ImageReaderRpcModel_LocalEnvEntry$json, ImageReaderRpcModel_GlobalEnvEntry$json],
};

@$core.Deprecated('Use imageReaderRpcModelDescriptor instead')
const ImageReaderRpcModel_LocalEnvEntry$json = const {
  '1': 'LocalEnvEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': const {'7': true},
};

@$core.Deprecated('Use imageReaderRpcModelDescriptor instead')
const ImageReaderRpcModel_GlobalEnvEntry$json = const {
  '1': 'GlobalEnvEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `ImageReaderRpcModel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageReaderRpcModelDescriptor = $convert.base64Decode('ChNJbWFnZVJlYWRlclJwY01vZGVsEiQKBWltYWdlGAEgASgLMg4uSW1hZ2VScGNNb2RlbFIFaW1hZ2USKAoQbGFyZ2VyX2ltYWdlX3VybBgCIAEoCVIObGFyZ2VySW1hZ2VVcmwSIgoNcmF3X2ltYWdlX3VybBgDIAEoCVILcmF3SW1hZ2VVcmwSHwoLdXBsb2FkX3RpbWUYBCABKAlSCnVwbG9hZFRpbWUSFgoGc291cmNlGAUgASgJUgZzb3VyY2USFgoGcmF0aW5nGAYgASgJUgZyYXRpbmcSFAoFc2NvcmUYByABKAlSBXNjb3JlEiQKBmJhZGdlcxgKIAMoCzIMLlRhZ1JwY01vZGVsUgZiYWRnZXMSPgoIbG9jYWxFbnYYFCADKAsyIi5JbWFnZVJlYWRlclJwY01vZGVsLkxvY2FsRW52RW50cnlSCGxvY2FsRW52EkEKCWdsb2JhbEVudhgVIAMoCzIjLkltYWdlUmVhZGVyUnBjTW9kZWwuR2xvYmFsRW52RW50cnlSCWdsb2JhbEVudhIlCg5lbmFibGVfc3VjY2VzcxgeIAEoCFINZW5hYmxlU3VjY2VzcxIfCgtlbmFibGVfZmFpbBgfIAEoCFIKZW5hYmxlRmFpbBIdCgppc19zdWNjZXNzGCAgASgIUglpc1N1Y2Nlc3MSJQoOZmFpbGVkX21lc3NhZ2UYISABKAlSDWZhaWxlZE1lc3NhZ2UaOwoNTG9jYWxFbnZFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6AjgBGjwKDkdsb2JhbEVudkVudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgJUgV2YWx1ZToCOAE=');
@$core.Deprecated('Use autoCompleteRpcModelDescriptor instead')
const AutoCompleteRpcModel$json = const {
  '1': 'AutoCompleteRpcModel',
  '2': const [
    const {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.AutoCompleteRpcModel.Item', '10': 'items'},
    const {'1': 'localEnv', '3': 10, '4': 3, '5': 11, '6': '.AutoCompleteRpcModel.LocalEnvEntry', '10': 'localEnv'},
    const {'1': 'globalEnv', '3': 11, '4': 3, '5': 11, '6': '.AutoCompleteRpcModel.GlobalEnvEntry', '10': 'globalEnv'},
    const {'1': 'enable_success', '3': 20, '4': 1, '5': 8, '10': 'enableSuccess'},
    const {'1': 'enable_fail', '3': 21, '4': 1, '5': 8, '10': 'enableFail'},
    const {'1': 'is_success', '3': 22, '4': 1, '5': 8, '10': 'isSuccess'},
    const {'1': 'failed_message', '3': 23, '4': 1, '5': 9, '10': 'failedMessage'},
  ],
  '3': const [AutoCompleteRpcModel_Item$json, AutoCompleteRpcModel_LocalEnvEntry$json, AutoCompleteRpcModel_GlobalEnvEntry$json],
};

@$core.Deprecated('Use autoCompleteRpcModelDescriptor instead')
const AutoCompleteRpcModel_Item$json = const {
  '1': 'Item',
  '2': const [
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'subtitle', '3': 2, '4': 1, '5': 9, '10': 'subtitle'},
    const {'1': 'complete', '3': 3, '4': 1, '5': 9, '10': 'complete'},
  ],
};

@$core.Deprecated('Use autoCompleteRpcModelDescriptor instead')
const AutoCompleteRpcModel_LocalEnvEntry$json = const {
  '1': 'LocalEnvEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': const {'7': true},
};

@$core.Deprecated('Use autoCompleteRpcModelDescriptor instead')
const AutoCompleteRpcModel_GlobalEnvEntry$json = const {
  '1': 'GlobalEnvEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `AutoCompleteRpcModel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List autoCompleteRpcModelDescriptor = $convert.base64Decode('ChRBdXRvQ29tcGxldGVScGNNb2RlbBIwCgVpdGVtcxgBIAMoCzIaLkF1dG9Db21wbGV0ZVJwY01vZGVsLkl0ZW1SBWl0ZW1zEj8KCGxvY2FsRW52GAogAygLMiMuQXV0b0NvbXBsZXRlUnBjTW9kZWwuTG9jYWxFbnZFbnRyeVIIbG9jYWxFbnYSQgoJZ2xvYmFsRW52GAsgAygLMiQuQXV0b0NvbXBsZXRlUnBjTW9kZWwuR2xvYmFsRW52RW50cnlSCWdsb2JhbEVudhIlCg5lbmFibGVfc3VjY2VzcxgUIAEoCFINZW5hYmxlU3VjY2VzcxIfCgtlbmFibGVfZmFpbBgVIAEoCFIKZW5hYmxlRmFpbBIdCgppc19zdWNjZXNzGBYgASgIUglpc1N1Y2Nlc3MSJQoOZmFpbGVkX21lc3NhZ2UYFyABKAlSDWZhaWxlZE1lc3NhZ2UaVAoESXRlbRIUCgV0aXRsZRgBIAEoCVIFdGl0bGUSGgoIc3VidGl0bGUYAiABKAlSCHN1YnRpdGxlEhoKCGNvbXBsZXRlGAMgASgJUghjb21wbGV0ZRo7Cg1Mb2NhbEVudkVudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgJUgV2YWx1ZToCOAEaPAoOR2xvYmFsRW52RW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4AQ==');
