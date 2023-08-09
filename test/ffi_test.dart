import 'dart:convert';
import 'dart:io';

import 'package:catweb/test/site/eh/parser/list_parser.dart';

void main() {
  final data = jsonEncode(ehListParser.toJson());
  final save = File("./test/ffi_request.json");
  save.writeAsStringSync(data);
}
