import 'package:catweb/data/constant.dart';
import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/ui/components/cupertino_list_tile.dart';
import 'package:catweb/ui/components/simple_sliver.dart';
import 'package:catweb/ui/fragments/viewer_subpage/list/subpage_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SubPageListFragment extends StatelessWidget {
  SubPageListFragment({
    Key? key,
    required SitePageModel model,
    SubPageModel? subPageModel,
  })  : controller = SubListController(
          model: model,
          subPageModel: subPageModel,
        ),
        super(key: key);

  final SubListController controller;

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: controller.refreshController,
      enablePullDown: false,
      enablePullUp: true,
      footer: _buildIndicator(context),
      child: CustomScrollView(
        slivers: [
          _buildPullRefresh(context),
          _buildBody(context),
        ],
      ),
    );
  }

  Widget _buildPullRefresh(BuildContext context) {
    return CupertinoSliverRefreshControl(
      refreshIndicatorExtent: 50,
      onRefresh: () async {
        controller.onRefresh();
      },
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
        delegate: SliverChildBuilderDelegate((context, index) {
          return CupertinoListTile(
            selected: true,
            // selectedColor: controller.items[index],
            title: Text(controller.items[index].toString()),
          );
        }, childCount: controller.items.length),
      );
    });
  }

  Widget _buildIndicator(BuildContext context) {
    return CustomFooter(builder: (context, state) {
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
            height: kNavigatorBarHeight,
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
            height: kNavigatorBarHeight,
            child: Center(
              child: Text('真的一点也没有了...', style: TextStyle(fontSize: 15)),
            ),
          );
        case LoadStatus.failed:
          return SizedBox(
            height: kNavigatorBarHeight,
            child: Center(
              child: Text(controller.errorMessage ?? '',
                  style: const TextStyle(fontSize: 15)),
            ),
          );
      }
    });
  }
}
