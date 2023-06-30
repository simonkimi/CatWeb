import 'package:freezed_annotation/freezed_annotation.dart';

part 'field.g.dart';

part 'field.freezed.dart';

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
class ColorField with _$ColorField {
  const ColorField._();

  const factory ColorField({
    @Default(0) int a,
    @Default(0) int r,
    @Default(0) int g,
    @Default(0) int b,
  }) = _ColorField;

  factory ColorField.fromJson(Map<String, dynamic> json) =>
      _$ColorFieldFromJson(json);

  @override
  String toString() {
    return '#${r.toRadixString(16).padLeft(2, '0')}${g.toRadixString(16).padLeft(2, '0')}${b.toRadixString(16).padLeft(2, '0')}';
  }
}

@JsonEnum(valueField: 'value')
enum ScriptFieldType {
  output('output'),
  js('javascript'),
  lua('lua'),
  computed('computed'),
  replace('replace');

  const ScriptFieldType(this.value);

  final String value;

  factory ScriptFieldType.fromValue(String value) {
    return ScriptFieldType.values.firstWhere((e) => e.value == value);
  }
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
