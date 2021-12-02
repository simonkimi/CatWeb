import 'package:catweb/ui/pages/rules_manager/rules_manager/rules_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  static const routeName = 'MainPage';

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: true,
      navigationBar: CupertinoNavigationBar(
        middle: const Text('CatWeb'),
        leading: CupertinoButton(
          onPressed: () {},
          child: const Icon(CupertinoIcons.layers_alt),
          padding: EdgeInsets.zero,
          minSize: 0,
        ),
      ),
      child: SafeArea(
        child: emptyWidget(context),
      ),
    );
  }

  Stack emptyWidget(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: CupertinoButton(
            onPressed: () {
              Get.to(() => const SiteManager());
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(
                  CupertinoIcons.add,
                  color: CupertinoColors.activeBlue,
                ),
                SizedBox(width: 5),
                Text(
                  '添加站点',
                  style: TextStyle(
                    color: CupertinoColors.activeBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                )
              ],
            ),
            color: CupertinoColors.systemGrey6,
          ),
        ),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              SizedBox(height: 100),
              Text(
                '没有找到任何站点',
                style: TextStyle(
                  fontSize: 12,
                  color: CupertinoColors.systemGrey,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
