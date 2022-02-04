import 'dart:io';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/gen/protobuf/model.pbserver.dart';
import 'package:catweb/gen/protobuf/rpc.pbserver.dart';
import 'package:catweb/network/parser/parser.dart';
import 'package:catweb/test/test_model/parser/list_parser.dart';
import 'package:catweb/utils/time_line.dart';

void main() async {
  final line = TimeLine();
  line.startTimer();
  final file = File('./test/html/favourite.htm').readAsStringSync();

  final req = ParserFFi(
    source: file,
    parser: ehListParser,
    env: SiteEnvModel(),
    type: RpcType.RPC_TYPE_LIST_VIEW_PARSER,
  );

  final buffer = await req.send();

  final model = ListRpcModel.fromBuffer(buffer);
  for (final m in model.globalEnv.entries) {
    print(m);
  }
  line.getRunTime();
}