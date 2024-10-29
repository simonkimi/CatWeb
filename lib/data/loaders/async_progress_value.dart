import 'package:freezed_annotation/freezed_annotation.dart';

part 'async_progress_value.freezed.dart';

@freezed
class AsyncProgressValue<T> with _$AsyncProgressValue<T> {
  const AsyncProgressValue._();

  const factory AsyncProgressValue.idle() = AsyncProgressIdle<T>;

  const factory AsyncProgressValue.data(T value) = AsyncProgressData<T>;

  const factory AsyncProgressValue.loading(double progress) =
      AsyncProgressLoading<T>;

  const factory AsyncProgressValue.error(Object error, StackTrace stackTrace) =
      AsyncProgressError<T>;

  const factory AsyncProgressValue.cached() = AsyncProgressCached<T>;

  bool get isLoading => switch (this) {
        AsyncProgressLoading() => true,
        _ => false,
      };

  double get progress => switch (this) {
        AsyncProgressLoading(:final progress) => progress,
        _ => 0,
      };

  bool get hasValue => switch (this) {
        AsyncProgressData() => true,
        _ => false,
      };

  T? get value => switch (this) {
        AsyncProgressData(:final value) => value,
        _ => null,
      };

  Object? get error => switch (this) {
        AsyncProgressError(:final error) => error,
        _ => null,
      };

  StackTrace? get stackTrace => switch (this) {
        AsyncProgressError(:final stackTrace) => stackTrace,
        _ => null,
      };

  static Future<AsyncProgressValue<T>> guard<T>(
    Future<T> Function() future,
  ) async {
    try {
      final value = await future();
      return AsyncProgressValue.data(value);
    } catch (e, s) {
      return AsyncProgressValue.error(e, s);
    }
  }
}
