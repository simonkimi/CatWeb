import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:catweb/data/constant.dart';

class LoadMoreFooter extends StatelessWidget {
  const LoadMoreFooter({
    Key? key,
    this.hasToolBar = false,
  }) : super(key: key);

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
                const Text('不要停下来啊!', style: TextStyle(fontSize: 15)),
              ],
            );
          case LoadStatus.loading:
            return SizedBox(
              height: kBottomBarHeight,
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
          case LoadStatus.noMore:
            return const SizedBox(
              height: kBottomBarHeight,
              child: Center(
                child: Text('真的一点也没有了...', style: TextStyle(fontSize: 15)),
              ),
            );
          case LoadStatus.failed:
            return const SizedBox(
              height: kBottomBarHeight,
              child: Center(
                child: Text('加载失败, 请重试', style: TextStyle(fontSize: 15)),
              ),
            );
        }
      },
    );
  }
}
