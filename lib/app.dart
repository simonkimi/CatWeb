import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

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
    return push(
      CupertinoPageRoute(
        builder: (context) {
          if (providers == null || providers.isEmpty) {
            return child;
          }
          return MultiProvider(providers: providers, child: child);
        },
      ),
    );
  }
}
