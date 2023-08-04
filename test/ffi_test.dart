import 'dart:convert';
import 'dart:io';

import 'package:catweb/data/models/ffi/result/request.dart';
import 'package:catweb/test/site/eh/parser/list_parser.dart';

void main() {
  final file = File("./test/list.htm");
  final ffiRequest =
      FfiRequest.listParser(ehListParser, file.readAsStringSync());
  final data = jsonEncode(ffiRequest.toJson());
  final save = File("./test/ffi_request.json");
  save.writeAsStringSync(data);
}
