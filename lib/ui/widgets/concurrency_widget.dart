import 'package:flutter/cupertino.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
