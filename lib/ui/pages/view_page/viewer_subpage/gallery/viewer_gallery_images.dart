import 'package:catweb/ui/components/cupertino_app_bar.dart';
import 'package:catweb/ui/components/dark_image.dart';
import 'package:catweb/ui/components/image_loader.dart';
import 'package:catweb/ui/components/load_more_footer.dart';
import 'package:catweb/ui/components/simple_sliver.dart';
import 'package:catweb/ui/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'gallery_controller.dart';

class ViewerGalleryImages extends StatelessWidget {
  const ViewerGalleryImages({Key? key, required this.c}) : super(key: key);

  final GalleryPreviewController c;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoAppBar(
        leading: const CupertinoBackLeading(),
        child: Obx(() => CupertinoScrollbar(
          child: SmartRefresher(
            enablePullDown: false,
            enablePullUp: true,
            controller: c.refreshController,
            onLoading: c.onLoadMore,
            footer: const LoadMoreFooter(),
            child: CustomScrollView(
              slivers: [
                SliverPullToRefresh(onRefresh: c.onRefresh),
                SliverGrid(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 150,
                    childAspectRatio: 0.65,
                  ),
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(4),
                        child: Column(
                          children: [
                            Expanded(
                              child: DarkWidget(
                                child: c.map[index] != null
                                    ? ImageLoader(
                                  concurrency: c.concurrency,
                                  model: c.map[index]!,
                                  imageWidgetBuilder: (context, child) {
                                    return FittedBox(
                                      fit: BoxFit.contain,
                                      child: child,
                                    );
                                  },
                                )
                                    : const SizedBox(),
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
                      );
                    },
                    childCount: c.length(),
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
