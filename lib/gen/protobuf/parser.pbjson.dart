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
    const {
      '1': 'image',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.ImageSelector',
      '10': 'image'
    },
    const {'1': 'rawImage', '3': 3, '4': 1, '5': 9, '10': 'rawImage'},
    const {
      '1': 'extraSelector',
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
    'CgtJbWFnZVBhcnNlchISCgRuYW1lGAEgASgJUgRuYW1lEiQKBWltYWdlGAIgASgLMg4uSW1hZ2VTZWxlY3RvclIFaW1hZ2USGgoIcmF3SW1hZ2UYAyABKAlSCHJhd0ltYWdlEjQKDWV4dHJhU2VsZWN0b3IYYyADKAsyDi5FeHRyYVNlbGVjdG9yUg1leHRyYVNlbGVjdG9y');
@$core.Deprecated('Use listViewParserDescriptor instead')
const ListViewParser$json = const {
  '1': 'ListViewParser',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'itemSelector', '3': 2, '4': 1, '5': 9, '10': 'itemSelector'},
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
      '1': 'uploadTime',
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
      '1': 'imgCount',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'imgCount'
    },
    const {
      '1': 'previewImg',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.ImageSelector',
      '10': 'previewImg'
    },
    const {'1': 'tag', '3': 9, '4': 1, '5': 11, '6': '.Selector', '10': 'tag'},
    const {
      '1': 'tagColor',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'tagColor'
    },
    const {
      '1': 'badgeSelector',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'badgeSelector'
    },
    const {
      '1': 'badgeText',
      '3': 12,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'badgeText'
    },
    const {
      '1': 'badgeColor',
      '3': 13,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'badgeColor'
    },
    const {
      '1': 'extraSelector',
      '3': 99,
      '4': 3,
      '5': 11,
      '6': '.ExtraSelector',
      '10': 'extraSelector'
    },
    const {
      '1': 'nextPage',
      '3': 14,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'nextPage'
    },
  ],
};

/// Descriptor for `ListViewParser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listViewParserDescriptor = $convert.base64Decode(
    'Cg5MaXN0Vmlld1BhcnNlchISCgRuYW1lGAEgASgJUgRuYW1lEiIKDGl0ZW1TZWxlY3RvchgCIAEoCVIMaXRlbVNlbGVjdG9yEh8KBXRpdGxlGAMgASgLMgkuU2VsZWN0b3JSBXRpdGxlEiUKCHN1YnRpdGxlGAQgASgLMgkuU2VsZWN0b3JSCHN1YnRpdGxlEikKCnVwbG9hZFRpbWUYBSABKAsyCS5TZWxlY3RvclIKdXBsb2FkVGltZRIdCgRzdGFyGAYgASgLMgkuU2VsZWN0b3JSBHN0YXISJQoIaW1nQ291bnQYByABKAsyCS5TZWxlY3RvclIIaW1nQ291bnQSLgoKcHJldmlld0ltZxgIIAEoCzIOLkltYWdlU2VsZWN0b3JSCnByZXZpZXdJbWcSGwoDdGFnGAkgASgLMgkuU2VsZWN0b3JSA3RhZxIlCgh0YWdDb2xvchgKIAEoCzIJLlNlbGVjdG9yUgh0YWdDb2xvchIvCg1iYWRnZVNlbGVjdG9yGAsgASgLMgkuU2VsZWN0b3JSDWJhZGdlU2VsZWN0b3ISJwoJYmFkZ2VUZXh0GAwgASgLMgkuU2VsZWN0b3JSCWJhZGdlVGV4dBIpCgpiYWRnZUNvbG9yGA0gASgLMgkuU2VsZWN0b3JSCmJhZGdlQ29sb3ISNAoNZXh0cmFTZWxlY3RvchhjIAMoCzIOLkV4dHJhU2VsZWN0b3JSDWV4dHJhU2VsZWN0b3ISJQoIbmV4dFBhZ2UYDiABKAsyCS5TZWxlY3RvclIIbmV4dFBhZ2U=');
@$core.Deprecated('Use galleryParserDescriptor instead')
const GalleryParser$json = const {
  '1': 'GalleryParser',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {
      '1': 'title',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'title'
    },
    const {
      '1': 'subtitle',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'subtitle'
    },
    const {
      '1': 'uploadTime',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'uploadTime'
    },
    const {
      '1': 'star',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'star'
    },
    const {
      '1': 'imgCount',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'imgCount'
    },
    const {
      '1': 'prePageImg',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'prePageImg'
    },
    const {
      '1': 'language',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'language'
    },
    const {
      '1': 'coverImg',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.ImageSelector',
      '10': 'coverImg'
    },
    const {
      '1': 'description',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'description'
    },
    const {
      '1': 'thumbnailSelector',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'thumbnailSelector'
    },
    const {
      '1': 'thumbnail',
      '3': 12,
      '4': 1,
      '5': 11,
      '6': '.ImageSelector',
      '10': 'thumbnail'
    },
    const {
      '1': 'thumbnailUrl',
      '3': 13,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'thumbnailUrl'
    },
    const {
      '1': 'commentSelector',
      '3': 14,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'commentSelector'
    },
    const {
      '1': 'comments',
      '3': 15,
      '4': 1,
      '5': 11,
      '6': '.CommentSelector',
      '10': 'comments'
    },
    const {'1': 'tag', '3': 16, '4': 1, '5': 11, '6': '.Selector', '10': 'tag'},
    const {
      '1': 'tagColor',
      '3': 17,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'tagColor'
    },
    const {
      '1': 'badgeSelector',
      '3': 18,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'badgeSelector'
    },
    const {
      '1': 'badgeText',
      '3': 19,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'badgeText'
    },
    const {
      '1': 'badgeColor',
      '3': 20,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'badgeColor'
    },
    const {
      '1': 'badgeType',
      '3': 21,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'badgeType'
    },
    const {
      '1': 'nextPage',
      '3': 22,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'nextPage'
    },
    const {
      '1': 'chapterSelector',
      '3': 23,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'chapterSelector'
    },
    const {
      '1': 'chapterTitle',
      '3': 24,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'chapterTitle'
    },
    const {
      '1': 'chapterSubtitle',
      '3': 25,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'chapterSubtitle'
    },
    const {
      '1': 'chapterCover',
      '3': 26,
      '4': 1,
      '5': 11,
      '6': '.ImageSelector',
      '10': 'chapterCover'
    },
    const {
      '1': 'extraSelector',
      '3': 99,
      '4': 3,
      '5': 11,
      '6': '.ExtraSelector',
      '10': 'extraSelector'
    },
  ],
};

/// Descriptor for `GalleryParser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List galleryParserDescriptor = $convert.base64Decode(
    'Cg1HYWxsZXJ5UGFyc2VyEhIKBG5hbWUYASABKAlSBG5hbWUSHwoFdGl0bGUYAiABKAsyCS5TZWxlY3RvclIFdGl0bGUSJQoIc3VidGl0bGUYAyABKAsyCS5TZWxlY3RvclIIc3VidGl0bGUSKQoKdXBsb2FkVGltZRgEIAEoCzIJLlNlbGVjdG9yUgp1cGxvYWRUaW1lEh0KBHN0YXIYBSABKAsyCS5TZWxlY3RvclIEc3RhchIlCghpbWdDb3VudBgGIAEoCzIJLlNlbGVjdG9yUghpbWdDb3VudBIpCgpwcmVQYWdlSW1nGAcgASgLMgkuU2VsZWN0b3JSCnByZVBhZ2VJbWcSJQoIbGFuZ3VhZ2UYCCABKAsyCS5TZWxlY3RvclIIbGFuZ3VhZ2USKgoIY292ZXJJbWcYCSABKAsyDi5JbWFnZVNlbGVjdG9yUghjb3ZlckltZxIrCgtkZXNjcmlwdGlvbhgKIAEoCzIJLlNlbGVjdG9yUgtkZXNjcmlwdGlvbhI3ChF0aHVtYm5haWxTZWxlY3RvchgLIAEoCzIJLlNlbGVjdG9yUhF0aHVtYm5haWxTZWxlY3RvchIsCgl0aHVtYm5haWwYDCABKAsyDi5JbWFnZVNlbGVjdG9yUgl0aHVtYm5haWwSLQoMdGh1bWJuYWlsVXJsGA0gASgLMgkuU2VsZWN0b3JSDHRodW1ibmFpbFVybBIzCg9jb21tZW50U2VsZWN0b3IYDiABKAsyCS5TZWxlY3RvclIPY29tbWVudFNlbGVjdG9yEiwKCGNvbW1lbnRzGA8gASgLMhAuQ29tbWVudFNlbGVjdG9yUghjb21tZW50cxIbCgN0YWcYECABKAsyCS5TZWxlY3RvclIDdGFnEiUKCHRhZ0NvbG9yGBEgASgLMgkuU2VsZWN0b3JSCHRhZ0NvbG9yEi8KDWJhZGdlU2VsZWN0b3IYEiABKAsyCS5TZWxlY3RvclINYmFkZ2VTZWxlY3RvchInCgliYWRnZVRleHQYEyABKAsyCS5TZWxlY3RvclIJYmFkZ2VUZXh0EikKCmJhZGdlQ29sb3IYFCABKAsyCS5TZWxlY3RvclIKYmFkZ2VDb2xvchInCgliYWRnZVR5cGUYFSABKAsyCS5TZWxlY3RvclIJYmFkZ2VUeXBlEiUKCG5leHRQYWdlGBYgASgLMgkuU2VsZWN0b3JSCG5leHRQYWdlEjMKD2NoYXB0ZXJTZWxlY3RvchgXIAEoCzIJLlNlbGVjdG9yUg9jaGFwdGVyU2VsZWN0b3ISLQoMY2hhcHRlclRpdGxlGBggASgLMgkuU2VsZWN0b3JSDGNoYXB0ZXJUaXRsZRIzCg9jaGFwdGVyU3VidGl0bGUYGSABKAsyCS5TZWxlY3RvclIPY2hhcHRlclN1YnRpdGxlEjIKDGNoYXB0ZXJDb3ZlchgaIAEoCzIOLkltYWdlU2VsZWN0b3JSDGNoYXB0ZXJDb3ZlchI0Cg1leHRyYVNlbGVjdG9yGGMgAygLMg4uRXh0cmFTZWxlY3RvclINZXh0cmFTZWxlY3Rvcg==');
