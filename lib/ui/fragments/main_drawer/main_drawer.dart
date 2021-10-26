import 'package:cat_web/ui/pages/rules_manager/rules_manager.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          buildUserAccountHeader(context),
          Expanded(
            child: ListView(
              children: const [
              ],
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('站点管理'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(SiteManager.routeName);
            },
          )
        ],
      ),
    );
  }

  Widget buildUserAccountHeader(BuildContext context) {
    return UserAccountsDrawerHeader(
      accountName: const Text('CatWeb'),
      accountEmail: const Text('https://catweb.moe'),
      currentAccountPicture: const CircleAvatar(
        backgroundImage: AssetImage(
          'assets/images/gelbooru.ico',
        ),
      ),
      otherAccountsPictures: List.filled(
          5,
          const CircleAvatar(
            backgroundImage: AssetImage(
              'assets/images/gelbooru.ico',
            ),
          )),
    );
  }
}
