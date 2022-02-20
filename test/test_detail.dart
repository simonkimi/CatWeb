import 'dart:io';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/gen/protobuf/model.pbserver.dart';
import 'package:catweb/gen/protobuf/rpc.pbserver.dart';
import 'package:catweb/network/parser/parser.dart';
import 'package:catweb/test/site/eh/parser/gallery_parser.dart';
import 'package:catweb/utils/time_line.dart';

void main() async {
  final line = TimeLine();
  line.startTimer();
  final file = File('./test/html/detail.html').readAsStringSync();

  final req = ParserFFi(
    source: file,
    parser: ehGalleryParser,
    env: SiteEnvModel(),
    type: RpcType.RPC_TYPE_GALLERY_PARSER,
  );

  final buffer = await req.send();

  final model = GalleryRpcModel.fromBuffer(buffer);
  print(model.description);
  line.getRunTime();
}
