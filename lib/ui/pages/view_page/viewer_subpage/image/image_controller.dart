import 'package:catweb/data/controller/setting_controller.dart';
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

  String? get idCode;

  String get fromUuid;
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

  final concurrency = 3;
  var readerIsForward = true; // 是否为正向阅读
  var currentIndex = 0; // 当前阅读的页码

  // 图片列表
  final RxList<ReaderImageLoader> imageLoaderList = <ReaderImageLoader>[].obs;

  final _waitLoadModel = <int, Future<void> Function(bool)>{};

  Future<void> requestLoadIndex(int index) async {
    currentIndex = index;
    final preloadCount = Get.find<SettingController>().preloadCount.value;
    final needLoadList = imageLoaderList.skip(index).take(preloadCount + 1);
    // 添加需要加载的数据
    for (final element in needLoadList) {
      if (!_waitLoadModel.containsKey(element.index) && element.state.isIdle) {
        _waitLoadModel[element.index] = element.requestLoad;
      }
    }
    // 删除由于翻页已经不需要加载的页面
    _waitLoadModel.removeWhere(
        (key, value) => readerIsForward ? key < index : key > index);
    _trigger(index);
  }

  int get loadingCount =>
      imageLoaderList.where((e) => e.state.isLoading).length;

  void _trigger(int index) {
    while (concurrency - loadingCount > 0 && _waitLoadModel.isNotEmpty) {
      final select = _waitLoadModel.keys.map((key) => (key - index).abs());
      final min = select.reduce((a, b) => a < b ? a : b);
      final entity = imageLoaderList[min + (readerIsForward ? 0 : -1) + index];
      entity.requestLoad(true).whenComplete(() => _trigger(currentIndex));
      _waitLoadModel.remove(entity.index);
    }
  }

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
