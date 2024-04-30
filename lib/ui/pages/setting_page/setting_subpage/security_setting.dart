import 'dart:io';

import 'package:catweb/data/controller/settings.dart';
import 'package:catweb/get.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/widgets/cupertino_input.dart';
import 'package:catweb/ui/widgets/dialog.dart';
import 'package:catweb/ui/widgets/setting_group.dart';
import 'package:catweb/ui/pages/setting_page/widgets/setting_base.dart';
import 'package:catweb/ui/pages/setting_page/widgets/setting_tile.dart';
import 'package:flutter/cupertino.dart';

class SecuritySettingPage extends StatelessWidget {
  const SecuritySettingPage({
    super.key,
    this.fromSetting = true,
  });

  final bool fromSetting;

  SettingService get controller => inject();

  @override
  Widget build(BuildContext context) {
    return SettingScaffold(
      title: I.of(context).security,
      children: [
        CupertinoListSection.insetGrouped(
          children: [
            SettingTile(
              title: '切到后台后模糊',
              trailing: VnSwitchField(
                scale: 0.9,
                value: controller.blurWhenBackgroundNotifier,
                onChanged: (value) async {
                  if (Platform.isAndroid && value) {
                    showCupertinoConfirmDialog(
                      context: context,
                      title: '提示',
                      content: I.of(context).blur_android_warning,
                      showCancel: false,
                    );
                  }
                  return value;
                },
              ),
            ),
          ],
        ),
        CupertinoListSection.insetGrouped(
          header: const SettingGroupTitle('Cookie保护'),
          footer: const SettingGroupTitle(
              '安全模式将保护您登录令牌不被恶意规则窃取, 若您想为某规则单独关闭, 请前往网站设置'),
          children: [
            SettingTile(
              title: '启用安全模式',
              trailing: VnSwitchField(
                scale: 0.9,
                value: controller.protectCookieNotifier,
                onChanged: (value) async {
                  if (!value) {
                    return (await showCupertinoConfirmDialog(
                          context: context,
                          content: '此开关为全局安全模式开关, 若您想为莫规则单独关闭, 请前往设置主页',
                          confineText: '关闭',
                          confineTextColor:
                              CupertinoColors.systemRed.resolveFrom(context),
                        ) !=
                        true);
                  } else {
                    return value;
                  }
                },
              ),
            )
          ],
        ),
      ],
    );
  }

// SettingTile _buildSecuritySwitch(BuildContext context) {
//   return SettingTile(
//     title: '启用安全模式',
//     trailing: CupertinoObxSwitch(
//       scale: 0.9,
//       value: controller.protectCookie,
//       onChange: (value) async {
//         if (!value) {
//           return (await showCupertinoConfirmDialog(
//                 context: context,
//                 content: '此开关为全局安全模式开关, 若您想为莫规则单独关闭, 请前往设置主页',
//                 confineText: '关闭',
//                 confineTextColor:
//                     CupertinoColors.systemRed.resolveFrom(context),
//               ) !=
//               true);
//         } else {
//           return value;
//         }
//       },
//     ),
//   );
// }
}
