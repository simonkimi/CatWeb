import 'package:bot_toast/bot_toast.dart';
import 'package:catweb/data/constant.dart';
import 'package:catweb/data/models/page_loader_state.dart';
import 'package:catweb/ui/pages/view_page/list/notifier/subpage_notifier.dart';
import 'package:catweb/ui/widgets/cupertino_app_bar.dart';
import 'package:catweb/ui/widgets/cupertino_divider.dart';
import 'package:catweb/ui/widgets/load_more_footer.dart';
import 'package:catweb/ui/widgets/simple_sliver.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'list_extended_card.dart';

class SubPageListFragment extends StatefulWidget {
  const SubPageListFragment({
    super.key,
    required this.hasTabBar,
    required this.hasToolBar,
    this.tabBarHeight,
  });

  final bool hasTabBar;
  final bool hasToolBar;
  final double? tabBarHeight;

  @override
  State<SubPageListFragment> createState() => _SubPageListFragmentState();
}

class _SubPageListFragmentState extends State<SubPageListFragment>
    with AutomaticKeepAliveClientMixin {
  SubListNotifier get notifier => context.read();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AppBarScrollNotifier(
      child: CupertinoScrollbar(
        controller: notifier.scrollController,
        child: SmartRefresher(
          controller: notifier.refreshController,
          enablePullDown: false,
          enablePullUp: true,
          onLoading: notifier.loadNextPage,
          footer: LoadMoreFooter(
            hasToolBar: widget.hasToolBar,
          ),
          child: Selector<
              SubListNotifier,
              ({
                PageLoaderState state,
                Iterable<ListItemModel?> items,
              })>(
            selector: (_, notifier) => (
              state: notifier.state,
              items: notifier.items,
            ),
            builder: (_, value, __) {
              return CustomScrollView(
                controller: notifier.scrollController,
                cacheExtent: 300,
                physics: (value.state.isLoading && value.items.isEmpty)
                    ? const NeverScrollableScrollPhysics()
                    : null,
                slivers: [
                  SliverPullToRefresh(
                    onRefresh: () => notifier.refresh(),
                    extraHeight: widget.hasTabBar
                        ? widget.tabBarHeight ?? kCupertinoTabBarHeight
                        : 0,
                  ),
                  _buildBody(context),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Selector<
        SubListNotifier,
        ({
          PageLoaderState state,
          Iterable<ListItemModel?> items,
        })>(
      selector: (_, n) => (state: n.state, items: n.items),
      builder: (_, value, __) {
        return switch (value.state) {
          PageLoaderState.loading when value.items.isEmpty =>
            const LoadingSliver(),
          PageLoaderStateError(:final error) when value.items.isEmpty =>
            ExceptionSliver(errMsg: error.toString()),
          _ => _buildSliverList(context)
        };
      },
    );
  }

  Widget _buildSliverList(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (index.isOdd) {
            return const ImageListDivider();
          }
          final ListItemModel model = notifier.items.toList()[index ~/ 2]!;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: ListExtendedCard(
              model: model.previewModel,
              queue: notifier.previewConcurrency,
              onTap: () {
                if (model.idCode?.isEmpty == true) {
                  BotToast.showText(text: '跳转目标为空');
                  return;
                }
                // TODO 跳转到详情界面
                // NavigatorNotifier.push(
                //   targetName: (controller.siteRule.template as TemplateList)
                //       .targetItem
                //       .value,
                //   envModel: SiteEnvStore({
                //     'idCode': model.idCode ?? '',
                //   }),
                //   model: model,
                // );
              },
            ),
          );
        },
        childCount: notifier.items.length * 2,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
