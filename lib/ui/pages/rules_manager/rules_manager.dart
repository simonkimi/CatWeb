import 'package:catweb/ui/components/cupertino_list_tile.dart';
import 'package:catweb/ui/pages/rules_manager/rules_edit_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SiteManager extends StatelessWidget {
  const SiteManager({Key? key}) : super(key: key);

  static const routeName = 'SiteManager';

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: buildAppbar(context),
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListView(
              children: [
                CupertinoListTile(
                  selected: true,
                  title: const Text('EHentai'),
                  subtitle: const Text('https://e-hentai.org'),
                  trailing: const Icon(Icons.more_horiz),
                  onTap: () {},
                ),
                const SizedBox(height: 50),
                CupertinoListTile(
                  leading: const Icon(CupertinoIcons.add_circled_solid),
                  title: const Text('编写一个规则'),
                  trailing: const Icon(CupertinoIcons.forward),
                  onTap: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => RulesEditPage()));
                  },
                ),
                const SizedBox(height: 5),
                CupertinoListTile(
                  leading: const Icon(CupertinoIcons.qrcode_viewfinder),
                  title: const Text('扫码获取规则'),
                  trailing: const Icon(CupertinoIcons.forward),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  CupertinoNavigationBar buildAppbar(BuildContext context) {
    return CupertinoNavigationBar(
      leading: CupertinoButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Icon(CupertinoIcons.back),
        padding: EdgeInsets.zero,
        minSize: 0,
      ),
      middle: const Text('站点管理'),
    );
  }
}
