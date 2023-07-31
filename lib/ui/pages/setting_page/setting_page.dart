import 'package:catweb/data/constant.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/widgets/cupertino_app_bar.dart';
import 'package:catweb/ui/pages/setting_page/setting_subpage/display_setting.dart';
import 'package:catweb/ui/pages/setting_page/setting_subpage/security_setting.dart';
import 'package:catweb/ui/pages/setting_page/widgets/setting_tile.dart';
import 'package:catweb/ui/widgets/setting_group.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      child: CupertinoScrollbar(
        child: CustomScrollView(
          slivers: [
            CupertinoSliverNavigationBar(
              padding: kAppbarPadding,
              largeTitle: Text(I.of(context).setting)
            ),

            SliverToBoxAdapter(
              child: CupertinoListSection.insetGrouped(
                children: [
                  SettingTile(
                    title: I.of(context).display,
                    color: CupertinoColors.systemBlue.resolveFrom(context),
                    icon: CupertinoIcons.book,
                    onTap: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => const DisplaySettingPage()));
                    },
                  ),
                  SettingTile(
                    title: I.of(context).download,
                    color: CupertinoColors.systemGreen.resolveFrom(context),
                    icon: CupertinoIcons.cloud_download,
                  ),
                  SettingTile(
                    title: I.of(context).security,
                    color: CupertinoColors.systemRed.resolveFrom(context),
                    icon: CupertinoIcons.lock,
                    onTap: () => Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => const SecuritySettingPage())),
                  ),
                  SettingTile(
                    title: I.of(context).advanced,
                    color: CupertinoColors.systemTeal.resolveFrom(context),
                    icon: CupertinoIcons.chevron_left_slash_chevron_right,
                  ),
                  SettingTile(
                    title: I.of(context).about,
                    color: CupertinoColors.systemBlue.resolveFrom(context),
                    icon: CupertinoIcons.info,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
