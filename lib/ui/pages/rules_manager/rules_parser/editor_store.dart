import 'package:cat_web/data/protocol/model/parser.dart';
import 'package:cat_web/gen/protobuf/parser.pbserver.dart';
import 'package:mobx/mobx.dart';

part 'editor_store.g.dart';

class EditorStore = EditorStoreBase with _$EditorStore;

abstract class EditorStoreBase with Store {
  EditorStoreBase({required ParserType type, required dynamic model})
      : parserBase = (() {
          switch (type) {
            case ParserType.list:
              return ListViewParserModel(model as ListViewParser?);
            case ParserType.gallery:
              return GalleryParserModel(model as GalleryParser?);
          }
        })();

  @observable
  ParserBaseModel parserBase;
}
