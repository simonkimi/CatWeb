import 'dart:ui';
import 'package:bot_toast/bot_toast.dart';
import 'package:catweb/data/controller/db_service.dart';
import 'package:catweb/data/controller/site_service.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/theme/themes.dart';
import 'package:catweb/ui/pages/view_page/viewer_main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'data/controller/setting_service.dart';
import 'navigator.dart';

Future<void> initGetX() async {
  await Get.putAsync(() async {
    final service = SettingService();
    await service.init();
    return service;
  }, permanent: true);

  Get.put(DbService(), permanent: true);
  Get.put(SiteService(), permanent: true);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initGetX();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  var _needBlur = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (SettingService.to.blurWhenBackground.isTrue) {
      final newState = state != AppLifecycleState.resumed &&
          Get.find<SettingService>().blurWhenBackground.isTrue;
      if (newState != _needBlur) {
        setState(() {
          _needBlur = newState;
        });
      }
    }
  }

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
      onGenerateRoute: (settings) {
        return CupertinoPageRoute(
          builder: (context) => const ViewerMain(),
          settings: settings,
        );
      },
      builder: (context, child) {
        child = Stack(
          textDirection: TextDirection.ltr,
          children: [
            child ?? const SizedBox(),
            if (_needBlur)
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: const SizedBox(),
              ),
          ],
        );
        child = BotToastInit()(context, child);
        return child;
      },
      supportedLocales: I.supportedLocales,
      navigatorKey: AppNavigator().key,
      navigatorObservers: [BotToastNavigatorObserver()],
      theme: defaultTheme(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }
}
