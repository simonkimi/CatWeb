///
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class PageTemplate extends $pb.ProtobufEnum {
  static const PageTemplate imageList = PageTemplate._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'imageList');
  static const PageTemplate imageWaterfall = PageTemplate._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'imageWaterfall');
  static const PageTemplate detail = PageTemplate._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'detail');

  static const $core.List<PageTemplate> values = <PageTemplate> [
    imageList,
    imageWaterfall,
    detail,
  ];

  static final $core.Map<$core.int, PageTemplate> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PageTemplate? valueOf($core.int value) => _byValue[value];

  const PageTemplate._($core.int v, $core.String n) : super(v, n);
}

class SiteDisplayType extends $pb.ProtobufEnum {
  static const SiteDisplayType show = SiteDisplayType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'show');
  static const SiteDisplayType shrink = SiteDisplayType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'shrink');
  static const SiteDisplayType showWhenPossible = SiteDisplayType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'showWhenPossible');
  static const SiteDisplayType hide = SiteDisplayType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'hide');

  static const $core.List<SiteDisplayType> values = <SiteDisplayType> [
    show,
    shrink,
    showWhenPossible,
    hide,
  ];

  static final $core.Map<$core.int, SiteDisplayType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SiteDisplayType? valueOf($core.int value) => _byValue[value];

  const SiteDisplayType._($core.int v, $core.String n) : super(v, n);
}

