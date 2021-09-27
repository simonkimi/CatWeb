import 'package:cat_web/gen/protobuf/selector.pb.dart';
import 'package:cat_web/ui/page/rules_manager/rules_manager.dart';
import 'package:flutter/material.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RulesManager(),
    );
  }
}