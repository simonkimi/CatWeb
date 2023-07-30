import 'dart:ui';
import 'package:get/get.dart';

class RegField {
  RegField({
    String reg = '',
    String value = '',
  })  : reg = reg.obs,
        value = value.obs;
  final RxString reg;
  final RxString value;

  Map<String, dynamic> toJson() => {
        'reg': reg.value,
        'value': value.value,
      };

  factory RegField.fromJson(Map<String, dynamic> json) => RegField(
        reg: json['reg'] as String,
        value: json['value'] as String,
      );
}

enum ScriptFieldType {
  output('output'),
  js('js'),
  computed('computed'),
  replace('replace');

  const ScriptFieldType(this.value);

  final String value;

  factory ScriptFieldType.fromValue(String value) {
    return ScriptFieldType.values.firstWhere((e) => e.value == value);
  }
}

class ScriptField {
  final RxString script;
  final Rx<ScriptFieldType> type;

  ScriptField({
    String script = '',
    ScriptFieldType type = ScriptFieldType.output,
  })  : script = script.obs,
        type = type.obs;

  Map<String, dynamic> toJson() => {
        'script': script.value,
        'type': type.value.value,
      };

  factory ScriptField.fromJson(Map<String, dynamic> json) => ScriptField(
        script: json['script'] as String,
        type: ScriptFieldType.fromValue(json['type'] as String),
      );
}

class ColorField {
  ColorField({
    int a = 255,
    int r = 0,
    int g = 0,
    int b = 0,
  })  : a = a.obs,
        r = r.obs,
        g = g.obs,
        b = b.obs;

  final RxInt a;
  final RxInt r;
  final RxInt g;
  final RxInt b;

  Color get color => Color.fromARGB(a.value, r.value, g.value, b.value);

  Map<String, dynamic> toJson() => {
        'a': a.value,
        'r': r.value,
        'g': g.value,
        'b': b.value,
      };

  factory ColorField.fromJson(Map<String, dynamic> json) => ColorField(
        a: json['a'] as int,
        r: json['r'] as int,
        g: json['g'] as int,
        b: json['b'] as int,
      );

  factory ColorField.fromColor(Color color) => ColorField(
        a: color.alpha,
        r: color.red,
        g: color.green,
        b: color.blue,
      );

  String get hex =>
      '#${r.value.toRadixString(16).padLeft(2, '0')}${g.value.toRadixString(16).padLeft(2, '0')}${b.value.toRadixString(16).padLeft(2, '0')}';
}
