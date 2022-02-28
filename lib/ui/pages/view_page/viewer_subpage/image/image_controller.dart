import 'dart:math';

import 'package:catweb/data/controller/site_controller.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/gen/protobuf/model.pbserver.dart';
import 'package:catweb/network/client/image_loader.dart';
import 'package:get/get.dart';

enum ImageState {
  waiting, // 等待加载
  loading, // 加载中
  finish, // 加载完成
  error, // 加载失败
}

class ImageContainer {
  ImageContainer({
    required this.idCode,
    required this.localEnv,
    required this.blueprint,
  });

  final String idCode;
  final SiteEnvModel localEnv;
  final PageBlueprintModel blueprint;

  final global = Get.find<GlobalController>();

  final Rx<ImageState> state = ImageState.waiting.obs;
  ImageReaderRpcModel? model;

  Future<void> load() async {
    state.value = ImageState.loading;
    try {
      final url = blueprint.url.isEmpty ? idCode : blueprint.url.value;

      final env = localEnv.copy()..set('idCode', idCode);

      model = await global.website.client.getReadImage(
        url: url,
        model: blueprint,
        localEnv: env,
      );
      state.value = ImageState.finish;
    } catch (e) {
      state.value = ImageState.error;
      return;
    }
  }
}

abstract class ReaderInfo<T> {
  String getIdCode(T);

  RxList<T> get fromList;

  int? get pageCount; // 总面数
}

class ImageController<T> {
  ImageController({
    required this.readerInfo,
    required this.localEnv,
    required this.blueprint,
  }) {
    // imageIdCode.value =
    //     readerInfo.fromList.map((e) => readerInfo.getIdCode(e)).toList();
    // readerInfo.fromList.listen((List<T> list) {
    //   imageIdCode.value = list.map((e) => readerInfo.getIdCode(e)).toList();
    //   for (final item in imageIdCode) {
    //     imageContainerMap[item] ??= ImageContainer(
    //       idCode: item,
    //       blueprint: blueprint,
    //       localEnv: localEnv,
    //     );
    //   }
    // });
  }

  final ReaderInfo<T> readerInfo;
  final PageBlueprintModel blueprint;

  final global = Get.find<GlobalController>();
  final SiteEnvModel localEnv;

  // 从上级菜单传过来的列表, 其中包含了idCode
  final RxList<String?> imageIdCode = <String?>[].obs;

  // 图片所在的html获取结果, 相同String共享一个ImageContainer
  final imageContainerMap = <String, ImageContainer>{};

  // 图片储存数据, 相同的url公用一个ImageLoadModel
  final imageMap = <String, ImageLoadModel>{};

  void _updateIdCode(List<T> items) {
    imageIdCode.length = max(imageIdCode.length, items.length);
    for (var i = 0; i < items.length; i++) {
      if (imageIdCode[i] == null) {
        imageIdCode[i] = readerInfo.getIdCode(items[i]);
      }
    }
  }
}
