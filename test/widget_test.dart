
import 'dart:convert';

import 'package:catweb/data/models/site_model/parser/rx_selector.dart';
import 'package:catweb/data/models/site_model/parser/selector.dart';

void main() {
  var selector = RxSelector(
    selector: "123123",
    type: SelectorType.css,
    function: SelectorFunctionType.text,
  );

  print(jsonEncode(selector.toJson()));
}