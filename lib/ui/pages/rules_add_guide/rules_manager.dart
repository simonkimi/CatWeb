import 'package:bot_toast/bot_toast.dart';
import 'package:catweb/data/controller/setting_controller.dart';
import 'package:catweb/data/controller/site_controller.dart';
import 'package:catweb/data/database/database.dart';
import 'package:catweb/gen/protobuf/store.pbserver.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/test/site/eh/eh_rules.dart' as eh;
import 'package:catweb/ui/widgets/cupertino_list_tile.dart';
import 'package:catweb/ui/widgets/cupertino_router.dart';
import 'package:catweb/ui/widgets/dialog.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_add_page.dart';
import 'package:catweb/ui/pages/setting_page/setting_page.dart';
import 'package:catweb/ui/pages/webview_login_in/webview_login_in.dart';
import 'package:catweb/utils/debug.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

enum _MenuSelect {
  edit,
  share,
  delete,
  login,
}

class SiteManager extends GetWidget<GlobalController> {
  const SiteManager({super.key});

  static const routeName = 'SiteManager';

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: _buildAppbar(context),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: StreamBuilder<List<WebTableData>>(
                    initialData: const [],
                    stream: DB().webDao.getAllStream(),
                    builder: (context, snapshot) {
                      return _buildListView(snapshot, controller, context);
                    },
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CupertinoButton(
                  child: const Icon(CupertinoIcons.add),
                  onPressed: () =>
                      _toEditPage(Navigator.of(context), pb: null, db: null),
                ),
                CupertinoButton(
                  child: const Icon(CupertinoIcons.qrcode_viewfinder),
                  onPressed: () {},
                ),
                CupertinoButton(
                  child: const Icon(CupertinoIcons.settings),
                  onPressed: () {
                    Navigator.of(context).push(CupertinoWithModalsPageRoute(
                        builder: (context) => const SettingsPage()));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSiteItem(BuildContext context, WebTableData e) {
    final pb = SiteBlueprint.fromBuffer(e.blueprint);
    return Obx(() => CupertinoListTile(
          selected: controller.id == e.id,
          title: Text(pb.name),
          subtitle: Text(pb.baseUrl),
          trailing: const Icon(Icons.more_horiz),
          // leading: Center(
          //   child: SizedBox(
          //     width: 20,
          //     height: 20,
          //     child: Image.asset(
          //       'assets/images/gelbooru.ico',
          //       fit: BoxFit.fill,
          //     ),
          //   ),
          // ),
          onTrailingTap: () => _onTrailingTap(context, e, pb),
          onTap: () => controller.setNewSite(
            controller.id == e.id ? null : e,
          ),
        ));
  }

  Widget _buildListView(
    AsyncSnapshot<List<WebTableData>> snapshot,
    GlobalController globalController,
    BuildContext context,
  ) {
    if (snapshot.data!.isEmpty) {
      return const Center(
        child: Text('没有找到站点, 请点击下面的按钮添加'),
      );
    }
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        ...snapshot.data!.map((e) => _buildSiteItem(context, e)),
      ],
    );
  }

  CupertinoNavigationBar _buildAppbar(BuildContext context) {
    return CupertinoNavigationBar(
      padding: const EdgeInsetsDirectional.only(start: 10),
      leading: CupertinoButton(
        onPressed: () => Get.back(),
        padding: EdgeInsets.zero,
        minSize: 0,
        child: const Icon(CupertinoIcons.back),
      ),
      middle: const Text('站点管理'),
    );
  }

  Future<void> _onTrailingTap(
    BuildContext context,
    WebTableData db,
    SiteBlueprint pb,
  ) async {
    final navigator = Navigator.of(context);
    final result = await showCupertinoSelectDialog<_MenuSelect>(
      cancelText: I.of(context).cancel,
      context: context,
      items: [
        SelectTileItem(title: I.of(context).edit, value: _MenuSelect.edit),
        const SelectTileItem(title: '分享', value: _MenuSelect.share),
        SelectTileItem(
            title: db.loginCookies.isNotEmpty
                ? I.of(context).logout
                : I.of(context).login,
            value: _MenuSelect.login),
        SelectTileItem(
          title: I.of(context).delete,
          value: _MenuSelect.delete,
          destructive: true,
        ),
      ],
    );
    switch (result) {
      case null:
      case _MenuSelect.share:
        return _share();
      case _MenuSelect.edit:
        return _toEditPage(navigator, pb: pb, db: db);
      case _MenuSelect.delete:
        return _onDelete(context, db, pb);
      case _MenuSelect.login:
        return _loginIn(context, db, pb);
    }
  }

  Future<void> _loginIn(
    BuildContext context,
    WebTableData db,
    SiteBlueprint pb,
  ) async {
    if (db.loginCookies.isNotEmpty) {
      // 注销登录
      final isReload = await showCupertinoConfirmDialog(
        context: context,
        title: I.of(context).logout,
        content: I.of(context).logout_check,
      );
      if (isReload == true) {
        await DB().webDao.replace(db.copyWith(loginCookies: ''));
        Get.back();
      }
    } else {
      // 登录
      if (Uri.tryParse(pb.baseUrl)?.host != Uri.tryParse(pb.loginUrl)?.host) {
        if (!Get.find<SettingController>().protectCookie.value ||
            !db.securityModel) {
          final w = await showCupertinoConfirmDialog(
            context: context,
            title: I.of(context).login,
            content:
                I.of(context).login_without_security(pb.loginCookieDescription),
          );
          if (w == false) {
            return;
          }
        } else {
          final w = await showCupertinoConfirmDialog(
            context: context,
            title: I.of(context).login,
            content: I.of(context).login_with_security,
          );
          if (w == false) {
            return;
          }
        }
      }

      final List<Cookie>? cookies = await Navigator.of(context).push(
        CupertinoPageRoute(
          builder: (context) => WebViewLoginIn(
            url: pb.loginUrl,
          ),
        ),
      );

      if (cookies != null) {
        final cookieStr = cookies.map((e) => '${e.name}=${e.value}').join('; ');
        await DB().webDao.replace(db.copyWith(loginCookies: cookieStr));
        BotToast.showText(text: I.of(context).login_success);
        logger.i('Login success, cookies: $cookieStr');
      }
    }
  }

  Future<void> _share() async {}

  Future<void> _onDelete(
      BuildContext context, WebTableData db, SiteBlueprint pb) async {
    if (await showCupertinoConfirmDialog(
          context: context,
          content: I.of(context).delete_confirm(pb.name),
          title: I.of(context).delete,
          confineText: I.of(context).delete,
          confineTextColor: CupertinoColors.systemRed.resolveFrom(context),
        ) ==
        true) {
      DB().webDao.remove(db);
    }
  }

  void _toEditPage(
    NavigatorState navigator, {
    SiteBlueprint? pb,
    WebTableData? db,
  }) =>
      navigator.push(CupertinoWithModalsPageRoute(
          builder: (context) =>
              RulesEditPage(pb: pb ?? eh.ehTestSite, db: db)));
}
