import 'dart:math';

import 'package:catweb/data/models/page_loader_state.dart';
import 'package:catweb/utils/debug.dart';
import 'package:catweb/utils/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

/// 一页的数据
abstract class BasePageData<TItem> {
  /// 每一页中的每一项数据
  List<TItem> get items;

  void dispose();
}

/// 页面数据加载Notifier
/// TItems: 每一项数据
/// TPage: 一页的数据
abstract class BasePageLoaderNotifier<TItems,
    TPage extends BasePageData<TItems>> with ChangeNotifier {
  final pageData = <int, TPage>{};

  int _currentPage = -1;
  int _startPage = 0;

  PageLoaderState state = const PageLoaderState.idle();

  int? get chunkSize; // 每块图片数量, 如果为null则只能一面一面跳页
  int? get totalSize; // 一共有多少图片, 为null则不允许跳页

  Future<TPage> loadPageImpl(int page);

  Future<void> loadNextPage() async {
    if (checkIfOutOfRange(_currentPage)) {
      state = const PageLoaderState.end();
      notifyListeners();
      return;
    }
    await _loadPageData(_currentPage + 1);
    _currentPage += 1;
    if (checkIfOutOfRange(_currentPage + 1)) {
      logger.d('下一面 $_currentPage 超出范围, 没有更多');
      state = const PageLoaderState.end();
      notifyListeners();
    }
    if (state.isLoading) {
      state = const PageLoaderState.idle();
    }
  }

  Future<void> refresh() async {
    pageData.clear();
    _currentPage = -1;
    await loadNextPage();
  }

  Future<void> loadIndex(int index) async {
    if (totalSize == null || chunkSize == null) {
      while (items.length < index) {
        await loadNextPage();
      }
    } else {
      final pageIndex = (index / chunkSize!).floor();
      await _loadPageData(pageIndex);
    }
    if (state.isLoading) {
      state = const PageLoaderState.idle();
    }
  }

  Future<void> _loadPageData(int page) async {
    if (pageData.containsKey(page)) return;
    logger.d('当前页面', _currentPage, '准备加载页面', page);
    state = const PageLoaderState.loading();
    notifyListeners();
    try {
      final data = await loadPageImpl(page);
      pageData[page] = data;
      logger.d('加载', page, '完成');
      notifyListeners();
    } catch (e, stack) {
      logger.e('加载', page, '失败', e, stack);
      state = PageLoaderState.error(e, stack);
      notifyListeners();
    }
  }

  bool checkIfOutOfRange(int page) {
    if (totalSize == null || chunkSize == null) return false;
    return (page + 1) * chunkSize! >= totalSize!;
  }

  Future<void> jumpPage(int page) async {
    _currentPage = page - 1;
    _startPage = page;
    await loadNextPage();
  }

  Iterable<TPage> get successivePages =>
      (pageData.entries.where((e) => e.key >= _startPage).toList()
            ..sort((a, b) => a.key - b.key))
          .getSuccessive((e) => e.key)
          .map((e) => e.value);

  Iterable<TItems?> get allItems sync* {
    assert(chunkSize != null);
    if (totalSize != null) {
      for (var i = 0; i < totalSize!; i++) {
        final index = (i / chunkSize!).floor();
        yield pageData[index]?.items.elementAtOrNull(i % chunkSize!);
      }
    } else {
      final maxIndex = pageData.keys.fold(-1, max);
      for (var i = 0; i <= maxIndex; i++) {
        final chunk =
            i == maxIndex ? pageData[maxIndex]!.items.length : chunkSize!;
        for (var j = 0; j < chunk; j++) {
          yield pageData[i]?.items[j];
        }
      }
    }
  }

  Iterable<TItems> get successiveItems =>
      successivePages.expand((e) => e.items);

  Iterable<TItems?> get items => chunkSize == null ? successiveItems : allItems;

  @override
  void dispose() {
    super.dispose();
    for (final page in pageData.values) {
      page.dispose();
    }
  }
}
