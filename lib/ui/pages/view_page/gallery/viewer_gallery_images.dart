import 'package:catweb/ui/widgets/cupertino_app_bar.dart';
import 'package:catweb/ui/widgets/image_loader.dart';
import 'package:catweb/ui/widgets/load_more_footer.dart';
import 'package:catweb/ui/widgets/simple_sliver.dart';
import 'package:catweb/ui/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';


import 'viewer_gallery_notifier.dart';

class ViewerGalleryImages extends StatelessWidget {
  const ViewerGalleryImages({
    super.key,
    required this.onOpenPage,
  });

  final Future<void> Function(int?) onOpenPage;

  @override
  Widget build(BuildContext context) {
    ViewerGalleryNotifier notifier = context.read();
    final successiveItems = context.select((ViewerGalleryNotifier n) =>
    n.successiveItems).toList();

    return CupertinoPageScaffold(
      child: CupertinoAppBar(
        leading: const CupertinoBackLeading(),
        child: CupertinoScrollbar(
          child: SmartRefresher(
            enablePullDown: false,
            enablePullUp: true,
            controller: notifier.refreshController,
            onLoading: notifier.loadNextPage,
            footer: const LoadMoreFooter(),
            child: CustomScrollView(
              slivers: [
                SliverPullToRefresh(onRefresh: notifier.refresh),
                SliverGrid(
                  gridDelegate:
                  const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 150,
                    childAspectRatio: 0.65,
                  ),
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      return GestureDetector(
                        onTap: () => onOpenPage(index),
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Column(
                            children: [
                              Expanded(
                                child: ImageLoader(
                                  queue: notifier.imageQueue,
                                  model: successiveItems[index].previewImage,
                                  imageWidgetBuilder: (context, child) {
                                    return FittedBox(
                                      fit: BoxFit.contain,
                                      child: child,
                                    );
                                  },
                                  innerImageBuilder: (context, child) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: child,
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                (index + 1).toString(),
                                style: TextStyle(
                                  height: 1,
                                  fontSize: 14,
                                  color: FixColor.title.resolveFrom(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    childCount: successiveItems.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
