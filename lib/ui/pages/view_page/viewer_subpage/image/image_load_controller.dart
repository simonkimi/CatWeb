import 'dart:math';

import 'package:catweb/data/controller/setting_controller.dart';
import 'package:catweb/data/loaders/image_with_preview.dart';
import 'package:catweb/data/loaders/load_more_model.dart';
import 'package:get/get.dart';

/// 这里是图片控制器
/// 图片加载页面应该只做最基本的事情, 便是显示图片
/// 其他功能例如加载图片数据(url, 高度宽度等), 应该交由上级负责, 因为不知道模板是怎么实现的
abstract class BaseImageLoadController<T, E, V extends ImageWithPreviewModel<E>> {
  BaseImageLoadController({required this.loaderController});

  /// 总面数
  int? get pageCount;

  /// 图片加载控制器
  final LoadMorePage<T, E, V> loaderController;

  // 下面是具体实现的方法
  final _waitLoadModel = <V>[];
  var readerIsForward = true;

  var currentIndex = 0;

  /// 现在阅读器阅读到哪一面了, 里面做的是预加载与记录
  Future<void> onIndexChanged(int index, bool isForward) async {
    readerIsForward = isForward;
    currentIndex = index;
    final preloadCount = Get.find<SettingController>().preloadCount.value;
    final needLoadList = isForward
        ? loaderController.items.skip(index).take(preloadCount + 1)
        : loaderController.items.skip(max(0, index - preloadCount)).take(preloadCount + 1);
    // 添加需要加载的数据
    for (final element in needLoadList) {
      if (!_waitLoadModel.contains(element) && element.state.isIdle) {
        _waitLoadModel.add(element);
      }
    }
    // 删除由于翻页已经不需要加载的页面
    _waitLoadModel.removeWhere(
        (key, value) => readerIsForward ? key < index : key > index);
    _trigger(index);
  }

  int get loadingCount => imageList.where((e) => e.state.isLoading).length;

  void _trigger(int index) {
    var concurrency = Get.find<SettingController>().concurrencyCount.value;
    while (concurrency == -1 ||
        (concurrency - loadingCount > 0 && _waitLoadModel.isNotEmpty)) {
      final entities = _waitLoadModel.entries
          .where((e) => readerIsForward ? e.key >= index : e.key <= index);
      if (entities.isNotEmpty) {
        final entity = entities.reduce((value, element) =>
            (value.key - index).abs() < (element.key - index).abs()
                ? value
                : element);
        _waitLoadModel.remove(entity.key);
        // TODO，加载逻辑放在这一层或上一层做
        loadModel(entity.key).whenComplete(() => _trigger(currentIndex));
      }
    }
  }

  /// 请求加载数据
  Future<void> loadModel(int index);
}
