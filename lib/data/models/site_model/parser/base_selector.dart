import 'package:xml/xml.dart';

enum SelectorType {
  css('css'),
  xpath('xpath'),
  jsonPath('jsonPath');

  const SelectorType(this.value);
  final String value;

  factory SelectorType.fromValue(String value) {
    return SelectorType.values.firstWhere((e) => e.value == value);
  }
}

enum SelectorFunctionType {
  auto('auto'),
  text('text'),
  attr('attr'),
  raw('raw');

  const SelectorFunctionType(this.value);
  final String value;

  factory SelectorFunctionType.fromValue(String value) {
    return SelectorFunctionType.values.firstWhere((e) => e.value == value);
  }
}

enum SelectorScriptType {
  js('js'),
  lua('lua'),
  computed('computed'),
  replace('replace');

  const SelectorScriptType(this.value);
  final String value;

  factory SelectorScriptType.fromValue(String value) {
    return SelectorScriptType.values.firstWhere((e) => e.value == value);
  }
}

class Selector {
  Selector({
    required this.selector,
    required this.selectorType,
    required this.selectorFunctionType,
    required this.regex,
    required this.replace,
    required this.script,
    required this.scriptType,
    required this.defaultValue,
  });

  String selector;

  SelectorType selectorType;
  SelectorFunctionType selectorFunctionType;
  String regex;
  String replace;
  String script;
  SelectorScriptType scriptType;
  String defaultValue;

  XmlElement toXml() {
    return XmlElement(
      XmlName('Selector'),
      [
        XmlAttribute(XmlName('Selector'), selector),
        XmlAttribute(XmlName('SelectorType'), selectorType.value),
        XmlAttribute(
            XmlName('SelectorFunctionType'), selectorFunctionType.value),
        XmlAttribute(XmlName('Regex'), regex),
        XmlAttribute(XmlName('Replace'), replace),
        XmlAttribute(XmlName('Script'), script),
        XmlAttribute(XmlName('ScriptType'), scriptType.value),
        XmlAttribute(XmlName('DefaultValue'), defaultValue),
      ],
      [],
    );
  }

  factory Selector.fromXml(XmlElement element) {
    return Selector(
      selector: element.getAttribute('Selector')!,
      selectorType: SelectorType.fromValue(element.getAttribute('SelectorType')!),
      selectorFunctionType: SelectorFunctionType.fromValue(element.getAttribute('SelectorFunctionType')!),
      regex: element.getAttribute('Regex')!,
      replace: element.getAttribute('Replace')!,
      script: element.getAttribute('Script')!,
      scriptType: SelectorScriptType.fromValue(element.getAttribute('ScriptType')!),
      defaultValue: element.getAttribute('DefaultValue')!,
    );
  }
}
