import 'package:catweb/i18n.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_editor_notifier.dart';
import 'package:catweb/ui/widgets/cupertino_divider.dart';
import 'package:catweb/ui/widgets/cupertino_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RulesBasic extends StatelessWidget {
  const RulesBasic({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.read<RulesEditorNotifier>();

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      children: [
        TripleTextField(
          labelText: I.of(context).name,
          initialValue: notifier.blueprint.name,
          onSubmitted: notifier.setName,
        ),
        TripleTextField(
          labelText: I.of(context).base_url,
          initialValue: notifier.blueprint.baseUrl,
          onSubmitted: notifier.setBaseUrl,
        ),
        TripleTextField(
          labelText: '标志',
          initialValue: notifier.blueprint.flag,
          onSubmitted: notifier.setFlag,
        ),
        const CupertinoDivider(height: 30),
        TripleTextField(
          labelText: I.of(context).login_url,
          initialValue: notifier.blueprint.loginUrl,
          onSubmitted: notifier.setLoginUrl,
        ),
        TripleTextField(
          labelText: I.of(context).login_url_reg,
          initialValue: notifier.blueprint.loginCookieReg,
          hintText: '.*',
          onSubmitted: notifier.setLoginCookieReg,
        ),
        TripleTextField(
          labelText: 'Cookie跨域说明',
          initialValue: notifier.blueprint.loginCookieDescription,
          minLine: 3,
          onSubmitted: notifier.setLoginCookieDescription,
        ),
        const CupertinoDivider(height: 30),
      ],
    );
  }
}
