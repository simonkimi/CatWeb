import 'dart:async';
import 'dart:collection';
import 'package:catweb/data/loaders/async_progress_value.dart';
import 'package:collection/collection.dart';

abstract class PriorityTask<T> {
  AsyncProgressValue<T> state = const AsyncProgressValue.idle();

  final future = Completer<T>();

  int get id;

  Future<T> run();

  Future<void> runner() async {
    state = AsyncProgressValue.loading(0);
    state = await AsyncProgressValue.guard(run);
    switch (state) {
      case AsyncProgressValue.error:
        future.completeError(state.error!);
        break;
      case AsyncProgressValue.data:
        future.complete(state.value);
        break;
      default:
        future.completeError(Exception('Unknown state: $state'));
    }
  }
}

class _TaskPriority<T extends PriorityTask> implements Comparable {
  final T task;
  int priority;

  int get id => task.id;

  _TaskPriority(this.task, this.priority);

  void setPriority(int priority) {
    this.priority = priority;
  }

  @override
  int compareTo(other) {
    if (other is _TaskPriority) {
      return priority.compareTo(other.priority);
    }
    throw ArgumentError(
        'Cannot compare _TaskPriority with ${other.runtimeType}');
  }
}

class PriorityTaskQuery<T extends PriorityTask> {
  PriorityTaskQuery({required this.maxConcurrency});

  final int maxConcurrency;
  final HeapPriorityQueue<_TaskPriority> _waitQueue =
      HeapPriorityQueue<_TaskPriority>();
  final Map<int, _TaskPriority<T>> _waitQueueMap = {};

  final _workQueue = Queue<T>();
  final _workQueueIds = <int>{};

  void add(int priority, T task) {
    _add(priority, task);
    _trigger();
  }

  void cancelWhere(bool Function(T) test) {
    _waitQueueMap.values.where((e) => test(e.task)).forEach((e) {
      _waitQueue.remove(e);
      _waitQueueMap.remove(e.id);
    });
  }

  void _add(int priority, T task) {
    if (task.state != const AsyncProgressValue.idle()) {
      return;
    }
    if (_workQueueIds.contains(task.id)) {
      return;
    }

    if (_waitQueueMap.containsKey(task.id)) {
      _waitQueueMap[task.id]!.setPriority(priority);
    } else {
      final taskPriority = _TaskPriority(task, priority);
      _waitQueue.add(taskPriority);
      _waitQueueMap[task.id] = taskPriority;
    }
  }

  void addAll(Map<int, T> tasks) {
    tasks.forEach((priority, task) {
      _add(priority, task);
    });
    _trigger();
  }

  void _trigger() {
    while (_waitQueue.isNotEmpty && _workQueue.length < maxConcurrency) {
      final task = _waitQueue.removeFirst().task;
      _workQueue.add(task);
      _workQueueIds.add(task.id);
      task.runner().then((value) {
        _workQueue.remove(task);
        _workQueueIds.remove(task.id);
        Future.microtask(_trigger);
      });
    }
  }
}
