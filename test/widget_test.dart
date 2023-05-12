// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:catweb/data/models/site_model/parser/base_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:catweb/main.dart';

void main() {
  final selector = Selector(
    selector: "#gdo",
    selectorType: SelectorType.css,
    selectorFunctionType: SelectorFunctionType.auto,
    regex: r'<div class="ths nosel">(\d+) rows.+sel">(\w)',
    replace: r'$1|$2',
    script:
        "function hook(t){var row=t.split('|')[0];var column=t.split('|')[1];return parseInt(row)*{'L':5,'N':10}[column]}",
    scriptType: SelectorScriptType.js,
    defaultValue: "",
  );

  final element = selector.toXml();
  print(element.toXmlString(pretty: true, indent: '  '));
}
