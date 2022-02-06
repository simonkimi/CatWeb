import 'package:catweb/gen/protobuf/model.pbserver.dart';
import 'package:uuid/uuid.dart';

extension GetDetail on DetailRpcModel {
  String? get getTitle => hasTitle() ? title : null;

  String? get getSubTitle => hasSubtitle() ? subtitle : null;

  String? get safaLanguage => hasLanguage() ? language : null;

  int? get getImageCount => hasImageCount() ? imageCount : null;

  String? get getUploadTime => hasUploadTime() ? uploadTime : null;

  int? get getCountPrePage => hasCountPrePage() ? countPrePage : null;

  String? get getDescription => hasDescription() ? description : null;

  double? get getStar => hasStar() ? star : null;

  ImageRpcModel? get getCoverImg => hasCoverImg() ? coverImg : ImageRpcModel();
}

extension GetImageRpcModel on ImageRpcModel {
  String? get getUrl => hasUrl() ? url : null;

  String? get getCacheKey => hasCacheKey() ? cacheKey : null;

  double? get getWidth => hasWidth() ? width : null;

  double? get getHeight => hasHeight() ? height : null;

  double? get getImgX => hasImgX() ? imgX : null;

  double? get getImgY => hasImgY() ? imgY : null;

  String? get getTarget => hasTarget() ? target : null;

  String get key => getCacheKey ?? const Uuid().v5(Uuid.NAMESPACE_URL, url);

  bool get repeatImage => hasImgX() && hasImgY();
}
