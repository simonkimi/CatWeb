import 'dart:async';
import 'dart:math';

import 'package:catweb/utils/debug.dart';
import 'package:catweb/utils/state_mixin.dart';
import 'package:catweb/utils/helper.dart';
import 'package:dio/dio.dart' hide Lock;
import 'package:event_bus/event_bus.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:synchronized/synchronized.dart';

import 'load_more_actions.dart';

abstract class LoadMoreBase with LoadListStateMixin {
  final _requestLock = Lock();

  final refreshController = RefreshController();

  Future<void> awaitLock() => _requestLock.synchronized(() {});

  @override
  void loadComplete() {
    super.loadComplete();
    if (state.isComplete || state.isIdle) {
      refreshController.loadComplete();
      refreshController.refreshCompleted();
    }
  }

  @override
  void loadNoData() {
    super.loadNoData();
    refreshController.loadNoData();
  }

  @override
  void loadError(Exception error) {
    super.loadError(error);
    refreshController.loadFailed();
  }

  void dispose() {
    refreshController.dispose();
  }
}

abstract class LoadMoreItem<T, E, V> {
  LoadMoreItem(this.pageData, {List<V> Function(T data)? genModel}) {
    models = genModel != null ? genModel(pageData) : [];
  }

  /// 页面数据
  final T pageData;

  List<E> get items;

  late final List<V> models;
}

abstract class LoadMorePage<T, E, V> extends LoadMoreBase {
  final RxMap<int, LoadMoreItem<T, E, V>> pages = <int, LoadMoreItem<T, E, V>>{}.obs;
  final RxInt _currentPage = (-1).obs; // 下一面，上一面要用的
  final RxInt _startPage = (0).obs;
  final event = EventBus();

  /// 检查加载的数据是否已经超出范围
  bool checkIfOutOfRange(int page) {
    if (totalSize == null || chunkSize == null) return false;
    return (page + 1) * chunkSize! >= totalSize!;
  }

  /// 这里传入的page应该是以0开始的, 第一面就是0
  Future<void> _loadPageData(int page) async {
    await _requestLock.synchronized(() async {
      if (pages.containsKey(page)) return;
      logger.i('当前页面', _currentPage.value, '准备加载页面', page);
      loadStart();
      final pageData = await netWorkLoadPage(page);
      pages[page] = pageData;
      logger.i('加载', page, '完成');
    });
  }

  /// 加载下一面数据
  Future<void> onLoadMore() async {
    try {
      if (!checkIfOutOfRange(_currentPage.value)) {
        await _loadPageData(_currentPage.value + 1);
        event.fire(LoaderNextPageEvent());
        _currentPage.value += 1;
        loadComplete();
        if (checkIfOutOfRange(_currentPage.value)) {
          logger.i('下一面${_currentPage.value}超出范围, 没有更多', _currentPage.value);
          loadNoData();
        }
      } else {
        loadNoData();
      }
    } on DioError catch (e) {
      loadError(e);
    } on Exception catch (e) {
      loadError(e);
    }
  }

  /// 刷新页面数据
  Future<void> onRefresh() async {
    if (_requestLock.locked) return awaitLock();
    pages.clear();
    _currentPage.value = -1;
    loadRefresh();
    await onLoadMore();
    event.fire(LoaderRefreshEvent());
  }

  /// 加载指定的index，用于在预览中跳页
  // Future<void> loadIndex(int index, [RxBool? stop]) async {
  //   return await _requestLock.synchronized(() async {
  //     if (totalSize == null || chunkSize == null) {
  //       // 没有确切的面数, 只能一面面加载
  //       while (items.length < index) {
  //         if (stop?.isTrue ?? false) {
  //           break;
  //         }
  //         await onLoadMore();
  //       }
  //     } else {
  //       // 有确切的面数, 直接加载
  //       final page = (index / chunkSize!).floor();
  //       await _loadPageData(page);
  //     }
  //   });
  // }

  /// 跳页，加载某夜数据
  Future<void> jumpPage(int page) async {
    _currentPage.value = page - 1;
    _startPage.value = page;
    await onLoadMore();
  }

  Future<LoadMoreItem<T, E, V>> netWorkLoadPage(int page);

  int? get chunkSize; // 每块图片数量, 如果为null则只能一面一面跳页
  int? get totalSize; // 一共有多少图片, 为null则不允许跳页

  Iterable<E> get successiveItems => successivePages.expand((e) => e.items);

  Iterable<LoadMoreItem<T, E, V>> get successivePages =>
      (pages.entries.where((e) => e.key >= _startPage.value).toList()
            ..sort((a, b) => a.key - b.key))
          .getSuccessive((e) => e.key)
          .map((e) => e.value);

  Iterable<E?> get allItems sync* {
    assert(chunkSize != null);
    if (totalSize != null) {
      for (var i = 0; i < totalSize!; i++) {
        final index = (i / chunkSize!).floor();
        final model = pages[index];
        if (model == null) {
          yield null;
        } else {
          yield model.items.index(i % chunkSize!);
        }
      }
    } else {
      final maxIndex = pages.keys.fold(-1, max);
      for (var i = 0; i <= maxIndex; i++) {
        final chunk =
            i == maxIndex ? pages[maxIndex]!.items.length : chunkSize!;
        for (var j = 0; j < chunk; j++) {
          yield pages[i]?.items[j];
        }
      }
    }
  }

  Iterable<E?> get items => chunkSize == null ? successiveItems : allItems;
}
