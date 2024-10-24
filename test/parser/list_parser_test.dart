import 'dart:io';

import 'package:catweb/data/models/ffi/result/result.dart';
import 'package:catweb/data/models/site/parser.dart';
import 'package:catweb/network/client/client.dart';
import 'package:test/test.dart';

void main() {
  test('list_ffi', () async {
    final html =
        await File('test/parser/testdata/list_html.html').readAsString();
    final parser =
        await File('test/parser/testdata/list_parser.json').readAsString();

    final rsp = await callFFiParser(html, ParserModelType.list, parser);
    final result = ListParserResult.fromJson(rsp);

    print(result);
  });
}
