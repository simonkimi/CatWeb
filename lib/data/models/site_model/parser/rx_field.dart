import 'package:catweb/data/models/site_model/fields/field.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';

@JsonSerializable()
class RxRegField {
  RxRegField({
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

  factory RxRegField.fromJson(Map<String, dynamic> json) => RxRegField(
        reg: json['reg'] as String,
        value: json['value'] as String,
      );
}

@JsonSerializable()
class RxScriptField {
  final RxString script;
  final Rx<ScriptFieldType> type;

  RxScriptField({
    String script = '',
    ScriptFieldType type = ScriptFieldType.output,
  })  : script = script.obs,
        type = type.obs;

  Map<String, dynamic> toJson() => {
        'script': script.value,
        'type': type.value.value,
      };

  factory RxScriptField.fromJson(Map<String, dynamic> json) => RxScriptField(
        script: json['script'] as String,
        type: ScriptFieldType.fromValue(json['type'] as String),
      );
}
