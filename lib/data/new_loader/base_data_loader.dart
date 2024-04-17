import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';

part 'base_data_loader.freezed.dart';

abstract class BasePageData<TItem> {
  TItem get item;
}

@freezed
class PagingState<TItem> with _$PagingState<TItem> {
  const PagingState._();

  const factory PagingState({
    @Default({}) Map<int, BasePageData<TItem>> pageData,
    @Default(0) int currentPage,
    @Default(0) int startPage,
    @Default(false) bool isEnd,
  }) = _PagingState;
}

abstract class BaseDataLoader<TItem> extends AsyncNotifier<PagingState<TItem>> {
  int? get totalSize;

  int? get chunkSize;

  @override
  FutureOr<PagingState<TItem>> build() {
    return const PagingState(
      pageData: {},
      currentPage: -1,
      startPage: 0,
      isEnd: false,
    );
  }

  Future<void> loadNextPage() async {

  }

  Future<void> _loadPageData(int page) async {
    if (state.value?.pageData.containsKey(page) == true) return;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final pageData = await loadPageData(page);
      return state.value!.copyWith(
        pageData: {
          ...state.value!.pageData,
          page: pageData,
        },
        currentPage: page,
      );
    });
  }

  bool checkPageOutOfRange(int page) {
    if (totalSize == null || chunkSize == null) return false;
    return (page + 1) * chunkSize! >= totalSize!;
  }

  Future<BasePageData<TItem>> loadPageData(int page);
}
