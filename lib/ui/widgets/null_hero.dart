import 'package:flutter/cupertino.dart';

class NullableHero extends StatelessWidget {
  const NullableHero({
    super.key,
    required this.child,
    this.tag,
  });

  final Widget child;
  final String? tag;

  @override
  Widget build(BuildContext context) {
    return tag != null ? Hero(tag: tag!, child: child) : child;
  }
}
