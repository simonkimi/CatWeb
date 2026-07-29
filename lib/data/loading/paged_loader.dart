import 'dart:async';
import 'dart:collection';

import 'cancellation.dart';
import 'load_failure.dart';

/// 标识下一页位置的不可变游标。
sealed class PageCursor {
  const PageCursor();

  const factory PageCursor.number(int value) = NumberPageCursor;
  const factory PageCursor.token(String value) = TokenPageCursor;
  const factory PageCursor.uri(Uri value) = UriPageCursor;
}

/// 使用整数页码表示的游标。
final class NumberPageCursor extends PageCursor {
  const NumberPageCursor(this.value);
  final int value;

  @override
  bool operator ==(Object other) =>
      other is NumberPageCursor && other.value == value;

  @override
  int get hashCode => Object.hash(NumberPageCursor, value);
}

/// 使用不透明字符串表示的游标。
final class TokenPageCursor extends PageCursor {
  const TokenPageCursor(this.value);
  final String value;

  @override
  bool operator ==(Object other) =>
      other is TokenPageCursor && other.value == value;

  @override
  int get hashCode => Object.hash(TokenPageCursor, value);
}

/// 使用完整或相对 URI 表示的游标。
final class UriPageCursor extends PageCursor {
  const UriPageCursor(this.value);
  final Uri value;

  @override
  bool operator ==(Object other) =>
      other is UriPageCursor && other.value == value;

  @override
  int get hashCode => Object.hash(UriPageCursor, value);
}

/// 页面加载请求。
///
/// 初始页、顺序下一页和随机页使用不同子类型，避免用可空参数推断行为。
sealed class PageRequest {
  const PageRequest();

  const factory PageRequest.initial() = InitialPageRequest;
  const factory PageRequest.next(PageCursor cursor) = NextPageRequest;
  factory PageRequest.index(int pageIndex) {
    RangeError.checkNotNegative(pageIndex, 'pageIndex');
    return IndexedPageRequest._(pageIndex);
  }
}

/// 请求数据源的初始页。
final class InitialPageRequest extends PageRequest {
  const InitialPageRequest();

  @override
  bool operator ==(Object other) => other is InitialPageRequest;

  @override
  int get hashCode => Object.hash(InitialPageRequest, 0);
}

/// 根据 [cursor] 顺序请求下一页。
final class NextPageRequest extends PageRequest {
  const NextPageRequest(this.cursor);
  final PageCursor cursor;

  @override
  bool operator ==(Object other) =>
      other is NextPageRequest && other.cursor == cursor;

  @override
  int get hashCode => Object.hash(NextPageRequest, cursor);
}

/// 按从零开始的 [pageIndex] 请求指定页。
final class IndexedPageRequest extends PageRequest {
  const IndexedPageRequest._(this.pageIndex);

  final int pageIndex;

  @override
  bool operator ==(Object other) =>
      other is IndexedPageRequest && other.pageIndex == pageIndex;

  @override
  int get hashCode => Object.hash(IndexedPageRequest, pageIndex);
}

/// 数据源支持的分页访问能力。
sealed class PaginationCapabilities {
  const PaginationCapabilities();

  const factory PaginationCapabilities.sequential() =
      SequentialPaginationCapabilities;
  const factory PaginationCapabilities.indexed({required int pageSize}) =
      IndexedPaginationCapabilities;
}

/// 只能沿下一页游标顺序访问的数据源。
final class SequentialPaginationCapabilities extends PaginationCapabilities {
  const SequentialPaginationCapabilities();
}

/// 可根据固定 [pageSize] 随机访问页的数据源。
final class IndexedPaginationCapabilities extends PaginationCapabilities {
  const IndexedPaginationCapabilities({required this.pageSize})
    : assert(pageSize > 0, 'pageSize must be greater than zero');

  final int pageSize;
}

/// 数据源一次成功加载返回的不可变页面片段。
///
/// [startIndex] 是 [items] 第一项在完整结果中的绝对索引。
/// 当 [isLast] 为 `false` 时必须提供 [nextCursor]。
final class PageChunk<T> {
  PageChunk({
    required this.startIndex,
    required List<T> items,
    required this.isLast,
    this.nextCursor,
    this.totalCount,
  }) : items = List<T>.unmodifiable(items) {
    RangeError.checkNotNegative(startIndex, 'startIndex');
    if (totalCount case final count?) {
      RangeError.checkNotNegative(count, 'totalCount');
    }
  }

  final int startIndex;
  final List<T> items;
  final PageCursor? nextCursor;
  final int? totalCount;
  final bool isLast;
}

/// 为 [PagedLoader] 提供页面数据的纯 Dart 接口。
abstract interface class PageSource<T> {
  /// 当前数据源支持的分页访问方式。
  PaginationCapabilities get capabilities;

  /// 执行一次页面请求。
  ///
  /// 实现必须传播 [cancellation]，并且不能自行推进外部页指针。
  Future<PageChunk<T>> load(
    PageRequest request,
    CancellationScope cancellation,
  );
}

/// 可感知强制刷新的页面数据源。
abstract interface class RefreshablePageSource {
  /// 通知数据源下一次初始页请求属于刷新，应绕过普通缓存策略。
  void beginRefresh();
}

/// 当前分页加载器正在进行的活动。
enum PagedActivity { idle, initial, append, refresh, randomAccess }

/// 分页加载器对外发布的不可变快照。
///
/// [items] 以绝对索引保存，既能表达连续列表，也能表达图库随机页产生的空洞。
final class PagedSnapshot<T> {
  PagedSnapshot({
    required Map<int, T> items,
    required this.hasNext,
    required this.activity,
    this.totalCount,
    this.failure,
  }) : items = UnmodifiableMapView<int, T>(Map<int, T>.of(items));

  /// 创建尚未加载任何项目的快照。
  factory PagedSnapshot.empty({PagedActivity activity = PagedActivity.idle}) =>
      PagedSnapshot<T>(items: const {}, hasNext: true, activity: activity);

  final Map<int, T> items;
  final int? totalCount;
  final bool hasNext;
  final PagedActivity activity;
  final LoadFailure? failure;

  /// 返回绝对 [index] 处已加载的项目；稀疏页尚未加载时返回 `null`。
  T? itemAt(int index) => items[index];

  /// 当前实际驻留在内存中的项目数。
  int get loadedCount => items.length;

  /// UI 可见的逻辑长度。
  ///
  /// 优先使用服务端总数；没有总数时使用当前最大已加载索引推导。
  int get visibleLength {
    if (totalCount case final count?) return count;
    if (items.isEmpty) return 0;
    return items.keys.reduce((a, b) => a > b ? a : b) + 1;
  }

  /// 是否正在执行页面请求。
  bool get isLoading => activity != PagedActivity.idle;
}

/// 与 UI 框架无关的分页状态机。
///
/// 同一个页面键只会同时执行一次。游标仅在页面成功并通过校验后推进；追加失败会
/// 保留现有项目，并由 [retry] 精确重试失败请求。刷新会立即清空快照、取消旧请求并
/// 增加 generation，因此旧响应无法覆盖新数据。
final class PagedLoader<T> {
  PagedLoader({
    required this.source,
    this.failureMapper = const DefaultLoadFailureMapper(),
    this.maxConsecutiveEmptyPages = 3,
  }) : _state = PagedSnapshot<T>.empty() {
    if (maxConsecutiveEmptyPages < 1) {
      throw RangeError.range(
        maxConsecutiveEmptyPages,
        1,
        null,
        'maxConsecutiveEmptyPages',
      );
    }
    if (source.capabilities case IndexedPaginationCapabilities(
      :final pageSize,
    ) when pageSize < 1) {
      throw RangeError.range(pageSize, 1, null, 'pageSize');
    }
  }

  final PageSource<T> source;
  final LoadFailureMapper failureMapper;
  final int maxConsecutiveEmptyPages;

  final StreamController<PagedSnapshot<T>> _states =
      StreamController<PagedSnapshot<T>>.broadcast(sync: true);
  final Map<PageRequest, _ActivePageLoad> _active = {};
  final Set<PageCursor> _seenCursors = {};

  PagedSnapshot<T> _state;
  PageCursor? _nextCursor;
  PageRequest? _failedRequest;
  PagedActivity? _failedActivity;
  Future<void>? _appendFuture;
  int _generation = 0;
  int _consecutiveEmptyPages = 0;
  bool _loadedInitial = false;
  bool _disposed = false;

  /// 当前同步可读的最新快照。
  PagedSnapshot<T> get state => _state;

  /// 后续快照的广播流。
  Stream<PagedSnapshot<T>> get states => _states.stream;

  /// 加载初始页；初始页已经成功加载时不会重复请求。
  Future<void> loadInitial() async {
    _checkNotDisposed();
    if (_loadedInitial) return;
    await _load(const PageRequest.initial(), PagedActivity.initial);
  }

  /// 顺序加载下一页。
  ///
  /// 没有下一页时立即完成；并发调用会共享同一个请求。
  Future<void> loadNext() {
    _checkNotDisposed();
    if (_appendFuture case final active?) return active;
    if (!_loadedInitial) return loadInitial();
    if (!_state.hasNext || _nextCursor == null) return Future<void>.value();

    final generation = _generation;
    final future = _load(PageRequest.next(_nextCursor!), PagedActivity.append);
    _appendFuture = future.whenComplete(() {
      if (_generation == generation) _appendFuture = null;
    });
    return _appendFuture!;
  }

  /// 确保绝对 [index] 对应的项目已经加载。
  ///
  /// indexed 数据源直接加载目标页，sequential 数据源则依次加载到目标、结束或失败。
  Future<void> ensureIndex(int index) async {
    _checkNotDisposed();
    if (index < 0) throw RangeError.index(index, const []);
    if (_state.itemAt(index) != null) return;
    if (_state.totalCount case final count? when index >= count) {
      throw RangeError.index(index, List<Object?>.filled(count, null));
    }

    switch (source.capabilities) {
      case IndexedPaginationCapabilities(:final pageSize):
        await _load(
          PageRequest.index(index ~/ pageSize),
          PagedActivity.randomAccess,
          updateContinuation: false,
        );
      case SequentialPaginationCapabilities():
        while (_state.itemAt(index) == null && _state.hasNext) {
          await loadNext();
          if (_state.failure != null) break;
        }
    }
  }

  /// 立即清空现有数据、取消当前 generation，并重新加载初始页。
  Future<void> refresh() async {
    _checkNotDisposed();
    _generation++;
    _cancelActive('refresh');
    if (source case final RefreshablePageSource refreshable) {
      refreshable.beginRefresh();
    }
    _reset(activity: PagedActivity.refresh);
    await _load(const PageRequest.initial(), PagedActivity.refresh);
  }

  /// 精确重试最近一次失败的页面请求。
  Future<void> retry() async {
    _checkNotDisposed();
    final request = _failedRequest;
    final activity = _failedActivity;
    if (request == null || activity == null) return;
    await _load(
      request,
      activity,
      updateContinuation: request is! IndexedPageRequest,
    );
  }

  Future<void> _load(
    PageRequest request,
    PagedActivity activity, {
    bool updateContinuation = true,
  }) {
    if (_active[request] case final active?) return active.future;

    final generation = _generation;
    final cancellation = CancellationScope();
    final completer = Completer<void>();
    _active[request] = _ActivePageLoad(cancellation, completer.future);
    _publish(
      PagedSnapshot<T>(
        items: _state.items,
        totalCount: _state.totalCount,
        hasNext: _state.hasNext,
        activity: activity,
      ),
    );

    () async {
      try {
        final chunk = await source.load(request, cancellation);
        cancellation.throwIfCancelled();
        if (_disposed || generation != _generation) return;
        _validateChunk(request, chunk, updateContinuation);
        _applyChunk(chunk, updateContinuation: updateContinuation);
        _failedRequest = null;
        _failedActivity = null;
      } on CancellationException {
        if (!_disposed && generation == _generation) {
          _publish(_idleSnapshot());
        }
      } catch (error, stackTrace) {
        if (_disposed || generation != _generation) return;
        _failedRequest = request;
        _failedActivity = activity;
        _publish(
          PagedSnapshot<T>(
            items: _state.items,
            totalCount: _state.totalCount,
            hasNext: _state.hasNext,
            activity: PagedActivity.idle,
            failure: failureMapper.map(error, stackTrace),
          ),
        );
      } finally {
        if (_active[request]?.cancellation == cancellation) {
          _active.remove(request);
        }
        if (!completer.isCompleted) completer.complete();
      }
    }();

    return completer.future;
  }

  void _validateChunk(
    PageRequest request,
    PageChunk<T> chunk,
    bool updateContinuation,
  ) {
    if (chunk.totalCount case final count?
        when chunk.startIndex + chunk.items.length > count) {
      throw StateError('Page items exceed totalCount');
    }
    if (chunk.totalCount case final count?) {
      final loadedOutsideRange = _state.items.keys.any(
        (index) => index >= count,
      );
      if (loadedOutsideRange) {
        throw StateError('totalCount excludes previously loaded items');
      }
    }
    if (!updateContinuation) return;
    if (!chunk.isLast && chunk.nextCursor == null) {
      throw StateError('Non-final page has no next cursor');
    }
    if (chunk.isLast && chunk.nextCursor != null) {
      throw StateError('Final page must not include a next cursor');
    }
    if (chunk.isLast) return;
    if (request case NextPageRequest(
      :final cursor,
    ) when cursor == chunk.nextCursor) {
      throw StateError('Pagination cursor did not advance');
    }
    if (_seenCursors.contains(chunk.nextCursor)) {
      throw StateError('Pagination cursor loop detected');
    }
  }

  void _applyChunk(PageChunk<T> chunk, {required bool updateContinuation}) {
    final merged = Map<int, T>.of(_state.items);
    for (var offset = 0; offset < chunk.items.length; offset++) {
      merged[chunk.startIndex + offset] = chunk.items[offset];
    }

    if (updateContinuation) {
      _loadedInitial = true;
      if (chunk.items.isEmpty && !chunk.isLast) {
        _consecutiveEmptyPages++;
        if (_consecutiveEmptyPages >= maxConsecutiveEmptyPages) {
          throw StateError('Too many consecutive empty pages');
        }
      } else {
        _consecutiveEmptyPages = 0;
      }
      if (chunk.nextCursor case final cursor?) _seenCursors.add(cursor);
      _nextCursor = chunk.nextCursor;
    }

    final totalCount = chunk.totalCount ?? _state.totalCount;
    final reachedTotal = totalCount != null && merged.length >= totalCount;
    _publish(
      PagedSnapshot<T>(
        items: merged,
        totalCount: totalCount,
        hasNext: updateContinuation
            ? !chunk.isLast && !reachedTotal && chunk.nextCursor != null
            : _state.hasNext,
        activity: PagedActivity.idle,
      ),
    );
  }

  PagedSnapshot<T> _idleSnapshot() => PagedSnapshot<T>(
    items: _state.items,
    totalCount: _state.totalCount,
    hasNext: _state.hasNext,
    activity: PagedActivity.idle,
    failure: _state.failure,
  );

  void _reset({required PagedActivity activity}) {
    _nextCursor = null;
    _failedRequest = null;
    _failedActivity = null;
    _appendFuture = null;
    _consecutiveEmptyPages = 0;
    _loadedInitial = false;
    _seenCursors.clear();
    _publish(PagedSnapshot<T>.empty(activity: activity));
  }

  void _publish(PagedSnapshot<T> value) {
    if (_disposed) return;
    _state = value;
    _states.add(value);
  }

  void _cancelActive(Object reason) {
    for (final active in _active.values) {
      active.cancellation.cancel(reason);
    }
    _active.clear();
  }

  /// 取消所有活动请求，等待数据源结束并关闭状态流。
  Future<void> dispose() async {
    if (_disposed) return;
    _disposed = true;
    _generation++;
    final pending = _active.values
        .map((active) => active.future)
        .toList(growable: false);
    _cancelActive('dispose');
    await Future.wait(pending);
    await _states.close();
  }

  void _checkNotDisposed() {
    if (_disposed) throw StateError('PagedLoader is disposed');
  }
}

final class _ActivePageLoad {
  const _ActivePageLoad(this.cancellation, this.future);
  final CancellationScope cancellation;
  final Future<void> future;
}
