import 'dart:async';

class CancelException implements Exception {
  CancelException();

  @override
  String toString() {
    return 'CancelException: Cancelled';
  }
}

class Lock<T> {
  Lock({
    required this.action,
    this.timeout,
    required this.onFinish,
  });

  final Duration? timeout;
  final Future<T> Function() action;
  final Function() onFinish;

  final _completer = Completer<T>();
  var _isRunning = false;
  var _isCancel = false;

  bool get isCompleted => _completer.isCompleted;

  bool get isRunning => !isCompleted && _isRunning;

  bool get isWaiting => !isCompleted && !_isRunning && !_isCancel;

  Future<T> get future => _completer.future;

  Future<void> _run() async {
    _isRunning = true;
    if (_isCancel) {
      _completer.completeError(CancelException());
      return;
    }

    runZonedGuarded(
      () async {
        if (timeout != null) {
          final result = await action().timeout(timeout!);
          _completer.complete(result);
        } else {
          final result = await action();
          _completer.complete(result);
        }
        onFinish();
      },
      (error, stack) {
        _completer.completeError(error, stack);
        onFinish();
      },
    );
  }

  void cancel() {
    _isCancel = true;
  }
}

class ConcurrencyLock {
  ConcurrencyLock(this.concurrency);

  final int concurrency;

  final _lockList = <Lock>[];

  Lock<T> synchronized<T>(
    Future<T> Function() action, {
    Duration? timeout,
  }) {
    final lock = Lock<T>(
      action: action,
      timeout: timeout,
      onFinish: _trigger,
    );
    _lockList.add(lock);
    _trigger();
    return lock;
  }

  int get _lockCount => _lockList.where((e) => e.isRunning).length;

  Iterable<Lock> get waitingList => _lockList.where((e) => e.isWaiting);

  void _trigger() {
    while ((_lockCount < concurrency || concurrency <= 0) &&
        waitingList.isNotEmpty) {
      waitingList.first._run().whenComplete(() => _trigger());
    }
  }
}
