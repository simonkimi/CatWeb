import 'package:catweb/ui/components/cupertino_divider.dart';
import 'package:catweb/ui/components/cupertino_input.dart';
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
          labelText: '名称',
          value: controller.siteConfigModel.name,
        ),
        CupertinoInput(
          labelText: '基础Url',
          value: controller.siteConfigModel.baseUrl,
        ),
        const CupertinoDivider(height: 30),
        CupertinoInput(
          labelText: '登录Url',
          value: controller.siteConfigModel.loginUrl,
        ),
        CupertinoInput(
          labelText: '登录Cookie作用域',
          value: controller.siteConfigModel.loginCookie.reg,
          hintText: '.*',
        ),
        CupertinoInput(
          labelText: 'Cookies',
          value: controller.siteConfigModel.loginCookie.value,
          minLine: 3,
        ),
        const CupertinoDivider(height: 30),
        CupertinoInput(
          labelText: '更新Url',
          value: controller.siteConfigModel.upgradeUrl,
        ),
      ],
    );
  }
}
