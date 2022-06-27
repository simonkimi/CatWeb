import 'package:catweb/data/controller/setting_controller.dart';
import 'package:catweb/data/loaders/async_task.dart';
import 'package:catweb/data/models/image_with_preview.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/utils/debug.dart';
import 'package:catweb/utils/helper.dart';
import 'package:get/get.dart';

abstract class ReaderInfo<T, V extends ImageWithPreviewModel<T>> {
  /// 获取项目模型
  Iterable<V?> get items;

  /// 一共有多少项目
  int? get itemsCount;

  /// 告知上级去加载[index]的数据
  Future<void> loadIndexModel(int index);

  /// 初始界面的index
  int? get startReadIndex;

  void onReaderIndexChanged(int index) {}
}

class _LoadModelTask extends AsyncTask<void> {
  _LoadModelTask({
    required this.readerInfo,
    required this.index,
    required this.blueprint,
    required this.localEnv,
  });

  final ReaderInfo readerInfo;
  final int index;
  final PageBlueprintModel blueprint;
  final SiteEnvModel localEnv;

  @override
  Future<void> run() async {
    final model = readerInfo.items.toList().index(index);
    if (model == null) {
      await readerInfo.loadIndexModel(index);
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

  @override
  int? get id => index;
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
  var readerIsForward = true;
  var currentIndex = 0;

  late final _loadModelPool = AsyncPool<_LoadModelTask>(
    priorityBuilder: (task) => 99999 - (currentIndex - task.index).abs(),
  );

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
        .where((e) => !_loadModelPool.contains(e))
        .map((e) => _LoadModelTask(
              blueprint: blueprint,
              localEnv: localEnv,
              readerInfo: readerInfo,
              index: e,
            ));

    _loadModelPool.removeWhere(
        (task) => readerIsForward ? task.index < index : task.index > index);
    _loadModelPool.addAll(needLoadItem);
  }
}
