import 'package:catweb/ui/widgets/cupertino_app_bar.dart';
import 'package:catweb/ui/widgets/image_loader.dart';
import 'package:catweb/ui/widgets/load_more_footer.dart';
import 'package:catweb/ui/widgets/simple_sliver.dart';
import 'package:catweb/ui/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'gallery_controller.dart';

class ViewerGalleryImages extends StatelessWidget {
  const ViewerGalleryImages({
    super.key,
    required this.previewController,
    required this.onOpenPage,
  });

  final GalleryPreviewController previewController;
  final Future<void> Function(int?) onOpenPage;

  // TODO Gallery图片加载问题

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoAppBar(
        leading: const CupertinoBackLeading(),
        child: Obx(() => CupertinoScrollbar(
              child: SmartRefresher(
                enablePullDown: false,
                enablePullUp: true,
                controller: previewController.refreshController,
                onLoading: previewController.onLoadMore,
                footer: const LoadMoreFooter(),
                child: CustomScrollView(
                  slivers: [
                    SliverPullToRefresh(onRefresh: previewController.onRefresh),
                    SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 150,
                        childAspectRatio: 0.65,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final list = previewController.items.toList();
                          return GestureDetector(
                            onTap: () => onOpenPage(index),
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: Column(
                                children: [
                                  // TODO 加载图片模型
                                  Expanded(
                                    child: list[index] != null
                                        ? ImageLoader(
                                            concurrency: previewController
                                                .previewConcurrency,
                                            model:
                                                list[index]!.value.previewImg,
                                            imageWidgetBuilder:
                                                (context, child) {
                                              return FittedBox(
                                                fit: BoxFit.contain,
                                                child: child,
                                              );
                                            },
                                            innerImageBuilder:
                                                (context, child) {
                                              return ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                child: child,
                                              );
                                            },
                                          )
                                        : const Center(
                                            child: Text('null'),
                                          ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    (index + 1).toString(),
                                    style: TextStyle(
                                      height: 1,
                                      fontSize: 14,
                                      color:
                                          FixColor.title.resolveFrom(context),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        childCount: previewController.items.length,
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
