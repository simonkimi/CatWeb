import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

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
  final _state = LoadListStatue.idle().obs;

  LoadListStatue get state => _state.value;

  void loadStart() => _state.value = LoadListStatue.loading();

  void loadNoData() => _state.value = LoadListStatue.complete();

  void loadComplete() =>
      state.isRunning ? _state.value = LoadListStatue.idle() : null;

  void loadError(Exception error) {
    if (error is DioError && CancelToken.isCancel(error)) {
      return;
    }
    _state.value = LoadListStatue.error(error);
  }

  void loadRefresh() => _state.value = LoadListStatue.refresh();

  String? get errorMessage => state.error?.toString();
}

class LoadStatue {
  final bool isIdle;
  final bool isLoading;
  final bool isError;
  final Exception? error;
  final bool isComplete;

  LoadStatue._({
    this.isLoading = false,
    this.isError = false,
    this.isIdle = false,
    this.isComplete = false,
    this.error,
  });

  factory LoadStatue.idle() => LoadStatue._(isIdle: true);

  factory LoadStatue.loading() => LoadStatue._(isLoading: true);

  factory LoadStatue.error(Exception error) => LoadStatue._(
        isError: true,
        error: error,
      );

  factory LoadStatue.complete() => LoadStatue._(isComplete: true);
}

mixin LoadStateMixin {
  final _state = LoadListStatue.idle().obs;

  LoadListStatue get state => _state.value;

  void loadStart() => _state.value = LoadListStatue.loading();

  void loadComplete() => _state.value = LoadListStatue.complete();

  void loadError(Exception error) {
    if (error is DioError && CancelToken.isCancel(error)) {
      loadComplete();
      return;
    }
    _state.value = LoadListStatue.error(error);
  }
}
