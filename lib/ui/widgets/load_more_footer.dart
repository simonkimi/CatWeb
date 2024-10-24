import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:catweb/data/constant.dart';

class LoadMoreFooter extends StatelessWidget {
  const LoadMoreFooter({
    super.key,
    this.hasToolBar = false,
  });

  final bool hasToolBar;

  @override
  Widget build(BuildContext context) {
    return CustomFooter(
      height: 50 + (hasToolBar ? kBottomBarHeight : 0),
      builder: (BuildContext context, LoadStatus? state) {
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
                Text(
                  '不要停下来啊!',
                  style: TextStyle(
                    fontSize: 15,
                    color: CupertinoColors.label.resolveFrom(context),
                  ),
                ),
              ],
            );
          case LoadStatus.loading:
            return SizedBox(
              height: kBottomBarHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CupertinoActivityIndicator(),
                  const SizedBox(width: 10),
                  Text(
                    '努力加载中...',
                    style: TextStyle(
                      fontSize: 15,
                      color: CupertinoColors.label.resolveFrom(context),
                    ),
                  ),
                ],
              ),
            );
          case LoadStatus.noMore:
            return SizedBox(
              height: kBottomBarHeight,
              child: Center(
                child: Text(
                  '真的一点也没有了...',
                  style: TextStyle(
                    fontSize: 15,
                    color: CupertinoColors.label.resolveFrom(context),
                  ),
                ),
              ),
            );
          case LoadStatus.failed:
            return SizedBox(
              height: kBottomBarHeight,
              child: Center(
                child: Text(
                  '加载失败, 请重试',
                  style: TextStyle(
                    fontSize: 15,
                    color: CupertinoColors.label.resolveFrom(context),
                  ),
                ),
              ),
            );
        }
      },
    );
  }
}
