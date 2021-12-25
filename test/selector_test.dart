import 'dart:io';

import 'package:catweb/network/parser_exec/html_xpath_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:universal_html/html.dart' hide File;

void main() {
  test('Children selector test', () async {
    final root = UniversalHtmlTree.parse(
        File('test/html/favourite.htm').readAsStringSync());

    print((root.query(r"//*[contains(@class, 'glname')]/..").node!.node
            as Element)
        .innerHtml);
  });
}
