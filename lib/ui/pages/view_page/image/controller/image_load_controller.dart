import 'package:catweb/data/loaders/async_task.dart';
import 'package:catweb/data/models/image_with_preview.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/navigator.dart';
import 'package:catweb/network/client/image_concurrency.dart';
import 'package:catweb/utils/debug.dart';
import 'package:catweb/utils/helper.dart';

abstract class ReaderInfo<T, V extends ImageWithPreviewModel> {
  /// 获取项目模型
  Iterable<V?> get items;

  /// 一共有多少项目
  int? get itemsCount;

  /// 告知上级去加载[index]的数据
  Future<void> loadIndexModel(int index);

  /// 初始界面的index
  int? get startReadIndex;

  void onReaderIndexChanged(int index) {}

  ImageListConcurrency get previewConcurrency;
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
  final SitePage blueprint;
  final SiteEnvStore localEnv;

  @override
  Future<void> run() async {
    final model = readerInfo.items.toList().index(index);
    if (model == null) {
      await readerInfo.loadIndexModel(index);
      if (model == null) {
        logger.f('加载$index后仍然为空');
        throw Exception('加载$index后仍然为空');
      }
    }
    await model.loadReaderModel(
      siteRule: blueprint,
      localEnv: localEnv,
    );
  }

  @override
  String? get id => index.toString();
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

  final SitePage blueprint;
  final SiteEnvStore localEnv;

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
    final preloadCount = get<SettingService>().preloadCount.value;
    final items = readerInfo.items.toList();
    final needLoadItem = List.generate(
            preloadCount + 1, // 加载预加载页面+1, e为index
            (index) => (readerIsForward ? 1 : -1) * index + currentIndex)
        .where((e) => e < items.length && e >= 0) // 过滤掉超出范围的页面
        .where((e) =>
            !items.has(e) ||
            (items[e]?.state.isComplete ?? false)) // 过滤掉已经完成的任务
        .where(
            (e) => !_loadModelPool.containsTaskId(e.toString())) // 过滤掉任务中已经存在的
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
