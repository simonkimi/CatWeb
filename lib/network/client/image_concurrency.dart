import 'package:catweb/data/protocol/model/model.dart';
import 'package:catweb/gen/protobuf/model.pb.dart';
import 'package:dio/dio.dart';

import 'image_loader.dart';

abstract class ImageConcurrency {
  ImageLoadModel create(ImageRpcModel model);

  void reload(ImageLoadModel imageLoadModel);

  void dispose();
}

class ImageListConcurrency implements ImageConcurrency {
  ImageListConcurrency({required this.dio, this.concurrency = 0});

  final Dio dio;
  final int concurrency;

  final _globalCancelToken = CancelToken();

  final _imageMap = <String, ImageLoadModel>{};

  List<ImageLoadModel> get activeImage =>
      _imageMap.values.where((e) => e.needLoad).toList();

  @override
  ImageLoadModel create(ImageRpcModel model) {
    late ImageLoadModel exist;
    if (_imageMap.containsKey(model.key)) {
      exist = _imageMap[model.key]!..handle();
    } else {
      exist = ImageLoadModel(model: model, dio: dio);
      _imageMap[model.key] = exist;
    }

    _trigger();
    exist.loadCache().whenComplete(() => _trigger());
    return exist;
  }

  @override
  void reload(ImageLoadModel model) {
    model.reset();
    _trigger();
  }

  @override
  void dispose() {
    _globalCancelToken.cancel();
    _imageMap.forEach((key, value) {
      value.dispose();
    });
  }

  void _trigger() {
    while ((activeImage.length < concurrency || concurrency == 0) &&
        activeImage.isNotEmpty) {
      activeImage[0].load().then((value) => _trigger());
    }
  }
}
