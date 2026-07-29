import 'dart:async';

import 'package:catweb/data/loading/cancellation.dart';
import 'package:catweb/data/loading/load_failure.dart';
import 'package:catweb/data/loading/paged_loader.dart';
import 'package:catweb/ui/state/paged_loader_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('bridge exposes initial loading and end state', (tester) async {
    final page = Completer<PageChunk<int>>();
    final notifier = _BridgeNotifier(_WidgetPageSource((_, _) => page.future));
    unawaited(notifier.loadInitial());

    await tester.pumpWidget(_SnapshotApp(notifier: notifier));
    expect(find.text('loading-empty'), findsOneWidget);

    page.complete(PageChunk(startIndex: 0, items: const [1], isLast: true));
    await tester.pump();
    expect(find.text('items:1-end'), findsOneWidget);

    await tester.pumpWidget(const SizedBox());
    notifier.dispose();
  });

  testWidgets('bridge exposes an empty-state failure', (tester) async {
    final notifier = _BridgeNotifier(
      _WidgetPageSource((_, _) async => throw StateError('initial failed')),
    );

    await notifier.loadInitial();
    await tester.pumpWidget(_SnapshotApp(notifier: notifier));

    expect(find.text('error-empty'), findsOneWidget);
    await tester.pumpWidget(const SizedBox());
    notifier.dispose();
  });

  testWidgets('append failure preserves existing content', (tester) async {
    var calls = 0;
    final notifier = _BridgeNotifier(
      _WidgetPageSource((request, _) async {
        calls++;
        if (request is InitialPageRequest) {
          return PageChunk(
            startIndex: 0,
            items: const [1],
            nextCursor: const PageCursor.token('next'),
            isLast: false,
          );
        }
        throw StateError('append failed');
      }),
    );
    await notifier.loadInitial();
    await tester.pumpWidget(_SnapshotApp(notifier: notifier));

    await notifier.loadNextPage();
    await tester.pump();

    expect(find.text('items:1-error'), findsOneWidget);
    expect(calls, 2);
    await tester.pumpWidget(const SizedBox());
    notifier.dispose();
  });
}

final class _SnapshotApp extends StatelessWidget {
  const _SnapshotApp({required this.notifier});

  final _BridgeNotifier notifier;

  @override
  Widget build(BuildContext context) => CupertinoApp(
    home: ListenableBuilder(
      listenable: notifier,
      builder: (_, _) {
        final state = notifier.pageSnapshot;
        final count = state.loadedCount;
        final label = switch ((count, state.isLoading, state.failure)) {
          (0, true, _) => 'loading-empty',
          (0, false, LoadFailure()) => 'error-empty',
          (_, _, LoadFailure()) => 'items:$count-error',
          (_, _, _) when !state.hasNext => 'items:$count-end',
          _ => 'items:$count',
        };
        return CupertinoPageScaffold(child: Center(child: Text(label)));
      },
    ),
  );
}

final class _BridgeNotifier extends ChangeNotifier
    with PagedLoaderNotifier<int> {
  _BridgeNotifier(PageSource<int> source) {
    bindPageLoader(PagedLoader<int>(source: source));
  }

  @override
  void dispose() {
    disposePageLoader();
    super.dispose();
  }
}

final class _WidgetPageSource implements PageSource<int> {
  const _WidgetPageSource(this.handler);

  final Future<PageChunk<int>> Function(
    PageRequest request,
    CancellationScope cancellation,
  )
  handler;

  @override
  PaginationCapabilities get capabilities =>
      const PaginationCapabilities.sequential();

  @override
  Future<PageChunk<int>> load(
    PageRequest request,
    CancellationScope cancellation,
  ) => handler(request, cancellation);
}
