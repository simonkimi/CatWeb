import 'dart:ui';
import 'package:bot_toast/bot_toast.dart';
import 'package:catweb/data/controller/db.dart';
import 'package:catweb/data/controller/global.dart';
import 'package:catweb/data/controller/settings.dart';
import 'package:catweb/data/controller/site.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/theme/themes.dart';
import 'package:catweb/ui/pages/view_page/viewer_main.dart';
import 'package:cupertino_modal_sheet/cupertino_modal_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'app.dart';

Future<void> initializeApp() async {
  getIt.registerSingletonAsync(() => SettingService().init());
  getIt.registerSingletonAsync(() => GlobalService().init());
  getIt.registerSingleton(DbService());
  getIt.registerSingletonWithDependencies(
    () => SiteService(
      setting: getIt.get<SettingService>(),
      db: getIt.get<DbService>(),
    ),
    dependsOn: [SettingService],
  );
  await getIt.allReady();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeApp();
  runApp(const MyApp());
}

class MyApp extends HookWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final setting = getIt.get<SettingService>();
    final needBlur = useState(false);
    useOnAppLifecycleStateChange((previous, current) {
      if (setting.blurWhenBackground) {
        final newState = current != AppLifecycleState.resumed;
        if (newState != needBlur.value) {
          needBlur.value = newState;
        }
      }
    });

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
        final root = Stack(
          textDirection: TextDirection.ltr,
          children: [
            child ?? const SizedBox(),
            if (needBlur.value)
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: const SizedBox(),
              ),
          ],
        );
        return BotToastInit()(context, root);
      },
      supportedLocales: I.supportedLocales,
      navigatorKey: App().key,
      navigatorObservers: [BotToastNavigatorObserver()],
      theme: defaultTheme(),
    );
  }
}
