import 'package:catweb/ui/pages/rules_add_guide/rules_add_page.dart';
import 'package:catweb/test/site/eh/eh_rules.dart' as eh;
import 'package:catweb/ui/pages/rules_add_guide/rules_manager.dart';
import 'package:catweb/ui/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class EmptyFragment extends StatelessWidget {
  const EmptyFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: true,
      navigationBar: CupertinoNavigationBar(
        middle: const Text('CatWeb'),
        leading: CupertinoButton(
          onPressed: () {
            showCupertinoModalBottomSheet(
              context: context,
              expand: true,
              builder: (context) => const SiteManager(),
            );
          },
          padding: EdgeInsets.zero,
          minSize: 0,
          child: const Icon(CupertinoIcons.layers_alt),
        ),
      ),
      child: SafeArea(
        child: _emptyWidget(context),
      ),
    );
  }

  Stack _emptyWidget(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: CupertinoButton(
            onPressed: () {
              // Get.to(() => const SiteManager());
              Get.to(() => RulesEditPage(pb: eh.ehTestSite));
            },
            color: FixColor.groupedColor,
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
