///
//  Generated code. Do not modify.
//  source: parser.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use imageParserDescriptor instead')
const ImageParser$json = const {
  '1': 'ImageParser',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'uuid', '3': 2, '4': 1, '5': 9, '10': 'uuid'},
    const {'1': 'id', '3': 3, '4': 1, '5': 11, '6': '.Selector', '10': 'id'},
    const {
      '1': 'image',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.ImageSelector',
      '10': 'image'
    },
    const {
      '1': 'larger_image',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'largerImage'
    },
    const {
      '1': 'raw_image',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'rawImage'
    },
    const {
      '1': 'upload_time',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'uploadTime'
    },
    const {
      '1': 'source',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'source'
    },
    const {
      '1': 'rating',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'rating'
    },
    const {
      '1': 'score',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'score'
    },
    const {
      '1': 'uploader_avatar',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.ImageSelector',
      '10': 'uploaderAvatar'
    },
    const {
      '1': 'extra_selector',
      '3': 99,
      '4': 3,
      '5': 11,
      '6': '.ExtraSelector',
      '10': 'extraSelector'
    },
  ],
};

/// Descriptor for `ImageParser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageParserDescriptor = $convert.base64Decode(
    'CgtJbWFnZVBhcnNlchISCgRuYW1lGAEgASgJUgRuYW1lEhIKBHV1aWQYAiABKAlSBHV1aWQSGQoCaWQYAyABKAsyCS5TZWxlY3RvclICaWQSJAoFaW1hZ2UYBCABKAsyDi5JbWFnZVNlbGVjdG9yUgVpbWFnZRIsCgxsYXJnZXJfaW1hZ2UYBSABKAsyCS5TZWxlY3RvclILbGFyZ2VySW1hZ2USJgoJcmF3X2ltYWdlGAYgASgLMgkuU2VsZWN0b3JSCHJhd0ltYWdlEioKC3VwbG9hZF90aW1lGAcgASgLMgkuU2VsZWN0b3JSCnVwbG9hZFRpbWUSIQoGc291cmNlGAggASgLMgkuU2VsZWN0b3JSBnNvdXJjZRIhCgZyYXRpbmcYCSABKAsyCS5TZWxlY3RvclIGcmF0aW5nEh8KBXNjb3JlGAogASgLMgkuU2VsZWN0b3JSBXNjb3JlEjcKD3VwbG9hZGVyX2F2YXRhchgLIAEoCzIOLkltYWdlU2VsZWN0b3JSDnVwbG9hZGVyQXZhdGFyEjUKDmV4dHJhX3NlbGVjdG9yGGMgAygLMg4uRXh0cmFTZWxlY3RvclINZXh0cmFTZWxlY3Rvcg==');
@$core.Deprecated('Use listViewParserDescriptor instead')
const ListViewParser$json = const {
  '1': 'ListViewParser',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'uuid', '3': 2, '4': 1, '5': 9, '10': 'uuid'},
    const {
      '1': 'item_selector',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'itemSelector'
    },
    const {
      '1': 'title',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'title'
    },
    const {
      '1': 'subtitle',
      '3': 12,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'subtitle'
    },
    const {
      '1': 'upload_time',
      '3': 13,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'uploadTime'
    },
    const {
      '1': 'star',
      '3': 14,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'star'
    },
    const {
      '1': 'img_count',
      '3': 15,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'imgCount'
    },
    const {
      '1': 'preview_img',
      '3': 16,
      '4': 1,
      '5': 11,
      '6': '.ImageSelector',
      '10': 'previewImg'
    },
    const {'1': 'tag', '3': 20, '4': 1, '5': 11, '6': '.Selector', '10': 'tag'},
    const {
      '1': 'tag_color',
      '3': 21,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'tagColor'
    },
    const {
      '1': 'badge_selector',
      '3': 22,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'badgeSelector'
    },
    const {
      '1': 'badge_text',
      '3': 23,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'badgeText'
    },
    const {
      '1': 'badge_color',
      '3': 24,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'badgeColor'
    },
    const {
      '1': 'paper',
      '3': 25,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'paper'
    },
    const {
      '1': 'next_page',
      '3': 30,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'nextPage'
    },
    const {
      '1': 'id_code',
      '3': 31,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'idCode'
    },
    const {
      '1': 'extra_selector',
      '3': 99,
      '4': 3,
      '5': 11,
      '6': '.ExtraSelector',
      '10': 'extraSelector'
    },
  ],
};

/// Descriptor for `ListViewParser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listViewParserDescriptor = $convert.base64Decode(
    'Cg5MaXN0Vmlld1BhcnNlchISCgRuYW1lGAEgASgJUgRuYW1lEhIKBHV1aWQYAiABKAlSBHV1aWQSLgoNaXRlbV9zZWxlY3RvchgKIAEoCzIJLlNlbGVjdG9yUgxpdGVtU2VsZWN0b3ISHwoFdGl0bGUYCyABKAsyCS5TZWxlY3RvclIFdGl0bGUSJQoIc3VidGl0bGUYDCABKAsyCS5TZWxlY3RvclIIc3VidGl0bGUSKgoLdXBsb2FkX3RpbWUYDSABKAsyCS5TZWxlY3RvclIKdXBsb2FkVGltZRIdCgRzdGFyGA4gASgLMgkuU2VsZWN0b3JSBHN0YXISJgoJaW1nX2NvdW50GA8gASgLMgkuU2VsZWN0b3JSCGltZ0NvdW50Ei8KC3ByZXZpZXdfaW1nGBAgASgLMg4uSW1hZ2VTZWxlY3RvclIKcHJldmlld0ltZxIbCgN0YWcYFCABKAsyCS5TZWxlY3RvclIDdGFnEiYKCXRhZ19jb2xvchgVIAEoCzIJLlNlbGVjdG9yUgh0YWdDb2xvchIwCg5iYWRnZV9zZWxlY3RvchgWIAEoCzIJLlNlbGVjdG9yUg1iYWRnZVNlbGVjdG9yEigKCmJhZGdlX3RleHQYFyABKAsyCS5TZWxlY3RvclIJYmFkZ2VUZXh0EioKC2JhZGdlX2NvbG9yGBggASgLMgkuU2VsZWN0b3JSCmJhZGdlQ29sb3ISHwoFcGFwZXIYGSABKAsyCS5TZWxlY3RvclIFcGFwZXISJgoJbmV4dF9wYWdlGB4gASgLMgkuU2VsZWN0b3JSCG5leHRQYWdlEiIKB2lkX2NvZGUYHyABKAsyCS5TZWxlY3RvclIGaWRDb2RlEjUKDmV4dHJhX3NlbGVjdG9yGGMgAygLMg4uRXh0cmFTZWxlY3RvclINZXh0cmFTZWxlY3Rvcg==');
@$core.Deprecated('Use detailParserDescriptor instead')
const DetailParser$json = const {
  '1': 'DetailParser',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'uuid', '3': 2, '4': 1, '5': 9, '10': 'uuid'},
    const {
      '1': 'title',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'title'
    },
    const {
      '1': 'subtitle',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'subtitle'
    },
    const {
      '1': 'upload_time',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'uploadTime'
    },
    const {
      '1': 'star',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'star'
    },
    const {
      '1': 'img_count',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'imgCount'
    },
    const {
      '1': 'page_count',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'pageCount'
    },
    const {
      '1': 'language',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'language'
    },
    const {
      '1': 'cover_img',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.ImageSelector',
      '10': 'coverImg'
    },
    const {
      '1': 'description',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'description'
    },
    const {
      '1': 'thumbnail_selector',
      '3': 20,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'thumbnailSelector'
    },
    const {
      '1': 'thumbnail',
      '3': 21,
      '4': 1,
      '5': 11,
      '6': '.ImageSelector',
      '10': 'thumbnail'
    },
    const {
      '1': 'thumbnail_url',
      '3': 22,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'thumbnailUrl'
    },
    const {
      '1': 'comment_selector',
      '3': 30,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'commentSelector'
    },
    const {
      '1': 'comment',
      '3': 31,
      '4': 1,
      '5': 11,
      '6': '.CommentSelector',
      '10': 'comment'
    },
    const {'1': 'tag', '3': 40, '4': 1, '5': 11, '6': '.Selector', '10': 'tag'},
    const {
      '1': 'tag_color',
      '3': 41,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'tagColor'
    },
    const {
      '1': 'badge_selector',
      '3': 50,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'badgeSelector'
    },
    const {
      '1': 'badge_text',
      '3': 51,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'badgeText'
    },
    const {
      '1': 'badge_category',
      '3': 52,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'badgeCategory'
    },
    const {
      '1': 'chapter_selector',
      '3': 60,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'chapterSelector'
    },
    const {
      '1': 'chapter_title',
      '3': 61,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'chapterTitle'
    },
    const {
      '1': 'chapter_subtitle',
      '3': 62,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'chapterSubtitle'
    },
    const {
      '1': 'chapter_cover',
      '3': 63,
      '4': 1,
      '5': 11,
      '6': '.ImageSelector',
      '10': 'chapterCover'
    },
    const {
      '1': 'next_page',
      '3': 70,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'nextPage'
    },
    const {
      '1': 'count_pre_page',
      '3': 71,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'countPrePage'
    },
    const {
      '1': 'extra_selector',
      '3': 99,
      '4': 3,
      '5': 11,
      '6': '.ExtraSelector',
      '10': 'extraSelector'
    },
  ],
};

/// Descriptor for `DetailParser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List detailParserDescriptor = $convert.base64Decode(
    'CgxEZXRhaWxQYXJzZXISEgoEbmFtZRgBIAEoCVIEbmFtZRISCgR1dWlkGAIgASgJUgR1dWlkEh8KBXRpdGxlGAMgASgLMgkuU2VsZWN0b3JSBXRpdGxlEiUKCHN1YnRpdGxlGAQgASgLMgkuU2VsZWN0b3JSCHN1YnRpdGxlEioKC3VwbG9hZF90aW1lGAUgASgLMgkuU2VsZWN0b3JSCnVwbG9hZFRpbWUSHQoEc3RhchgGIAEoCzIJLlNlbGVjdG9yUgRzdGFyEiYKCWltZ19jb3VudBgHIAEoCzIJLlNlbGVjdG9yUghpbWdDb3VudBIoCgpwYWdlX2NvdW50GAggASgLMgkuU2VsZWN0b3JSCXBhZ2VDb3VudBIlCghsYW5ndWFnZRgJIAEoCzIJLlNlbGVjdG9yUghsYW5ndWFnZRIrCgljb3Zlcl9pbWcYCiABKAsyDi5JbWFnZVNlbGVjdG9yUghjb3ZlckltZxIrCgtkZXNjcmlwdGlvbhgLIAEoCzIJLlNlbGVjdG9yUgtkZXNjcmlwdGlvbhI4ChJ0aHVtYm5haWxfc2VsZWN0b3IYFCABKAsyCS5TZWxlY3RvclIRdGh1bWJuYWlsU2VsZWN0b3ISLAoJdGh1bWJuYWlsGBUgASgLMg4uSW1hZ2VTZWxlY3RvclIJdGh1bWJuYWlsEi4KDXRodW1ibmFpbF91cmwYFiABKAsyCS5TZWxlY3RvclIMdGh1bWJuYWlsVXJsEjQKEGNvbW1lbnRfc2VsZWN0b3IYHiABKAsyCS5TZWxlY3RvclIPY29tbWVudFNlbGVjdG9yEioKB2NvbW1lbnQYHyABKAsyEC5Db21tZW50U2VsZWN0b3JSB2NvbW1lbnQSGwoDdGFnGCggASgLMgkuU2VsZWN0b3JSA3RhZxImCgl0YWdfY29sb3IYKSABKAsyCS5TZWxlY3RvclIIdGFnQ29sb3ISMAoOYmFkZ2Vfc2VsZWN0b3IYMiABKAsyCS5TZWxlY3RvclINYmFkZ2VTZWxlY3RvchIoCgpiYWRnZV90ZXh0GDMgASgLMgkuU2VsZWN0b3JSCWJhZGdlVGV4dBIwCg5iYWRnZV9jYXRlZ29yeRg0IAEoCzIJLlNlbGVjdG9yUg1iYWRnZUNhdGVnb3J5EjQKEGNoYXB0ZXJfc2VsZWN0b3IYPCABKAsyCS5TZWxlY3RvclIPY2hhcHRlclNlbGVjdG9yEi4KDWNoYXB0ZXJfdGl0bGUYPSABKAsyCS5TZWxlY3RvclIMY2hhcHRlclRpdGxlEjQKEGNoYXB0ZXJfc3VidGl0bGUYPiABKAsyCS5TZWxlY3RvclIPY2hhcHRlclN1YnRpdGxlEjMKDWNoYXB0ZXJfY292ZXIYPyABKAsyDi5JbWFnZVNlbGVjdG9yUgxjaGFwdGVyQ292ZXISJgoJbmV4dF9wYWdlGEYgASgLMgkuU2VsZWN0b3JSCG5leHRQYWdlEi8KDmNvdW50X3ByZV9wYWdlGEcgASgLMgkuU2VsZWN0b3JSDGNvdW50UHJlUGFnZRI1Cg5leHRyYV9zZWxlY3RvchhjIAMoCzIOLkV4dHJhU2VsZWN0b3JSDWV4dHJhU2VsZWN0b3I=');
@$core.Deprecated('Use autoCompleteParserDescriptor instead')
const AutoCompleteParser$json = const {
  '1': 'AutoCompleteParser',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'uuid', '3': 2, '4': 1, '5': 9, '10': 'uuid'},
    const {'1': 'split', '3': 10, '4': 1, '5': 9, '10': 'split'},
    const {
      '1': 'item_selector',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'itemSelector'
    },
    const {
      '1': 'item_complete',
      '3': 12,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'itemComplete'
    },
    const {
      '1': 'item_subtitle',
      '3': 13,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'itemSubtitle'
    },
    const {
      '1': 'item_title',
      '3': 14,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'itemTitle'
    },
    const {
      '1': 'extra_selector',
      '3': 99,
      '4': 3,
      '5': 11,
      '6': '.ExtraSelector',
      '10': 'extraSelector'
    },
  ],
};

/// Descriptor for `AutoCompleteParser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List autoCompleteParserDescriptor = $convert.base64Decode(
    'ChJBdXRvQ29tcGxldGVQYXJzZXISEgoEbmFtZRgBIAEoCVIEbmFtZRISCgR1dWlkGAIgASgJUgR1dWlkEhQKBXNwbGl0GAogASgJUgVzcGxpdBIuCg1pdGVtX3NlbGVjdG9yGAsgASgLMgkuU2VsZWN0b3JSDGl0ZW1TZWxlY3RvchIuCg1pdGVtX2NvbXBsZXRlGAwgASgLMgkuU2VsZWN0b3JSDGl0ZW1Db21wbGV0ZRIuCg1pdGVtX3N1YnRpdGxlGA0gASgLMgkuU2VsZWN0b3JSDGl0ZW1TdWJ0aXRsZRIoCgppdGVtX3RpdGxlGA4gASgLMgkuU2VsZWN0b3JSCWl0ZW1UaXRsZRI1Cg5leHRyYV9zZWxlY3RvchhjIAMoCzIOLkV4dHJhU2VsZWN0b3JSDWV4dHJhU2VsZWN0b3I=');
