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
    const {'1': 'target', '3': 7, '4': 1, '5': 9, '10': 'target'},
  ],
};

/// Descriptor for `ImageRpcModel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageRpcModelDescriptor = $convert.base64Decode(
    'Cg1JbWFnZVJwY01vZGVsEhAKA3VybBgBIAEoCVIDdXJsEhoKCGNhY2hlS2V5GAIgASgJUghjYWNoZUtleRIUCgV3aWR0aBgDIAEoAVIFd2lkdGgSFgoGaGVpZ2h0GAQgASgBUgZoZWlnaHQSEgoEaW1nWBgFIAEoAVIEaW1nWBISCgRpbWdZGAYgASgBUgRpbWdZEhYKBnRhcmdldBgHIAEoCVIGdGFyZ2V0');
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
final $typed_data.Uint8List colorRpcModelDescriptor = $convert.base64Decode(
    'Cg1Db2xvclJwY01vZGVsEgwKAWEYASABKAVSAWESDAoBchgCIAEoBVIBchIMCgFnGAMgASgFUgFnEgwKAWIYBCABKAVSAWI=');
@$core.Deprecated('Use listRpcModelDescriptor instead')
const ListRpcModel$json = const {
  '1': 'ListRpcModel',
  '2': const [
    const {
      '1': 'items',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.ListRpcModel.Item',
      '10': 'items'
    },
    const {
      '1': 'localEnv',
      '3': 10,
      '4': 3,
      '5': 11,
      '6': '.ListRpcModel.LocalEnvEntry',
      '10': 'localEnv'
    },
    const {
      '1': 'globalEnv',
      '3': 11,
      '4': 3,
      '5': 11,
      '6': '.ListRpcModel.GlobalEnvEntry',
      '10': 'globalEnv'
    },
  ],
  '3': const [
    ListRpcModel_Tag$json,
    ListRpcModel_Item$json,
    ListRpcModel_LocalEnvEntry$json,
    ListRpcModel_GlobalEnvEntry$json
  ],
};

@$core.Deprecated('Use listRpcModelDescriptor instead')
const ListRpcModel_Tag$json = const {
  '1': 'Tag',
  '2': const [
    const {'1': 'text', '3': 1, '4': 1, '5': 9, '10': 'text'},
    const {
      '1': 'color',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.ColorRpcModel',
      '10': 'color'
    },
  ],
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
    const {
      '1': 'preview_img',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.ImageRpcModel',
      '10': 'previewImg'
    },
    const {
      '1': 'tag',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.ListRpcModel.Tag',
      '10': 'tag'
    },
    const {
      '1': 'badges',
      '3': 11,
      '4': 3,
      '5': 11,
      '6': '.ListRpcModel.Tag',
      '10': 'badges'
    },
    const {'1': 'paper', '3': 12, '4': 1, '5': 9, '10': 'paper'},
    const {'1': 'next_page', '3': 20, '4': 1, '5': 9, '10': 'nextPage'},
    const {'1': 'id_code', '3': 21, '4': 1, '5': 9, '10': 'idCode'},
    const {
      '1': 'env',
      '3': 30,
      '4': 3,
      '5': 11,
      '6': '.ListRpcModel.Item.EnvEntry',
      '10': 'env'
    },
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
final $typed_data.Uint8List listRpcModelDescriptor = $convert.base64Decode(
    'CgxMaXN0UnBjTW9kZWwSKAoFaXRlbXMYASADKAsyEi5MaXN0UnBjTW9kZWwuSXRlbVIFaXRlbXMSNwoIbG9jYWxFbnYYCiADKAsyGy5MaXN0UnBjTW9kZWwuTG9jYWxFbnZFbnRyeVIIbG9jYWxFbnYSOgoJZ2xvYmFsRW52GAsgAygLMhwuTGlzdFJwY01vZGVsLkdsb2JhbEVudkVudHJ5UglnbG9iYWxFbnYaPwoDVGFnEhIKBHRleHQYASABKAlSBHRleHQSJAoFY29sb3IYAiABKAsyDi5Db2xvclJwY01vZGVsUgVjb2xvchq+AwoESXRlbRIUCgV0aXRsZRgBIAEoCVIFdGl0bGUSGgoIc3VidGl0bGUYAiABKAlSCHN1YnRpdGxlEh8KC3VwbG9hZF90aW1lGAMgASgJUgp1cGxvYWRUaW1lEhIKBHN0YXIYBCABKAFSBHN0YXISGwoJaW1nX2NvdW50GAUgASgFUghpbWdDb3VudBIvCgtwcmV2aWV3X2ltZxgGIAEoCzIOLkltYWdlUnBjTW9kZWxSCnByZXZpZXdJbWcSIwoDdGFnGAogASgLMhEuTGlzdFJwY01vZGVsLlRhZ1IDdGFnEikKBmJhZGdlcxgLIAMoCzIRLkxpc3RScGNNb2RlbC5UYWdSBmJhZGdlcxIUCgVwYXBlchgMIAEoCVIFcGFwZXISGwoJbmV4dF9wYWdlGBQgASgJUghuZXh0UGFnZRIXCgdpZF9jb2RlGBUgASgJUgZpZENvZGUSLQoDZW52GB4gAygLMhsuTGlzdFJwY01vZGVsLkl0ZW0uRW52RW50cnlSA2Vudho2CghFbnZFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6AjgBGjsKDUxvY2FsRW52RW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4ARo8Cg5HbG9iYWxFbnZFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6AjgB');
@$core.Deprecated('Use detailRpcModelDescriptor instead')
const DetailRpcModel$json = const {
  '1': 'DetailRpcModel',
  '2': const [
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'subtitle', '3': 2, '4': 1, '5': 9, '10': 'subtitle'},
    const {'1': 'language', '3': 3, '4': 1, '5': 9, '10': 'language'},
    const {'1': 'image_count', '3': 4, '4': 1, '5': 5, '10': 'imageCount'},
    const {'1': 'upload_time', '3': 5, '4': 1, '5': 9, '10': 'uploadTime'},
    const {'1': 'count_pre_page', '3': 6, '4': 1, '5': 5, '10': 'countPrePage'},
    const {'1': 'description', '3': 7, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'star', '3': 8, '4': 1, '5': 1, '10': 'star'},
    const {
      '1': 'tag',
      '3': 20,
      '4': 1,
      '5': 11,
      '6': '.DetailRpcModel.Tag',
      '10': 'tag'
    },
    const {
      '1': 'badges',
      '3': 21,
      '4': 3,
      '5': 11,
      '6': '.DetailRpcModel.Badge',
      '10': 'badges'
    },
    const {
      '1': 'comments',
      '3': 22,
      '4': 3,
      '5': 11,
      '6': '.DetailRpcModel.Comment',
      '10': 'comments'
    },
  ],
  '3': const [
    DetailRpcModel_Tag$json,
    DetailRpcModel_Badge$json,
    DetailRpcModel_Comment$json
  ],
};

@$core.Deprecated('Use detailRpcModelDescriptor instead')
const DetailRpcModel_Tag$json = const {
  '1': 'Tag',
  '2': const [
    const {'1': 'text', '3': 1, '4': 1, '5': 9, '10': 'text'},
    const {
      '1': 'color',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.ColorRpcModel',
      '10': 'color'
    },
    const {
      '1': 'env',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.DetailRpcModel.Tag.EnvEntry',
      '10': 'env'
    },
  ],
  '3': const [DetailRpcModel_Tag_EnvEntry$json],
};

@$core.Deprecated('Use detailRpcModelDescriptor instead')
const DetailRpcModel_Tag_EnvEntry$json = const {
  '1': 'EnvEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': const {'7': true},
};

@$core.Deprecated('Use detailRpcModelDescriptor instead')
const DetailRpcModel_Badge$json = const {
  '1': 'Badge',
  '2': const [
    const {'1': 'text', '3': 1, '4': 1, '5': 9, '10': 'text'},
    const {'1': 'category', '3': 2, '4': 1, '5': 9, '10': 'category'},
  ],
};

@$core.Deprecated('Use detailRpcModelDescriptor instead')
const DetailRpcModel_Comment$json = const {
  '1': 'Comment',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'content', '3': 2, '4': 1, '5': 9, '10': 'content'},
    const {'1': 'time', '3': 3, '4': 1, '5': 9, '10': 'time'},
    const {'1': 'score', '3': 4, '4': 1, '5': 9, '10': 'score'},
  ],
};

/// Descriptor for `DetailRpcModel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List detailRpcModelDescriptor = $convert.base64Decode(
    'Cg5EZXRhaWxScGNNb2RlbBIUCgV0aXRsZRgBIAEoCVIFdGl0bGUSGgoIc3VidGl0bGUYAiABKAlSCHN1YnRpdGxlEhoKCGxhbmd1YWdlGAMgASgJUghsYW5ndWFnZRIfCgtpbWFnZV9jb3VudBgEIAEoBVIKaW1hZ2VDb3VudBIfCgt1cGxvYWRfdGltZRgFIAEoCVIKdXBsb2FkVGltZRIkCg5jb3VudF9wcmVfcGFnZRgGIAEoBVIMY291bnRQcmVQYWdlEiAKC2Rlc2NyaXB0aW9uGAcgASgJUgtkZXNjcmlwdGlvbhISCgRzdGFyGAggASgBUgRzdGFyEiUKA3RhZxgUIAEoCzITLkRldGFpbFJwY01vZGVsLlRhZ1IDdGFnEi0KBmJhZGdlcxgVIAMoCzIVLkRldGFpbFJwY01vZGVsLkJhZGdlUgZiYWRnZXMSMwoIY29tbWVudHMYFiADKAsyFy5EZXRhaWxScGNNb2RlbC5Db21tZW50Ughjb21tZW50cxqnAQoDVGFnEhIKBHRleHQYASABKAlSBHRleHQSJAoFY29sb3IYAiABKAsyDi5Db2xvclJwY01vZGVsUgVjb2xvchIuCgNlbnYYAyADKAsyHC5EZXRhaWxScGNNb2RlbC5UYWcuRW52RW50cnlSA2Vudho2CghFbnZFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6AjgBGjcKBUJhZGdlEhIKBHRleHQYASABKAlSBHRleHQSGgoIY2F0ZWdvcnkYAiABKAlSCGNhdGVnb3J5GmkKB0NvbW1lbnQSGgoIdXNlcm5hbWUYASABKAlSCHVzZXJuYW1lEhgKB2NvbnRlbnQYAiABKAlSB2NvbnRlbnQSEgoEdGltZRgDIAEoCVIEdGltZRIUCgVzY29yZRgEIAEoCVIFc2NvcmU=');
