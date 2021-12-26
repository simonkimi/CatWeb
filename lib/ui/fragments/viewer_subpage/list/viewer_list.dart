import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/ui/components/cupertino_app_bar.dart';
import 'package:catweb/ui/components/tab_bar.dart';
import 'package:catweb/ui/fragments/viewer_subpage/list/subpage_controller.dart';
import 'package:catweb/ui/fragments/viewer_subpage/list/subpage_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    return CupertinoAppBar(
      title: model.name.string,
      tabs: model.subPages
          .map((e) => CupertinoTab(e.name.string.globalEnv()))
          .toList(),
      tabController: tabController,
      child: TabBarView(
        controller: tabController,
        children: subListController.map((e) {
          return SubPageListFragment(
            controller: e,
            hasTabBar: widget.hasTabBar,
            hasToolBar: !useSingleWidget,
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSingleViewer(BuildContext context) {
    return CupertinoAppBar(
      title: model.name.string,
      tabs: model.subPages
          .map((e) => CupertinoTab(e.name.string.globalEnv()))
          .toList(),
      child: SubPageListFragment(
        controller: subListController.first,
        hasTabBar: widget.hasTabBar,
        hasToolBar: !useSingleWidget,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
