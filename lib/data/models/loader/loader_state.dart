import 'package:catweb/utils/obs_helper.dart';
import 'package:flutter/cupertino.dart';

class LoaderState {
  final bool isIdle;
  final bool isLoading;
  final bool isError;
  final bool isNoMoreValue;
  final Exception? error;

  LoaderState._({
    this.isLoading = false,
    this.isError = false,
    this.isIdle = false,
    this.isNoMoreValue = false,
    this.error,
  });

  factory LoaderState.idle() => LoaderState._(isIdle: true);

  factory LoaderState.loading() => LoaderState._(isLoading: true);

  factory LoaderState.noMoreValue() => LoaderState._(isNoMoreValue: true);

  factory LoaderState.error(Exception error) => LoaderState._(
        isError: true,
        error: error,
      );

  bool get canLoadMore => (isIdle || isError) && !isNoMoreValue;
}

mixin ListLoaderStateMixin {
  final state = LoaderState.idle().obs;

  @protected
  void stateLoadStart() {
    if (!state.value.isLoading) {
      state.value = LoaderState.loading();
    }
  }

  @protected
  void stateLoadComplete() {
    if (!state.value.isIdle) {
      state.value = LoaderState.idle();
    }
  }

  @protected
  void stateLoadError(Exception error) {
    state.value = LoaderState.error(error);
  }

  @protected
  void stateLoadNoMoreValue() {
    if (!state.value.isNoMoreValue) {
      state.value = LoaderState.noMoreValue();
    }
  }
}
