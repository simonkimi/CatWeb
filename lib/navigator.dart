import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final getIt = GetIt.instance;

class AppNavigator {
  factory AppNavigator() => _appNavigator;

  AppNavigator._();

  static final AppNavigator _appNavigator = AppNavigator._();
  final GlobalKey<NavigatorState> _key = GlobalKey(debugLabel: 'navigate_key');

  GlobalKey<NavigatorState> get key => _key;

  BuildContext get context => _key.currentState!.context;
}

extension BuildContextExt on BuildContext {
  Future<T?> to<T extends Object?>(
    Widget child, [
    List<SingleChildWidget>? providers,
  ]) {
    return Navigator.of(this).to(child, providers);
  }
}

extension NavigatorExt on NavigatorState {
  Future<T?> to<T extends Object?>(
    Widget child, [
    List<SingleChildWidget>? providers,
  ]) {
    return push(CupertinoPageRoute(
      builder: (context) {
        if (providers == null || providers.isNotEmpty) {
          return child;
        }
        return MultiProvider(
          providers: providers,
          child: child,
        );
      },
    ));
  }
}
