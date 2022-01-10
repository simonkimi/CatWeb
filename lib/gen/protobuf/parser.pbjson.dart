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
      '1': 'largerImage',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'largerImage'
    },
    const {
      '1': 'rawImage',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'rawImage'
    },
    const {
      '1': 'uploadTime',
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
      '1': 'uploaderAvatar',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.ImageSelector',
      '10': 'uploaderAvatar'
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

/// Descriptor for `ImageParser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageParserDescriptor = $convert.base64Decode(
    'CgtJbWFnZVBhcnNlchISCgRuYW1lGAEgASgJUgRuYW1lEhIKBHV1aWQYAiABKAlSBHV1aWQSGQoCaWQYAyABKAsyCS5TZWxlY3RvclICaWQSJAoFaW1hZ2UYBCABKAsyDi5JbWFnZVNlbGVjdG9yUgVpbWFnZRIrCgtsYXJnZXJJbWFnZRgFIAEoCzIJLlNlbGVjdG9yUgtsYXJnZXJJbWFnZRIlCghyYXdJbWFnZRgGIAEoCzIJLlNlbGVjdG9yUghyYXdJbWFnZRIpCgp1cGxvYWRUaW1lGAcgASgLMgkuU2VsZWN0b3JSCnVwbG9hZFRpbWUSIQoGc291cmNlGAggASgLMgkuU2VsZWN0b3JSBnNvdXJjZRIhCgZyYXRpbmcYCSABKAsyCS5TZWxlY3RvclIGcmF0aW5nEh8KBXNjb3JlGAogASgLMgkuU2VsZWN0b3JSBXNjb3JlEjYKDnVwbG9hZGVyQXZhdGFyGAsgASgLMg4uSW1hZ2VTZWxlY3RvclIOdXBsb2FkZXJBdmF0YXISNAoNZXh0cmFTZWxlY3RvchhjIAMoCzIOLkV4dHJhU2VsZWN0b3JSDWV4dHJhU2VsZWN0b3I=');
@$core.Deprecated('Use listViewParserDescriptor instead')
const ListViewParser$json = const {
  '1': 'ListViewParser',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'uuid', '3': 2, '4': 1, '5': 9, '10': 'uuid'},
    const {
      '1': 'itemSelector',
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
      '1': 'uploadTime',
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
      '1': 'imgCount',
      '3': 15,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'imgCount'
    },
    const {
      '1': 'previewImg',
      '3': 16,
      '4': 1,
      '5': 11,
      '6': '.ImageSelector',
      '10': 'previewImg'
    },
    const {'1': 'tag', '3': 20, '4': 1, '5': 11, '6': '.Selector', '10': 'tag'},
    const {
      '1': 'tagColor',
      '3': 21,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'tagColor'
    },
    const {
      '1': 'badgeSelector',
      '3': 22,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'badgeSelector'
    },
    const {
      '1': 'badgeText',
      '3': 23,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'badgeText'
    },
    const {
      '1': 'badgeColor',
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
      '1': 'nextPage',
      '3': 30,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'nextPage'
    },
    const {
      '1': 'idCode',
      '3': 31,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'idCode'
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

/// Descriptor for `ListViewParser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listViewParserDescriptor = $convert.base64Decode(
    'Cg5MaXN0Vmlld1BhcnNlchISCgRuYW1lGAEgASgJUgRuYW1lEhIKBHV1aWQYAiABKAlSBHV1aWQSLQoMaXRlbVNlbGVjdG9yGAogASgLMgkuU2VsZWN0b3JSDGl0ZW1TZWxlY3RvchIfCgV0aXRsZRgLIAEoCzIJLlNlbGVjdG9yUgV0aXRsZRIlCghzdWJ0aXRsZRgMIAEoCzIJLlNlbGVjdG9yUghzdWJ0aXRsZRIpCgp1cGxvYWRUaW1lGA0gASgLMgkuU2VsZWN0b3JSCnVwbG9hZFRpbWUSHQoEc3RhchgOIAEoCzIJLlNlbGVjdG9yUgRzdGFyEiUKCGltZ0NvdW50GA8gASgLMgkuU2VsZWN0b3JSCGltZ0NvdW50Ei4KCnByZXZpZXdJbWcYECABKAsyDi5JbWFnZVNlbGVjdG9yUgpwcmV2aWV3SW1nEhsKA3RhZxgUIAEoCzIJLlNlbGVjdG9yUgN0YWcSJQoIdGFnQ29sb3IYFSABKAsyCS5TZWxlY3RvclIIdGFnQ29sb3ISLwoNYmFkZ2VTZWxlY3RvchgWIAEoCzIJLlNlbGVjdG9yUg1iYWRnZVNlbGVjdG9yEicKCWJhZGdlVGV4dBgXIAEoCzIJLlNlbGVjdG9yUgliYWRnZVRleHQSKQoKYmFkZ2VDb2xvchgYIAEoCzIJLlNlbGVjdG9yUgpiYWRnZUNvbG9yEh8KBXBhcGVyGBkgASgLMgkuU2VsZWN0b3JSBXBhcGVyEiUKCG5leHRQYWdlGB4gASgLMgkuU2VsZWN0b3JSCG5leHRQYWdlEiEKBmlkQ29kZRgfIAEoCzIJLlNlbGVjdG9yUgZpZENvZGUSNAoNZXh0cmFTZWxlY3RvchhjIAMoCzIOLkV4dHJhU2VsZWN0b3JSDWV4dHJhU2VsZWN0b3I=');
@$core.Deprecated('Use galleryParserDescriptor instead')
const GalleryParser$json = const {
  '1': 'GalleryParser',
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
      '1': 'pageCount',
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
      '1': 'coverImg',
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
      '1': 'thumbnailSelector',
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
      '1': 'thumbnailUrl',
      '3': 22,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'thumbnailUrl'
    },
    const {
      '1': 'commentSelector',
      '3': 30,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'commentSelector'
    },
    const {
      '1': 'comments',
      '3': 31,
      '4': 1,
      '5': 11,
      '6': '.CommentSelector',
      '10': 'comments'
    },
    const {'1': 'tag', '3': 40, '4': 1, '5': 11, '6': '.Selector', '10': 'tag'},
    const {
      '1': 'tagColor',
      '3': 41,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'tagColor'
    },
    const {
      '1': 'badgeSelector',
      '3': 50,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'badgeSelector'
    },
    const {
      '1': 'badgeText',
      '3': 51,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'badgeText'
    },
    const {
      '1': 'badgeColor',
      '3': 52,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'badgeColor'
    },
    const {
      '1': 'badgeType',
      '3': 53,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'badgeType'
    },
    const {
      '1': 'chapterSelector',
      '3': 60,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'chapterSelector'
    },
    const {
      '1': 'chapterTitle',
      '3': 61,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'chapterTitle'
    },
    const {
      '1': 'chapterSubtitle',
      '3': 62,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'chapterSubtitle'
    },
    const {
      '1': 'chapterCover',
      '3': 63,
      '4': 1,
      '5': 11,
      '6': '.ImageSelector',
      '10': 'chapterCover'
    },
    const {
      '1': 'nextPage',
      '3': 70,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'nextPage'
    },
    const {
      '1': 'prePageImageCount',
      '3': 71,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'prePageImageCount'
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
    'Cg1HYWxsZXJ5UGFyc2VyEhIKBG5hbWUYASABKAlSBG5hbWUSEgoEdXVpZBgCIAEoCVIEdXVpZBIfCgV0aXRsZRgDIAEoCzIJLlNlbGVjdG9yUgV0aXRsZRIlCghzdWJ0aXRsZRgEIAEoCzIJLlNlbGVjdG9yUghzdWJ0aXRsZRIpCgp1cGxvYWRUaW1lGAUgASgLMgkuU2VsZWN0b3JSCnVwbG9hZFRpbWUSHQoEc3RhchgGIAEoCzIJLlNlbGVjdG9yUgRzdGFyEiUKCGltZ0NvdW50GAcgASgLMgkuU2VsZWN0b3JSCGltZ0NvdW50EicKCXBhZ2VDb3VudBgIIAEoCzIJLlNlbGVjdG9yUglwYWdlQ291bnQSJQoIbGFuZ3VhZ2UYCSABKAsyCS5TZWxlY3RvclIIbGFuZ3VhZ2USKgoIY292ZXJJbWcYCiABKAsyDi5JbWFnZVNlbGVjdG9yUghjb3ZlckltZxIrCgtkZXNjcmlwdGlvbhgLIAEoCzIJLlNlbGVjdG9yUgtkZXNjcmlwdGlvbhI3ChF0aHVtYm5haWxTZWxlY3RvchgUIAEoCzIJLlNlbGVjdG9yUhF0aHVtYm5haWxTZWxlY3RvchIsCgl0aHVtYm5haWwYFSABKAsyDi5JbWFnZVNlbGVjdG9yUgl0aHVtYm5haWwSLQoMdGh1bWJuYWlsVXJsGBYgASgLMgkuU2VsZWN0b3JSDHRodW1ibmFpbFVybBIzCg9jb21tZW50U2VsZWN0b3IYHiABKAsyCS5TZWxlY3RvclIPY29tbWVudFNlbGVjdG9yEiwKCGNvbW1lbnRzGB8gASgLMhAuQ29tbWVudFNlbGVjdG9yUghjb21tZW50cxIbCgN0YWcYKCABKAsyCS5TZWxlY3RvclIDdGFnEiUKCHRhZ0NvbG9yGCkgASgLMgkuU2VsZWN0b3JSCHRhZ0NvbG9yEi8KDWJhZGdlU2VsZWN0b3IYMiABKAsyCS5TZWxlY3RvclINYmFkZ2VTZWxlY3RvchInCgliYWRnZVRleHQYMyABKAsyCS5TZWxlY3RvclIJYmFkZ2VUZXh0EikKCmJhZGdlQ29sb3IYNCABKAsyCS5TZWxlY3RvclIKYmFkZ2VDb2xvchInCgliYWRnZVR5cGUYNSABKAsyCS5TZWxlY3RvclIJYmFkZ2VUeXBlEjMKD2NoYXB0ZXJTZWxlY3Rvchg8IAEoCzIJLlNlbGVjdG9yUg9jaGFwdGVyU2VsZWN0b3ISLQoMY2hhcHRlclRpdGxlGD0gASgLMgkuU2VsZWN0b3JSDGNoYXB0ZXJUaXRsZRIzCg9jaGFwdGVyU3VidGl0bGUYPiABKAsyCS5TZWxlY3RvclIPY2hhcHRlclN1YnRpdGxlEjIKDGNoYXB0ZXJDb3Zlchg/IAEoCzIOLkltYWdlU2VsZWN0b3JSDGNoYXB0ZXJDb3ZlchIlCghuZXh0UGFnZRhGIAEoCzIJLlNlbGVjdG9yUghuZXh0UGFnZRI3ChFwcmVQYWdlSW1hZ2VDb3VudBhHIAEoCzIJLlNlbGVjdG9yUhFwcmVQYWdlSW1hZ2VDb3VudBI0Cg1leHRyYVNlbGVjdG9yGGMgAygLMg4uRXh0cmFTZWxlY3RvclINZXh0cmFTZWxlY3Rvcg==');
