import 'package:catweb/data/constant.dart';
import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/ui/components/grey_tab_indicator.dart';
import 'package:catweb/ui/components/tab_bar.dart';
import 'package:catweb/ui/fragments/viewer_subpage/list/subpage_list.dart';
import 'package:catweb/ui/pages/rules_manager/rules_manager/rules_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:catweb/utils/utils.dart';

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

  bool get useSingleWidget =>
      model.subPages.isEmpty || model.subPages.length == 1;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: useSingleWidget
          ? _buildSingleViewer(context)
          : _buildMultiViewer(context),
    );
  }

  Widget _buildMultiViewer(BuildContext context) {
    return DefaultTabController(
      length: model.subPages.length,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [_buildAppbar(context)];
        },
        body: TabBarView(
          children: model.subPages
              .map((e) => SubPageListFragment(
                    model: model,
                    subPageModel: e,
                  ))
              .toList(),
        ),
      ),
    );
  }

  Widget _buildSingleViewer(BuildContext context) {
    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [_buildAppbar(context)];
      },
      body: SubPageListFragment(
        model: model,
        subPageModel: model.subPages.index(0),
      ),
    );
  }

  Widget _buildNavigationBar(
      BuildContext context, double offset, double maxExtent) {
    return SizedBox(
      height: maxExtent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: CupertinoNavigationBar(
              padding: const EdgeInsetsDirectional.only(start: 10),
              middle: Text(model.name.string),
              border: const Border(),
              leading: CupertinoButton(
                minSize: 0,
                padding: EdgeInsets.zero,
                child: const Icon(Icons.menu),
                onPressed: () => Get.to(const SiteManager()),
              ),
            ),
          ),
          if (!useSingleWidget)
            Material(
              child: TabBar(
                indicator: const GreyUnderlineTabIndicator(),
                tabs: model.subPages
                    .map((e) => CupertinoTab(e.name.string))
                    .toList(),
              ),
            )
        ],
      ),
    );
  }

  Widget _buildAppbar(BuildContext context) {
    final tabBarHeight = useSingleWidget ? 0.0 : kTabBarHeight;
    return SliverPersistentHeader(
      floating: true,
      pinned: true,
      delegate: FooSliverPersistentHeaderDelegate(
        builder: (context, offset, _) => _buildNavigationBar(
          context,
          offset,
          tabBarHeight +
              kNavigatorBarHeight +
              MediaQuery.of(context).padding.top,
        ),
        minHeight: MediaQuery.of(context).padding.top + tabBarHeight,
        maxHeight:
            tabBarHeight + context.mediaQueryPadding.top + kNavigatorBarHeight,
      ),
    );
  }
}
