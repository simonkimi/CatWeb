import 'package:catweb/data/models/site/field.dart';
import 'package:catweb/data/models/site/selector.dart';
import 'package:flutter/cupertino.dart';

class SelectorEditorNotifier with ChangeNotifier {
  SelectorEditorNotifier({required this.selector});

  SelectorModel selector;

  void setSelectorValue(String value) {
    if (selector.selector == value) return;
    selector = selector.copyWith(selector: value);
    notifyListeners();
  }

  void setSelectorQuery(SelectorQuery value) {
    if (selector.type == value) return;
    selector = selector.copyWith(type: value);
    notifyListeners();
  }

  void setSelectorFunction(SelectorFunction value) {
    if (selector.function == value) return;
    selector = selector.copyWith(function: value);
    notifyListeners();
  }

  void setSelectorParam(String value) {
    if (selector.param == value) return;
    selector = selector.copyWith(param: value);
    notifyListeners();
  }

  void setSelectorRegex(String value) {
    if (selector.regex == value) return;
    selector = selector.copyWith(regex: value);
    notifyListeners();
  }

  void setSelectorReplace(String value) {
    if (selector.replace == value) return;
    selector = selector.copyWith(replace: value);
    notifyListeners();
  }

  void setSelectorScript(ScriptField value) {
    if (selector.script == value) return;
    selector = selector.copyWith(script: value);
    notifyListeners();
  }
}
