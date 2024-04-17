import 'dart:ui';
import 'package:bot_toast/bot_toast.dart';
import 'package:catweb/data/controller/site_service.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/theme/themes.dart';
import 'package:catweb/ui/pages/view_page/viewer_main.dart';
import 'package:cupertino_modal_sheet/cupertino_modal_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/controller/db_service.dart';
import 'data/controller/navigator_service.dart';
import 'data/controller/setting_service.dart';
import 'navigator.dart';

Future<void> setup() async {
  getIt.registerSingletonAsync(() async {
    return SharedPreferences.getInstance();
  });
  getIt.registerSingletonAsync(() async {
    final service = SettingService();
    await service.init();
    return service;
  });
  getIt.registerSingleton(() => DbService());
  getIt.registerSingleton(() => NavigatorService());
  getIt.registerSingletonAsync(() async {
    final service = SiteService();
    await service.init();
    return service;
  });
  await getIt.allReady();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.init((await getApplicationDocumentsDirectory()).path);
  await setup();
  runApp(const ProviderScope(child: MyApp()));
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
    if (getIt.get<SettingService>().blurWhenBackground.value) {
      final newState = state != AppLifecycleState.resumed;
      if (newState != _needBlur) {
        setState(() {
          _needBlur = newState;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'CatWeb',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        I.delegate
      ],
      onGenerateRoute: (settings) {
        return CupertinoModalSheetRoute(
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
