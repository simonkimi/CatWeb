import 'dart:io';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/gen/protobuf/model.pbserver.dart';
import 'package:catweb/gen/protobuf/rpc.pbserver.dart';
import 'package:catweb/network/parser/parser.dart';
import 'package:catweb/test/site/eh/parser/auto_complete_parser.dart';
import 'package:catweb/utils/time_line.dart';

void main() async {
  final line = TimeLine();
  line.startTimer();
  final file = File('./test/html/suggest.json').readAsStringSync();

  final req = ParserFFi(
    source: file,
    parser: ehAutoCompleteParser,
    env: SiteEnvModel(),
    type: RpcType.RPC_TYPE_AUTO_COMPLETE,
  );

  // File('./test/buffer.tmp').writeAsBytesSync(req.request.writeToBuffer());

  final buffer = await req.send();

  final model = AutoCompleteRpcModel.fromBuffer(buffer);

  print(model);
}
