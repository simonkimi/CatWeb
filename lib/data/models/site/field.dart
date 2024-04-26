import 'dart:ui';

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

enum ScriptFieldType {
  @JsonValue('output')
  output,
  @JsonValue('js')
  js,
}

@freezed
class ScriptField with _$ScriptField {
  const factory ScriptField({
    @Default('') String script,
    @Default(ScriptFieldType.output) ScriptFieldType type,
  }) = _ScriptField;

  factory ScriptField.fromJson(Map<String, dynamic> json) =>
      _$ScriptFieldFromJson(json);
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
