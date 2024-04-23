import 'dart:ui';
import 'package:bot_toast/bot_toast.dart';
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
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'navigator.dart';

Future<void> initializeApp(WidgetRef ref) async {
  await Future.wait([
    ref.read(settingsProvider.notifier).loadSettings(),
    ref.read(siteProvider.notifier).init(),
    ref.read(globalProvider).init(),
    getIt.allReady(),
  ]);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer();
  getIt.registerSingleton(() => container);
  runApp(UncontrolledProviderScope(
    container: container,
    child: const MyApp(),
  ));
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final needBlur = useState(false);
    useOnAppLifecycleStateChange((previous, current) {
      if (ref.read(settingsProvider).blurWhenBackground) {
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
        final botRoot = BotToastInit()(context, root);
        return FutureBuilder(
          future: initializeApp(ref),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return botRoot;
            }
            return const SizedBox();
          },
        );
      },
      supportedLocales: I.supportedLocales,
      navigatorKey: AppNavigator().key,
      navigatorObservers: [BotToastNavigatorObserver()],
      theme: defaultTheme(),
    );
  }
}
