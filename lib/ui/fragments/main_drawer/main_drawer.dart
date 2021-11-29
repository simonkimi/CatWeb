import 'package:catweb/data/database/database.dart';
import 'package:catweb/gen/protobuf/store.pbserver.dart';
import 'package:catweb/ui/pages/rules_manager/rules_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

class MainDrawer extends HookWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final showWebsiteList = useState(false);
    return Drawer(
      child: Column(
        children: [
          buildUserAccountHeader(context, showWebsiteList),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: showWebsiteList.value
                  ? buildWebsiteList(context)
                  : buildPageList(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPageList(BuildContext context) {
    return Column(
      key: UniqueKey(),
      children: [
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const [
              ListTile(
                leading: Icon(Icons.home),
                title: Text('主页'),
              ),
              ListTile(
                leading: Icon(Icons.local_fire_department),
                title: Text('热门'),
              ),
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text('收藏'),
              ),
            ],
          ),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.settings_outlined),
          title: const Text('设置'),
          onTap: () {
            Get.back();
            Navigator.of(context).pushNamed(SiteManager.routeName);
          },
        )
      ],
    );
  }

  Widget buildWebsiteList(BuildContext context) {
    return Column(
      key: UniqueKey(),
      children: [
        Expanded(
          child: StreamBuilder<List<SiteTableData>>(
            stream: DB().siteDao.getAllStream(),
            initialData: const [],
            builder: (context, snapshot) {
              return ListView(
                children: snapshot.data!.map((e) {
                  final entity = RulesProtocol.fromBuffer(e.bin);
                  return ListTile(
                    title: Text(entity.name),
                    subtitle: Text(entity.baseUrl),
                  );
                }).toList(),
              );
            },
          ),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.settings_outlined),
          title: const Text('站点管理'),
          onTap: () {
            Get.back();
            Navigator.of(context).pushNamed(SiteManager.routeName);
          },
        )
      ],
    );
  }

  Widget buildUserAccountHeader(
    BuildContext context,
    ValueNotifier<bool> showWebsiteList,
  ) {
    return StreamBuilder<List<SiteTableData>>(
      stream: DB().siteDao.getAllStream(),
      initialData: const [],
      builder: (context, snapshot) {
        return UserAccountsDrawerHeader(
          margin: EdgeInsets.zero,
          accountName: const Text('CatWeb'),
          accountEmail: const Text('https://catweb.moe'),
          currentAccountPicture: const CircleAvatar(
            backgroundImage: AssetImage(
              'assets/images/gelbooru.ico',
            ),
          ),
          otherAccountsPictures: snapshot.data!.map((e) {
            return CircleAvatar(
              backgroundImage: (e.favicon.isNotEmpty
                  ? MemoryImage(e.favicon)
                  : const AssetImage(
                      'assets/images/gelbooru.ico',
                    )) as ImageProvider,
            );
          }).toList(),
          onDetailsPressed: () {
            showWebsiteList.value = !showWebsiteList.value;
          },
        );
      },
    );
  }
}
