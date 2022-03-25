import 'package:catweb/data/controller/site_controller.dart';
import 'package:catweb/data/database/database.dart';
import 'package:catweb/gen/protobuf/store.pbserver.dart';
import 'package:catweb/test/site/eh/eh_rules.dart' as eh;
import 'package:catweb/ui/components/cupertino_list_tile.dart';
import 'package:catweb/ui/components/cupertino_router.dart';
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
    final siteController = Get.find<GlobalController>();
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
                      return _buildListView(snapshot, siteController, context);
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
                  onPressed: () => _toEditPage(context, pb: null, db: null),
                ),
                CupertinoButton(
                  child: const Icon(CupertinoIcons.qrcode),
                  onPressed: () {},
                ),
                CupertinoButton(
                  child: const Icon(CupertinoIcons.settings),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSiteItem(BuildContext context, WebTableData e) {
    final siteController = Get.find<GlobalController>();
    final pb = SiteBlueprint.fromBuffer(e.blueprint);
    return Obx(() => CupertinoListTile(
          selected: siteController.id == e.id,
          title: Text(pb.name),
          subtitle: Text(pb.baseUrl),
          trailing: const Icon(Icons.more_horiz),
          onTrailingTap: () => _onTrailingTap(context, e, pb),
          onTap: () => siteController.setNewSite(
            siteController.id == e.id ? null : e,
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
        child: const Icon(CupertinoIcons.back),
        padding: EdgeInsets.zero,
        minSize: 0,
      ),
      middle: const Text('站点管理'),
    );
  }

  Future<void> _onTrailingTap(
    BuildContext context,
    WebTableData db,
    SiteBlueprint pb,
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
        await _toEditPage(context, pb: pb, db: db);
        break;
      case _MenuSelect.delete:
        if (await showCupertinoConfirmDialog(
              context: context,
              content: '确定要删除 ${pb.name} 吗？',
              title: '取消',
              showCancel: true,
            ) ==
            true) {
          DB().webDao.remove(db);
        }
        break;
    }
  }

  Future<void> _toEditPage(
    BuildContext context, {
    SiteBlueprint? pb,
    WebTableData? db,
  }) async {
    Navigator.of(context).push(CupertinoWithModalsPageRoute(
        builder: (context) => RulesEditPage(pb: pb ?? eh.ehTestSite, db: db)));
  }
}
