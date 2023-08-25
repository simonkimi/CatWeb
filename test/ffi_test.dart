import 'dart:convert';
import 'dart:io';

import 'package:catweb/network/client/cilent.dart';
import 'package:catweb/test/site/eh/parser/list_parser.dart';
import 'package:catweb_parser/catweb_parser.dart';

void main() async {
  final file = File('test/list.htm');
  final html = file.readAsStringSync();

  var parser = jsonEncode(ehListParser.toJson());
  File('test/list_parser.json').writeAsStringSync(parser);

  final rsp = await parseHtmlAsync(html, ParserType.list.value, parser);

  print(rsp);
}
