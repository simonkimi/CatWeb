import 'package:catweb/utils/obs_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:synchronized/synchronized.dart';

class LoadListStatue {
  final bool isIdle;
  final bool isLoading;
  final bool isError;
  final bool isRefresh;
  final Exception? error;
  final bool isComplete;

  LoadListStatue._({
    this.isLoading = false,
    this.isError = false,
    this.isIdle = false,
    this.isComplete = false,
    this.isRefresh = false,
    this.error,
  });

  factory LoadListStatue.idle() => LoadListStatue._(isIdle: true);

  factory LoadListStatue.loading() => LoadListStatue._(isLoading: true);

  factory LoadListStatue.error(Exception error) => LoadListStatue._(
        isError: true,
        error: error,
      );

  factory LoadListStatue.complete() => LoadListStatue._(isComplete: true);

  factory LoadListStatue.refresh() => LoadListStatue._(isRefresh: true);

  bool get canLoadMore => isIdle || isError;

  bool get isRunning => isLoading || isRefresh;
}

mixin LoadListStateMixin {
  final state = LoadListStatue.idle().obs;

  @protected
  void stateLoadStart() => state.value = LoadListStatue.loading();

  @protected
  void stateLoadNoData() => state.value = LoadListStatue.complete();

  @protected
  void stateLoadComplete() =>
      state.value.isRunning ? state.value = LoadListStatue.idle() : null;

  @protected
  void stateLoadError(Exception error) {
    if (error is DioException && CancelToken.isCancel(error)) {
      return;
    }
    state.value = LoadListStatue.error(error);
  }

  @protected
  void stateLoadRefresh() => state.value = LoadListStatue.refresh();

  String? get errorMessage => state.error?.toString();
}

mixin LoadStateMixin {
  final _state = LoadListStatue.idle().obs;

  LoadListStatue get state => _state.value;

  void loadStart() => _state.value = LoadListStatue.loading();

  void loadComplete() => _state.value = LoadListStatue.complete();

  void loadError(Exception error) {
    if (error is DioException && CancelToken.isCancel(error)) {
      loadComplete();
      return;
    }
    _state.value = LoadListStatue.error(error);
  }

  bool get canLoad => state.isIdle || state.isError;
}

abstract class LoadMoreBase with LoadListStateMixin {
  @protected
  final requestLock = Lock();

  final refreshController = RefreshController();

  Future<void> awaitLock() => requestLock.synchronized(() {});

  @override
  void stateLoadComplete() {
    super.stateLoadComplete();
    if (state.isComplete || state.isIdle) {
      refreshController.loadComplete();
      refreshController.refreshCompleted();
    }
  }

  @override
  void stateLoadNoData() {
    super.stateLoadNoData();
    refreshController.loadNoData();
  }

  @override
  void stateLoadError(Exception error) {
    super.stateLoadError(error);
    refreshController.loadFailed();
  }

  void dispose() {
    refreshController.dispose();
  }
}
