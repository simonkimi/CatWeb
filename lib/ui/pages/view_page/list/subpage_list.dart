import 'package:bot_toast/bot_toast.dart';
import 'package:catweb/data/constant.dart';
import 'package:catweb/data/controller/navigator_service.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/models/site_model/pages/template_list.dart';
import 'package:catweb/ui/widgets/cupertino_app_bar.dart';
import 'package:catweb/ui/widgets/cupertino_divider.dart';
import 'package:catweb/ui/widgets/load_more_footer.dart';
import 'package:catweb/ui/widgets/simple_sliver.dart';
import 'package:catweb/ui/pages/view_page/list/controller/subpage_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'list_extended_card.dart';

class SubPageListFragment extends StatefulWidget {
  const SubPageListFragment({
    super.key,
    required this.controller,
    required this.hasTabBar,
    required this.hasToolBar,
    this.tabBarHeight,
  });

  final SubListController controller;
  final bool hasTabBar;
  final bool hasToolBar;
  final double? tabBarHeight;

  @override
  State<SubPageListFragment> createState() => _SubPageListFragmentState();
}

class _SubPageListFragmentState extends State<SubPageListFragment>
    with AutomaticKeepAliveClientMixin {
  SubListController get controller => widget.controller;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AppBarScrollNotifier(
      child: Obx(() => CupertinoScrollbar(
            controller: controller.scrollController,
            child: SmartRefresher(
              controller: controller.refreshController,
              enablePullDown: false,
              enablePullUp: !controller.state.isRefresh,
              onLoading: () => controller.onLoadMore(),
              footer: LoadMoreFooter(
                hasToolBar: widget.hasToolBar,
              ),
              child: CustomScrollView(
                controller: controller.scrollController,
                cacheExtent: 300,
                physics: (controller.state.isRefresh ||
                            controller.state.isLoading) &&
                        controller.items.isEmpty
                    ? const NeverScrollableScrollPhysics()
                    : null,
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
          )),
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
    return Obx(() {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            if (index.isOdd) {
              return const ImageListDivider();
            }
            final ListItemModel model = controller.items.toList()[index ~/ 2]!;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: ListExtendedCard(
                model: model.previewModel,
                concurrency: controller.previewConcurrency,
                onTap: () {
                  if (model.idCode?.isEmpty == true) {
                    BotToast.showText(text: '跳转目标为空');
                    return;
                  }
                  NavigatorService.push(
                    targetName: (controller.blueprint.template as TemplateList)
                        .targetItem
                        .value,
                    envModel: SiteEnvStore({
                      'idCode': model.idCode ?? '',
                    }),
                    model: model,
                  );
                },
              ),
            );
          },
          childCount: controller.items.length * 2,
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
