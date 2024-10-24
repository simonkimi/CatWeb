import 'package:catweb/data/controller/settings.dart';
import 'package:catweb/data/loaders/priority_task_query.dart';
import 'package:catweb/data/models/image_with_preview.dart';
import 'package:catweb/data/models/site/page.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/app.dart';
import 'package:catweb/network/client/image_concurrency.dart';
import 'package:catweb/utils/debug.dart';
import 'package:catweb/utils/helper.dart';
import 'package:flutter/cupertino.dart';

abstract class ReaderInfo<T extends ImageWithPreviewModel> with ChangeNotifier {
  /// 获取项目模型
  Iterable<T?> get items;

  /// 一共有多少项目
  int? get itemsCount;

  /// 告知上级去加载[index]的数据
  Future<void> loadIndexModel(int index);

  /// 初始界面的index
  int? get startReadIndex;

  ImageLoaderQueue get previewConcurrency;
}

class _LoadPageTask extends PriorityTask<void> {
  final int index;
  final ReaderInfo readerInfo;
  final SitePageRule pageRule;
  final SiteEnvStore localEnv;

  _LoadPageTask({
    required this.index,
    required this.readerInfo,
    required this.pageRule,
    required this.localEnv,
  });

  @override
  int get id => index;

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
    await model.load(pageRule: pageRule, localEnv: localEnv);
  }
}

class ReaderLoaderNotifier extends ChangeNotifier {
  final ReaderInfo readerInfo;
  final SitePageRule sitePageRule;
  final SiteEnvStore localEnv;
  final SettingService settingService = getIt.get();

  final PriorityTaskQuery<_LoadPageTask> _loadPageQuery =
      PriorityTaskQuery(maxConcurrency: 1);

  ReaderLoaderNotifier({
    required this.readerInfo,
    required this.sitePageRule,
    required this.localEnv,
  });

  /// 阅读器是否是正向的, 用于判断预加载的方向
  bool readerIsForward = true;
  int currentIndex = 0;

  Future onIndexChanged(int index, bool isForward) async {
    readerIsForward = isForward;
    currentIndex = index;
    final items = readerInfo.items.toList();
    final needLoadIndex = List.generate(preloadCount + 1,
        (index) => (readerIsForward ? 1 : -1) * index + currentIndex);

    final needLoadItem = needLoadIndex
        .where((i) => i > 0 && i < items.length)
        .where((i) => items[i]?.imageModel.hasValue ?? false)
        .map((i) => MapEntry(
            (currentIndex - i).abs(),
            _LoadPageTask(
              index: i,
              readerInfo: readerInfo,
              pageRule: sitePageRule,
              localEnv: localEnv,
            )));
    _loadPageQuery.addAll(Map.fromEntries(needLoadItem));
  }

  int get preloadCount => settingService.preloadCount;
}
