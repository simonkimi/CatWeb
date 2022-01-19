///
//  Generated code. Do not modify.
//  source: page.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class Template extends $pb.ProtobufEnum {
  static const Template TEMPLATE_IMAGE_LIST = Template._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'TEMPLATE_IMAGE_LIST');
  static const Template TEMPLATE_IMAGE_WATERFALL = Template._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'TEMPLATE_IMAGE_WATERFALL');
  static const Template TEMPLATE_DETAIL = Template._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'TEMPLATE_DETAIL');
  static const Template TEMPLATE_IMAGE_VIEWER = Template._(
      3,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'TEMPLATE_IMAGE_VIEWER');

  static const $core.List<Template> values = <Template>[
    TEMPLATE_IMAGE_LIST,
    TEMPLATE_IMAGE_WATERFALL,
    TEMPLATE_DETAIL,
    TEMPLATE_IMAGE_VIEWER,
  ];

  static final $core.Map<$core.int, Template> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static Template? valueOf($core.int value) => _byValue[value];

  const Template._($core.int v, $core.String n) : super(v, n);
}

class SiteDisplayType extends $pb.ProtobufEnum {
  static const SiteDisplayType show = SiteDisplayType._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'show');
  static const SiteDisplayType shrink = SiteDisplayType._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'shrink');
  static const SiteDisplayType hide = SiteDisplayType._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'hide');

  static const $core.List<SiteDisplayType> values = <SiteDisplayType>[
    show,
    shrink,
    hide,
  ];

  static final $core.Map<$core.int, SiteDisplayType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static SiteDisplayType? valueOf($core.int value) => _byValue[value];

  const SiteDisplayType._($core.int v, $core.String n) : super(v, n);
}
