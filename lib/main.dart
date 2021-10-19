import 'package:cat_web/i18n.dart';
import 'package:cat_web/ui/page/rules_manager/rules_manager.dart';
import 'package:cat_web/ui/page/rules_manager/rules_parser/rules_parser_editor.dart';
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
      home: RulesManager(),
      routes: {
        RulesParserEditor.routeName: (_) => RulesParserEditor(),
      },
    );
  }
}
