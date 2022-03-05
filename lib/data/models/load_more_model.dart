import 'dart:async';

import 'package:catweb/utils/debug.dart';
import 'package:catweb/utils/utils.dart';
import 'package:dio/dio.dart' hide Lock;
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:synchronized/synchronized.dart';
import 'package:tuple/tuple.dart';

enum LoadMoreState {
  idle, // 待命
  loading, // 加载中
  noMoreData, // 没有其他数据了
  refreshing, // 刷新中
  loadError, // 加载更多出错
}

abstract class LoadMoreBase {
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
    if ([
      LoadMoreState.loading,
      LoadMoreState.refreshing,
      LoadMoreState.loadError
    ].contains(_state.value)) {
      _state.value = LoadMoreState.idle;
      refreshController.loadComplete();
      refreshController.refreshCompleted();
    }
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

abstract class LoadMoreList<E, T> extends LoadMoreBase {
  final RxList<T> items = <T>[].obs;
  final RxList<E> pages = <E>[].obs;

  final RxInt _page = (-1).obs; // 加载更多是从page=0开始的

  Future<Tuple2<E, List<T>>> loadPage(int page);

  bool isItemExist(T item);

  Future<void> onLoadMore() async {
    if (_requestLock.locked) return awaitLock();
    try {
      await _requestLock.synchronized(() async {
        loadStart();
        final loadItems = await loadPage(_page.value + 1);
        _page.value += 1;
        if (loadItems.item2.isEmpty) {
          loadNoData();
        } else {
          items.addAll(loadItems.item2.where((e) => !isItemExist(e)));
          pages.add(loadItems.item1);
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
    pages.clear();
    _page.value = -1;
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

abstract class LoadMoreMap<E, T> extends LoadMoreBase {
  final RxMap<int, E?> pages = <int, E?>{}.obs;
  final RxMap<int, T?> items = <int, T?>{}.obs;

  int? get chunkSize; // 每块图片数量, 如果为null则只能一面一面跳页

  int? get totalSize; // 一共有多少图片, 为null则不允许跳页

  String get baseUrl;

  /// page是由0开始的, 所以初始为-1, 在 +1 后变为0
  final RxInt _page = (-1).obs; // 初始加载页面记录

  /// 加载(page)面的数据, 这里的page是以0开始的
  Future<Tuple2<E, List<T>>> loadPage(int page);

  bool isItemExist(T item);

  Future<void> onLoadMore() async {
    try {
      if (!checkIfOutOfRange(_page.value)) {
        await onJumpPage(_page.value + 1);
      } else {
        loadNoData();
      }
      if (checkIfOutOfRange(_page.value)) {
        loadNoData();
      }
    } on DioError catch (e) {
      loadError(e);
    } on Exception catch (e) {
      loadError(e);
    }
  }

  bool checkIfOutOfRange(int page) {
    if (totalSize == null || chunkSize == null) return false;
    return (page + 1) * chunkSize! >= totalSize!;
  }

  /// 这里传入的page应该是以0开始的, 第一面就是0
  Future<void> onJumpPage(int page) async {
    log('当前页面', _page.value, '准备加载页面', page);
    await _requestLock.synchronized(() async {
      if (pages.containsKey(page)) return;
      loadStart();
      final pageData = await loadPage(page);
      pages[page] = pageData.item1;
      // 如果没有每面页数的话, 则不允许直接跳转对应面数, 只能一面一面加载, 直接寻找到最大位置即可
      if (chunkSize == null) {
        // 如果一面一面加载没有数据了, 就说明加载完毕
        if (pageData.item2.isEmpty) loadNoData();
        for (var i = 0; i < pageData.item2.length; i++) {
          items[i + pages.trueLength] = pageData.item2[i];
        }
      } else {
        // 有最大面数的话, 则在对应的位置进行加载
        for (var i = 0; i < pageData.item2.length; i++) {
          items[page * chunkSize! + i] = pageData.item2[i];
        }
      }
      _page.value = page;
    });
  }

  Future<void> requestLoadItem(int index, [RxBool? stop]) async {
    if (totalSize == null) throw UnsupportedError('必须知道总体数量才能跳页');
    if (chunkSize != null) {
      // 有确切的面数, 直接加载
      final page = (index / chunkSize!).floor();
      await loadPage(page);
    } else {
      // 没有确切的面数, 只能一面面加载
      while (items.maxIndex < index) {
        if (stop?.isTrue ?? false) {
          break;
        }
        await onLoadMore();
      }
    }
  }

  Future<void> onRefresh() async {
    if (_requestLock.locked) return awaitLock();
    pages.clear();
    items.clear();
    _page.value = -1;
    loadRefresh();
    await onLoadMore();
  }
}
