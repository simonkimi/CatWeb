import 'package:dio/dio.dart' hide Lock;
import 'package:get/get.dart';
import 'package:synchronized/synchronized.dart';

enum LoadMoreState {
  idle, // 待命
  loading, // 加载中
  noMoreData, // 没有其他数据了
  refreshing, // 刷新中
}

abstract class LoadMoreModel<T> extends GetxController {
  final lock = Lock();

  final RxList<T> _items = <T>[].obs;

  RxList<T> get items => _items;

  final RxInt _page = 0.obs;

  RxInt get page => _page;

  final RxInt _pageTail = 0.obs;

  RxInt get pageTail => _pageTail;

  final Rx<Exception?> _lastException = Rx(null);

  final Rx<LoadMoreState> _state = LoadMoreState.idle.obs;

  LoadMoreState get state => _state.value;

  bool get isLoading =>
      state == LoadMoreState.loading || state == LoadMoreState.refreshing;

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

  Future<void> onRefresh() async {
    if (state == LoadMoreState.idle) {
      if (isRefresh) {
        _page.value = 0;
        _items.clear();
        await _loadNextPage();
      } else {
        await _loadPreviousPage();
      }
    }
  }

  Future<void> onLoadMore() async {
    if (state == LoadMoreState.idle) await _loadNextPage();
  }

  Future<void> _loadNextPage() async {
    try {
      await lock.synchronized(() async {
        _lastException.value = null;
        _state.value = LoadMoreState.loading;
        final page = _page.value + 1;
        final items =
            (await loadPage(page)).where((e) => isItemExist(e) == false);
        if (items.isEmpty) {
          _state.value = LoadMoreState.noMoreData;
        } else {
          _page.value = page;
          _items.addAll(items);
          _state.value = LoadMoreState.idle;
        }
      });
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) return;
      _lastException.value = e;
      _state.value = LoadMoreState.idle;
    } on Exception catch (e) {
      _lastException.value = e;
      _state.value = LoadMoreState.idle;
    }
  }

  Future<void> _loadPreviousPage() async {
    try {
      _lastException.value = null;
      await lock.synchronized(() async {
        _state.value = LoadMoreState.refreshing;
        final page = _pageTail.value - 1;
        final items =
            (await loadPage(page)).where((e) => isItemExist(e) == false);
        if (items.isNotEmpty) {
          _page.value = page;
          _items.insertAll(0, items);
        }
        _state.value = LoadMoreState.idle;
      });
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) return;
      _state.value = LoadMoreState.refreshing;
      _lastException.value = e;
    } on Exception catch (e) {
      _state.value = LoadMoreState.refreshing;
      _lastException.value = e;
      rethrow;
    }
  }
}
