import 'dart:async';
import 'dart:math';
import 'package:catweb/utils/debug.dart';
import 'package:catweb/utils/helper.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:synchronized/synchronized.dart';
import 'load_more_mixin.dart';

/// 加载中每一个数据的内部值
abstract class LoadMoreItem<E> {
  E get value;
}

/// 用于加载一面一面数据
abstract class LoadMorePage<T, E, V extends LoadMoreItem<E>> {
  LoadMorePage(this.pageData) {
    models = genModel();
  }

  /// 页面数据
  final T pageData;

  /// 页面数据内有效的列表数据
  List<E> get items;

  /// 列表数据经过处理后模型
  late final List<V> models;

  List<V> genModel();
}

/// 加载控制器: 页面风格
/// T: 页面数据, E: 项目原始数据, V: 项目处理模型数据
abstract class LoadMoreLoader<T, E, V extends LoadMoreItem<E>>
    extends LoadMoreBase {
  final RxMap<int, LoadMorePage<T, E, V>> pages =
      <int, LoadMorePage<T, E, V>>{}.obs;
  final RxInt _currentPage = (-1).obs; // 下一面，上一面要用的
  final RxInt _startPage = (0).obs;

  /// 检查加载的数据是否已经超出范围
  bool checkIfOutOfRange(int page) {
    if (totalSize == null || chunkSize == null) return false;
    return (page + 1) * chunkSize! >= totalSize!;
  }

  /// 这里传入的page应该是以0开始的, 第一面就是0
  Future<void> _loadPageData(int page) async {
    await requestLock.synchronized(() async {
      if (pages.containsKey(page)) return;
      logger.d('当前页面', _currentPage.value, '准备加载页面', page);
      stateLoadStart();
      final pageData = await netWorkLoadPage(page);
      pages[page] = pageData;
      logger.d('加载', page, '完成');
    });
  }

  /// 加载下一面数据
  Future<void> onLoadMore() async {
    try {
      if (!checkIfOutOfRange(_currentPage.value)) {
        await _loadPageData(_currentPage.value + 1);
        _currentPage.value += 1;
        stateLoadComplete();
        if (checkIfOutOfRange(_currentPage.value)) {
          logger.d('下一面${_currentPage.value}超出范围, 没有更多', _currentPage.value);
          stateLoadNoData();
        }
      } else {
        stateLoadNoData();
      }
    } on DioException catch (e) {
      stateLoadError(e);
    } on Exception catch (e) {
      stateLoadError(e);
    }
  }

  /// 刷新页面数据
  Future<void> onRefresh() async {
    if (requestLock.locked) return awaitLock();
    pages.clear();
    _currentPage.value = -1;
    stateLoadRefresh();
    await onLoadMore();
  }

  final loadIndexLock = Lock();

  /// 加载指定的index，用于在预览中跳页
  Future<void> loadIndex(int index) async {
    await loadIndexLock.synchronized(() async {
      if (totalSize == null || chunkSize == null) {
        // 没有确切的面数, 只能一面面加载
        // 没有确定面数, item必定是连续的, 不存在null的可能性
        while (items.length < index) {
          await onLoadMore();
        }
      } else {
        // 有确切的面数, 直接加载
        final page = (index / chunkSize!).floor();
        await _loadPageData(page);
      }
    });
  }

  /// 跳页，加载某夜数据
  Future<void> jumpPage(int page) async {
    _currentPage.value = page - 1;
    _startPage.value = page;
    await onLoadMore();
  }

  Future<LoadMorePage<T, E, V>> netWorkLoadPage(int page);

  int? get chunkSize; // 每块图片数量, 如果为null则只能一面一面跳页
  int? get totalSize; // 一共有多少图片, 为null则不允许跳页

  Iterable<V> get successiveItems => successivePages.expand((e) => e.models);

  Iterable<LoadMorePage<T, E, V>> get successivePages =>
      (pages.entries.where((e) => e.key >= _startPage.value).toList()
            ..sort((a, b) => a.key - b.key))
          .getSuccessive((e) => e.key)
          .map((e) => e.value);

  Iterable<V?> get allItems sync* {
    assert(chunkSize != null);
    if (totalSize != null) {
      for (var i = 0; i < totalSize!; i++) {
        final index = (i / chunkSize!).floor();
        yield pages[index]?.models.index(i % chunkSize!);
      }
    } else {
      final maxIndex = pages.keys.fold(-1, max);
      for (var i = 0; i <= maxIndex; i++) {
        final chunk =
            i == maxIndex ? pages[maxIndex]!.items.length : chunkSize!;
        for (var j = 0; j < chunk; j++) {
          yield pages[i]?.models[j];
        }
      }
    }
  }

  Iterable<V?> get items => chunkSize == null ? successiveItems : allItems;
}
