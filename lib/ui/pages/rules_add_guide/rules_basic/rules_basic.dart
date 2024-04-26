import 'package:catweb/i18n.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_input.dart';
import 'package:catweb/ui/widgets/cupertino_divider.dart';
import 'package:flutter/material.dart';



class RulesBasic extends StatelessWidget {
  const RulesBasic({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      children: [
        RulesTextField(
          labelText: I.of(context).name,
          selector: (notifier) => notifier.blueprint.name,
          save: (notifier) => notifier.setName,
        ),
        RulesTextField(
          labelText: I.of(context).base_url,
          selector: (notifier) => notifier.blueprint.baseUrl,
          save: (notifier) => notifier.setBaseUrl,
        ),
        RulesTextField(
          labelText: '标志',
          selector: (notifier) => notifier.blueprint.flag,
          save: (notifier) => notifier.setFlag,
        ),
        const CupertinoDivider(height: 30),
        RulesTextField(
          labelText: I.of(context).login_url,
          selector: (notifier) => notifier.blueprint.loginUrl,
          save: (notifier) => notifier.setLoginUrl,
        ),
        RulesTextField(
          labelText: I.of(context).login_url_reg,
          selector: (notifier) => notifier.blueprint.loginCookieReg,
          save: (notifier) => notifier.setLoginCookieReg,
          hintText: '.*',
        ),
        RulesTextField(
          labelText: 'Cookie跨域说明',
          selector: (notifier) => notifier.blueprint.loginCookieDescription,
          save: (notifier) => notifier.setLoginCookieDescription,
          minLine: 3,
        ),
        // const CupertinoDivider(height: 30),
        // RulesTextField(
        //   labelText: I.of(context).check_upgrade_url,
        //   selector: (notifier) => notifier.blueprint.upgradeUrl,
        //   save: (notifier) => notifier.setUpgradeUrl,
        // ),
      ],
    );
  }
}
