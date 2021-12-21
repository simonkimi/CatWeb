import 'package:catweb/ui/components/cupertino_list_tile.dart';
import 'package:catweb/ui/components/sliver/persistent_header_builder.dart';
import 'package:catweb/ui/components/sliver/simple_sliver.dart';
import 'package:catweb/ui/components/sliver/sliver_persistent_header.dart';
import 'package:catweb/ui/fragments/viewer_subpage/test/test_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TestFragment extends GetWidget<TestController> {
  const TestFragment({Key? key}) : super(key: key);

  Widget _buildNavigationBar(BuildContext context) {
    return const CupertinoNavigationBar(
      middle: Text('Test'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final navigationBar = _buildNavigationBar(context);

    return CupertinoPageScaffold(
      child: CupertinoScrollbar(
        child: CustomScrollView(
          slivers: [
            SliverFloatingPinnedPersistentHeader(
              delegate: SliverFloatingPinnedPersistentHeaderBuilder(
                minExtentProtoType: SizedBox(
                  height: MediaQuery.of(context).padding.top,
                ),
                maxExtentProtoType: navigationBar,
                builder: (context, offset, maxExtent) => navigationBar,
              ),
            ),
            CupertinoSliverRefreshControl(
              refreshIndicatorExtent: 50,
              onRefresh: () => controller.onRefresh(),
            ),
            _buildBody(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Obx(() {
      if (controller.items.isEmpty && controller.isLoading) {
        return const LoadingSliver();
      } else if (controller.items.isEmpty && controller.errorMessage != null) {
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
            key: UniqueKey(),
            selected: true,
            selectedColor: controller.items[index],
            title: Text(controller.items[index].toString()),
          );
        }, childCount: controller.items.length),
      );
    });
  }
}
