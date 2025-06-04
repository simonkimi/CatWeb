import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_loader_state.freezed.dart';

@freezed
sealed class PageLoaderState with _$PageLoaderState {
  const PageLoaderState._();

  const factory PageLoaderState.idle() = _Idle;

  const factory PageLoaderState.loading() = _Running;

  const factory PageLoaderState.end() = _End;

  const factory PageLoaderState.error(Object error, StackTrace stackTrace) =
      PageLoaderStateError;

  static Future<PageLoaderState> guard<T>(T Function() f) async {
    try {
      f();
      return const PageLoaderState.idle();
    } catch (e, stack) {
      return PageLoaderState.error(e, stack);
    }
  }

  bool get isLoading => switch (this) {
        _Running() => true,
        _ => false,
      };

  bool get isError => switch (this) {
        PageLoaderStateError() => true,
        _ => false,
      };

  bool get isEnd => switch (this) {
        _End() => true,
        _ => false,
      };
}
