import 'package:catweb/ui/components/app_bar.dart';
import 'package:catweb/ui/pages/rules_manager/rules_edit_page.dart';
import 'package:catweb/utils/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class SiteManager extends StatelessWidget {
  const SiteManager({Key? key}) : super(key: key);

  static const routeName = 'SiteManager';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: '站点管理'),
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        overlayColor: Colors.transparent,
        overlayOpacity: 0.0,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.more_horiz),
          ),
          SpeedDialChild(
            child: const Icon(Icons.qr_code),
          ),
          SpeedDialChild(
            child: const Icon(Icons.edit_outlined),
            onTap: () {
              Navigator.of(context).pushNamed(RulesEditPage.routeName);
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          const ListTile(
            title: Text('ExHentai'),
            subtitle: Text('https://exhentai.org'),
            trailing: Icon(Icons.more_vert),
          ).card(),
        ],
      ),
    );
  }
}
