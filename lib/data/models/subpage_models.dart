import 'package:catweb/data/loaders/page_loader.dart';
import 'package:catweb/data/models/ffi/result/base.dart';
import 'package:catweb/data/models/ffi/result/result.dart';
import 'package:catweb/data/models/image_with_preview.dart';

/// List中每一页的数据
class ListPageData extends BasePageData<ListItemModel> {
  ListPageData(this.pageData)
      : _items = pageData.items!.map((e) => ListItemModel(e)).toList();

  final ListParserResult pageData;

  final List<ListItemModel> _items;

  @override
  List<ListItemModel> get items => _items;

  @override
  void dispose() {
    for (var item in _items) {
      item.dispose();
    }
  }
}

/// List带预览加载的项目
class ListItemModel extends ImageWithPreviewModel {
  ListItemModel(this.previewModel);

  final ListParserResultItem previewModel;

  @override
  ImageResult get previewImage => previewModel.previewImage!;

  @override
  String? get idCode => previewModel.idCode;
}
