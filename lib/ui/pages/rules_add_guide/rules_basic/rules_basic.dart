import 'package:catweb/i18n.dart';
import 'package:catweb/ui/widgets/cupertino_divider.dart';
import 'package:catweb/ui/widgets/cupertino_input.dart';
import 'package:catweb/ui/pages/rules_add_guide/controller/rules_edit_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

class RulesBasic extends HookWidget {
  const RulesBasic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final c = Get.find<RulesEditController>();
    final blueprint = c.blueprint;
    useEffect(() {
      return () => c.updateBlueMap(blueprint);
    });

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      children: [
        CupertinoInput(
          labelText: I.of(context).name,
          value: blueprint.name,
          onChanged: (value) {
            blueprint.name = value;
          },
        ),
        CupertinoInput(
          labelText: I.of(context).base_url,
          value: blueprint.baseUrl,
          onChanged: (value) {
            blueprint.baseUrl = value;
          },
        ),
        CupertinoInput(
          labelText: 'flag',
          value: blueprint.flag,
          onChanged: (value) {
            blueprint.flag = value;
          },
        ),
        const CupertinoDivider(height: 30),
        CupertinoInput(
          labelText: I.of(context).login_url,
          value: blueprint.loginUrl,
          onChanged: (value) {
            blueprint.loginUrl = value;
          },
        ),
        CupertinoInput(
          labelText: I.of(context).login_url_reg,
          value: blueprint.loginCookieReg,
          hintText: '.*',
          onChanged: (value) {
            blueprint.loginCookieReg = value;
          },
        ),
        CupertinoInput(
          labelText: 'Cookie跨域说明',
          value: blueprint.loginCookieDescription,
          minLine: 3,
          onChanged: (value) {
            blueprint.loginCookieDescription = value;
          },
        ),
        const CupertinoDivider(height: 30),
        CupertinoInput(
          labelText: I.of(context).check_upgrade_url,
          value: blueprint.upgradeUrl,
          onChanged: (value) {
            blueprint.upgradeUrl = value;
          },
        ),
      ],
    );
  }
}
