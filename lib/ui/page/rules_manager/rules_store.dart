import 'package:cat_web/gen/protobuf/parser.pbserver.dart';
import 'package:cat_web/gen/protobuf/store.pbserver.dart';
import 'package:mobx/mobx.dart';

part 'rules_store.g.dart';

class RulesStore = RulesStoreBase with _$RulesStore;

abstract class RulesStoreBase with Store {
  RulesStoreBase(RulesProtocol? entity)
      : siteName = entity?.name ?? '',
        baseUrl = entity?.baseUrl ?? '',
        cookies = entity?.cookies ?? '',
        headers = entity?.headers ?? '',
        needCookies = entity?.needCookies ?? false;

  final galleryParsers = ObservableList<GalleryParser>();
  final listViewParsers = ObservableList<ListViewParser>();

  @observable
  String siteName;

  @observable
  String baseUrl;

  @observable
  String cookies;

  @observable
  String headers;

  @observable
  bool needCookies;
}
