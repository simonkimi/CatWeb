import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class LoadStatue {
  final bool isIdle;
  final bool isLoading;
  final bool isError;
  final bool isRefresh;
  final Exception? error;
  final bool isComplete;

  LoadStatue._({
    this.isLoading = false,
    this.isError = false,
    this.isIdle = false,
    this.isComplete = false,
    this.isRefresh = false,
    this.error,
  });

  factory LoadStatue.idle() => LoadStatue._(isIdle: true);

  factory LoadStatue.loading() => LoadStatue._(isLoading: true);

  factory LoadStatue.error(Exception error) => LoadStatue._(
        isError: true,
        error: error,
      );

  factory LoadStatue.complete() => LoadStatue._(isComplete: true);

  factory LoadStatue.refresh() => LoadStatue._(isRefresh: true);

  bool get canLoadMore => isIdle || isError;

  bool get isRunning => isLoading || isRefresh;
}

mixin LoadStateMixin {
  final _state = LoadStatue.idle().obs;

  LoadStatue get state => _state.value;

  void loadStart() => _state.value = LoadStatue.loading();

  void loadNoData() => _state.value = LoadStatue.complete();

  void loadComplete() =>
      state.isRunning ? _state.value = LoadStatue.idle() : null;

  void loadError(Exception error) {
    if (error is DioError && CancelToken.isCancel(error)) {
      return;
    }
    _state.value = LoadStatue.error(error);
  }

  void loadRefresh() => _state.value = LoadStatue.refresh();

  String? get errorMessage => state.error?.toString();
}
