///
import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use imageParserDescriptor instead')
const ImageParser$json = const {
  '1': 'ImageParser',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'id', '3': 2, '4': 1, '5': 11, '6': '.Selector', '10': 'id'},
    const {
      '1': 'image',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.ImageSelector',
      '10': 'image'
    },
    const {
      '1': 'largerImage',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'largerImage'
    },
    const {
      '1': 'rawImage',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'rawImage'
    },
    const {
      '1': 'uploadTime',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'uploadTime'
    },
    const {
      '1': 'source',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'source'
    },
    const {
      '1': 'rating',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'rating'
    },
    const {
      '1': 'score',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'score'
    },
    const {
      '1': 'uploaderAvatar',
      '3': 10,
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
    'CgtJbWFnZVBhcnNlchISCgRuYW1lGAEgASgJUgRuYW1lEhkKAmlkGAIgASgLMgkuU2VsZWN0b3JSAmlkEiQKBWltYWdlGAMgASgLMg4uSW1hZ2VTZWxlY3RvclIFaW1hZ2USKwoLbGFyZ2VySW1hZ2UYBCABKAsyCS5TZWxlY3RvclILbGFyZ2VySW1hZ2USJQoIcmF3SW1hZ2UYBSABKAsyCS5TZWxlY3RvclIIcmF3SW1hZ2USKQoKdXBsb2FkVGltZRgGIAEoCzIJLlNlbGVjdG9yUgp1cGxvYWRUaW1lEiEKBnNvdXJjZRgHIAEoCzIJLlNlbGVjdG9yUgZzb3VyY2USIQoGcmF0aW5nGAggASgLMgkuU2VsZWN0b3JSBnJhdGluZxIfCgVzY29yZRgJIAEoCzIJLlNlbGVjdG9yUgVzY29yZRI2Cg51cGxvYWRlckF2YXRhchgKIAEoCzIOLkltYWdlU2VsZWN0b3JSDnVwbG9hZGVyQXZhdGFyEjQKDWV4dHJhU2VsZWN0b3IYYyADKAsyDi5FeHRyYVNlbGVjdG9yUg1leHRyYVNlbGVjdG9y');
@$core.Deprecated('Use listViewParserDescriptor instead')
const ListViewParser$json = const {
  '1': 'ListViewParser',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {
      '1': 'itemSelector',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'itemSelector'
    },
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
      '1': 'paper',
      '3': 14,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'paper'
    },
    const {
      '1': 'nextPage',
      '3': 98,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'nextPage'
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
    'Cg5MaXN0Vmlld1BhcnNlchISCgRuYW1lGAEgASgJUgRuYW1lEi0KDGl0ZW1TZWxlY3RvchgCIAEoCzIJLlNlbGVjdG9yUgxpdGVtU2VsZWN0b3ISHwoFdGl0bGUYAyABKAsyCS5TZWxlY3RvclIFdGl0bGUSJQoIc3VidGl0bGUYBCABKAsyCS5TZWxlY3RvclIIc3VidGl0bGUSKQoKdXBsb2FkVGltZRgFIAEoCzIJLlNlbGVjdG9yUgp1cGxvYWRUaW1lEh0KBHN0YXIYBiABKAsyCS5TZWxlY3RvclIEc3RhchIlCghpbWdDb3VudBgHIAEoCzIJLlNlbGVjdG9yUghpbWdDb3VudBIuCgpwcmV2aWV3SW1nGAggASgLMg4uSW1hZ2VTZWxlY3RvclIKcHJldmlld0ltZxIbCgN0YWcYCSABKAsyCS5TZWxlY3RvclIDdGFnEiUKCHRhZ0NvbG9yGAogASgLMgkuU2VsZWN0b3JSCHRhZ0NvbG9yEi8KDWJhZGdlU2VsZWN0b3IYCyABKAsyCS5TZWxlY3RvclINYmFkZ2VTZWxlY3RvchInCgliYWRnZVRleHQYDCABKAsyCS5TZWxlY3RvclIJYmFkZ2VUZXh0EikKCmJhZGdlQ29sb3IYDSABKAsyCS5TZWxlY3RvclIKYmFkZ2VDb2xvchIfCgVwYXBlchgOIAEoCzIJLlNlbGVjdG9yUgVwYXBlchIlCghuZXh0UGFnZRhiIAEoCzIJLlNlbGVjdG9yUghuZXh0UGFnZRI0Cg1leHRyYVNlbGVjdG9yGGMgAygLMg4uRXh0cmFTZWxlY3RvclINZXh0cmFTZWxlY3Rvcg==');
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
      '1': 'pageCount',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.Selector',
      '10': 'pageCount'
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
    'Cg1HYWxsZXJ5UGFyc2VyEhIKBG5hbWUYASABKAlSBG5hbWUSHwoFdGl0bGUYAiABKAsyCS5TZWxlY3RvclIFdGl0bGUSJQoIc3VidGl0bGUYAyABKAsyCS5TZWxlY3RvclIIc3VidGl0bGUSKQoKdXBsb2FkVGltZRgEIAEoCzIJLlNlbGVjdG9yUgp1cGxvYWRUaW1lEh0KBHN0YXIYBSABKAsyCS5TZWxlY3RvclIEc3RhchIlCghpbWdDb3VudBgGIAEoCzIJLlNlbGVjdG9yUghpbWdDb3VudBInCglwYWdlQ291bnQYByABKAsyCS5TZWxlY3RvclIJcGFnZUNvdW50EiUKCGxhbmd1YWdlGAggASgLMgkuU2VsZWN0b3JSCGxhbmd1YWdlEioKCGNvdmVySW1nGAkgASgLMg4uSW1hZ2VTZWxlY3RvclIIY292ZXJJbWcSKwoLZGVzY3JpcHRpb24YCiABKAsyCS5TZWxlY3RvclILZGVzY3JpcHRpb24SNwoRdGh1bWJuYWlsU2VsZWN0b3IYCyABKAsyCS5TZWxlY3RvclIRdGh1bWJuYWlsU2VsZWN0b3ISLAoJdGh1bWJuYWlsGAwgASgLMg4uSW1hZ2VTZWxlY3RvclIJdGh1bWJuYWlsEi0KDHRodW1ibmFpbFVybBgNIAEoCzIJLlNlbGVjdG9yUgx0aHVtYm5haWxVcmwSMwoPY29tbWVudFNlbGVjdG9yGA4gASgLMgkuU2VsZWN0b3JSD2NvbW1lbnRTZWxlY3RvchIsCghjb21tZW50cxgPIAEoCzIQLkNvbW1lbnRTZWxlY3RvclIIY29tbWVudHMSGwoDdGFnGBAgASgLMgkuU2VsZWN0b3JSA3RhZxIlCgh0YWdDb2xvchgRIAEoCzIJLlNlbGVjdG9yUgh0YWdDb2xvchIvCg1iYWRnZVNlbGVjdG9yGBIgASgLMgkuU2VsZWN0b3JSDWJhZGdlU2VsZWN0b3ISJwoJYmFkZ2VUZXh0GBMgASgLMgkuU2VsZWN0b3JSCWJhZGdlVGV4dBIpCgpiYWRnZUNvbG9yGBQgASgLMgkuU2VsZWN0b3JSCmJhZGdlQ29sb3ISJwoJYmFkZ2VUeXBlGBUgASgLMgkuU2VsZWN0b3JSCWJhZGdlVHlwZRIlCghuZXh0UGFnZRgWIAEoCzIJLlNlbGVjdG9yUghuZXh0UGFnZRIzCg9jaGFwdGVyU2VsZWN0b3IYFyABKAsyCS5TZWxlY3RvclIPY2hhcHRlclNlbGVjdG9yEi0KDGNoYXB0ZXJUaXRsZRgYIAEoCzIJLlNlbGVjdG9yUgxjaGFwdGVyVGl0bGUSMwoPY2hhcHRlclN1YnRpdGxlGBkgASgLMgkuU2VsZWN0b3JSD2NoYXB0ZXJTdWJ0aXRsZRIyCgxjaGFwdGVyQ292ZXIYGiABKAsyDi5JbWFnZVNlbGVjdG9yUgxjaGFwdGVyQ292ZXISNAoNZXh0cmFTZWxlY3RvchhjIAMoCzIOLkV4dHJhU2VsZWN0b3JSDWV4dHJhU2VsZWN0b3I=');
