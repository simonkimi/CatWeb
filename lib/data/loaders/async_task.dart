import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';

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
  AsyncTaskBuilder({
    required this.task,
    this.id,
  });

  final Future<T> Function() task;

  @override
  final String? id;

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

  String? get id;
}

class AsyncPool<T extends AsyncTask> {
  AsyncPool({
    this.maxConcurrency = 1,
    this.priorityBuilder,
    this.ignoreError = false,
    this.filter,
    this.saveSuccessfulTask = false,
  });

  final int Function(T task)? priorityBuilder;

  final bool Function(T task)? filter;

  final int maxConcurrency;
  final bool ignoreError;
  final bool saveSuccessfulTask;

  void add(T task) {
    taskQueue.add(task);
    _trigger();
  }

  void addAll(Iterable<T> tasks) {
    taskQueue.addAll(tasks);
    _trigger();
  }

  void removeWhere(bool Function(T task) test) {
    taskQueue.removeWhere(test);
  }

  bool containsTaskId(String id) =>
      taskQueue.where((e) => e.id == id).isNotEmpty ||
      workQueue.where((e) => e.id == id).isNotEmpty;

  @protected
  final taskQueue = Queue<T>();

  @protected
  final workQueue = Queue<T>();

  @protected
  final completeMap = <String, T>{};

  void _trigger() {
    final queue =
        filter != null ? taskQueue.where(filter!) : taskQueue.toList();

    while (queue.isNotEmpty && workQueue.length < maxConcurrency) {
      late final T task;

      if (priorityBuilder != null) {
        taskQueue.removeWhere((e) => e.state.isCanceled);
        final priority = queue.toList()
          ..sort((a, b) => priorityBuilder!(b) - priorityBuilder!(a));
        if (priority.isNotEmpty) {
          task = priority.first;
        }
        taskQueue.remove(task);
      } else {
        task = queue.first;
        taskQueue.remove(task);
        if (task._state.isCanceled) {
          continue;
        }
      }

      workQueue.add(task);
      _runner(task).then((value) {
        workQueue.remove(task);
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
