import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/ui/components/cupertino_divider.dart';
import 'package:catweb/ui/components/cupertino_input.dart';
import 'package:catweb/ui/components/dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class RulesPageEdit extends StatelessWidget {
  const RulesPageEdit({
    Key? key,
    required this.model,
  }) : super(key: key);

  final SitePageModel model;


  CupertinoNavigationBar buildAppbar(BuildContext context) {
    return CupertinoNavigationBar(
      leading: CupertinoButton(
        onPressed: () {
          showExitConferDialog(context).then((value) {
            if (value == true) {
              Navigator.of(context).pop();
            }
          });
        },
        child: const Icon(CupertinoIcons.back),
        padding: EdgeInsets.zero,
        minSize: 0,
      ),
      middle: const Text('规则'),
      trailing: CupertinoButton(
        onPressed: () {},
        child: const Icon(Icons.save_outlined),
        padding: EdgeInsets.zero,
        minSize: 0,
      ),
      border: const Border(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showExitConferDialog(context),
      child: CupertinoPageScaffold(
        navigationBar: buildAppbar(context),
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            children: [
              CupertinoInput(
                labelText: '名称',
                value: model.name,
              ),
              CupertinoInput(
                labelText: '网址',
                value: model.name,
                description: '可以使用 {var} 替换参数',
              ),
              const CupertinoDivider(height: 20),
              Obx(() => CupertinoReadOnlyInput(
                labelText: '模板',
                value: model.type.value.string(context),
              )),
              Obx(() => CupertinoReadOnlyInput(
                labelText: '解析器',
                value: model.parser.value,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
