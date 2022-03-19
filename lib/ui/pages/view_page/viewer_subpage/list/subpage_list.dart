import 'package:catweb/data/constant.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/templete.dart';
import 'package:catweb/network/client/image_concurrency.dart';
import 'package:catweb/ui/components/cupertino_app_bar.dart';
import 'package:catweb/ui/components/load_more_footer.dart';
import 'package:catweb/ui/components/simple_sliver.dart';
import 'package:catweb/ui/pages/view_page/viewer_subpage/list/controller/subpage_controller.dart';
import 'package:catweb/ui/pages/view_page/viewer_subpage/viewer_subpage_scaffold.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'list_extended_card.dart';

class SubPageListFragment extends StatefulWidget {
  const SubPageListFragment({
    Key? key,
    required this.controller,
    required this.hasTabBar,
    required this.hasToolBar,
    this.tabBarHeight,
  }) : super(key: key);

  final SubListController controller;
  final bool hasTabBar;
  final bool hasToolBar;
  final double? tabBarHeight;

  @override
  _SubPageListFragmentState createState() => _SubPageListFragmentState();
}

class _SubPageListFragmentState extends State<SubPageListFragment>
    with AutomaticKeepAliveClientMixin {
  SubListController get controller => widget.controller;

  late final concurrency = ImageListConcurrency(
    dio: widget.controller.global.client!.imageDio,
    concurrency: 2,
  );

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AppBarScrollNotifier(
      child: CupertinoScrollbar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: SmartRefresher(
            controller: controller.refreshController,
            enablePullDown: false,
            enablePullUp: true,
            onLoading: () => controller.onLoadMore(),
            footer: LoadMoreFooter(
              hasToolBar: widget.hasToolBar,
            ),
            child: CustomScrollView(
              cacheExtent: 300,
              slivers: [
                SliverPullToRefresh(
                  onRefresh: () => controller.onRefresh(),
                  extraHeight: widget.hasTabBar
                      ? widget.tabBarHeight ?? kCupertinoTabBarHeight
                      : 0,
                ),
                _buildBody(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Obx(() {
      if (controller.isFullScreenLoading) {
        return const LoadingSliver();
      } else if (controller.isFullScreenError) {
        return ExceptionSliver(errMsg: controller.errorMessage!.toString());
      }
      return _buildSliverList(context);
    });
  }

  Widget _buildSliverList(BuildContext context) {
    // TODO 瀑布流支持
    return Obx(() {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final model = controller.items[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.5),
              child: ListExtendedCard(
                model: model,
                concurrency: concurrency,
                onTap: () {
                  pushNewPage(
                    to: (controller.blueprint.templateData
                            as TemplateListDataModel)
                        .targetItem
                        .value,
                    envModel: SiteEnvModel(model.env),
                    model: model,
                  );
                },
              ),
            );
          },
          childCount: controller.items.length,
        ),
      );
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
