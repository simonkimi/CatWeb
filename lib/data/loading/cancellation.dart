import 'dart:async';

/// 表示异步操作被主动取消，而不是加载失败。
final class CancellationException implements Exception {
  const CancellationException([this.reason]);

  final Object? reason;

  @override
  String toString() =>
      reason == null ? 'Operation cancelled' : 'Operation cancelled: $reason';
}

/// 可在纯 Dart 层传播的协作式取消作用域。
///
/// 被调用方应在开始耗时工作前及 `await` 返回后调用 [throwIfCancelled]。
/// 通过 [linked] 创建的作用域在操作结束后应调用 [unlink]，避免父作用域
/// 长期持有已经完成的子操作。
final class CancellationScope {
  CancellationScope();

  /// 创建一个跟随任意 [parents] 取消的子作用域。
  factory CancellationScope.linked(Iterable<CancellationScope> parents) {
    final scope = CancellationScope();
    for (final parent in parents) {
      if (parent.isCancelled) {
        scope.cancel(parent.reason);
        break;
      }
      scope._unlinkers.add(parent.onCancel(scope.cancel));
    }
    return scope;
  }

  bool _isCancelled = false;
  Object? _reason;
  final Completer<Object?> _cancelled = Completer<Object?>();
  final Map<int, void Function(Object?)> _listeners = {};
  final List<void Function()> _unlinkers = [];
  int _nextListenerId = 0;

  /// 当前作用域是否已经取消。
  bool get isCancelled => _isCancelled;

  /// 首次取消时提供的原因。
  Object? get reason => _reason;

  /// 在作用域取消时完成，并返回取消原因。
  Future<Object?> get whenCancelled => _cancelled.future;

  /// 取消当前作用域。重复调用不会改变第一次取消的原因。
  void cancel([Object? reason]) {
    if (_isCancelled) return;
    _isCancelled = true;
    _reason = reason;
    _cancelled.complete(reason);
    final listeners = _listeners.values.toList(growable: false);
    _listeners.clear();
    unlink();
    for (final listener in listeners) {
      listener(reason);
    }
  }

  /// 注册取消监听，并返回用于移除该监听的函数。
  ///
  /// 若作用域已经取消，[listener] 会立即执行。
  void Function() onCancel(void Function(Object? reason) listener) {
    if (_isCancelled) {
      listener(_reason);
      return () {};
    }
    final id = _nextListenerId++;
    _listeners[id] = listener;
    return () => _listeners.remove(id);
  }

  /// 解除 [linked] 建立的父作用域监听，但不取消当前作用域。
  void unlink() {
    final unlinkers = _unlinkers.toList(growable: false);
    _unlinkers.clear();
    for (final unlink in unlinkers) {
      unlink();
    }
  }

  /// 若当前作用域已取消，则抛出 [CancellationException]。
  void throwIfCancelled() {
    if (_isCancelled) throw CancellationException(_reason);
  }
}
