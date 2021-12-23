import 'package:catweb/data/controller/site_controller.dart';
import 'package:catweb/data/database/database.dart';
import 'package:catweb/gen/protobuf/store.pbserver.dart';
import 'package:catweb/test/test_model.dart' as eh;
import 'package:catweb/ui/components/cupertino_list_tile.dart';
import 'package:catweb/ui/components/dialog.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_add_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum _MenuSelect {
  edit,
  share,
  delete,
}

class SiteManager extends StatelessWidget {
  const SiteManager({Key? key}) : super(key: key);

  static const routeName = 'SiteManager';

  @override
  Widget build(BuildContext context) {
    final siteController = Get.find<SiteController>();
    return CupertinoPageScaffold(
      navigationBar: buildAppbar(context),
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: StreamBuilder<List<WebTableData>>(
              initialData: const [],
              stream: DB().webDao.getAllStream(),
              builder: (context, snapshot) {
                return buildListView(snapshot, siteController, context);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSiteItem(BuildContext context, WebTableData e) {
    final siteController = Get.find<SiteController>();
    final pb = SiteConfig.fromBuffer(e.bin);
    return Obx(() => CupertinoListTile(
          selected: siteController.id == e.id,
          title: Text(pb.name),
          subtitle: Text(pb.baseUrl),
          trailing: const Icon(Icons.more_horiz),
          onTrailingTap: () => onTrailingTap(context, e, pb),
          onTap: () => siteController.setNewSite(
            siteController.id == e.id ? null : e,
          ),
        ));
  }

  ListView buildListView(
    AsyncSnapshot<List<WebTableData>> snapshot,
    SiteController siteController,
    BuildContext context,
  ) {
    return ListView(
      children: [
        ...snapshot.data!.map((e) => buildSiteItem(context, e)),
        if (snapshot.data!.isNotEmpty) const SizedBox(height: 50),
        CupertinoListTile(
          leading: const Icon(CupertinoIcons.add_circled_solid),
          title: const Text('编写一个规则'),
          trailing: const Icon(CupertinoIcons.forward),
          onTap: () => toEditPage(null, null),
        ),
        const SizedBox(height: 5),
        CupertinoListTile(
          leading: const Icon(CupertinoIcons.qrcode_viewfinder),
          title: const Text('扫码获取规则'),
          trailing: const Icon(CupertinoIcons.forward),
          onTap: () {},
        ),
      ],
    );
  }

  CupertinoNavigationBar buildAppbar(BuildContext context) {
    return CupertinoNavigationBar(
      padding: const EdgeInsetsDirectional.only(start: 10),
      leading: CupertinoButton(
        onPressed: () => Get.back(),
        child: const Icon(CupertinoIcons.back),
        padding: EdgeInsets.zero,
        minSize: 0,
      ),
      middle: const Text('站点管理'),
    );
  }

  Future<void> onTrailingTap(
    BuildContext context,
    WebTableData db,
    SiteConfig pb,
  ) async {
    final result = await showCupertinoSelectDialog<_MenuSelect>(
      cancelText: '取消',
      context: context,
      items: const [
        SelectTileItem(title: '编辑', value: _MenuSelect.edit),
        SelectTileItem(title: '分享', value: _MenuSelect.share),
        SelectTileItem(
          title: '删除',
          value: _MenuSelect.delete,
          destructive: true,
        ),
      ],
    );
    switch (result) {
      case null:
      case _MenuSelect.share:
        // TODO 分享功能
        break;
      case _MenuSelect.edit:
        await toEditPage(pb, db);
        break;
      case _MenuSelect.delete:
        if (await showCupertinoConfirmDialog(
              context: context,
              content: '确定要删除 ${pb.name} 吗？',
              title: '取消',
            ) ==
            true) {
          DB().webDao.remove(db);
        }
        break;
    }
  }

  Future<void> toEditPage(SiteConfig? pb, WebTableData? db) async {
    await Get.to(() => RulesEditPage(pb: pb ?? eh.ehTestSite, db: db));
  }
}
