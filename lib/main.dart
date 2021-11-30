import 'package:bot_toast/bot_toast.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/themes.dart';
import 'package:catweb/ui/pages/main_page/main_page.dart';
import 'package:catweb/ui/pages/rules_manager/rules_edit_page.dart';
import 'package:catweb/ui/pages/rules_manager/rules_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'data/store/setting_controller.dart';
import 'navigator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.lazyPut(() => SettingController(), fenix: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetCupertinoApp(
      title: 'CatWeb',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        I.delegate
      ],
      supportedLocales: I.supportedLocales,
      navigatorKey: AppNavigator().key,
      initialRoute: MainPage.routeName,
      navigatorObservers: [BotToastNavigatorObserver()],
      builder: BotToastInit(),
      theme: defaultTheme(),
      routes: {
        MainPage.routeName: (_) => const MainPage(),
        SiteManager.routeName: (_) => const SiteManager(),
        RulesEditPage.routeName: (_) => const RulesEditPage(),
      },
    );
  }
}
