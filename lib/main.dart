import 'package:cat_web/i18n.dart';
import 'package:cat_web/ui/pages/main_page/main_page.dart';
import 'package:cat_web/ui/pages/rules_manager/rules_edit_page.dart';
import 'package:cat_web/ui/pages/rules_manager/rules_manager.dart';
import 'package:cat_web/ui/pages/rules_manager/rules_parser/rules_parser_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'navigator.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        I.delegate
      ],
      supportedLocales: I.supportedLocales,
      navigatorKey: AppNavigator().key,
      initialRoute: MainPage.routeName,
      routes: {
        RulesParserEditor.routeName: (_) => RulesParserEditor(),
        MainPage.routeName: (_) => const MainPage(),
        SiteManager.routeName: (_) => const SiteManager(),
        RulesEditPage.routeName: (_) => RulesEditPage(),
      },
    );
  }
}
