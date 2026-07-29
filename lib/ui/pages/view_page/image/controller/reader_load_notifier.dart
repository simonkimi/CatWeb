import 'dart:async';

import 'package:catweb/app.dart';
import 'package:catweb/data/controller/settings.dart';
import 'package:catweb/data/loading/cancellation.dart';
import 'package:catweb/data/loading/resource_loader.dart';
import 'package:catweb/data/media/image_repository.dart';
import 'package:catweb/data/models/ffi/result/base.dart';
import 'package:catweb/data/models/ffi/result/result.dart';
import 'package:catweb/data/models/image_with_preview.dart';
import 'package:catweb/data/site_runtime/runtime_contracts.dart';
import 'package:catweb/data/site_runtime/site_definition.dart';
import 'package:catweb/data/site_runtime/site_executor.dart';
import 'package:catweb/network/runtime/dio_http_transport.dart';
import 'package:catweb/network/runtime/site_session.dart';
import 'package:flutter/foundation.dart';

/// 阅读器访问分页预览项所需的最小接口。
abstract interface class ReaderInfo<T extends ImageWithPreviewModel>
    implements Listenable {
  T? itemAt(int index);
  int get itemCount;
  Future<void> loadIndexModel(int index);
  int? get startReadIndex;
  ImageRepository get previewRepository;
}

/// 协调阅读页解析请求和预加载资源优先级的控制器。
///
/// 当前页优先级最高；移动方向变化时会重新计算窗口并释放窗口外 handle。
final class ReaderLoaderNotifier extends ChangeNotifier {
  ReaderLoaderNotifier({
    required this.readerInfo,
    required this.endpoint,
    required this.requestContext,
    required this.session,
  }) : settingService = getIt.get(),
       _loader = ResourceLoader<int, ImageResult>(
         source: _ReaderImageSource(
           readerInfo: readerInfo,
           endpoint: endpoint,
           requestContext: requestContext,
           session: session,
           quality: () => getIt.get<SettingService>().imageQuality,
         ),
         maxConcurrency: 1,
         retention: ResourceRetention.memory,
         failureMapper: const SiteRuntimeFailureMapper(),
       ) {
    scheduleMicrotask(
      () => onIndexChanged(readerInfo.startReadIndex ?? 0, true),
    );
  }

  final ReaderInfo<ImageWithPreviewModel> readerInfo;
  final EndpointRule endpoint;
  final RequestContext requestContext;
  final SiteSession session;
  final SettingService settingService;
  final ResourceLoader<int, ImageResult> _loader;
  final Map<int, ResourceHandle<int, ImageResult>> _handles = {};
  final Map<int, StreamSubscription<ResourceSnapshot<ImageResult>>>
  _subscriptions = {};
  final Map<int, ResourceSnapshot<ImageResult>> _states = {};

  bool readerIsForward = true;
  int currentIndex = 0;
  bool _disposed = false;

  ResourceSnapshot<ImageResult> stateAt(int index) =>
      _states[index] ?? const ResourceSnapshot.idle();

  ImageResult? imageAt(int index) => switch (stateAt(index)) {
    ResourceSuccess<ImageResult>(:final value) => value,
    _ => null,
  };

  Future<void> onIndexChanged(int index, bool isForward) async {
    if (_disposed) return;
    readerIsForward = isForward;
    currentIndex = index;
    final direction = isForward ? 1 : -1;
    final requiredIndices = <int>{};
    for (var distance = 0; distance <= preloadCount; distance++) {
      final target = currentIndex + direction * distance;
      if (target >= 0 && target < readerInfo.itemCount) {
        requiredIndices.add(target);
      }
    }

    for (final entry in _handles.entries.toList(growable: false)) {
      if (!requiredIndices.contains(entry.key)) {
        await _subscriptions.remove(entry.key)?.cancel();
        await entry.value.release();
        if (_disposed) return;
        _handles.remove(entry.key);
      }
    }

    for (final target in requiredIndices) {
      final distance = (target - currentIndex).abs();
      final existing = _handles[target];
      if (existing != null) {
        existing.reprioritize(distance);
        continue;
      }
      final handle = _loader.acquire(target, priority: distance);
      _handles[target] = handle;
      _states[target] = handle.state;
      _subscriptions[target] = handle.states.listen((state) {
        if (_disposed) return;
        _states[target] = state;
        notifyListeners();
      });
    }
    if (!_disposed) notifyListeners();
  }

  void retry(int index) => _handles[index]?.retry();

  int get preloadCount => settingService.preloadCount;

  @override
  void dispose() {
    _disposed = true;
    for (final subscription in _subscriptions.values) {
      unawaited(subscription.cancel());
    }
    for (final handle in _handles.values) {
      unawaited(handle.release());
    }
    unawaited(_loader.dispose());
    super.dispose();
  }
}

final class _ReaderImageSource implements ResourceSource<int, ImageResult> {
  const _ReaderImageSource({
    required this.readerInfo,
    required this.endpoint,
    required this.requestContext,
    required this.session,
    required this.quality,
  });

  final ReaderInfo<ImageWithPreviewModel> readerInfo;
  final EndpointRule endpoint;
  final RequestContext requestContext;
  final SiteSession session;
  final ImageQuality Function() quality;

  @override
  Future<ResourceLoadResult<ImageResult>> load(
    int index,
    CancellationScope cancellation,
    void Function(ResourceProgress progress) onProgress,
  ) async {
    var item = readerInfo.itemAt(index);
    if (item == null) {
      await readerInfo.loadIndexModel(index);
      cancellation.throwIfCancelled();
      item = readerInfo.itemAt(index);
    }
    if (item == null) {
      throw StateError('Item $index is unavailable after loading its page');
    }
    final idCode = item.idCode;
    if (idCode == null || idCode.isEmpty) {
      throw StateError('Item $index has no reader target');
    }
    final result = await session.execute<ImageReaderResult>(
      SiteOperation<ImageReaderResult>(
        endpointId: endpoint.id,
        context: requestContext,
        inputs: {'idCode': idCode},
      ),
      cancellation,
    );
    cancellation.throwIfCancelled();
    return ResourceLoadResult(_selectImage(result.data));
  }

  ImageResult _selectImage(ImageReaderResult result) {
    final selected = switch (quality()) {
      ImageQuality.original =>
        result.rawImage ?? result.largerImage ?? result.image,
      ImageQuality.larger =>
        result.largerImage ?? result.image ?? result.rawImage,
      ImageQuality.defaultQ =>
        result.image ?? result.largerImage ?? result.rawImage,
    };
    return selected ?? (throw StateError('Reader parser returned no image'));
  }
}
