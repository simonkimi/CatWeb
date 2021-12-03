import 'package:dio/dio.dart' hide Lock;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:synchronized/synchronized.dart';

abstract class LoadMoreModel<T> extends GetxController {
  final refreshController = RefreshController();
  final listScrollController = ScrollController();

  final RxBool _isLoading = false.obs;

  final lock = Lock();

  RxBool get isLoading => _isLoading;

  final RxList<T> _items = <T>[].obs;

  RxList<T> get items => _items;

  final RxInt _page = 0.obs;

  RxInt get page => _page;

  final RxInt _pageTail = 0.obs;

  RxInt get pageTail => _pageTail;

  final Rx<Exception?> lastException = Rx(null);

  Future<List<T>> loadPage(int page);

  bool isItemExist(T item);

  bool get isRefresh => _pageTail.value < 1;

  Future<void> onRefresh() async {
    _page.value = 0;
    _items.clear();
    await _loadNextPage();
  }

  Future<void> onLoadMore() async {
    if (refreshController.isRefresh || lock.locked) return;
    await _loadNextPage();
  }

  Future<void> onLoadPrevious() async {
    if (isRefresh) return;
    await _loadPreviousPage();
  }

  Future<void> _loadNextPage() async {
    try {
      lastException.value = null;
      await lock.synchronized(() async {
        _isLoading.value = true;
        final page = _page.value + 1;
        final items =
            (await loadPage(page)).where((e) => isItemExist(e) == false);
        if (items.isEmpty) {
          refreshController.loadNoData();
        } else {
          _page.value = page;
          _items.addAll(items);
        }
      });
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) return;
      refreshController.loadFailed();
      refreshController.refreshFailed();
      lastException.value = e;
    } on Exception catch (e) {
      refreshController.loadFailed();
      lastException.value = e;
      rethrow;
    } finally {
      refreshController.loadComplete();
      refreshController.refreshCompleted();
      _isLoading.value = false;
    }
  }

  Future<void> _loadPreviousPage() async {
    try {
      lastException.value = null;
      await lock.synchronized(() async {
        _isLoading.value = true;
        final page = _pageTail.value - 1;
        final items =
            (await loadPage(page)).where((e) => isItemExist(e) == false);
        if (items.isEmpty) {
          refreshController.loadNoData();
        } else {
          _page.value = page;
          _items.insertAll(0, items);
        }
      });
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) return;
      refreshController.refreshFailed();
      refreshController.loadFailed();
      lastException.value = e;
    } on Exception catch (e) {
      refreshController.loadFailed();
      lastException.value = e;
      rethrow;
    } finally {
      refreshController.loadComplete();
      refreshController.refreshCompleted();
      _isLoading.value = false;
    }
  }
}
