import 'package:catweb/data/constant.dart';
import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/ui/components/grey_tab_indicator.dart';
import 'package:catweb/ui/components/tab_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

class ViewerListFragment extends StatelessWidget {
  const ViewerListFragment({
    Key? key,
    required this.model,
  }) : super(key: key);

  final SitePageModel model;

  @override
  Widget build(BuildContext context) {
    final widget = DefaultTabController(
      length: 3,
      child: CupertinoPageScaffold(
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [_buildAppbar(context)];
          },
          body: TabBarView(
            children: [
              Container(),
              Container(),
              Container(),
            ],
          ),
        ),
      ),
    );

    return widget;
  }

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
}
