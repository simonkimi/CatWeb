abstract class AsyncValue<T> {
  const AsyncValue._();

  const factory AsyncValue.idle() = AsyncIdle;

  const factory AsyncValue.data(T value) = AsyncData<T>;

  const factory AsyncValue.loading() = AsyncLoading;

  const factory AsyncValue.error(Object error, StackTrace stackTrace) =
      AsyncError;

  bool get isLoading;

  bool get hasValue;

  T? get value;

  Object? get error;

  StackTrace? get stackTrace;

  static Future<AsyncValue<T>> guard<T>(Future<T> Function() future) async {
    try {
      return AsyncValue.data(await future());
    } catch (e, stackTrace) {
      return AsyncValue.error(e, stackTrace);
    }
  }
}

class AsyncIdle<T> extends AsyncValue<T> {
  const AsyncIdle() : super._();

  @override
  bool get hasValue => false;

  @override
  bool get isLoading => false;

  @override
  Object? get error => null;

  @override
  StackTrace? get stackTrace => null;

  @override
  T? get value => null;
}

class AsyncLoading<T> extends AsyncValue<T> {
  const AsyncLoading() : super._();

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

class AsyncData<T> extends AsyncValue<T> {
  const AsyncData(this.value) : super._();

  @override
  final T value;

  @override
  bool get hasValue => true;

  @override
  bool get isLoading => false;

  @override
  Object? get error => null;

  @override
  StackTrace? get stackTrace => null;
}

class AsyncError<T> extends AsyncValue<T> {
  const AsyncError(this.error, this.stackTrace) : super._();

  @override
  final Object error;

  @override
  final StackTrace stackTrace;

  @override
  bool get hasValue => false;

  @override
  bool get isLoading => false;

  @override
  T? get value => null;
}
