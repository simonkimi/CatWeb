import 'dart:ui';
import 'package:bot_toast/bot_toast.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/theme/themes.dart';
import 'package:catweb/ui/pages/view_page/viewer_main.dart';
import 'package:cupertino_modal_sheet/cupertino_modal_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'data/controller/setting_service.dart';
import 'navigator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState createState() => _MyAppState();
}

class _MyAppState extends ConsumerState with WidgetsBindingObserver {
  var _needBlur = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (ref.read<SettingProvider>(settingProvider).blurWhenBackground.value) {
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
