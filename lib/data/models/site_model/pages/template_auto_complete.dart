import 'package:catweb/data/models/site_model/pages/template.dart';
import 'package:catweb/data/models/site_model/parser/field.dart';
import 'package:catweb/utils/obs_helper.dart';
import 'package:flutter/cupertino.dart';

class TemplateAutoComplete implements ITemplate {
  TemplateAutoComplete({
    String splitChar = '',
    int timeout = 0,
    ScriptField? script,
  })  : splitChar = splitChar.obs,
        timeout = timeout.obs,
        script = script ?? ScriptField(),
        type = TemplateType.autoComplete;

  @override
  final TemplateType type;
  final ValueNotifier<String> splitChar;
  final ValueNotifier<int> timeout;
  final ScriptField script;

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.value,
      'splitChar': splitChar.value,
      'timeout': timeout.value,
      'script': script.toJson(),
    };
  }

  factory TemplateAutoComplete.fromJson(Map<String, dynamic> json) {
    return TemplateAutoComplete(
      splitChar: json['splitChar'],
      timeout: json['timeout'],
      script: ScriptField.fromJson(json['script']),
    );
  }
}
