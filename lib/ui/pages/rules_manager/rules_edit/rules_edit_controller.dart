import 'package:catweb/data/protocol/model/store.dart';
import 'package:catweb/gen/protobuf/store.pbserver.dart';
import 'package:get/get.dart';

class RulesEditController extends GetxController {
  RulesEditController({
    SiteProtobuf? pb,
  }) : rulesModel = SiteProtobufModel(pb);

  final SiteProtobufModel rulesModel;
}
