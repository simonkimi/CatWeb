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

abstract class LoadMoreModel<T> {
  LoadMoreModel() {
    _stateListener = _rxState.listen((state) {
      print('Loading State: $state');
      switch (state) {
        case LoadMoreState.idle:
          refreshController.loadComplete();
          break;
        case LoadMoreState.noMoreData:
          refreshController.loadNoData();
          break;
        case LoadMoreState.loadError:
          refreshController.loadFailed();
          break;
        case LoadMoreState.refreshing:
        case LoadMoreState.loading:
          break;
      }
    });
  }

  late final StreamSubscription<LoadMoreState> _stateListener;

  final _lock = Lock();

  final refreshController = RefreshController();

  final RxList<T> _items = <T>[].obs;

  RxList<T> get items => _items;

  final RxInt _page = 0.obs;

  RxInt get page => _page;

  final RxInt _pageTail = 0.obs;

  RxInt get pageTail => _pageTail;

  final Rx<Exception?> _lastException = Rx(null);

  final Rx<LoadMoreState> _rxState = LoadMoreState.idle.obs;

  LoadMoreState get state => _rxState.value;

  bool get isLoading =>
      state == LoadMoreState.loading || state == LoadMoreState.refreshing;

  bool get canLoadMore =>
      state == LoadMoreState.idle || state == LoadMoreState.loadError;

  bool get isFullScreenLoading => items.isEmpty && isLoading;

  bool get isFullScreenError => items.isEmpty && _lastException.value != null;

  String? get errorMessage {
    if (_lastException.value == null) return null;

    if (_lastException.value is DioError) {
      return (_lastException.value as DioError).message;
    }

    return _lastException.value.toString();
  }

  Future<List<T>> loadPage(int page);

  bool isItemExist(T item);

  bool get isRefresh => _pageTail.value < 1;

  Future<void> requestFirstLoad() async {
    if (state == LoadMoreState.idle &&
        _lastException.value == null &&
        items.isEmpty) {
      await onRefresh();
    }
  }

  Future<void> onRefresh() async {
    if (!isLoading) {
      if (isRefresh) {
        _page.value = 0;
        _items.clear();
        _rxState.value = LoadMoreState.refreshing;
        await _loadNextPage();
      } else {
        await _loadPreviousPage();
      }
    }
  }

  Future<void> onLoadMore() async {
    if (canLoadMore) {
      _rxState.value = LoadMoreState.loading;
      await _loadNextPage();
    } else {
      refreshController.loadComplete();
    }
  }

  Future<void> _loadNextPage() async {
    try {
      await _lock.synchronized(() async {
        _lastException.value = null;
        final page = _page.value + 1;
        final loadItems = await loadPage(page);
        final items = loadItems.where((e) => !isItemExist(e));
        if (items.isEmpty) {
          _rxState.value = LoadMoreState.noMoreData;
        } else {
          _page.value = page;
          _items.addAll(items);
          _rxState.value = LoadMoreState.idle;
        }
      });
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) return;
      _lastException.value = e;
      _rxState.value = LoadMoreState.loadError;
    } on Exception catch (e) {
      _lastException.value = e;
      _rxState.value = LoadMoreState.loadError;
    }
  }

  Future<void> _loadPreviousPage() async {
    try {
      _lastException.value = null;
      await _lock.synchronized(() async {
        _rxState.value = LoadMoreState.refreshing;
        final page = _pageTail.value - 1;
        final items =
            (await loadPage(page)).where((e) => isItemExist(e) == false);
        if (items.isNotEmpty) {
          _page.value = page;
          _items.insertAll(0, items);
        }
        _rxState.value = LoadMoreState.idle;
      });
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) return;
      _rxState.value = LoadMoreState.loadError;
      _lastException.value = e;
    } on Exception catch (e) {
      _rxState.value = LoadMoreState.loadError;
      _lastException.value = e;
      rethrow;
    }
  }

  void dispose() {
    _stateListener.cancel();
  }
}
