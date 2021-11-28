import 'package:catweb/data/protocol/model/parser.dart';
import 'package:catweb/gen/protobuf/parser.pbserver.dart';
import 'package:mobx/mobx.dart';

part 'editor_store.g.dart';

class EditorStore = EditorStoreBase with _$EditorStore;

abstract class EditorStoreBase with Store {
  EditorStoreBase({required ParserType type, required dynamic model})
      : parserBase = (() {
          switch (type) {
            case ParserType.listParser:
              return ListViewParserModel(model as ListViewParser?);
            case ParserType.galleryParser:
              return GalleryParserModel(model as GalleryParser?);
            case ParserType.imageParser:
              return ImageParserModel(model as ImageParser?);
          }
        })();

  @observable
  ParserBaseModel parserBase;
}
