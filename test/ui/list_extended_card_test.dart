import 'package:catweb/data/media/image_repository.dart';
import 'package:catweb/data/models/ffi/result/base.dart';
import 'package:catweb/data/models/ffi/result/result.dart';
import 'package:catweb/ui/widgets/image_loader.dart';
import 'package:catweb/ui/widgets/list_extended_card.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('parsed items with no image render and remain tappable', (
    tester,
  ) async {
    final dio = Dio();
    final repository = ImageRepository(
      siteId: 'list',
      dio: dio,
      cacheOptions: CacheOptions(store: MemCacheStore()),
      maxConcurrency: 1,
    );
    addTearDown(() async {
      await repository.dispose();
      dio.close(force: true);
    });
    var taps = 0;
    // A completely absent image and a configured image with a missing URL are
    // both valid results from the parser.
    for (final image in <ImageResult?>[null, const ImageResult()]) {
      await tester.pumpWidget(
        CupertinoApp(
          home: CupertinoPageScaffold(
            child: Column(
              children: [
                ListExtendedCard(
                  model: ListParserResultItem(
                    title: 'Text only item',
                    previewImage: image,
                  ),
                  repository: repository,
                  onTap: () => taps++,
                ),
              ],
            ),
          ),
        ),
      );
      expect(tester.takeException(), isNull);
      expect(find.text('Text only item'), findsOneWidget);
      expect(find.byType(ImageLoader), findsNothing);
      await tester.tap(find.text('Text only item'));
    }
    expect(taps, 2);
  });
}
