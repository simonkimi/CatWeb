import 'dart:ui';

import 'package:bot_toast/bot_toast.dart';
import 'package:catweb/data/controller/db.dart';
import 'package:catweb/data/controller/global.dart';
import 'package:catweb/data/controller/settings.dart';
import 'package:catweb/data/controller/site.dart';
import 'package:catweb/data/repositories/site_repository.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/network/runtime/site_runtime_factory.dart';
import 'package:catweb/src/rust/frb_generated.dart';
import 'package:catweb/ui/pages/view_page/viewer_main.dart';
import 'package:catweb/ui/theme/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

final _services = GetIt.instance;

Future<void> initializeApp() async {
  _services.registerSingletonAsync<SettingService>(
    () => SettingService().init(),
    dispose: (service) => service.dispose(),
  );
  _services.registerSingletonAsync(() => GlobalService().init());
  _services.registerSingleton(
    DbService(),
    dispose: (service) => service.dispose(),
  );
  _services.registerSingletonAsync<SiteService>(
    () async {
      final db = _services.get<DbService>();
      final global = _services.get<GlobalService>();
      final setting = _services.get<SettingService>();
      final repository = SiteRepository(
        webDao: db.webDao,
        cookieJarDao: db.cookieJarDao,
      );
      final service = SiteService(
        setting: setting,
        repository: repository,
        runtimeFactory: SiteRuntimeFactory(
          documentCacheOptions: global.cacheOptions,
          imageCacheOptions: global.imageCacheOption,
          imageConcurrency: () => setting.concurrencyCount,
          cookieJarDao: repository.cookieJarDao,
        ),
      );
      await service.init();
      return service;
    },
    dependsOn: [SettingService, GlobalService],
    dispose: (service) => service.dispose(),
  );
  await _services.allReady();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RustLib.init();
  await initializeApp();
  runApp(
    MyApp(
      setting: _services.get<SettingService>(),
      siteService: _services.get<SiteService>(),
      dbService: _services.get<DbService>(),
    ),
  );
}

class MyApp extends HookWidget {
  const MyApp({
    required this.setting,
    required this.siteService,
    required this.dbService,
    super.key,
  });

  final SettingService setting;
  final SiteService siteService;
  final DbService dbService;

  @override
  Widget build(BuildContext context) {
    final needBlur = useState(false);
    useOnAppLifecycleStateChange((previous, current) {
      if (setting.blurWhenBackground) {
        final newState = current != AppLifecycleState.resumed;
        if (newState != needBlur.value) {
          needBlur.value = newState;
        }
      }
    });

    return MultiProvider(
      providers: [
        Provider.value(value: setting),
        Provider.value(value: siteService),
        Provider.value(value: dbService),
      ],
      child: CupertinoApp(
        title: 'CatWeb',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          I.delegate,
        ],
        home: ViewerMain(siteService: siteService),
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
        navigatorObservers: [BotToastNavigatorObserver()],
        theme: defaultTheme(),
      ),
    );
  }
}
