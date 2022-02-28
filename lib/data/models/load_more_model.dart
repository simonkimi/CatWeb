import 'dart:async';

import 'package:dio/dio.dart' hide Lock;
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:synchronized/synchronized.dart';

enum LoadMoreState {
  idle, // 待命
  loading, // 加载中
  noMoreData, // 没有其他数据了
  refreshing, // 刷新中
  loadError, // 加载更多出错
}

mixin LoadMoreMixin {
  final _requestLock = Lock();

  final refreshController = RefreshController();

  final Rx<LoadMoreState> _state = LoadMoreState.idle.obs;

  final Rx<Exception?> _exception = Rx<Exception?>(null);

  bool get isLoading =>
      _state.value == LoadMoreState.loading ||
      _state.value == LoadMoreState.refreshing;

  bool get canLoadMore =>
      _state.value == LoadMoreState.idle ||
      _state.value == LoadMoreState.loadError;

  LoadMoreState get state => _state.value;

  Future<void> awaitLock() => _requestLock.synchronized(() {});

  void loadStart() {
    _state.value = LoadMoreState.loading;
    _exception.value = null;
  }

  void loadComplete() {
    _state.value = LoadMoreState.idle;
    refreshController.loadComplete();
    refreshController.refreshCompleted();
  }

  void loadNoData() {
    _state.value = LoadMoreState.noMoreData;
    refreshController.loadNoData();
  }

  void loadError(Exception e) {
    if (e is DioError && CancelToken.isCancel(e)) {
      return;
    }
    _state.value = LoadMoreState.loadError;
    _exception.value = e;
    refreshController.loadFailed();
  }

  void loadRefresh() {
    _state.value = LoadMoreState.refreshing;
    _exception.value = null;
  }

  String? get errorMessage {
    if (_exception.value == null) return null;

    if (_exception.value is DioError) {
      return (_exception.value as DioError).message;
    }

    return _exception.value.toString();
  }
}

abstract class LoadMoreList<T> with LoadMoreMixin {
  final RxList<T> items = <T>[].obs;

  final RxInt _page = 0.obs; // 加载更多是从page=0开始的

  Future<List<T>> loadPage(int page);

  bool isItemExist(T item);

  Future<void> onLoadMore() async {
    if (_requestLock.locked) return awaitLock();
    try {
      await _requestLock.synchronized(() async {
        loadStart();
        final page = _page.value + 1;
        final loadItems = await loadPage(page);
        if (loadItems.isEmpty) {
          loadNoData();
        } else {
          _page.value = page;
          items.addAll(loadItems.where((e) => !isItemExist(e)));
          loadComplete();
        }
      });
    } on Exception catch (e) {
      loadError(e);
    }
  }

  Future<void> onRefresh() async {
    if (_requestLock.locked) return awaitLock();
    items.clear();
    _page.value = 0;
    loadRefresh();
    await onLoadMore();
  }

  void dispose() {
    refreshController.dispose();
  }

  void requestFirstLoad() {
    if (items.isEmpty && state == LoadMoreState.idle) {
      onRefresh();
    }
  }
}

abstract class LoadMoreMap<T> with LoadMoreMixin {
  final RxMap<int, T?> map = <int, T?>{}.obs;

  int length() => map.entries.fold(
      0,
      (previousValue, element) =>
          element.value != null && (element.key + 1) > (previousValue + 1)
              ? (element.key + 1)
              : previousValue);

  List<T> get getCoiledItems => map.entries
      .takeWhile((value) => value.value != null)
      .map((e) => e.value!)
      .toList();

  int? get chunkSize; // 每块图片数量, 如果为null则不允许跳页

  int? get totalSize; // 一共有多少图片, 为null则不允许跳页

  final RxInt _page = 0.obs; // 初始加载页面记录

  Future<List<T>> loadPage(int page);

  Future<void> onLoadMore() async {
    if (_requestLock.locked) return awaitLock();
    try {
      await _requestLock.synchronized(() async {
        loadStart();
        final loadItems = await loadPage(_page.value + 1);
        if (loadItems.isEmpty) {
          loadNoData();
        } else {
          _page.value += 1;
          final _mapLength = length();
          for (var i = 0; i < loadItems.length; i++) {
            map[_mapLength + i] = loadItems[i];
          }
          if (chunkSize != null && chunkSize != loadItems.length) {
            loadNoData();
          } else {
            loadComplete();
          }
        }
      });
    } on Exception catch (e) {
      loadError(e);
    }
  }

  bool isItemExist(T item);

  Future<void> onJumpPage(int page) async {
    assert(chunkSize != null);
    assert(totalSize != null);
    try {
      await _requestLock.synchronized(() async {
        loadStart();
        final loadItems = await loadPage(page);
        _page.value = page;
        final baseIndex = page * chunkSize!;
        for (var i = 0; i < loadItems.length; i++) {
          map[baseIndex + i] = loadItems[i];
        }
        loadComplete();
      });
    } on Exception catch (e) {
      loadError(e);
    }
  }

  Future<void> onRefresh() async {
    if (_requestLock.locked) return awaitLock();
    map.clear();
    _page.value = 0;
    loadRefresh();
    await onLoadMore();
  }
}
