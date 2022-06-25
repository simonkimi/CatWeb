import 'package:catweb/data/controller/setting_controller.dart';
import 'package:catweb/data/models/image_with_preview.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/utils/debug.dart';
import 'package:catweb/utils/helper.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

abstract class ReaderInfo<T, E extends ImageWithPreviewModel<T>> {
  Iterable<E?> get items;

  int? get pageCount;

  Future<void> loadIndexModel(int index, CancelToken cancelToken);
}

/// 图片阅读控制器
/// 用于接受阅读进度, 用于决定加载页面
class ReaderLoaderController {
  ReaderLoaderController({
    required this.readerInfo,
    required this.blueprint,
    required this.localEnv,
  });

  /// 图片加载控制器
  final ReaderInfo readerInfo;

  final PageBlueprintModel blueprint;
  final SiteEnvModel localEnv;

  // 下面是具体实现的方法
  final _waitLoadModel = <int>[];
  var readerIsForward = true;
  var currentIndex = 0;
  final _cancelToken = CancelToken();

  /// 现在阅读器阅读到哪一面了, 里面做的是预加载与记录
  Future<void> onIndexChanged(int index, bool isForward) async {
    readerIsForward = isForward;
    currentIndex = index;
    final preloadCount = Get.find<SettingController>().preloadCount.value;
    final items = readerInfo.items.toList();
    final needLoadItem = List.generate(preloadCount + 1,
            (index) => (readerIsForward ? 1 : -1) * index + currentIndex)
        .where((e) => e < items.length && e >= 0)
        .where((e) => !items.has(e) || items[e]!.state.canLoadMore)
        .where((e) => !_waitLoadModel.contains(e));
    _waitLoadModel.removeWhere((e) {
      return readerIsForward ? e < index : e > index;
    });
    _waitLoadModel.addAll(needLoadItem);
    _trigger(index);
  }

  void _trigger(int index) {
    var concurrency = Get.find<SettingController>().concurrencyCount.value;
    while (concurrency == -1 ||
        (concurrency - loadingCount > 0 && _waitLoadModel.isNotEmpty)) {
      final modelIndex = _waitLoadModel
          .where((e) => readerIsForward ? e >= index : e <= index)
          .reduce((value, element) =>
              (value - index).abs() < (element - index).abs()
                  ? value
                  : element);
      _loadIndexModel(modelIndex).whenComplete(() => _trigger(currentIndex));
      _waitLoadModel.remove(modelIndex);
    }
  }

  void dispose() {
    _cancelToken.cancel();
  }

  Future<void> _loadIndexModel(int index) async {
    final model = readerInfo.items.toList().index(index);
    if (model == null) {
      await readerInfo.loadIndexModel(index, _cancelToken);
      if (model == null) {
        logger.wtf('加载$index后仍然为空');
        throw Exception('加载$index后仍然为空');
      }
    }
    model.loadReaderModel(
      blueprint: blueprint,
      localEnv: localEnv,
    );
  }
}
