import 'package:catweb/data/models/ffi/result/base.dart';
import 'package:catweb/data/models/ffi/result/result.dart';
import 'package:catweb/data/models/image_with_preview.dart';

/// 列表解析结果的不可变业务适配项。
final class ListItemModel implements ImageWithPreviewModel {
  ListItemModel(this.previewModel);

  final ListParserResultItem previewModel;

  @override
  ImageResult get previewImage => previewModel.previewImage!;

  @override
  String? get idCode => previewModel.idCode;
}
