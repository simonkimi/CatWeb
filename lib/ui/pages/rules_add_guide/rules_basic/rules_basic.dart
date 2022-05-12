import 'package:catweb/i18n.dart';
import 'package:catweb/ui/widgets/cupertino_divider.dart';
import 'package:catweb/ui/widgets/cupertino_input.dart';
import 'package:catweb/ui/pages/rules_add_guide/controller/rules_edit_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RulesBasic extends GetView<RulesEditController> {
  const RulesBasic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      children: [
        CupertinoInput(
          labelText: I.of(context).name,
          value: controller.blueprint.name,
        ),
        CupertinoInput(
          labelText: I.of(context).base_url,
          value: controller.blueprint.baseUrl,
        ),
        CupertinoInput(
          labelText: 'flag',
          value: controller.blueprint.flag,
        ),
        const CupertinoDivider(height: 30),
        CupertinoInput(
          labelText: I.of(context).login_url,
          value: controller.blueprint.loginUrl,
        ),
        CupertinoInput(
          labelText: I.of(context).login_url_reg,
          value: controller.blueprint.loginCookieReg,
          hintText: '.*',
        ),
        CupertinoInput(
          labelText: 'Cookie跨域说明',
          value: controller.blueprint.loginCookieDescription,
          minLine: 3,
        ),
        const CupertinoDivider(height: 30),
        CupertinoInput(
          labelText: I.of(context).check_upgrade_url,
          value: controller.blueprint.upgradeUrl,
        ),
      ],
    );
  }
}
