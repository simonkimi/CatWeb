import 'dart:async';

import 'package:catweb/data/loading/paged_loader.dart';
import 'package:flutter/foundation.dart';

/// 将纯 Dart [PagedLoader] 快照桥接到 Flutter [ChangeNotifier] 的薄适配层。
///
/// mixin 不处理滚动、刷新控件或网站规则。宿主在 `dispose` 中必须调用
/// [disposePageLoader]。
mixin PagedLoaderNotifier<T> on ChangeNotifier {
  late final PagedLoader<T> pageLoader;
  late PagedSnapshot<T> pageSnapshot;
  StreamSubscription<PagedSnapshot<T>>? _pageSubscription;
  bool _pageBridgeDisposed = false;

  /// 绑定唯一的分页加载器并订阅其状态流。
  void bindPageLoader(PagedLoader<T> loader) {
    pageLoader = loader;
    pageSnapshot = loader.state;
    _pageSubscription = loader.states.listen((snapshot) {
      if (_pageBridgeDisposed) return;
      pageSnapshot = snapshot;
      notifyListeners();
    });
  }

  /// 按绝对索引顺序迭代当前已经加载的项目。
  Iterable<T> get loadedItems sync* {
    final indices = pageSnapshot.items.keys.toList()..sort();
    for (final index in indices) {
      yield pageSnapshot.items[index] as T;
    }
  }

  /// 加载初始页。
  Future<void> loadInitial() => pageLoader.loadInitial();

  /// 加载下一页。
  Future<void> loadNextPage() => pageLoader.loadNext();

  /// 清空并刷新分页数据。
  Future<void> refresh() => pageLoader.refresh();

  /// 确保绝对 [index] 所在页已加载。
  Future<void> loadIndex(int index) => pageLoader.ensureIndex(index);

  /// 精确重试最近一次失败的页面请求。
  Future<void> retry() => pageLoader.retry();

  /// 取消订阅并异步销毁分页加载器。
  void disposePageLoader() {
    _pageBridgeDisposed = true;
    unawaited(_pageSubscription?.cancel());
    _pageSubscription = null;
    unawaited(pageLoader.dispose());
  }
}
