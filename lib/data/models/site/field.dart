import 'package:catweb/utils/enum_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'field.freezed.dart';

part 'field.g.dart';

@freezed
class RegField with _$RegField {
  const factory RegField({
    @Default('') String reg,
    @Default('') String value,
  }) = _RegField;

  factory RegField.fromJson(Map<String, dynamic> json) =>
      _$RegFieldFromJson(json);
}

@freezed
class ScriptField with _$ScriptField {
  const ScriptField._();

  const factory ScriptField.output() = ScriptFieldOutput;

  const factory ScriptField.replace({
    @Default({}) Map<String, String> replace,
  }) = ScriptFieldReplace;

  const factory ScriptField.js({
    @Default('') String script,
  }) = ScriptFieldJs;

  factory ScriptField.fromJson(Map<String, dynamic> json) =>
      _$ScriptFieldFromJson(json);

  static ScriptField fromType(ScriptFieldType type) {
    return switch (type) {
      ScriptFieldType.output => const ScriptField.output(),
      ScriptFieldType.replace => const ScriptField.replace(),
      ScriptFieldType.js => const ScriptField.js()
    };
  }

  ScriptFieldType toType() {
    return switch (this) {
      ScriptFieldOutput() => ScriptFieldType.output,
      ScriptFieldReplace() => ScriptFieldType.replace,
      ScriptFieldJs() => ScriptFieldType.js,
      _ => throw Exception('Unknown ScriptField: $this')
    };
  }
}

enum ScriptFieldType implements IEnumDescription {
  output,
  replace,
  js;

  @override
  String getDescription(BuildContext context) {
    return switch (this) {
      ScriptFieldType.output => '输出',
      ScriptFieldType.replace => '替换',
      ScriptFieldType.js => 'Js脚本'
    };
  }
}

@freezed
class ColorField with _$ColorField {
  const factory ColorField({
    @Default(0) int a,
    @Default(0) int r,
    @Default(0) int g,
    @Default(0) int b,
  }) = _ColorField;

  factory ColorField.fromJson(Map<String, dynamic> json) =>
      _$ColorFieldFromJson(json);

  factory ColorField.fromColor(Color color) {
    return ColorField(
      a: color.alpha,
      r: color.red,
      g: color.green,
      b: color.blue,
    );
  }
}
