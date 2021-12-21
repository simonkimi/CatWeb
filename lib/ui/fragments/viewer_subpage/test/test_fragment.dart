import 'package:catweb/data/models/load_more_model.dart';
import 'package:catweb/ui/components/cupertino_list_tile.dart';
import 'package:catweb/ui/components/grey_tab_indicator.dart';
import 'package:catweb/ui/components/sliver/simple_sliver.dart';
import 'package:catweb/ui/components/tab_bar.dart';
import 'package:catweb/ui/fragments/viewer_subpage/test/test_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const kNavigatorBarHeight = 40.0;
const kTabBarHeight = 30.0;

class FooSliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  FooSliverPersistentHeaderDelegate({
    required this.builder,
    required this.maxHeight,
    required this.minHeight,
  });

  final double minHeight;
  final double maxHeight;

  final Function(
      BuildContext context, double shrinkOffset, bool overlapsContent) builder;

  @override
  Widget build(
          BuildContext context, double shrinkOffset, bool overlapsContent) =>
      builder(context, shrinkOffset, overlapsContent);

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return minHeight != oldDelegate.minExtent ||
        maxHeight != oldDelegate.maxExtent;
  }
}

class TestFragment extends GetWidget<TestController> {
  const TestFragment({Key? key}) : super(key: key);

  Widget _buildNavigationBar(
      BuildContext context, double offset, double maxExtent) {
    return SizedBox(
      height: maxExtent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Expanded(
            child: CupertinoNavigationBar(
              middle: Text('测试'),
              border: Border(),
            ),
          ),
          Material(
            child: TabBar(
              indicator: GreyUnderlineTabIndicator(),
              tabs: [
                CupertinoTab('测试1'),
                CupertinoTab('测试2'),
                CupertinoTab('测试3'),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final globalKey = GlobalKey<NestedScrollViewState>();

    final widget = DefaultTabController(
      length: 3,
      child: CupertinoPageScaffold(
        child: NestedScrollView(
          key: globalKey,
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [_buildAppbar(context)];
          },
          body: TabBarView(
            children: [
              CustomScrollView(
                slivers: [
                  _buildPullRefresh(context),
                  _buildBody(context),
                  _buildIndicator(context),
                ],
              ),
              Container(),
              Container(),
            ],
          ),
        ),
      ),
    );

    Future.delayed(0.seconds, () {
      final scrollController = globalKey.currentState?.innerController;
      scrollController?.addListener(() {
        final pixels = scrollController.position.pixels;
        final maxScrollExtent = scrollController.position.maxScrollExtent;
        if (pixels > maxScrollExtent + 50 && controller.canLoadMore) {
          controller.onLoadMore();
        }
      });
    });

    return widget;
  }

  Widget _buildAppbar(BuildContext context) {
    return SliverPersistentHeader(
      floating: true,
      pinned: true,
      delegate: FooSliverPersistentHeaderDelegate(
        builder: (context, offset, _) => _buildNavigationBar(
          context,
          offset,
          kTabBarHeight +
              kNavigatorBarHeight +
              MediaQuery.of(context).padding.top,
        ),
        minHeight: MediaQuery.of(context).padding.top + kTabBarHeight,
        maxHeight:
            kTabBarHeight + context.mediaQueryPadding.top + kNavigatorBarHeight,
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
            selectedColor: controller.items[index],
            title: Text(controller.items[index].toString()),
          );
        }, childCount: controller.items.length),
      );
    });
  }

  Widget _buildIndicator(BuildContext context) {
    return SliverToBoxAdapter(
      child: Obx(() {
        switch (controller.state) {
          case LoadMoreState.refreshing:
            return const SizedBox();
          case LoadMoreState.idle:
            return SizedBox(
              height: kNavigatorBarHeight,
              child: Row(
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
              ),
            );
          case LoadMoreState.loading:
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
          case LoadMoreState.noMoreData:
            return const SizedBox(
              height: kNavigatorBarHeight,
              child: Center(
                child: Text('真的一点也没有了...', style: TextStyle(fontSize: 15)),
              ),
            );
          case LoadMoreState.loadError:
            return SizedBox(
              height: kNavigatorBarHeight,
              child: Center(
                child: Text(controller.errorMessage ?? '',
                    style: const TextStyle(fontSize: 15)),
              ),
            );
        }
      }),
    );
  }
}
