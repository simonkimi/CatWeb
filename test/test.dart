import 'package:catweb/data/protocol/model/store.dart';
import 'package:catweb/test/site/eh/eh_rules.dart';

void main() async {
  final model = SiteBlueprintModel.fromBuffer(SiteBlueprintModel(ehTestSite).toPb().writeToBuffer());


  print(model.autoCompleteParsers[0].uuid);
}
