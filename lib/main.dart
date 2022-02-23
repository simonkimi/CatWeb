import 'package:catweb/data/controller/site_controller.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/theme/themes.dart';
import 'package:catweb/ui/pages/view_page/viewer_main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'data/controller/setting_controller.dart';
import 'navigator.dart';

Future<void> initGetX() async {
  await Get.put(SettingController(), permanent: true).init();
  Get.put(GlobalController(), permanent: true);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initGetX();
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
      theme: defaultTheme(),
      home: const ViewerMain(),
    );
  }
}
