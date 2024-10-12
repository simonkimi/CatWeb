import 'package:catweb/data/controller/settings.dart';
import 'package:catweb/data/loaders/priority_task_query.dart';
import 'package:catweb/data/models/image_with_preview.dart';
import 'package:catweb/data/models/site/site_blueprint.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/navigator.dart';
import 'package:catweb/network/client/image_concurrency.dart';
import 'package:catweb/utils/debug.dart';
import 'package:catweb/utils/helper.dart';
import 'package:flutter/cupertino.dart';


abstract class ReaderInfo<T extends ImageWithPreviewModel> {
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

  _LoadPageTask({required this.index, required this.readerInfo});

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
  }
}

class ReaderLoaderNotifier extends ChangeNotifier {
  final ReaderInfo readerInfo;
  final SiteBlueprint blueprint;
  final SiteEnvStore localEnv;
  final SettingService settingService = getIt.get();

  final PriorityTaskQuery<_LoadPageTask> _loadPageQuery =
      PriorityTaskQuery(maxConcurrency: 1);

  ReaderLoaderNotifier({
    required this.readerInfo,
    required this.blueprint,
    required this.localEnv,
  });

  /// 阅读器是否是正向的, 用于判断预加载的方向
  bool readerIsForward = true;
  int currentPage = 0;

  Future onIndexChanged(int index, bool isForward) async {
    readerIsForward = isForward;
    currentPage = index;
    final items = readerInfo.items.toList();
  }

  int get preloadCount => settingService.preloadCount;
}
