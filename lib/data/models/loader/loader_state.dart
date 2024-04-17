sealed class LoaderState {
  const LoaderState._();

  bool get isLoading;

  Object? get error;

  StackTrace? get stackTrace;

  const factory LoaderState.loading() = LoaderStateLoading;

  const factory LoaderState.idle({Object? error, StackTrace? stackTrace}) =
      LoaderStateIdle;

  static Future<LoaderStateIdle> guard<T>(Future<T> Function() future) async {
    try {
      await future();
      return const LoaderStateIdle(error: null, stackTrace: null);
    } catch (e, s) {
      return LoaderStateIdle(error: e, stackTrace: s);
    }
  }
}

class LoaderStateIdle extends LoaderState {
  const LoaderStateIdle({
    this.error,
    this.stackTrace,
  }) : super._();

  const LoaderStateIdle._(
    this.error,
    this.stackTrace,
  ) : super._();

  @override
  bool get isLoading => false;

  @override
  final Object? error;

  @override
  final StackTrace? stackTrace;
}

class LoaderStateLoading extends LoaderState {
  const LoaderStateLoading._() : super._();

  const LoaderStateLoading() : super._();

  @override
  bool get isLoading => true;

  @override
  final Object? error = null;

  @override
  final StackTrace? stackTrace = null;
}
