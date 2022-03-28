import 'package:catweb/data/constant.dart';
import 'package:catweb/ui/theme/colors.dart';
import 'package:flutter/cupertino.dart';

import 'cupertino_divider.dart';

class ExceptionSliver extends StatelessWidget {
  const ExceptionSliver({
    Key? key,
    this.errMsg,
    this.onRetry,
  }) : super(key: key);

  final String? errMsg;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: GestureDetector(
        onTap: onRetry,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Icon(CupertinoIcons.cloud_snow, size: 40),
              ),
              if (errMsg != null)
                Text(
                  errMsg!,
                  style: TextStyle(
                    color: FixColor.title.resolveFrom(context),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoadingSliver extends StatelessWidget {
  const LoadingSliver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverFillRemaining(
      child: Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}

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

class SliverPullToRefresh extends StatelessWidget {
  const SliverPullToRefresh({
    Key? key,
    this.onRefresh,
    this.extraHeight = 0,
  }) : super(key: key);

  final RefreshCallback? onRefresh;
  final double extraHeight;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top +
            kCupertinoNavigatorBar +
            extraHeight +
            5,
      ),
      sliver: CupertinoSliverRefreshControl(
        refreshIndicatorExtent: 50,
        refreshTriggerPullDistance: 100,
        onRefresh: () async {
          if (onRefresh != null) {
            await onRefresh!();
          }
        },
      ),
    );
  }
}

class SliverChildDividerBuilderDelegate extends SliverChildBuilderDelegate {
  SliverChildDividerBuilderDelegate({
    required NullableIndexedWidgetBuilder builder,
    required this.itemCount,
    this.divider,
  }) : super(builder, childCount: itemCount * 2 - 1);

  final Widget? divider;
  final int itemCount;

  @override
  Widget? build(BuildContext context, int index) {
    if (index.isOdd) {
      return divider ??
          const Padding(
            padding: EdgeInsets.only(
              right: 5,
              left: 124,
              // left: 5,
            ),
            child: CupertinoDivider(height: 5),
          );
    }
    if (index ~/ 2 >= itemCount) {
      return null;
    }
    return super.builder(context, index ~/ 2);
  }
}
