import 'package:cat_web/data/protocol/model/parser.dart';
import 'package:mobx/mobx.dart';

part 'editor_store.g.dart';

class EditorStore = EditorStoreBase with _$EditorStore;

abstract class EditorStoreBase with Store {
  @observable
  var parserBase = ListViewParserModel();
}
