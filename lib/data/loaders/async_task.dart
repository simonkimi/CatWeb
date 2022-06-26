import 'dart:async';
import 'dart:collection';

class AsyncState {
  AsyncState._({
    this.isIdle = true,
    this.isRunning = false,
    this.isError = false,
    this.isFinish = false,
    this.isCanceled = false,
    this.error,
  });

  final bool isIdle;
  final bool isRunning;
  final bool isError;
  final bool isFinish;
  final bool isCanceled;
  final Exception? error;

  factory AsyncState.idle() => AsyncState._(isIdle: true);

  factory AsyncState.running() => AsyncState._(isRunning: true);

  factory AsyncState.error(Exception error) => AsyncState._(
        isError: true,
        error: error,
      );

  factory AsyncState.finish() => AsyncState._(isFinish: true);

  factory AsyncState.canceled() => AsyncState._(isCanceled: true);
}

class AsyncTaskBuilder<T> extends AsyncTask<T> {
  AsyncTaskBuilder(this.task);

  final Future<T> Function() task;

  @override
  Future<T> run() => task();
}

/// T: 返回值, E: 进度
abstract class AsyncTask<T> {
  var _state = AsyncState.idle();

  final future = Completer<T>();

  void cancel() {
    _state = AsyncState.canceled();
  }

  Future<T> run();

  AsyncState get state => _state;

  int? get id;
}

class AsyncPool<T extends AsyncTask> {
  AsyncPool({
    this.maxConcurrency = 1,
    this.priorityBuilder,
    this.ignoreError = false,
  });

  final int Function(T task)? priorityBuilder;

  final int maxConcurrency;
  final bool ignoreError;

  void add(T task) {
    _taskQueue.add(task);
    _trigger();
  }

  void addAll(Iterable<T> tasks) {
    _taskQueue.addAll(tasks);
    _trigger();
  }

  void removeWhere(bool Function(T task) test) {
    _taskQueue.removeWhere(test);
  }

  bool contains(int id) =>
      _taskQueue.where((e) => e.id == id).isNotEmpty ||
      _workQueue.where((e) => e.id == id).isNotEmpty;

  final _taskQueue = Queue<T>();
  final _workQueue = Queue<T>();

  void _trigger() {
    while (_taskQueue.isNotEmpty && _workQueue.length < maxConcurrency) {
      late final T task;

      if (priorityBuilder != null) {
        _taskQueue.removeWhere((e) => e.state.isCanceled);
        final priority = _taskQueue.toList()
          ..sort((a, b) => priorityBuilder!(b) - priorityBuilder!(a));
        if (priority.isNotEmpty) {
          task = priority.first;
        }
        _taskQueue.remove(task);
      } else {
        task = _taskQueue.removeFirst();
        if (task._state.isCanceled) {
          continue;
        }
      }

      _workQueue.add(task);
      _runner(task).then((value) {
        _workQueue.remove(task);
        _trigger();
      });
    }
  }

  Future<void> _runner(T task) async {
    try {
      task._state = AsyncState.running();
      final result = await task.run();
      task.future.complete(result);
      task._state = AsyncState.finish();
    } on Exception catch (e) {
      task._state = AsyncState.error(e);
      if (!ignoreError) {
        task.future.completeError(e);
      }
    }
  }
}
