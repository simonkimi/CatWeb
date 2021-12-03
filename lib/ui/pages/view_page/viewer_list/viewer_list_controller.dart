import 'package:catweb/data/models/load_more_model.dart';
import 'package:catweb/ui/pages/view_page/viewer_list/viewer_list_model.dart';

class ViewerListController extends LoadMoreModel<ViewerListModel> {
  @override
  bool isItemExist(ViewerListModel item) => items.contains(item);

  @override
  Future<List<ViewerListModel>> loadPage(int page) {
    throw UnimplementedError();
  }
}
