///
//  Generated code. Do not modify.
//  source: page.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class SitePageType extends $pb.ProtobufEnum {
  static const SitePageType imageList = SitePageType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'imageList');
  static const SitePageType imageWaterfall = SitePageType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'imageWaterfall');
  static const SitePageType detail = SitePageType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'detail');

  static const $core.List<SitePageType> values = <SitePageType> [
    imageList,
    imageWaterfall,
    detail,
  ];

  static final $core.Map<$core.int, SitePageType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SitePageType? valueOf($core.int value) => _byValue[value];

  const SitePageType._($core.int v, $core.String n) : super(v, n);
}

