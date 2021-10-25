import 'package:cat_web/data/protocol/model/store.dart';
import 'package:cat_web/gen/protobuf/store.pbserver.dart';
import 'package:mobx/mobx.dart';

part 'rules_store.g.dart';

class RulesStore = RulesStoreBase with _$RulesStore;

abstract class RulesStoreBase with Store {
  RulesStoreBase([RulesProtocol? entity])
      : rulesModel = RulesProtocolModel(entity);

  final RulesProtocolModel rulesModel;
}
