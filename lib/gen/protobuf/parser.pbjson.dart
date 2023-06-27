//
//  Generated code. Do not modify.
//  source: parser.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use parserTypeDescriptor instead')
const ParserType$json = {
  '1': 'ParserType',
  '2': [
    {'1': 'PARSER_TYPE_IMAGE', '2': 0},
    {'1': 'PARSER_TYPE_LIST_VIEW', '2': 1},
    {'1': 'PARSER_TYPE_GALLERY', '2': 2},
    {'1': 'PARSER_TYPE_AUTO_COMPLETE', '2': 3},
  ],
};

/// Descriptor for `ParserType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List parserTypeDescriptor = $convert.base64Decode(
    'CgpQYXJzZXJUeXBlEhUKEVBBUlNFUl9UWVBFX0lNQUdFEAASGQoVUEFSU0VSX1RZUEVfTElTVF'
    '9WSUVXEAESFwoTUEFSU0VSX1RZUEVfR0FMTEVSWRACEh0KGVBBUlNFUl9UWVBFX0FVVE9fQ09N'
    'UExFVEUQAw==');

@$core.Deprecated('Use imageReaderParserDescriptor instead')
const ImageReaderParser$json = {
  '1': 'ImageReaderParser',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'uuid', '3': 2, '4': 1, '5': 9, '10': 'uuid'},
    {'1': 'id', '3': 3, '4': 1, '5': 11, '6': '.Selector', '10': 'id'},
    {'1': 'image', '3': 4, '4': 1, '5': 11, '6': '.ImageSelector', '10': 'image'},
    {'1': 'larger_image', '3': 5, '4': 1, '5': 11, '6': '.Selector', '10': 'largerImage'},
    {'1': 'raw_image', '3': 6, '4': 1, '5': 11, '6': '.Selector', '10': 'rawImage'},
    {'1': 'upload_time', '3': 7, '4': 1, '5': 11, '6': '.Selector', '10': 'uploadTime'},
    {'1': 'source', '3': 8, '4': 1, '5': 11, '6': '.Selector', '10': 'source'},
    {'1': 'rating', '3': 9, '4': 1, '5': 11, '6': '.Selector', '10': 'rating'},
    {'1': 'score', '3': 10, '4': 1, '5': 11, '6': '.Selector', '10': 'score'},
    {'1': 'badge_selector', '3': 20, '4': 1, '5': 11, '6': '.Selector', '10': 'badgeSelector'},
    {'1': 'badge_text', '3': 21, '4': 1, '5': 11, '6': '.Selector', '10': 'badgeText'},
    {'1': 'badge_category', '3': 22, '4': 1, '5': 11, '6': '.Selector', '10': 'badgeCategory'},
    {'1': 'successSelector', '3': 30, '4': 1, '5': 11, '6': '.Selector', '10': 'successSelector'},
    {'1': 'failedSelector', '3': 31, '4': 1, '5': 11, '6': '.Selector', '10': 'failedSelector'},
    {'1': 'extra_selector', '3': 99, '4': 3, '5': 11, '6': '.ExtraSelector', '10': 'extraSelector'},
  ],
};

/// Descriptor for `ImageReaderParser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageReaderParserDescriptor = $convert.base64Decode(
    'ChFJbWFnZVJlYWRlclBhcnNlchISCgRuYW1lGAEgASgJUgRuYW1lEhIKBHV1aWQYAiABKAlSBH'
    'V1aWQSGQoCaWQYAyABKAsyCS5TZWxlY3RvclICaWQSJAoFaW1hZ2UYBCABKAsyDi5JbWFnZVNl'
    'bGVjdG9yUgVpbWFnZRIsCgxsYXJnZXJfaW1hZ2UYBSABKAsyCS5TZWxlY3RvclILbGFyZ2VySW'
    '1hZ2USJgoJcmF3X2ltYWdlGAYgASgLMgkuU2VsZWN0b3JSCHJhd0ltYWdlEioKC3VwbG9hZF90'
    'aW1lGAcgASgLMgkuU2VsZWN0b3JSCnVwbG9hZFRpbWUSIQoGc291cmNlGAggASgLMgkuU2VsZW'
    'N0b3JSBnNvdXJjZRIhCgZyYXRpbmcYCSABKAsyCS5TZWxlY3RvclIGcmF0aW5nEh8KBXNjb3Jl'
    'GAogASgLMgkuU2VsZWN0b3JSBXNjb3JlEjAKDmJhZGdlX3NlbGVjdG9yGBQgASgLMgkuU2VsZW'
    'N0b3JSDWJhZGdlU2VsZWN0b3ISKAoKYmFkZ2VfdGV4dBgVIAEoCzIJLlNlbGVjdG9yUgliYWRn'
    'ZVRleHQSMAoOYmFkZ2VfY2F0ZWdvcnkYFiABKAsyCS5TZWxlY3RvclINYmFkZ2VDYXRlZ29yeR'
    'IzCg9zdWNjZXNzU2VsZWN0b3IYHiABKAsyCS5TZWxlY3RvclIPc3VjY2Vzc1NlbGVjdG9yEjEK'
    'DmZhaWxlZFNlbGVjdG9yGB8gASgLMgkuU2VsZWN0b3JSDmZhaWxlZFNlbGVjdG9yEjUKDmV4dH'
    'JhX3NlbGVjdG9yGGMgAygLMg4uRXh0cmFTZWxlY3RvclINZXh0cmFTZWxlY3Rvcg==');

@$core.Deprecated('Use listViewParserDescriptor instead')
const ListViewParser$json = {
  '1': 'ListViewParser',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'uuid', '3': 2, '4': 1, '5': 9, '10': 'uuid'},
    {'1': 'successSelector', '3': 3, '4': 1, '5': 11, '6': '.Selector', '10': 'successSelector'},
    {'1': 'failedSelector', '3': 4, '4': 1, '5': 11, '6': '.Selector', '10': 'failedSelector'},
    {'1': 'item_selector', '3': 10, '4': 1, '5': 11, '6': '.Selector', '10': 'itemSelector'},
    {'1': 'title', '3': 11, '4': 1, '5': 11, '6': '.Selector', '10': 'title'},
    {'1': 'subtitle', '3': 12, '4': 1, '5': 11, '6': '.Selector', '10': 'subtitle'},
    {'1': 'upload_time', '3': 13, '4': 1, '5': 11, '6': '.Selector', '10': 'uploadTime'},
    {'1': 'star', '3': 14, '4': 1, '5': 11, '6': '.Selector', '10': 'star'},
    {'1': 'img_count', '3': 15, '4': 1, '5': 11, '6': '.Selector', '10': 'imgCount'},
    {'1': 'preview_img', '3': 16, '4': 1, '5': 11, '6': '.ImageSelector', '10': 'previewImg'},
    {'1': 'language', '3': 17, '4': 1, '5': 11, '6': '.Selector', '10': 'language'},
    {'1': 'tag', '3': 20, '4': 1, '5': 11, '6': '.Selector', '10': 'tag'},
    {'1': 'tag_color', '3': 21, '4': 1, '5': 11, '6': '.Selector', '10': 'tagColor'},
    {'1': 'badge_selector', '3': 22, '4': 1, '5': 11, '6': '.Selector', '10': 'badgeSelector'},
    {'1': 'badge_text', '3': 23, '4': 1, '5': 11, '6': '.Selector', '10': 'badgeText'},
    {'1': 'badge_color', '3': 24, '4': 1, '5': 11, '6': '.Selector', '10': 'badgeColor'},
    {'1': 'paper', '3': 25, '4': 1, '5': 11, '6': '.Selector', '10': 'paper'},
    {'1': 'target', '3': 26, '4': 1, '5': 11, '6': '.Selector', '10': 'target'},
    {'1': 'next_page', '3': 30, '4': 1, '5': 11, '6': '.Selector', '10': 'nextPage'},
    {'1': 'id_code', '3': 31, '4': 1, '5': 11, '6': '.Selector', '10': 'idCode'},
    {'1': 'extra_selector', '3': 99, '4': 3, '5': 11, '6': '.ExtraSelector', '10': 'extraSelector'},
  ],
};

/// Descriptor for `ListViewParser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listViewParserDescriptor = $convert.base64Decode(
    'Cg5MaXN0Vmlld1BhcnNlchISCgRuYW1lGAEgASgJUgRuYW1lEhIKBHV1aWQYAiABKAlSBHV1aW'
    'QSMwoPc3VjY2Vzc1NlbGVjdG9yGAMgASgLMgkuU2VsZWN0b3JSD3N1Y2Nlc3NTZWxlY3RvchIx'
    'Cg5mYWlsZWRTZWxlY3RvchgEIAEoCzIJLlNlbGVjdG9yUg5mYWlsZWRTZWxlY3RvchIuCg1pdG'
    'VtX3NlbGVjdG9yGAogASgLMgkuU2VsZWN0b3JSDGl0ZW1TZWxlY3RvchIfCgV0aXRsZRgLIAEo'
    'CzIJLlNlbGVjdG9yUgV0aXRsZRIlCghzdWJ0aXRsZRgMIAEoCzIJLlNlbGVjdG9yUghzdWJ0aX'
    'RsZRIqCgt1cGxvYWRfdGltZRgNIAEoCzIJLlNlbGVjdG9yUgp1cGxvYWRUaW1lEh0KBHN0YXIY'
    'DiABKAsyCS5TZWxlY3RvclIEc3RhchImCglpbWdfY291bnQYDyABKAsyCS5TZWxlY3RvclIIaW'
    '1nQ291bnQSLwoLcHJldmlld19pbWcYECABKAsyDi5JbWFnZVNlbGVjdG9yUgpwcmV2aWV3SW1n'
    'EiUKCGxhbmd1YWdlGBEgASgLMgkuU2VsZWN0b3JSCGxhbmd1YWdlEhsKA3RhZxgUIAEoCzIJLl'
    'NlbGVjdG9yUgN0YWcSJgoJdGFnX2NvbG9yGBUgASgLMgkuU2VsZWN0b3JSCHRhZ0NvbG9yEjAK'
    'DmJhZGdlX3NlbGVjdG9yGBYgASgLMgkuU2VsZWN0b3JSDWJhZGdlU2VsZWN0b3ISKAoKYmFkZ2'
    'VfdGV4dBgXIAEoCzIJLlNlbGVjdG9yUgliYWRnZVRleHQSKgoLYmFkZ2VfY29sb3IYGCABKAsy'
    'CS5TZWxlY3RvclIKYmFkZ2VDb2xvchIfCgVwYXBlchgZIAEoCzIJLlNlbGVjdG9yUgVwYXBlch'
    'IhCgZ0YXJnZXQYGiABKAsyCS5TZWxlY3RvclIGdGFyZ2V0EiYKCW5leHRfcGFnZRgeIAEoCzIJ'
    'LlNlbGVjdG9yUghuZXh0UGFnZRIiCgdpZF9jb2RlGB8gASgLMgkuU2VsZWN0b3JSBmlkQ29kZR'
    'I1Cg5leHRyYV9zZWxlY3RvchhjIAMoCzIOLkV4dHJhU2VsZWN0b3JSDWV4dHJhU2VsZWN0b3I=');

@$core.Deprecated('Use galleryParserDescriptor instead')
const GalleryParser$json = {
  '1': 'GalleryParser',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'uuid', '3': 2, '4': 1, '5': 9, '10': 'uuid'},
    {'1': 'title', '3': 3, '4': 1, '5': 11, '6': '.Selector', '10': 'title'},
    {'1': 'subtitle', '3': 4, '4': 1, '5': 11, '6': '.Selector', '10': 'subtitle'},
    {'1': 'upload_time', '3': 5, '4': 1, '5': 11, '6': '.Selector', '10': 'uploadTime'},
    {'1': 'star', '3': 6, '4': 1, '5': 11, '6': '.Selector', '10': 'star'},
    {'1': 'img_count', '3': 7, '4': 1, '5': 11, '6': '.Selector', '10': 'imgCount'},
    {'1': 'page_count', '3': 8, '4': 1, '5': 11, '6': '.Selector', '10': 'pageCount'},
    {'1': 'language', '3': 9, '4': 1, '5': 11, '6': '.Selector', '10': 'language'},
    {'1': 'cover_img', '3': 10, '4': 1, '5': 11, '6': '.ImageSelector', '10': 'coverImg'},
    {'1': 'description', '3': 11, '4': 1, '5': 11, '6': '.Selector', '10': 'description'},
    {'1': 'thumbnail_selector', '3': 20, '4': 1, '5': 11, '6': '.Selector', '10': 'thumbnailSelector'},
    {'1': 'thumbnail', '3': 21, '4': 1, '5': 11, '6': '.ImageSelector', '10': 'thumbnail'},
    {'1': 'target', '3': 22, '4': 1, '5': 11, '6': '.Selector', '10': 'target'},
    {'1': 'comment_selector', '3': 30, '4': 1, '5': 11, '6': '.Selector', '10': 'commentSelector'},
    {'1': 'comment', '3': 31, '4': 1, '5': 11, '6': '.CommentSelector', '10': 'comment'},
    {'1': 'tag', '3': 40, '4': 1, '5': 11, '6': '.Selector', '10': 'tag'},
    {'1': 'tag_color', '3': 41, '4': 1, '5': 11, '6': '.Selector', '10': 'tagColor'},
    {'1': 'badge_selector', '3': 50, '4': 1, '5': 11, '6': '.Selector', '10': 'badgeSelector'},
    {'1': 'badge_text', '3': 51, '4': 1, '5': 11, '6': '.Selector', '10': 'badgeText'},
    {'1': 'badge_category', '3': 52, '4': 1, '5': 11, '6': '.Selector', '10': 'badgeCategory'},
    {'1': 'chapter_selector', '3': 60, '4': 1, '5': 11, '6': '.Selector', '10': 'chapterSelector'},
    {'1': 'chapter_title', '3': 61, '4': 1, '5': 11, '6': '.Selector', '10': 'chapterTitle'},
    {'1': 'chapter_subtitle', '3': 62, '4': 1, '5': 11, '6': '.Selector', '10': 'chapterSubtitle'},
    {'1': 'chapter_cover', '3': 63, '4': 1, '5': 11, '6': '.ImageSelector', '10': 'chapterCover'},
    {'1': 'next_page', '3': 70, '4': 1, '5': 11, '6': '.Selector', '10': 'nextPage'},
    {'1': 'count_pre_page', '3': 71, '4': 1, '5': 11, '6': '.Selector', '10': 'countPrePage'},
    {'1': 'successSelector', '3': 72, '4': 1, '5': 11, '6': '.Selector', '10': 'successSelector'},
    {'1': 'failedSelector', '3': 73, '4': 1, '5': 11, '6': '.Selector', '10': 'failedSelector'},
    {'1': 'extra_selector', '3': 99, '4': 3, '5': 11, '6': '.ExtraSelector', '10': 'extraSelector'},
  ],
};

/// Descriptor for `GalleryParser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List galleryParserDescriptor = $convert.base64Decode(
    'Cg1HYWxsZXJ5UGFyc2VyEhIKBG5hbWUYASABKAlSBG5hbWUSEgoEdXVpZBgCIAEoCVIEdXVpZB'
    'IfCgV0aXRsZRgDIAEoCzIJLlNlbGVjdG9yUgV0aXRsZRIlCghzdWJ0aXRsZRgEIAEoCzIJLlNl'
    'bGVjdG9yUghzdWJ0aXRsZRIqCgt1cGxvYWRfdGltZRgFIAEoCzIJLlNlbGVjdG9yUgp1cGxvYW'
    'RUaW1lEh0KBHN0YXIYBiABKAsyCS5TZWxlY3RvclIEc3RhchImCglpbWdfY291bnQYByABKAsy'
    'CS5TZWxlY3RvclIIaW1nQ291bnQSKAoKcGFnZV9jb3VudBgIIAEoCzIJLlNlbGVjdG9yUglwYW'
    'dlQ291bnQSJQoIbGFuZ3VhZ2UYCSABKAsyCS5TZWxlY3RvclIIbGFuZ3VhZ2USKwoJY292ZXJf'
    'aW1nGAogASgLMg4uSW1hZ2VTZWxlY3RvclIIY292ZXJJbWcSKwoLZGVzY3JpcHRpb24YCyABKA'
    'syCS5TZWxlY3RvclILZGVzY3JpcHRpb24SOAoSdGh1bWJuYWlsX3NlbGVjdG9yGBQgASgLMgku'
    'U2VsZWN0b3JSEXRodW1ibmFpbFNlbGVjdG9yEiwKCXRodW1ibmFpbBgVIAEoCzIOLkltYWdlU2'
    'VsZWN0b3JSCXRodW1ibmFpbBIhCgZ0YXJnZXQYFiABKAsyCS5TZWxlY3RvclIGdGFyZ2V0EjQK'
    'EGNvbW1lbnRfc2VsZWN0b3IYHiABKAsyCS5TZWxlY3RvclIPY29tbWVudFNlbGVjdG9yEioKB2'
    'NvbW1lbnQYHyABKAsyEC5Db21tZW50U2VsZWN0b3JSB2NvbW1lbnQSGwoDdGFnGCggASgLMgku'
    'U2VsZWN0b3JSA3RhZxImCgl0YWdfY29sb3IYKSABKAsyCS5TZWxlY3RvclIIdGFnQ29sb3ISMA'
    'oOYmFkZ2Vfc2VsZWN0b3IYMiABKAsyCS5TZWxlY3RvclINYmFkZ2VTZWxlY3RvchIoCgpiYWRn'
    'ZV90ZXh0GDMgASgLMgkuU2VsZWN0b3JSCWJhZGdlVGV4dBIwCg5iYWRnZV9jYXRlZ29yeRg0IA'
    'EoCzIJLlNlbGVjdG9yUg1iYWRnZUNhdGVnb3J5EjQKEGNoYXB0ZXJfc2VsZWN0b3IYPCABKAsy'
    'CS5TZWxlY3RvclIPY2hhcHRlclNlbGVjdG9yEi4KDWNoYXB0ZXJfdGl0bGUYPSABKAsyCS5TZW'
    'xlY3RvclIMY2hhcHRlclRpdGxlEjQKEGNoYXB0ZXJfc3VidGl0bGUYPiABKAsyCS5TZWxlY3Rv'
    'clIPY2hhcHRlclN1YnRpdGxlEjMKDWNoYXB0ZXJfY292ZXIYPyABKAsyDi5JbWFnZVNlbGVjdG'
    '9yUgxjaGFwdGVyQ292ZXISJgoJbmV4dF9wYWdlGEYgASgLMgkuU2VsZWN0b3JSCG5leHRQYWdl'
    'Ei8KDmNvdW50X3ByZV9wYWdlGEcgASgLMgkuU2VsZWN0b3JSDGNvdW50UHJlUGFnZRIzCg9zdW'
    'NjZXNzU2VsZWN0b3IYSCABKAsyCS5TZWxlY3RvclIPc3VjY2Vzc1NlbGVjdG9yEjEKDmZhaWxl'
    'ZFNlbGVjdG9yGEkgASgLMgkuU2VsZWN0b3JSDmZhaWxlZFNlbGVjdG9yEjUKDmV4dHJhX3NlbG'
    'VjdG9yGGMgAygLMg4uRXh0cmFTZWxlY3RvclINZXh0cmFTZWxlY3Rvcg==');

@$core.Deprecated('Use autoCompleteParserDescriptor instead')
const AutoCompleteParser$json = {
  '1': 'AutoCompleteParser',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'uuid', '3': 2, '4': 1, '5': 9, '10': 'uuid'},
    {'1': 'item_selector', '3': 11, '4': 1, '5': 11, '6': '.Selector', '10': 'itemSelector'},
    {'1': 'item_title', '3': 14, '4': 1, '5': 11, '6': '.Selector', '10': 'itemTitle'},
    {'1': 'item_subtitle', '3': 13, '4': 1, '5': 11, '6': '.Selector', '10': 'itemSubtitle'},
    {'1': 'item_complete', '3': 12, '4': 1, '5': 11, '6': '.Selector', '10': 'itemComplete'},
    {'1': 'successSelector', '3': 20, '4': 1, '5': 11, '6': '.Selector', '10': 'successSelector'},
    {'1': 'failedSelector', '3': 21, '4': 1, '5': 11, '6': '.Selector', '10': 'failedSelector'},
    {'1': 'extra_selector', '3': 99, '4': 3, '5': 11, '6': '.ExtraSelector', '10': 'extraSelector'},
  ],
};

/// Descriptor for `AutoCompleteParser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List autoCompleteParserDescriptor = $convert.base64Decode(
    'ChJBdXRvQ29tcGxldGVQYXJzZXISEgoEbmFtZRgBIAEoCVIEbmFtZRISCgR1dWlkGAIgASgJUg'
    'R1dWlkEi4KDWl0ZW1fc2VsZWN0b3IYCyABKAsyCS5TZWxlY3RvclIMaXRlbVNlbGVjdG9yEigK'
    'Cml0ZW1fdGl0bGUYDiABKAsyCS5TZWxlY3RvclIJaXRlbVRpdGxlEi4KDWl0ZW1fc3VidGl0bG'
    'UYDSABKAsyCS5TZWxlY3RvclIMaXRlbVN1YnRpdGxlEi4KDWl0ZW1fY29tcGxldGUYDCABKAsy'
    'CS5TZWxlY3RvclIMaXRlbUNvbXBsZXRlEjMKD3N1Y2Nlc3NTZWxlY3RvchgUIAEoCzIJLlNlbG'
    'VjdG9yUg9zdWNjZXNzU2VsZWN0b3ISMQoOZmFpbGVkU2VsZWN0b3IYFSABKAsyCS5TZWxlY3Rv'
    'clIOZmFpbGVkU2VsZWN0b3ISNQoOZXh0cmFfc2VsZWN0b3IYYyADKAsyDi5FeHRyYVNlbGVjdG'
    '9yUg1leHRyYVNlbGVjdG9y');

