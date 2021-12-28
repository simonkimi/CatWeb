import 'dart:io';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/parser.dart';
import 'package:catweb/network/parser_exec/gallery_parser_exec.dart';
import 'package:catweb/network/parser_exec/parser_exec.dart';
import 'package:catweb/test/test_model.dart';

void main() {
  final file = File('test/html/gallery.htm').readAsStringSync();

  final param = ParserParam<GalleryParserModel>(
    source: file,
    globalEnv: SiteEnvModel(),
    parser: GalleryParserModel(ehGalleryParser),
  );

  final exec = galleryParserExec(param);

  print(exec.result);
}
