import 'package:bot_toast/bot_toast.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/pages/main_page/main_page.dart';
import 'package:catweb/ui/pages/rules_manager/rules_edit_page.dart';
import 'package:catweb/ui/pages/rules_manager/rules_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'data/store/setting_store.dart';
import 'navigator.dart';
import 'themes.dart';


final settingStore = SettingStore();


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CatWeb',
      debugShowCheckedModeBanner: false,
      theme: blueTheme,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        I.delegate
      ],
      supportedLocales: I.supportedLocales,
      navigatorKey: AppNavigator().key,
      initialRoute: MainPage.routeName,
      navigatorObservers: [BotToastNavigatorObserver()],
      builder: BotToastInit(),
      routes: {
        MainPage.routeName: (_) => const MainPage(),
        SiteManager.routeName: (_) => const SiteManager(),
        RulesEditPage.routeName: (_) => RulesEditPage(),
      },
    );
  }
}
