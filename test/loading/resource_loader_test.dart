import 'dart:async';

import 'package:catweb/data/loading/cancellation.dart';
import 'package:catweb/data/loading/load_failure.dart';
import 'package:catweb/data/loading/resource_loader.dart';
import 'package:test/test.dart';

void main() {
  group('ResourceLoader', () {
    test('deduplicates consumers of the same key', () async {
      var calls = 0;
      final source = _FakeResourceSource<String, String>((key, _, _) async {
        calls++;
        return key.toUpperCase();
      });
      final loader = ResourceLoader<String, String>(
        source: source,
        maxConcurrency: 2,
      );

      final first = loader.acquire('a');
      final second = loader.acquire('a');

      expect(await first.result, 'A');
      expect(await second.result, 'A');
      expect(calls, 1);
      await first.release();
      await second.release();
      await loader.dispose();
    });

    test('exposes cache origin as success metadata', () async {
      final loader = ResourceLoader<String, String>(
        source: _FakeResourceSource((key, _, _) async => key, fromCache: true),
        maxConcurrency: 1,
      );

      final handle = loader.acquire('cached');
      await handle.result;

      expect(
        handle.state,
        isA<ResourceSuccess<String>>().having(
          (state) => state.fromCache,
          'fromCache',
          isTrue,
        ),
      );
      await handle.release();
      await loader.dispose();
    });

    test('uses stable priority order for pending work', () async {
      final completions = <String, Completer<String>>{};
      final started = <String>[];
      final source = _FakeResourceSource<String, String>((key, _, _) {
        started.add(key);
        return (completions[key] = Completer<String>()).future;
      });
      final loader = ResourceLoader<String, String>(
        source: source,
        maxConcurrency: 1,
      );

      final a = loader.acquire('a', priority: 10);
      final b = loader.acquire('b', priority: 10);
      final c = loader.acquire('c', priority: 1);
      expect(started, ['a']);

      completions['a']!.complete('a');
      await a.result;
      await Future<void>.delayed(Duration.zero);
      expect(started, ['a', 'c']);

      completions['c']!.complete('c');
      await c.result;
      await Future<void>.delayed(Duration.zero);
      expect(started, ['a', 'c', 'b']);
      completions['b']!.complete('b');
      await b.result;

      await a.release();
      await b.release();
      await c.release();
      await loader.dispose();
    });

    test('reprioritizes pending work', () async {
      final completions = <String, Completer<String>>{};
      final started = <String>[];
      final source = _FakeResourceSource<String, String>((key, _, _) {
        started.add(key);
        return (completions[key] = Completer<String>()).future;
      });
      final loader = ResourceLoader<String, String>(
        source: source,
        maxConcurrency: 1,
      );

      final a = loader.acquire('a');
      final b = loader.acquire('b', priority: 10);
      final c = loader.acquire('c', priority: 5);
      b.reprioritize(0);

      completions['a']!.complete('a');
      await a.result;
      await Future<void>.delayed(Duration.zero);
      expect(started, ['a', 'b']);

      completions['b']!.complete('b');
      await b.result;
      completions['c'] ??= Completer<String>();
      await Future<void>.delayed(Duration.zero);
      completions['c']!.complete('c');
      await c.result;

      await a.release();
      await b.release();
      await c.release();
      await loader.dispose();
    });

    test('releasing the last consumer cancels active work', () async {
      final cancelled = Completer<void>();
      final source = _FakeResourceSource<String, String>((key, scope, _) async {
        await scope.whenCancelled;
        cancelled.complete();
        scope.throwIfCancelled();
        return key;
      });
      final loader = ResourceLoader<String, String>(
        source: source,
        maxConcurrency: 1,
        retention: ResourceRetention.whileReferenced,
      );

      final handle = loader.acquire('a');
      await handle.release();
      await cancelled.future;

      expect(loader.stateOf('a'), isNull);
      await loader.dispose();
    });

    test(
      'releasing pending work completes its result with cancellation',
      () async {
        final blocker = Completer<String>();
        final source = _FakeResourceSource<String, String>((key, _, _) {
          return key == 'running' ? blocker.future : Future.value(key);
        });
        final loader = ResourceLoader<String, String>(
          source: source,
          maxConcurrency: 1,
          retention: ResourceRetention.whileReferenced,
        );
        final running = loader.acquire('running');
        final pending = loader.acquire('pending');
        final pendingResult = pending.result;

        await pending.release();

        await expectLater(pendingResult, throwsA(isA<CancellationException>()));
        blocker.complete('running');
        await running.result;
        await running.release();
        await loader.dispose();
      },
    );

    test('rejects a non-positive concurrency limit', () {
      expect(
        () => ResourceLoader<String, String>(
          source: _FakeResourceSource((key, _, _) async => key),
          maxConcurrency: 0,
        ),
        throwsRangeError,
      );
    });

    test('never exceeds the configured concurrency limit', () async {
      var runningCount = 0;
      var peakRunningCount = 0;
      final gates = <int, Completer<void>>{};
      final source = _FakeResourceSource<int, int>((key, _, _) async {
        runningCount++;
        if (runningCount > peakRunningCount) peakRunningCount = runningCount;
        await (gates[key] = Completer<void>()).future;
        runningCount--;
        return key;
      });
      final loader = ResourceLoader<int, int>(
        source: source,
        maxConcurrency: 2,
      );
      final handles = List.generate(4, loader.acquire);

      expect(peakRunningCount, 2);
      gates[0]!.complete();
      gates[1]!.complete();
      await Future<void>.delayed(Duration.zero);
      expect(peakRunningCount, 2);
      gates[2]!.complete();
      gates[3]!.complete();
      await Future.wait(handles.map((handle) => handle.result));

      for (final handle in handles) {
        await handle.release();
      }
      await loader.dispose();
    });

    test('retries the same entry after a failure', () async {
      var attempts = 0;
      final source = _FakeResourceSource<String, String>((key, _, _) async {
        attempts++;
        if (attempts == 1) throw StateError('temporary');
        return key;
      });
      final loader = ResourceLoader<String, String>(
        source: source,
        maxConcurrency: 1,
      );
      final handle = loader.acquire('value');

      await expectLater(handle.result, throwsStateError);
      expect(handle.state, isA<ResourceFailure<String>>());
      handle.retry();

      expect(await handle.result, 'value');
      expect(attempts, 2);
      await handle.release();
      await loader.dispose();
    });

    test('does not retry a non-retryable failure', () async {
      var attempts = 0;
      final loader = ResourceLoader<String, String>(
        source: _FakeResourceSource((key, _, _) async {
          attempts++;
          throw StateError(key);
        }),
        maxConcurrency: 1,
        failureMapper: const _NonRetryableFailureMapper(),
      );
      final handle = loader.acquire('value');
      await expectLater(handle.result, throwsStateError);

      handle.retry();
      await Future<void>.delayed(Duration.zero);

      expect(attempts, 1);
      expect(handle.state, isA<ResourceFailure<String>>());
      await handle.release();
      await loader.dispose();
    });

    test('dispose waits for running cancellation to finish', () async {
      final sourceFinished = Completer<void>();
      final source = _FakeResourceSource<String, String>((key, scope, _) async {
        await scope.whenCancelled;
        await Future<void>.delayed(Duration.zero);
        sourceFinished.complete();
        scope.throwIfCancelled();
        return key;
      });
      final loader = ResourceLoader<String, String>(
        source: source,
        maxConcurrency: 1,
      );
      loader.acquire('running');

      await loader.dispose();

      expect(sourceFinished.isCompleted, isTrue);
    });
  });
}

final class _NonRetryableFailureMapper implements LoadFailureMapper {
  const _NonRetryableFailureMapper();

  @override
  LoadFailure map(Object error, StackTrace stackTrace) => LoadFailure(
    kind: LoadFailureKind.configuration,
    error: error,
    stackTrace: stackTrace,
    retryable: false,
  );
}

final class _FakeResourceSource<K, T> implements ResourceSource<K, T> {
  const _FakeResourceSource(this.handler, {this.fromCache = false});

  final Future<T> Function(
    K key,
    CancellationScope cancellation,
    void Function(ResourceProgress progress) onProgress,
  )
  handler;
  final bool fromCache;

  @override
  Future<ResourceLoadResult<T>> load(
    K key,
    CancellationScope cancellation,
    void Function(ResourceProgress progress) onProgress,
  ) async => ResourceLoadResult(
    await handler(key, cancellation, onProgress),
    fromCache: fromCache,
  );
}
