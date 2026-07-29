/// 加载失败所属的稳定业务分类。
enum LoadFailureKind {
  configuration,
  network,
  http,
  parsing,
  persistence,
  cancelled,
  unknown,
}

/// 供控制器和 UI 使用的结构化加载失败。
///
/// [retryable] 只表示技术上允许重试，不代表调用方必须自动重试。
final class LoadFailure {
  const LoadFailure({
    required this.kind,
    required this.error,
    required this.stackTrace,
    required this.retryable,
  });

  final LoadFailureKind kind;
  final Object error;
  final StackTrace stackTrace;
  final bool retryable;

  @override
  String toString() => error.toString();
}

/// 将底层异常转换为统一 [LoadFailure] 的接口。
abstract interface class LoadFailureMapper {
  LoadFailure map(Object error, StackTrace stackTrace);
}

/// 无法识别异常类型时使用的默认映射器。
final class DefaultLoadFailureMapper implements LoadFailureMapper {
  const DefaultLoadFailureMapper();

  @override
  LoadFailure map(Object error, StackTrace stackTrace) => LoadFailure(
    kind: LoadFailureKind.unknown,
    error: error,
    stackTrace: stackTrace,
    retryable: true,
  );
}
