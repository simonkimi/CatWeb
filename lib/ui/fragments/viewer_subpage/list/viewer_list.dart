import 'dart:ui';
import 'package:catweb/data/constant.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/theme/colors.dart';
import 'package:catweb/ui/components/grey_tab_indicator.dart';
import 'package:catweb/ui/components/simple_sliver.dart';
import 'package:catweb/ui/components/tab_bar.dart';
import 'package:catweb/ui/fragments/viewer_subpage/list/subpage_controller.dart';
import 'package:catweb/ui/fragments/viewer_subpage/list/subpage_list.dart';
import 'package:catweb/ui/pages/rules_manager/rules_manager/rules_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:catweb/utils/utils.dart';

class ViewerListFragment extends StatefulWidget {
  const ViewerListFragment({
    Key? key,
    required this.model,
    this.hasTabBar = false,
  }) : super(key: key);

  final SitePageModel model;
  final bool hasTabBar;

  @override
  _ViewerListFragmentState createState() => _ViewerListFragmentState();
}

class _ViewerListFragmentState extends State<ViewerListFragment>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  late final model = widget.model;

  bool get useSingleWidget =>
      model.subPages.isEmpty || model.subPages.length == 1;

  late List<SubListController> subListController;

  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    print('ViewerListFragment<${model.name.string}> 初始化');
    tabController = TabController(length: model.subPages.length, vsync: this);

    if (useSingleWidget) {
      subListController = [
        SubListController(model: model, subPageModel: model.subPages.index(0))
      ];
    } else {
      subListController = model.subPages
          .map((e) => SubListController(model: model, subPageModel: e))
          .toList();
    }

    tabController.addListener(() {
      subListController[tabController.index].requestFirstLoad();
    });
    subListController.first.requestFirstLoad();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CupertinoPageScaffold(
      child: useSingleWidget
          ? _buildSingleViewer(context)
          : _buildMultiViewer(context),
    );
  }

  Widget _buildMultiViewer(BuildContext context) {
    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [_buildAppbar(context)];
      },
      body: TabBarView(
        controller: tabController,
        children: subListController.map((e) {
          return SubPageListFragment(
            controller: e,
            hasTabBar: widget.hasTabBar,
          );
        }).toList(),
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
        controller: subListController.first,
        hasTabBar: widget.hasTabBar,
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
              backgroundColor:
                  FixColor.navigationBarBackground.resolveFrom(context),
              middle: Text(model.name.string),
              border: useSingleWidget
                  ? const Border(
                      bottom: BorderSide(
                        color: Color(0x4D000000),
                        width: 0.0, // 0.0 means one physical pixel
                      ),
                    )
                  : null,
              leading: CupertinoButton(
                minSize: 0,
                padding: EdgeInsets.zero,
                child: const Icon(Icons.menu),
                onPressed: () => Get.to(() => const SiteManager()),
              ),
            ),
          ),
          if (!useSingleWidget)
            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5.0,
                  sigmaY: 5.0,
                ),
                child: Material(
                  color: FixColor.navigationBarBackground.resolveFrom(context),
                  child: TabBar(
                    controller: tabController,
                    dragStartBehavior: DragStartBehavior.start,
                    isScrollable: true,
                    indicator: const GreyUnderlineTabIndicator(),
                    tabs: model.subPages
                        .map((e) => CupertinoTab(e.name.string.globalEnv()))
                        .toList(),
                  ),
                ),
              ),
            ),
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

  @override
  bool get wantKeepAlive => true;
}
