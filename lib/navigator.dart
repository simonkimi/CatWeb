import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class AppNavigator {
  factory AppNavigator() => _appNavigator;

  AppNavigator._();

  static final AppNavigator _appNavigator = AppNavigator._();
  final GlobalKey<NavigatorState> _key = GlobalKey(debugLabel: 'navigate_key');

  GlobalKey<NavigatorState> get key => _key;

  BuildContext get context => _key.currentState!.context;
}

T get<T extends Object>({
  dynamic param1,
  dynamic param2,
  String? instanceName,
  Type? type,
}) {
  return getIt.get<T>(
      param1: param1, param2: param2, instanceName: instanceName, type: type);
}
