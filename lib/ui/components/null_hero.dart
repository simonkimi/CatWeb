import 'package:flutter/cupertino.dart';

class NullableHero extends StatelessWidget {
  const NullableHero({
    Key? key,
    required this.child,
    this.tag,
  }) : super(key: key);

  final Widget child;
  final String? tag;

  @override
  Widget build(BuildContext context) {
    return tag != null ? Hero(tag: tag!, child: child) : child;
  }
}
