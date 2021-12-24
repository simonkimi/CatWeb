import 'dart:io';

import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/parser.dart';
import 'package:catweb/network/parser_exec/list_parser_exec.dart';
import 'package:catweb/test/test_model/parser/list_parser.dart';

void main() {
  final file = File('test/html/favourite.htm').readAsStringSync();

  final param = ListParserParam(
    source: file,
    globalEnv: SiteEnvModel(),
    parser: ListViewParserModel(ehListParser)
  );

  final exec = listParserExec(param);

  print(exec.globalEnv);
}