import 'package:catweb/data/constant.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/ui/components/cupertino_app_bar.dart';
import 'package:catweb/ui/components/simple_sliver.dart';
import 'package:catweb/ui/pages/view_page/viewer_subpage/list/subpage_controller.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../viewer_main.dart';
import 'list_extended_card.dart';

class SubPageListFragment extends StatefulWidget {
  const SubPageListFragment({
    Key? key,
    required this.controller,
    required this.hasTabBar,
    required this.hasToolBar,
  }) : super(key: key);

  final SubListController controller;
  final bool hasTabBar;
  final bool hasToolBar;

  @override
  _SubPageListFragmentState createState() => _SubPageListFragmentState();
}

class _SubPageListFragmentState extends State<SubPageListFragment>
    with AutomaticKeepAliveClientMixin {
  late final controller = widget.controller;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AppBarScrollNotifier(
      child: SmartRefresher(
        controller: controller.refreshController,
        enablePullDown: false,
        enablePullUp: true,
        onLoading: () => controller.onLoadMore(),
        footer: _buildIndicator(context),
        child: CustomScrollView(
          slivers: [
            _buildPullRefresh(context),
            _buildBody(context),
          ],
        ),
      ),
    );
  }

  Widget _buildPullRefresh(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top +
              kCupertinoNavigatorBar +
              (widget.hasTabBar ? kCupertinoTabBarHeight : 0.0)),
      sliver: CupertinoSliverRefreshControl(
        refreshIndicatorExtent: 50,
        onRefresh: () async {
          controller.onRefresh();
        },
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
            return ListExtendedCard(
              model: model,
              onTap: () {
                pushNewPage(
                  to: controller.model.listItemTarget,
                  envModel: SiteEnvModel(model.env),
                  model: model,
                );
              },
            );
          },
          childCount: controller.items.length,
        ),
      );
    });
  }

  Widget _buildIndicator(BuildContext context) {
    return CustomFooter(
      height: 50 + (widget.hasToolBar ? kBottomBarHeight : 0),
      builder: _buildFootState,
    );
  }

  Widget _buildFootState(BuildContext context, LoadStatus? state) {
    switch (state) {
      case null:
      case LoadStatus.canLoading:
      case LoadStatus.idle:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.arrow_down,
              size: 18,
              color: CupertinoColors.label.resolveFrom(context),
            ),
            const SizedBox(width: 10),
            const Text('不要停下来啊!', style: TextStyle(fontSize: 15)),
          ],
        );
      case LoadStatus.loading:
        return SizedBox(
          height: kBottomBarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              CupertinoActivityIndicator(),
              SizedBox(width: 10),
              Text('努力加载中...', style: TextStyle(fontSize: 15)),
            ],
          ),
        );
      case LoadStatus.noMore:
        return const SizedBox(
          height: kBottomBarHeight,
          child: Center(
            child: Text('真的一点也没有了...', style: TextStyle(fontSize: 15)),
          ),
        );
      case LoadStatus.failed:
        return SizedBox(
          height: kBottomBarHeight,
          child: Center(
            child: Text(controller.errorMessage ?? '',
                style: const TextStyle(fontSize: 15)),
          ),
        );
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
