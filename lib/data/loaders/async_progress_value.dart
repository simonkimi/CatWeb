abstract class AsyncProgressValue<T> {
  const AsyncProgressValue._();

  const factory AsyncProgressValue.idle() = AsyncProgressIdle;

  const factory AsyncProgressValue.data(T value) = AsyncProgressData<T>;

  const factory AsyncProgressValue.loading(double progress) =
      AsyncProgressLoading;

  const factory AsyncProgressValue.error(Object error, StackTrace stackTrace) =
      AsyncProgressError;

  bool get isLoading;

  double get progress;

  bool get hasValue;

  T? get value;

  Object? get error;

  StackTrace? get stackTrace;

  static Future<AsyncProgressValue<T>> guard<T>(
      Future<T> Function() future) async {
    try {
      return AsyncProgressValue.data(await future());
    } catch (e, stackTrace) {
      return AsyncProgressValue.error(e, stackTrace);
    }
  }
}

class AsyncProgressIdle<T> extends AsyncProgressValue<T> {
  const AsyncProgressIdle() : super._();

  @override
  bool get hasValue => false;

  @override
  bool get isLoading => false;

  @override
  double get progress => 0;

  @override
  Object? get error => null;

  @override
  StackTrace? get stackTrace => null;

  @override
  T? get value => null;
}

class AsyncProgressData<T> extends AsyncProgressValue<T> {
  const AsyncProgressData._(this.value) : super._();

  const AsyncProgressData(T value) : this._(value);

  @override
  final T value;

  @override
  bool get hasValue => true;

  @override
  bool get isLoading => false;

  @override
  Object? get error => null;

  @override
  double get progress => 1;

  @override
  StackTrace? get stackTrace => null;
}

class AsyncProgressLoading<T> extends AsyncProgressValue<T> {
  const AsyncProgressLoading._(this.progress) : super._();

  const AsyncProgressLoading(double progress) : this._(progress);

  @override
  final double progress;

  @override
  bool get hasValue => false;

  @override
  bool get isLoading => true;

  @override
  Object? get error => null;

  @override
  StackTrace? get stackTrace => null;

  @override
  T? get value => null;
}

class AsyncProgressError<T> extends AsyncProgressValue<T> {
  const AsyncProgressError._(this.error, this.stackTrace) : super._();

  const AsyncProgressError(Object error, StackTrace stackTrace)
      : this._(error, stackTrace);

  @override
  final Object error;

  @override
  final StackTrace stackTrace;

  @override
  bool get hasValue => false;

  @override
  bool get isLoading => false;

  @override
  double get progress => 1;

  @override
  T? get value => null;
}
