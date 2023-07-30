import 'package:catweb/data/models/site_model/site_blue_map.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/widgets/cupertino_divider.dart';
import 'package:catweb/ui/widgets/cupertino_input.dart';
import 'package:catweb/ui/pages/rules_add_guide/controller/rules_edit_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RulesBasic extends GetWidget<RulesEditController> {
  const RulesBasic({
    super.key,
  });

  SiteBlueMap get blueprint => controller.blueprint;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      children: [
        CupertinoInput(
          labelText: I.of(context).name,
          value: blueprint.name,
        ),
        CupertinoInput(
          labelText: I.of(context).base_url,
          value: blueprint.baseUrl,
        ),
        CupertinoInput(
          labelText: 'flag',
          value: blueprint.flag,
        ),
        const CupertinoDivider(height: 30),
        CupertinoInput(
          labelText: I.of(context).login_url,
          value: blueprint.loginUrl,
        ),
        CupertinoInput(
          labelText: I.of(context).login_url_reg,
          value: blueprint.loginCookieReg,
          hintText: '.*',
        ),
        CupertinoInput(
          labelText: 'Cookie跨域说明',
          value: blueprint.loginCookieDescription,
          minLine: 3,
        ),
        const CupertinoDivider(height: 30),
        CupertinoInput(
          labelText: I.of(context).check_upgrade_url,
          value: blueprint.upgradeUrl,
        ),
      ],
    );
  }
}
