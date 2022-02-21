import 'package:catweb/ui/components/cupertino_app_bar.dart';
import 'package:catweb/ui/components/image_loader.dart';
import 'package:catweb/ui/components/simple_sliver.dart';
import 'package:flutter/cupertino.dart';

import 'gallery_controller.dart';

class ViewerGalleryImages extends StatelessWidget {
  const ViewerGalleryImages({Key? key, required this.c}) : super(key: key);

  final GalleryPreviewController c;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoAppBar(
        leading: const CupertinoBackLeading(),
        child: CustomScrollView(
          slivers: [
            SliverPullToRefresh(onRefresh: c.onRefresh),
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150,
                childAspectRatio: 0.7,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Column(
                    children: [
                      Expanded(
                        child: ImageLoader(
                          concurrency: c.concurrency,
                          model: c.items[index],
                          imageWidgetBuilder: (context, child) {
                            return FittedBox(
                              fit: BoxFit.contain,
                              child: child,
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        index.toString(),
                        style: const TextStyle(
                          height: 1,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  );
                },
                childCount: c.items.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
