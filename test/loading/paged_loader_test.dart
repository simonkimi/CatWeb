import 'dart:async';

import 'package:catweb/data/loading/cancellation.dart';
import 'package:catweb/data/loading/paged_loader.dart';
import 'package:test/test.dart';

void main() {
  group('PagedLoader', () {
    test('loads sequential pages and stops at the final chunk', () async {
      final source = _FakePageSource<int>((request, _) async {
        return switch (request) {
          InitialPageRequest() => PageChunk(
            startIndex: 0,
            items: [1, 2],
            nextCursor: const PageCursor.token('next'),
            isLast: false,
          ),
          NextPageRequest() => PageChunk(
            startIndex: 2,
            items: [3],
            isLast: true,
          ),
          _ => throw StateError('Unexpected request'),
        };
      });
      final loader = PagedLoader<int>(source: source);

      await loader.loadInitial();
      await loader.loadNext();

      expect(loader.state.items, {0: 1, 1: 2, 2: 3});
      expect(loader.state.hasNext, isFalse);
      expect(source.requests, hasLength(2));
      await loader.dispose();
    });

    test(
      'a failed append does not advance the cursor and retry is exact',
      () async {
        var appendAttempts = 0;
        final source = _FakePageSource<int>((request, _) async {
          return switch (request) {
            InitialPageRequest() => PageChunk(
              startIndex: 0,
              items: [1],
              nextCursor: const PageCursor.token('a'),
              isLast: false,
            ),
            NextPageRequest(:final cursor) => () {
              expect(cursor, const PageCursor.token('a'));
              appendAttempts++;
              if (appendAttempts == 1) throw StateError('temporary');
              return PageChunk(startIndex: 1, items: [2], isLast: true);
            }(),
            _ => throw StateError('Unexpected request'),
          };
        });
        final loader = PagedLoader<int>(source: source);

        await loader.loadInitial();
        await loader.loadNext();
        expect(loader.state.failure, isNotNull);
        expect(loader.state.items, {0: 1});

        await loader.retry();
        expect(loader.state.failure, isNull);
        expect(loader.state.items, {0: 1, 1: 2});
        expect(appendAttempts, 2);
        await loader.dispose();
      },
    );

    test('refresh clears immediately and ignores an older response', () async {
      final first = Completer<PageChunk<int>>();
      final refreshed = Completer<PageChunk<int>>();
      var calls = 0;
      final source = _FakePageSource<int>((request, _) {
        calls++;
        return calls == 1 ? first.future : refreshed.future;
      });
      final loader = PagedLoader<int>(source: source);

      final initialFuture = loader.loadInitial();
      await Future<void>.delayed(Duration.zero);
      final refreshFuture = loader.refresh();
      expect(loader.state.items, isEmpty);
      expect(loader.state.activity, PagedActivity.refresh);

      refreshed.complete(PageChunk(startIndex: 0, items: [2], isLast: true));
      await refreshFuture;
      first.complete(PageChunk(startIndex: 0, items: [1], isLast: true));
      await initialFuture;

      expect(loader.state.items, {0: 2});
      await loader.dispose();
    });

    test(
      'indexed sources load only the page containing the requested item',
      () async {
        final source = _FakePageSource<int>((request, _) async {
          final page = (request as IndexedPageRequest).pageIndex;
          return PageChunk(
            startIndex: page * 10,
            items: List.generate(10, (offset) => page * 10 + offset),
            totalCount: 100,
            nextCursor: PageCursor.number(page + 1),
            isLast: page == 9,
          );
        }, capabilities: const PaginationCapabilities.indexed(pageSize: 10));
        final loader = PagedLoader<int>(source: source);

        await loader.ensureIndex(42);

        expect(source.requests, [PageRequest.index(4)]);
        expect(loader.state.itemAt(42), 42);
        expect(loader.state.visibleLength, 100);
        await loader.dispose();
      },
    );

    test('sequential ensureIndex continues across empty pages', () async {
      var call = 0;
      final source = _FakePageSource<int>((request, _) async {
        call++;
        return switch (call) {
          1 => PageChunk(
            startIndex: 0,
            items: [0],
            nextCursor: const PageCursor.token('empty'),
            isLast: false,
          ),
          2 => PageChunk(
            startIndex: 1,
            items: const [],
            nextCursor: const PageCursor.token('after-empty'),
            isLast: false,
          ),
          _ => PageChunk(startIndex: 1, items: [1, 2], isLast: true),
        };
      });
      final loader = PagedLoader<int>(source: source);

      await loader.loadInitial();
      await loader.ensureIndex(2);

      expect(loader.state.itemAt(2), 2);
      expect(source.requests, hasLength(3));
      await loader.dispose();
    });

    test('rejects negative page requests in all build modes', () {
      expect(() => PageRequest.index(-1), throwsRangeError);
    });

    test('rejects an invalid empty-page guard in all build modes', () {
      expect(
        () => PagedLoader<int>(
          source: _FakePageSource((_, _) async {
            return PageChunk(startIndex: 0, items: const [], isLast: true);
          }),
          maxConsecutiveEmptyPages: 0,
        ),
        throwsRangeError,
      );
    });

    test('rejects contradictory final-page metadata', () async {
      final source = _FakePageSource<int>((_, _) async {
        return PageChunk(
          startIndex: 0,
          items: const [1],
          nextCursor: const PageCursor.token('unexpected'),
          isLast: true,
        );
      });
      final loader = PagedLoader<int>(source: source);

      await loader.loadInitial();

      expect(loader.state.failure?.error, isA<StateError>());
      expect(loader.state.items, isEmpty);
      await loader.dispose();
    });

    test('detects a cursor that does not advance', () async {
      final source = _FakePageSource<int>((request, _) async {
        return switch (request) {
          InitialPageRequest() => PageChunk(
            startIndex: 0,
            items: [1],
            nextCursor: const PageCursor.token('same'),
            isLast: false,
          ),
          NextPageRequest() => PageChunk(
            startIndex: 1,
            items: [2],
            nextCursor: const PageCursor.token('same'),
            isLast: false,
          ),
          _ => throw StateError('Unexpected request'),
        };
      });
      final loader = PagedLoader<int>(source: source);

      await loader.loadInitial();
      await loader.loadNext();

      expect(loader.state.failure?.error, isA<StateError>());
      expect(loader.state.items, {0: 1});
      await loader.dispose();
    });

    test('deduplicates simultaneous next-page requests', () async {
      final append = Completer<PageChunk<int>>();
      var appendCalls = 0;
      final source = _FakePageSource<int>((request, _) async {
        if (request is InitialPageRequest) {
          return PageChunk(
            startIndex: 0,
            items: [0],
            nextCursor: const PageCursor.token('next'),
            isLast: false,
          );
        }
        appendCalls++;
        return append.future;
      });
      final loader = PagedLoader<int>(source: source);
      await loader.loadInitial();

      final first = loader.loadNext();
      final second = loader.loadNext();
      append.complete(PageChunk(startIndex: 1, items: [1], isLast: true));
      await Future.wait([first, second]);

      expect(appendCalls, 1);
      expect(loader.state.items, {0: 0, 1: 1});
      await loader.dispose();
    });

    test('rejects chunks that exceed their declared total', () async {
      final source = _FakePageSource<int>((_, _) async {
        return PageChunk(
          startIndex: 1,
          items: [1, 2],
          totalCount: 2,
          isLast: true,
        );
      });
      final loader = PagedLoader<int>(source: source);

      await loader.loadInitial();

      expect(loader.state.failure?.error, isA<StateError>());
      expect(loader.state.items, isEmpty);
      await loader.dispose();
    });

    test('stops a sequential cursor chain with too many empty pages', () async {
      var cursor = 0;
      final source = _FakePageSource<int>((_, _) async {
        cursor++;
        return PageChunk(
          startIndex: 0,
          items: const [],
          nextCursor: PageCursor.number(cursor),
          isLast: false,
        );
      });
      final loader = PagedLoader<int>(
        source: source,
        maxConsecutiveEmptyPages: 2,
      );

      await loader.loadInitial();
      await loader.loadNext();

      expect(loader.state.failure?.error, isA<StateError>());
      expect(cursor, 2);
      await loader.dispose();
    });

    test(
      'dispose waits for an active page source to observe cancellation',
      () async {
        final sourceFinished = Completer<void>();
        final source = _FakePageSource<int>((_, scope) async {
          await scope.whenCancelled;
          sourceFinished.complete();
          scope.throwIfCancelled();
          throw StateError('unreachable');
        });
        final loader = PagedLoader<int>(source: source);
        unawaited(loader.loadInitial());

        await loader.dispose();

        expect(sourceFinished.isCompleted, isTrue);
      },
    );
  });
}

final class _FakePageSource<T> implements PageSource<T> {
  _FakePageSource(
    this.handler, {
    this.capabilities = const PaginationCapabilities.sequential(),
  });

  final Future<PageChunk<T>> Function(
    PageRequest request,
    CancellationScope cancellation,
  )
  handler;

  @override
  final PaginationCapabilities capabilities;

  final List<PageRequest> requests = [];

  @override
  Future<PageChunk<T>> load(
    PageRequest request,
    CancellationScope cancellation,
  ) {
    requests.add(request);
    return handler(request, cancellation);
  }
}
