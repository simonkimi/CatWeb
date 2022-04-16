import 'dart:ui';
import 'package:bot_toast/bot_toast.dart';
import 'package:catweb/data/controller/site_controller.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/components/cupertino_router.dart';
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
  runApp(const BlurController());
}

class BlurController extends StatefulWidget {
  const BlurController({Key? key}) : super(key: key);

  @override
  State<BlurController> createState() => _BlurControllerState();
}

class _BlurControllerState extends State<BlurController>
    with WidgetsBindingObserver {
  var _needBlur = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (Get.find<SettingController>().blurWhenBackground.isTrue) {
      final newState = state != AppLifecycleState.resumed;
      if (newState != _needBlur) {
        setState(() {
          _needBlur = newState &&
              Get.find<SettingController>().blurWhenBackground.isTrue;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      textDirection: TextDirection.ltr,
      children: [
        const MyApp(),
        if (_needBlur)
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: const SizedBox(),
          ),
      ],
    );
  }
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
      onGenerateRoute: (settings) {
        return CupertinoWithModalsPageRoute(
          builder: (context) => const ViewerMain(),
          settings: settings,
        );
      },
      builder: (context, child) {
        return BotToastInit()(context, child);
      },
      supportedLocales: I.supportedLocales,
      navigatorKey: AppNavigator().key,
      navigatorObservers: [BotToastNavigatorObserver()],
      theme: defaultTheme(),
    );
  }
}
