import 'package:catweb/data/controller/site_controller.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/gen/protobuf/model.pbserver.dart';
import 'package:catweb/utils/handle.dart';
import 'package:catweb/utils/state_mixin.dart';
import 'package:catweb/utils/utils.dart';
import 'package:get/get.dart';

import 'image_provider.dart';

enum ImageContainerState {
  waiting, // 等待加载
  loading, // 加载中
  finish, // 加载完成
  error, // 加载失败
}

class ReaderPreviewData {
  ReaderPreviewData({
    required this.idCode,
    required this.preview,
  });

  String? idCode;
  ImageRpcModel? preview;
}

abstract class ReaderInfo<T> {
  int? get pageCount; // 总面数

  // 第一个T是原类型, 要转换为数据
  TransmissionBufferStream<T, Map<int, ReaderPreviewData?>> get bufferStream;

  Future<void> requestLoadIndex(int index, [RxBool isStop]);
}

class ReaderImageLoader with LoadStateMixin {
  ReaderImageLoader({
    required this.index,
    required this.requestLoadIdCode,
    required this.localEnv,
    required this.blueprint,
    this.idCode,
    this.preview,
  });

  String? idCode; // 图片的id, 有可能还没有获取, 所以可空
  ImageRpcModel? preview; // 图片的预览信息
  final int index; // 图片的index, 这个是可以确定的
  final Future<void> Function(int index) requestLoadIdCode;
  final SiteEnvModel localEnv;
  final PageBlueprintModel blueprint;
  ImageReaderRpcModel? model;
  Rx<ReaderImageProvider?> imageModel = Rx<ReaderImageProvider?>(null);

  final global = Get.find<GlobalController>();

  // 阅读器想要加载数据的时候, 调用此函数
  Future<void> requestLoad(bool isAuto) async {
    if (model != null || state.isLoading) return;
    loadStart();
    try {
      if (idCode == null) {
        // 如果idCode为空时, 应该要求加载, 传到上级进行判断
        await requestLoadIdCode(index);
        if (idCode == null) return; // 如果idCode还为空的话, 返回 TODO: 错误提示
      }

      // 加载好数据后, 开始由idCode拿数据
      final url = blueprint.url.isEmpty ? idCode! : blueprint.url.value;
      final env = localEnv.clone()..set('idCode', idCode!);
      model = await global.website.client.getReadImage(
        url: url,
        model: blueprint,
        localEnv: env,
      );
      imageModel.value = ReaderImageProvider(
        model: model!.image,
        dio: global.website.client.imageDio,
      );
    } on Exception catch (e) {
      loadError(e);
    }
    loadNoData();
  }
}

class ImageReaderController {
  ImageReaderController({
    required this.readerInfo,
    required this.localEnv,
    required this.blueprint,
  }) {
    _updateIdCode(readerInfo.bufferStream.buffer);
    readerInfo.bufferStream.listen(_updateIdCode);
  }

  final ReaderInfo readerInfo;
  final PageBlueprintModel blueprint;

  final global = Get.find<GlobalController>();
  final SiteEnvModel localEnv;

  // 图片列表
  final RxList<ReaderImageLoader> imageLoaderList = <ReaderImageLoader>[].obs;

  void _updateIdCode(Map<int, ReaderPreviewData?> items) {
    for (var i = 0; i < items.realLength; i++) {
      if (imageLoaderList.length <= i) {
        imageLoaderList.add(ReaderImageLoader(
          index: i,
          idCode: items[i]?.idCode,
          preview: items[i]?.preview,
          requestLoadIdCode: readerInfo.requestLoadIndex,
          localEnv: localEnv,
          blueprint: blueprint,
        ));
      } else if (imageLoaderList[i].idCode == null && items.containsKey(i)) {
        imageLoaderList[i].idCode = items[i]?.idCode;
        imageLoaderList[i].preview = items[i]?.preview;
      }
    }
  }
}
