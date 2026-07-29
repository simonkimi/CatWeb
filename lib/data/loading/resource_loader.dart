import 'dart:async';

import 'cancellation.dart';
import 'load_failure.dart';

/// 资源在最后一个消费者释放后的保留策略。
enum ResourceRetention { whileReferenced, memory }

/// 资源加载进度。
final class ResourceProgress {
  const ResourceProgress({required this.loaded, this.total});

  final int loaded;
  final int? total;

  /// `0` 到 `1` 的进度比例；总大小未知时返回 `null`。
  double? get fraction {
    final expected = total;
    if (expected == null || expected <= 0) return null;
    return (loaded / expected).clamp(0, 1);
  }
}

/// 单个资源的统一异步状态。
///
/// 缓存命中通过 [ResourceSuccess.fromCache] 表达，不存在“已缓存但没有值”的状态。
sealed class ResourceSnapshot<T> {
  const ResourceSnapshot();

  const factory ResourceSnapshot.idle() = ResourceIdle<T>;
  const factory ResourceSnapshot.loading([ResourceProgress? progress]) =
      ResourceLoading<T>;
  const factory ResourceSnapshot.success(T value, {bool fromCache}) =
      ResourceSuccess<T>;
  const factory ResourceSnapshot.failure(LoadFailure failure) =
      ResourceFailure<T>;
}

/// 尚未调度资源加载。
final class ResourceIdle<T> extends ResourceSnapshot<T> {
  const ResourceIdle();
}

/// 正在加载资源，可选携带 [progress]。
final class ResourceLoading<T> extends ResourceSnapshot<T> {
  const ResourceLoading([this.progress]);
  final ResourceProgress? progress;
}

/// 资源加载成功。
final class ResourceSuccess<T> extends ResourceSnapshot<T> {
  const ResourceSuccess(this.value, {this.fromCache = false});
  final T value;

  /// 数据是否来自底层缓存。
  final bool fromCache;
}

/// 资源加载失败。
final class ResourceFailure<T> extends ResourceSnapshot<T> {
  const ResourceFailure(this.failure);
  final LoadFailure failure;
}

/// 按键加载资源的接口。
abstract interface class ResourceSource<K, T> {
  /// 加载 [key] 对应的资源，并通过 [onProgress] 报告进度。
  Future<ResourceLoadResult<T>> load(
    K key,
    CancellationScope cancellation,
    void Function(ResourceProgress progress) onProgress,
  );
}

/// 资源源返回的值及其缓存元数据。
final class ResourceLoadResult<T> {
  const ResourceLoadResult(this.value, {this.fromCache = false});

  final T value;
  final bool fromCache;
}

/// 支持去重、稳定优先级和并发限制的资源调度器。
///
/// 同一个 key 只会创建一个任务；多个 handle 共同持有该任务。数值越小优先级越高，
/// 相同优先级按首次入队顺序执行。等待中和运行中的任务都会在最后一个 handle 释放时
/// 取消。
final class ResourceLoader<K, T> {
  ResourceLoader({
    required this.source,
    required this.maxConcurrency,
    this.retention = ResourceRetention.memory,
    this.failureMapper = const DefaultLoadFailureMapper(),
  }) {
    if (maxConcurrency < 1) {
      throw RangeError.range(maxConcurrency, 1, null, 'maxConcurrency');
    }
  }

  final ResourceSource<K, T> source;
  final int maxConcurrency;
  final ResourceRetention retention;
  final LoadFailureMapper failureMapper;

  final Map<K, _ResourceEntry<K, T>> _entries = {};
  int _runningCount = 0;
  int _sequence = 0;
  int _handleId = 0;
  bool _disposed = false;

  /// 获取 [key] 的资源句柄。
  ///
  /// 每次调用都必须与一次 [ResourceHandle.release] 配对。
  ResourceHandle<K, T> acquire(K key, {int priority = 0}) {
    _checkNotDisposed();
    final entry = _entries.putIfAbsent(
      key,
      () => _ResourceEntry<K, T>(key: key, sequence: _sequence++),
    );
    final handleId = _handleId++;
    entry.handlePriorities[handleId] = priority;
    entry.recalculatePriority();
    if (entry.state is ResourceIdle<T>) _enqueue(entry);
    _trigger();
    return ResourceHandle<K, T>._(this, entry, handleId);
  }

  /// 返回 [key] 当前的同步状态；从未调度或已淘汰时返回 `null`。
  ResourceSnapshot<T>? stateOf(K key) => _entries[key]?.state;

  void _enqueue(_ResourceEntry<K, T> entry) {
    if (entry.queued || entry.running || entry.handlePriorities.isEmpty) return;
    entry.completer = Completer<T>();
    unawaited(entry.completer!.future.then<void>((_) {}, onError: (_, _) {}));
    entry.queued = true;
  }

  void _trigger() {
    if (_disposed) return;
    while (_runningCount < maxConcurrency) {
      final entry = _nextPending();
      if (entry == null) return;
      _start(entry);
    }
  }

  _ResourceEntry<K, T>? _nextPending() {
    _ResourceEntry<K, T>? best;
    for (final entry in _entries.values) {
      if (!entry.queued || entry.handlePriorities.isEmpty) continue;
      if (best == null ||
          entry.priority < best.priority ||
          (entry.priority == best.priority && entry.sequence < best.sequence)) {
        best = entry;
      }
    }
    return best;
  }

  void _start(_ResourceEntry<K, T> entry) {
    entry.queued = false;
    entry.running = true;
    entry.cancellation = CancellationScope();
    _runningCount++;
    entry.publish(const ResourceSnapshot.loading());

    () async {
      try {
        final result = await source.load(entry.key, entry.cancellation!, (
          progress,
        ) {
          if (entry.running && !entry.cancellation!.isCancelled) {
            entry.publish(ResourceSnapshot.loading(progress));
          }
        });
        entry.cancellation!.throwIfCancelled();
        entry.publish(
          ResourceSnapshot.success(result.value, fromCache: result.fromCache),
        );
        entry.completer!.complete(result.value);
      } on CancellationException catch (error, stackTrace) {
        entry.publish(const ResourceSnapshot.idle());
        entry.completer!.completeError(error, stackTrace);
      } catch (error, stackTrace) {
        final failure = failureMapper.map(error, stackTrace);
        entry.publish(ResourceSnapshot.failure(failure));
        entry.completer!.completeError(error, stackTrace);
      } finally {
        entry.running = false;
        entry.cancellation = null;
        _runningCount--;
        if (entry.retryPending && entry.handlePriorities.isNotEmpty) {
          entry.retryPending = false;
          entry.publish(const ResourceSnapshot.idle());
          _enqueue(entry);
        }
        if (entry.handlePriorities.isEmpty &&
            (retention == ResourceRetention.whileReferenced ||
                entry.state is! ResourceSuccess<T>)) {
          await entry.close();
          _entries.remove(entry.key);
        }
        _trigger();
      }
    }();
  }

  void _reprioritize(_ResourceEntry<K, T> entry, int handleId, int priority) {
    if (!entry.handlePriorities.containsKey(handleId)) return;
    entry.handlePriorities[handleId] = priority;
    entry.recalculatePriority();
    _trigger();
  }

  void _retry(_ResourceEntry<K, T> entry) {
    final state = entry.state;
    if (state is! ResourceFailure<T> ||
        !state.failure.retryable ||
        entry.handlePriorities.isEmpty) {
      return;
    }
    if (entry.running) {
      entry.retryPending = true;
      return;
    }
    entry.publish(const ResourceSnapshot.idle());
    _enqueue(entry);
    _trigger();
  }

  Future<void> _release(_ResourceEntry<K, T> entry, int handleId) async {
    entry.handlePriorities.remove(handleId);
    entry.recalculatePriority();
    if (entry.handlePriorities.isNotEmpty ||
        (retention == ResourceRetention.memory &&
            entry.state is ResourceSuccess<T>)) {
      return;
    }
    entry.queued = false;
    final runningFuture = entry.completer?.future;
    entry.cancellation?.cancel('No resource consumers');
    if (entry.running && runningFuture != null) {
      try {
        await runningFuture;
      } catch (_) {
        // Cancellation is the expected result of releasing the last handle.
      }
      return;
    }
    final completer = entry.completer;
    if (completer != null && !completer.isCompleted) {
      completer.completeError(
        const CancellationException('No resource consumers'),
      );
    }
    await entry.close();
    _entries.remove(entry.key);
  }

  /// 取消所有任务、等待运行中任务退出并释放内部状态流。
  Future<void> dispose() async {
    if (_disposed) return;
    _disposed = true;
    final entries = _entries.values.toList(growable: false);
    final running = <Future<void>>[];
    for (final entry in entries) {
      entry.queued = false;
      entry.cancellation?.cancel('ResourceLoader disposed');
      final completer = entry.completer;
      if (completer != null && !completer.isCompleted) {
        if (entry.running) {
          running.add(completer.future.then<void>((_) {}, onError: (_, _) {}));
        } else {
          completer.completeError(
            const CancellationException('ResourceLoader disposed'),
          );
        }
      }
    }
    await Future.wait(running);
    _entries.clear();
    await Future.wait(entries.map((entry) => entry.close()));
  }

  void _checkNotDisposed() {
    if (_disposed) throw StateError('ResourceLoader is disposed');
  }
}

/// 消费者持有的资源引用。
///
/// handle 被 [release] 后，重新定优先级和重试操作均不再生效。
final class ResourceHandle<K, T> {
  ResourceHandle._(this._loader, this._entry, this._id);

  final ResourceLoader<K, T> _loader;
  final _ResourceEntry<K, T> _entry;
  final int _id;
  bool _released = false;

  /// 当前同步状态。
  ResourceSnapshot<T> get state => _entry.state;

  /// 后续状态变化的广播流。
  Stream<ResourceSnapshot<T>> get states => _entry.states.stream;

  /// 当前加载轮次的结果。
  ///
  /// 失败时保留原始异常；调用 [retry] 后再次读取会得到新一轮 Future。
  Future<T> get result {
    return switch (_entry.state) {
      ResourceSuccess<T>(:final value) => Future<T>.value(value),
      ResourceFailure<T>(:final failure) => Future<T>.error(
        failure.error,
        failure.stackTrace,
      ),
      _ =>
        _entry.completer?.future ??
            Future<T>.error(StateError('Resource is not scheduled')),
    };
  }

  /// 更新当前消费者的优先级，数值越小越优先。
  void reprioritize(int priority) {
    if (_released) return;
    _loader._reprioritize(_entry, _id, priority);
  }

  /// 在最近一次失败允许重试时重新调度相同 key。
  void retry() {
    if (_released) return;
    _loader._retry(_entry);
  }

  /// 释放当前消费者引用。
  ///
  /// 释放最后一个引用可能取消正在运行的底层请求。
  Future<void> release() async {
    if (_released) return;
    _released = true;
    await _loader._release(_entry, _id);
  }
}

final class _ResourceEntry<K, T> {
  _ResourceEntry({required this.key, required this.sequence});

  final K key;
  final int sequence;
  final Map<int, int> handlePriorities = {};
  final StreamController<ResourceSnapshot<T>> states =
      StreamController<ResourceSnapshot<T>>.broadcast(sync: true);

  ResourceSnapshot<T> state = const ResourceSnapshot.idle();
  CancellationScope? cancellation;
  Completer<T>? completer;
  int priority = 0;
  bool queued = false;
  bool running = false;
  bool retryPending = false;

  void recalculatePriority() {
    if (handlePriorities.isEmpty) return;
    priority = handlePriorities.values.reduce((a, b) => a < b ? a : b);
  }

  void publish(ResourceSnapshot<T> value) {
    state = value;
    if (!states.isClosed) states.add(value);
  }

  Future<void> close() =>
      states.isClosed ? Future<void>.value() : states.close();
}
