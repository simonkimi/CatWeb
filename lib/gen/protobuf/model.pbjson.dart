//
//  Generated code. Do not modify.
//  source: model.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use imageRpcModelDescriptor instead')
const ImageRpcModel$json = {
  '1': 'ImageRpcModel',
  '2': [
    {'1': 'url', '3': 1, '4': 1, '5': 9, '10': 'url'},
    {'1': 'cacheKey', '3': 2, '4': 1, '5': 9, '10': 'cacheKey'},
    {'1': 'width', '3': 3, '4': 1, '5': 1, '10': 'width'},
    {'1': 'height', '3': 4, '4': 1, '5': 1, '10': 'height'},
    {'1': 'imgX', '3': 5, '4': 1, '5': 1, '10': 'imgX'},
    {'1': 'imgY', '3': 6, '4': 1, '5': 1, '10': 'imgY'},
  ],
};

/// Descriptor for `ImageRpcModel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageRpcModelDescriptor = $convert.base64Decode(
    'Cg1JbWFnZVJwY01vZGVsEhAKA3VybBgBIAEoCVIDdXJsEhoKCGNhY2hlS2V5GAIgASgJUghjYW'
    'NoZUtleRIUCgV3aWR0aBgDIAEoAVIFd2lkdGgSFgoGaGVpZ2h0GAQgASgBUgZoZWlnaHQSEgoE'
    'aW1nWBgFIAEoAVIEaW1nWBISCgRpbWdZGAYgASgBUgRpbWdZ');

@$core.Deprecated('Use colorRpcModelDescriptor instead')
const ColorRpcModel$json = {
  '1': 'ColorRpcModel',
  '2': [
    {'1': 'a', '3': 1, '4': 1, '5': 5, '10': 'a'},
    {'1': 'r', '3': 2, '4': 1, '5': 5, '10': 'r'},
    {'1': 'g', '3': 3, '4': 1, '5': 5, '10': 'g'},
    {'1': 'b', '3': 4, '4': 1, '5': 5, '10': 'b'},
  ],
};

/// Descriptor for `ColorRpcModel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List colorRpcModelDescriptor = $convert.base64Decode(
    'Cg1Db2xvclJwY01vZGVsEgwKAWEYASABKAVSAWESDAoBchgCIAEoBVIBchIMCgFnGAMgASgFUg'
    'FnEgwKAWIYBCABKAVSAWI=');

@$core.Deprecated('Use tagRpcModelDescriptor instead')
const TagRpcModel$json = {
  '1': 'TagRpcModel',
  '2': [
    {'1': 'text', '3': 1, '4': 1, '5': 9, '10': 'text'},
    {'1': 'color', '3': 2, '4': 1, '5': 11, '6': '.ColorRpcModel', '10': 'color'},
    {'1': 'category', '3': 3, '4': 1, '5': 9, '10': 'category'},
    {'1': 'env', '3': 4, '4': 3, '5': 11, '6': '.TagRpcModel.EnvEntry', '10': 'env'},
  ],
  '3': [TagRpcModel_EnvEntry$json],
};

@$core.Deprecated('Use tagRpcModelDescriptor instead')
const TagRpcModel_EnvEntry$json = {
  '1': 'EnvEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `TagRpcModel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tagRpcModelDescriptor = $convert.base64Decode(
    'CgtUYWdScGNNb2RlbBISCgR0ZXh0GAEgASgJUgR0ZXh0EiQKBWNvbG9yGAIgASgLMg4uQ29sb3'
    'JScGNNb2RlbFIFY29sb3ISGgoIY2F0ZWdvcnkYAyABKAlSCGNhdGVnb3J5EicKA2VudhgEIAMo'
    'CzIVLlRhZ1JwY01vZGVsLkVudkVudHJ5UgNlbnYaNgoIRW52RW50cnkSEAoDa2V5GAEgASgJUg'
    'NrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4AQ==');

@$core.Deprecated('Use listRpcModelDescriptor instead')
const ListRpcModel$json = {
  '1': 'ListRpcModel',
  '2': [
    {'1': 'enable_success', '3': 20, '4': 1, '5': 8, '10': 'enableSuccess'},
    {'1': 'enable_fail', '3': 21, '4': 1, '5': 8, '10': 'enableFail'},
    {'1': 'is_success', '3': 22, '4': 1, '5': 8, '10': 'isSuccess'},
    {'1': 'failed_message', '3': 23, '4': 1, '5': 9, '10': 'failedMessage'},
    {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.ListRpcModel.Item', '10': 'items'},
    {'1': 'next_page', '3': 2, '4': 1, '5': 9, '10': 'nextPage'},
    {'1': 'localEnv', '3': 10, '4': 3, '5': 11, '6': '.ListRpcModel.LocalEnvEntry', '10': 'localEnv'},
    {'1': 'globalEnv', '3': 11, '4': 3, '5': 11, '6': '.ListRpcModel.GlobalEnvEntry', '10': 'globalEnv'},
  ],
  '3': [ListRpcModel_Item$json, ListRpcModel_LocalEnvEntry$json, ListRpcModel_GlobalEnvEntry$json],
};

@$core.Deprecated('Use listRpcModelDescriptor instead')
const ListRpcModel_Item$json = {
  '1': 'Item',
  '2': [
    {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    {'1': 'subtitle', '3': 2, '4': 1, '5': 9, '10': 'subtitle'},
    {'1': 'upload_time', '3': 3, '4': 1, '5': 9, '10': 'uploadTime'},
    {'1': 'star', '3': 4, '4': 1, '5': 1, '10': 'star'},
    {'1': 'img_count', '3': 5, '4': 1, '5': 5, '10': 'imgCount'},
    {'1': 'preview_img', '3': 6, '4': 1, '5': 11, '6': '.ImageRpcModel', '10': 'previewImg'},
    {'1': 'language', '3': 7, '4': 1, '5': 9, '10': 'language'},
    {'1': 'tag', '3': 10, '4': 1, '5': 11, '6': '.TagRpcModel', '10': 'tag'},
    {'1': 'badges', '3': 11, '4': 3, '5': 11, '6': '.TagRpcModel', '10': 'badges'},
    {'1': 'paper', '3': 12, '4': 1, '5': 9, '10': 'paper'},
    {'1': 'target', '3': 13, '4': 1, '5': 9, '10': 'target'},
    {'1': 'next_page', '3': 20, '4': 1, '5': 9, '10': 'nextPage'},
    {'1': 'env', '3': 30, '4': 3, '5': 11, '6': '.ListRpcModel.Item.EnvEntry', '10': 'env'},
  ],
  '3': [ListRpcModel_Item_EnvEntry$json],
};

@$core.Deprecated('Use listRpcModelDescriptor instead')
const ListRpcModel_Item_EnvEntry$json = {
  '1': 'EnvEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use listRpcModelDescriptor instead')
const ListRpcModel_LocalEnvEntry$json = {
  '1': 'LocalEnvEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use listRpcModelDescriptor instead')
const ListRpcModel_GlobalEnvEntry$json = {
  '1': 'GlobalEnvEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `ListRpcModel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listRpcModelDescriptor = $convert.base64Decode(
    'CgxMaXN0UnBjTW9kZWwSJQoOZW5hYmxlX3N1Y2Nlc3MYFCABKAhSDWVuYWJsZVN1Y2Nlc3MSHw'
    'oLZW5hYmxlX2ZhaWwYFSABKAhSCmVuYWJsZUZhaWwSHQoKaXNfc3VjY2VzcxgWIAEoCFIJaXNT'
    'dWNjZXNzEiUKDmZhaWxlZF9tZXNzYWdlGBcgASgJUg1mYWlsZWRNZXNzYWdlEigKBWl0ZW1zGA'
    'EgAygLMhIuTGlzdFJwY01vZGVsLkl0ZW1SBWl0ZW1zEhsKCW5leHRfcGFnZRgCIAEoCVIIbmV4'
    'dFBhZ2USNwoIbG9jYWxFbnYYCiADKAsyGy5MaXN0UnBjTW9kZWwuTG9jYWxFbnZFbnRyeVIIbG'
    '9jYWxFbnYSOgoJZ2xvYmFsRW52GAsgAygLMhwuTGlzdFJwY01vZGVsLkdsb2JhbEVudkVudHJ5'
    'UglnbG9iYWxFbnYazwMKBEl0ZW0SFAoFdGl0bGUYASABKAlSBXRpdGxlEhoKCHN1YnRpdGxlGA'
    'IgASgJUghzdWJ0aXRsZRIfCgt1cGxvYWRfdGltZRgDIAEoCVIKdXBsb2FkVGltZRISCgRzdGFy'
    'GAQgASgBUgRzdGFyEhsKCWltZ19jb3VudBgFIAEoBVIIaW1nQ291bnQSLwoLcHJldmlld19pbW'
    'cYBiABKAsyDi5JbWFnZVJwY01vZGVsUgpwcmV2aWV3SW1nEhoKCGxhbmd1YWdlGAcgASgJUghs'
    'YW5ndWFnZRIeCgN0YWcYCiABKAsyDC5UYWdScGNNb2RlbFIDdGFnEiQKBmJhZGdlcxgLIAMoCz'
    'IMLlRhZ1JwY01vZGVsUgZiYWRnZXMSFAoFcGFwZXIYDCABKAlSBXBhcGVyEhYKBnRhcmdldBgN'
    'IAEoCVIGdGFyZ2V0EhsKCW5leHRfcGFnZRgUIAEoCVIIbmV4dFBhZ2USLQoDZW52GB4gAygLMh'
    'suTGlzdFJwY01vZGVsLkl0ZW0uRW52RW50cnlSA2Vudho2CghFbnZFbnRyeRIQCgNrZXkYASAB'
    'KAlSA2tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6AjgBGjsKDUxvY2FsRW52RW50cnkSEAoDa2'
    'V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4ARo8Cg5HbG9iYWxFbnZFbnRy'
    'eRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6AjgB');

@$core.Deprecated('Use galleryRpcModelDescriptor instead')
const GalleryRpcModel$json = {
  '1': 'GalleryRpcModel',
  '2': [
    {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    {'1': 'subtitle', '3': 2, '4': 1, '5': 9, '10': 'subtitle'},
    {'1': 'language', '3': 3, '4': 1, '5': 9, '10': 'language'},
    {'1': 'image_count', '3': 4, '4': 1, '5': 5, '10': 'imageCount'},
    {'1': 'upload_time', '3': 5, '4': 1, '5': 9, '10': 'uploadTime'},
    {'1': 'count_pre_page', '3': 6, '4': 1, '5': 5, '10': 'countPrePage'},
    {'1': 'description', '3': 7, '4': 1, '5': 9, '10': 'description'},
    {'1': 'star', '3': 8, '4': 1, '5': 1, '10': 'star'},
    {'1': 'items', '3': 9, '4': 3, '5': 11, '6': '.GalleryRpcModel.Item', '10': 'items'},
    {'1': 'cover_img', '3': 10, '4': 1, '5': 11, '6': '.ImageRpcModel', '10': 'coverImg'},
    {'1': 'tag', '3': 20, '4': 1, '5': 11, '6': '.TagRpcModel', '10': 'tag'},
    {'1': 'badges', '3': 21, '4': 3, '5': 11, '6': '.TagRpcModel', '10': 'badges'},
    {'1': 'comments', '3': 22, '4': 3, '5': 11, '6': '.GalleryRpcModel.Comment', '10': 'comments'},
    {'1': 'next_page', '3': 23, '4': 1, '5': 9, '10': 'nextPage'},
    {'1': 'localEnv', '3': 30, '4': 3, '5': 11, '6': '.GalleryRpcModel.LocalEnvEntry', '10': 'localEnv'},
    {'1': 'globalEnv', '3': 31, '4': 3, '5': 11, '6': '.GalleryRpcModel.GlobalEnvEntry', '10': 'globalEnv'},
    {'1': 'enable_success', '3': 40, '4': 1, '5': 8, '10': 'enableSuccess'},
    {'1': 'enable_fail', '3': 41, '4': 1, '5': 8, '10': 'enableFail'},
    {'1': 'is_success', '3': 42, '4': 1, '5': 8, '10': 'isSuccess'},
    {'1': 'failed_message', '3': 43, '4': 1, '5': 9, '10': 'failedMessage'},
  ],
  '3': [GalleryRpcModel_Comment$json, GalleryRpcModel_Item$json, GalleryRpcModel_LocalEnvEntry$json, GalleryRpcModel_GlobalEnvEntry$json],
};

@$core.Deprecated('Use galleryRpcModelDescriptor instead')
const GalleryRpcModel_Comment$json = {
  '1': 'Comment',
  '2': [
    {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    {'1': 'content', '3': 2, '4': 1, '5': 9, '10': 'content'},
    {'1': 'time', '3': 3, '4': 1, '5': 9, '10': 'time'},
    {'1': 'score', '3': 4, '4': 1, '5': 9, '10': 'score'},
    {'1': 'avatar', '3': 5, '4': 1, '5': 11, '6': '.ImageRpcModel', '10': 'avatar'},
  ],
};

@$core.Deprecated('Use galleryRpcModelDescriptor instead')
const GalleryRpcModel_Item$json = {
  '1': 'Item',
  '2': [
    {'1': 'preview_img', '3': 9, '4': 1, '5': 11, '6': '.ImageRpcModel', '10': 'previewImg'},
    {'1': 'target', '3': 10, '4': 1, '5': 9, '10': 'target'},
  ],
};

@$core.Deprecated('Use galleryRpcModelDescriptor instead')
const GalleryRpcModel_LocalEnvEntry$json = {
  '1': 'LocalEnvEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use galleryRpcModelDescriptor instead')
const GalleryRpcModel_GlobalEnvEntry$json = {
  '1': 'GlobalEnvEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `GalleryRpcModel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List galleryRpcModelDescriptor = $convert.base64Decode(
    'Cg9HYWxsZXJ5UnBjTW9kZWwSFAoFdGl0bGUYASABKAlSBXRpdGxlEhoKCHN1YnRpdGxlGAIgAS'
    'gJUghzdWJ0aXRsZRIaCghsYW5ndWFnZRgDIAEoCVIIbGFuZ3VhZ2USHwoLaW1hZ2VfY291bnQY'
    'BCABKAVSCmltYWdlQ291bnQSHwoLdXBsb2FkX3RpbWUYBSABKAlSCnVwbG9hZFRpbWUSJAoOY2'
    '91bnRfcHJlX3BhZ2UYBiABKAVSDGNvdW50UHJlUGFnZRIgCgtkZXNjcmlwdGlvbhgHIAEoCVIL'
    'ZGVzY3JpcHRpb24SEgoEc3RhchgIIAEoAVIEc3RhchIrCgVpdGVtcxgJIAMoCzIVLkdhbGxlcn'
    'lScGNNb2RlbC5JdGVtUgVpdGVtcxIrCgljb3Zlcl9pbWcYCiABKAsyDi5JbWFnZVJwY01vZGVs'
    'Ughjb3ZlckltZxIeCgN0YWcYFCABKAsyDC5UYWdScGNNb2RlbFIDdGFnEiQKBmJhZGdlcxgVIA'
    'MoCzIMLlRhZ1JwY01vZGVsUgZiYWRnZXMSNAoIY29tbWVudHMYFiADKAsyGC5HYWxsZXJ5UnBj'
    'TW9kZWwuQ29tbWVudFIIY29tbWVudHMSGwoJbmV4dF9wYWdlGBcgASgJUghuZXh0UGFnZRI6Cg'
    'hsb2NhbEVudhgeIAMoCzIeLkdhbGxlcnlScGNNb2RlbC5Mb2NhbEVudkVudHJ5Ughsb2NhbEVu'
    'dhI9CglnbG9iYWxFbnYYHyADKAsyHy5HYWxsZXJ5UnBjTW9kZWwuR2xvYmFsRW52RW50cnlSCW'
    'dsb2JhbEVudhIlCg5lbmFibGVfc3VjY2VzcxgoIAEoCFINZW5hYmxlU3VjY2VzcxIfCgtlbmFi'
    'bGVfZmFpbBgpIAEoCFIKZW5hYmxlRmFpbBIdCgppc19zdWNjZXNzGCogASgIUglpc1N1Y2Nlc3'
    'MSJQoOZmFpbGVkX21lc3NhZ2UYKyABKAlSDWZhaWxlZE1lc3NhZ2UakQEKB0NvbW1lbnQSGgoI'
    'dXNlcm5hbWUYASABKAlSCHVzZXJuYW1lEhgKB2NvbnRlbnQYAiABKAlSB2NvbnRlbnQSEgoEdG'
    'ltZRgDIAEoCVIEdGltZRIUCgVzY29yZRgEIAEoCVIFc2NvcmUSJgoGYXZhdGFyGAUgASgLMg4u'
    'SW1hZ2VScGNNb2RlbFIGYXZhdGFyGk8KBEl0ZW0SLwoLcHJldmlld19pbWcYCSABKAsyDi5JbW'
    'FnZVJwY01vZGVsUgpwcmV2aWV3SW1nEhYKBnRhcmdldBgKIAEoCVIGdGFyZ2V0GjsKDUxvY2Fs'
    'RW52RW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4ARo8Cg'
    '5HbG9iYWxFbnZFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6'
    'AjgB');

@$core.Deprecated('Use imageReaderRpcModelDescriptor instead')
const ImageReaderRpcModel$json = {
  '1': 'ImageReaderRpcModel',
  '2': [
    {'1': 'image', '3': 1, '4': 1, '5': 11, '6': '.ImageRpcModel', '10': 'image'},
    {'1': 'larger_image_url', '3': 2, '4': 1, '5': 9, '10': 'largerImageUrl'},
    {'1': 'raw_image_url', '3': 3, '4': 1, '5': 9, '10': 'rawImageUrl'},
    {'1': 'upload_time', '3': 4, '4': 1, '5': 9, '10': 'uploadTime'},
    {'1': 'source', '3': 5, '4': 1, '5': 9, '10': 'source'},
    {'1': 'rating', '3': 6, '4': 1, '5': 9, '10': 'rating'},
    {'1': 'score', '3': 7, '4': 1, '5': 9, '10': 'score'},
    {'1': 'badges', '3': 10, '4': 3, '5': 11, '6': '.TagRpcModel', '10': 'badges'},
    {'1': 'localEnv', '3': 20, '4': 3, '5': 11, '6': '.ImageReaderRpcModel.LocalEnvEntry', '10': 'localEnv'},
    {'1': 'globalEnv', '3': 21, '4': 3, '5': 11, '6': '.ImageReaderRpcModel.GlobalEnvEntry', '10': 'globalEnv'},
    {'1': 'enable_success', '3': 30, '4': 1, '5': 8, '10': 'enableSuccess'},
    {'1': 'enable_fail', '3': 31, '4': 1, '5': 8, '10': 'enableFail'},
    {'1': 'is_success', '3': 32, '4': 1, '5': 8, '10': 'isSuccess'},
    {'1': 'failed_message', '3': 33, '4': 1, '5': 9, '10': 'failedMessage'},
  ],
  '3': [ImageReaderRpcModel_LocalEnvEntry$json, ImageReaderRpcModel_GlobalEnvEntry$json],
};

@$core.Deprecated('Use imageReaderRpcModelDescriptor instead')
const ImageReaderRpcModel_LocalEnvEntry$json = {
  '1': 'LocalEnvEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use imageReaderRpcModelDescriptor instead')
const ImageReaderRpcModel_GlobalEnvEntry$json = {
  '1': 'GlobalEnvEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `ImageReaderRpcModel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageReaderRpcModelDescriptor = $convert.base64Decode(
    'ChNJbWFnZVJlYWRlclJwY01vZGVsEiQKBWltYWdlGAEgASgLMg4uSW1hZ2VScGNNb2RlbFIFaW'
    '1hZ2USKAoQbGFyZ2VyX2ltYWdlX3VybBgCIAEoCVIObGFyZ2VySW1hZ2VVcmwSIgoNcmF3X2lt'
    'YWdlX3VybBgDIAEoCVILcmF3SW1hZ2VVcmwSHwoLdXBsb2FkX3RpbWUYBCABKAlSCnVwbG9hZF'
    'RpbWUSFgoGc291cmNlGAUgASgJUgZzb3VyY2USFgoGcmF0aW5nGAYgASgJUgZyYXRpbmcSFAoF'
    'c2NvcmUYByABKAlSBXNjb3JlEiQKBmJhZGdlcxgKIAMoCzIMLlRhZ1JwY01vZGVsUgZiYWRnZX'
    'MSPgoIbG9jYWxFbnYYFCADKAsyIi5JbWFnZVJlYWRlclJwY01vZGVsLkxvY2FsRW52RW50cnlS'
    'CGxvY2FsRW52EkEKCWdsb2JhbEVudhgVIAMoCzIjLkltYWdlUmVhZGVyUnBjTW9kZWwuR2xvYm'
    'FsRW52RW50cnlSCWdsb2JhbEVudhIlCg5lbmFibGVfc3VjY2VzcxgeIAEoCFINZW5hYmxlU3Vj'
    'Y2VzcxIfCgtlbmFibGVfZmFpbBgfIAEoCFIKZW5hYmxlRmFpbBIdCgppc19zdWNjZXNzGCAgAS'
    'gIUglpc1N1Y2Nlc3MSJQoOZmFpbGVkX21lc3NhZ2UYISABKAlSDWZhaWxlZE1lc3NhZ2UaOwoN'
    'TG9jYWxFbnZFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6Aj'
    'gBGjwKDkdsb2JhbEVudkVudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgJUgV2'
    'YWx1ZToCOAE=');

@$core.Deprecated('Use autoCompleteRpcModelDescriptor instead')
const AutoCompleteRpcModel$json = {
  '1': 'AutoCompleteRpcModel',
  '2': [
    {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.AutoCompleteRpcModel.Item', '10': 'items'},
    {'1': 'localEnv', '3': 10, '4': 3, '5': 11, '6': '.AutoCompleteRpcModel.LocalEnvEntry', '10': 'localEnv'},
    {'1': 'globalEnv', '3': 11, '4': 3, '5': 11, '6': '.AutoCompleteRpcModel.GlobalEnvEntry', '10': 'globalEnv'},
    {'1': 'enable_success', '3': 20, '4': 1, '5': 8, '10': 'enableSuccess'},
    {'1': 'enable_fail', '3': 21, '4': 1, '5': 8, '10': 'enableFail'},
    {'1': 'is_success', '3': 22, '4': 1, '5': 8, '10': 'isSuccess'},
    {'1': 'failed_message', '3': 23, '4': 1, '5': 9, '10': 'failedMessage'},
  ],
  '3': [AutoCompleteRpcModel_Item$json, AutoCompleteRpcModel_LocalEnvEntry$json, AutoCompleteRpcModel_GlobalEnvEntry$json],
};

@$core.Deprecated('Use autoCompleteRpcModelDescriptor instead')
const AutoCompleteRpcModel_Item$json = {
  '1': 'Item',
  '2': [
    {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    {'1': 'subtitle', '3': 2, '4': 1, '5': 9, '10': 'subtitle'},
    {'1': 'complete', '3': 3, '4': 1, '5': 9, '10': 'complete'},
  ],
};

@$core.Deprecated('Use autoCompleteRpcModelDescriptor instead')
const AutoCompleteRpcModel_LocalEnvEntry$json = {
  '1': 'LocalEnvEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use autoCompleteRpcModelDescriptor instead')
const AutoCompleteRpcModel_GlobalEnvEntry$json = {
  '1': 'GlobalEnvEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `AutoCompleteRpcModel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List autoCompleteRpcModelDescriptor = $convert.base64Decode(
    'ChRBdXRvQ29tcGxldGVScGNNb2RlbBIwCgVpdGVtcxgBIAMoCzIaLkF1dG9Db21wbGV0ZVJwY0'
    '1vZGVsLkl0ZW1SBWl0ZW1zEj8KCGxvY2FsRW52GAogAygLMiMuQXV0b0NvbXBsZXRlUnBjTW9k'
    'ZWwuTG9jYWxFbnZFbnRyeVIIbG9jYWxFbnYSQgoJZ2xvYmFsRW52GAsgAygLMiQuQXV0b0NvbX'
    'BsZXRlUnBjTW9kZWwuR2xvYmFsRW52RW50cnlSCWdsb2JhbEVudhIlCg5lbmFibGVfc3VjY2Vz'
    'cxgUIAEoCFINZW5hYmxlU3VjY2VzcxIfCgtlbmFibGVfZmFpbBgVIAEoCFIKZW5hYmxlRmFpbB'
    'IdCgppc19zdWNjZXNzGBYgASgIUglpc1N1Y2Nlc3MSJQoOZmFpbGVkX21lc3NhZ2UYFyABKAlS'
    'DWZhaWxlZE1lc3NhZ2UaVAoESXRlbRIUCgV0aXRsZRgBIAEoCVIFdGl0bGUSGgoIc3VidGl0bG'
    'UYAiABKAlSCHN1YnRpdGxlEhoKCGNvbXBsZXRlGAMgASgJUghjb21wbGV0ZRo7Cg1Mb2NhbEVu'
    'dkVudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgJUgV2YWx1ZToCOAEaPAoOR2'
    'xvYmFsRW52RW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4'
    'AQ==');

