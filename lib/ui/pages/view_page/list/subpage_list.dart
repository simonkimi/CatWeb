import 'dart:math' as math;

import 'package:bot_toast/bot_toast.dart';
import 'package:catweb/app.dart';
import 'package:catweb/data/constant.dart';
import 'package:catweb/data/loading/paged_loader.dart';
import 'package:catweb/data/models/subpage_models.dart';
import 'package:catweb/ui/pages/view_page/list/subpage_notifier.dart';
import 'package:catweb/ui/pages/view_page/viewer_subpage_scaffold.dart';
import 'package:catweb/ui/widgets/cupertino_app_bar.dart';
import 'package:catweb/ui/widgets/cupertino_divider.dart';
import 'package:catweb/ui/widgets/list_extended_card.dart';
import 'package:catweb/ui/widgets/load_more_footer.dart';
import 'package:catweb/ui/widgets/simple_sliver.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/rendering.dart' show ScrollCacheExtent;
import 'package:provider/provider.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class SubPageListFragment extends HookWidget {
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
  Widget build(BuildContext context) {
    useAutomaticKeepAlive(wantKeepAlive: true);
    final SubListNotifier notifier = context.read();
    return AppBarScrollNotifier(
      child: CupertinoScrollbar(
        controller: notifier.scrollController,
        child: SmartRefresher(
          controller: notifier.refreshController,
          enablePullDown: false,
          enablePullUp: true,
          onLoading: notifier.loadNextPage,
          footer: LoadMoreFooter(hasToolBar: hasToolBar),
          child:
              Selector<
                SubListNotifier,
                ({
                  PagedSnapshot<ListItemModel> state,
                  List<ListItemModel> items,
                })
              >(
                selector: (_, notifier) => (
                  state: notifier.pageSnapshot,
                  items: notifier.loadedItems.toList(),
                ),
                builder: (_, value, _) {
                  return CustomScrollView(
                    controller: notifier.scrollController,
                    scrollCacheExtent: const ScrollCacheExtent.pixels(300),
                    physics: (value.state.isLoading && value.items.isEmpty)
                        ? const NeverScrollableScrollPhysics()
                        : null,
                    slivers: [
                      SliverPullToRefresh(
                        onRefresh: () => notifier.refresh(),
                        extraHeight: hasTabBar
                            ? tabBarHeight ?? kCupertinoTabBarHeight
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
      ({PagedSnapshot<ListItemModel> state, List<ListItemModel> items})
    >(
      selector: (_, n) =>
          (state: n.pageSnapshot, items: n.loadedItems.toList()),
      builder: (_, value, _) {
        if (value.items.isEmpty && value.state.isLoading) {
          return const LoadingSliver();
        }
        if (value.items.isEmpty) {
          final failure = value.state.failure;
          if (failure != null) {
            return ExceptionSliver(errMsg: failure.error.toString());
          }
        }
        return _buildSliverList(context);
      },
    );
  }

  Widget _buildSliverList(BuildContext context) {
    final SubListNotifier notifier = context.read();
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        if (index.isOdd) {
          return const ImageListDivider();
        }
        final ListItemModel model = notifier.loadedItems.elementAt(index ~/ 2);
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: ListExtendedCard(
            model: model.previewModel,
            repository: notifier.previewRepository,
            onTap: () {
              final idCode = model.idCode;
              if (idCode == null || idCode.isEmpty) {
                BotToast.showText(text: '跳转目标为空');
                return;
              }
              final targetId = notifier.endpoint.links.item;
              if (targetId == null) {
                BotToast.showText(text: '列表端点未配置详情链接');
                return;
              }
              context.to(
                ViewerPage(
                  endpoint: notifier.website.endpoint(targetId),
                  website: notifier.website,
                  requestContext: notifier.requestContext.apply({
                    'idCode': idCode,
                  }),
                ),
              );
            },
          ),
        );
      }, childCount: math.max(0, notifier.pageSnapshot.loadedCount * 2 - 1)),
    );
  }
}
