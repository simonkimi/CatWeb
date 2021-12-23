///
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SelectorFunction extends $pb.ProtobufEnum {
  static const SelectorFunction auto = SelectorFunction._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'auto');
  static const SelectorFunction text = SelectorFunction._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'text');
  static const SelectorFunction attr = SelectorFunction._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'attr');
  static const SelectorFunction raw = SelectorFunction._(
      3,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'raw');

  static const $core.List<SelectorFunction> values = <SelectorFunction>[
    auto,
    text,
    attr,
    raw,
  ];

  static final $core.Map<$core.int, SelectorFunction> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static SelectorFunction? valueOf($core.int value) => _byValue[value];

  const SelectorFunction._($core.int v, $core.String n) : super(v, n);
}
