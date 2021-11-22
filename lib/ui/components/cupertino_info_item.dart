import 'package:flutter/cupertino.dart';
import 'package:catweb/themes.dart';

class CupertinoInfoItem extends StatelessWidget {
  const CupertinoInfoItem({
    Key? key,
    required this.top,
    required this.middle,
    required this.bottom,
  }) : super(key: key);

  final Widget top;
  final Widget middle;
  final Widget bottom;

  @override
  Widget build(BuildContext context) {
    final _top = buildSize(context, top, 14);
    final _middle = buildSize(context, middle, 20, true);
    final _bottom = buildSize(context, bottom, 14);

    return Column(
      children: [
        SizedBox(
          height: 20,
          child: _top,
        ),
        SizedBox(
          height: 30,
          child: Center(
            child: _middle,
          ),
        ),
        SizedBox(
          height: 20,
          child: _bottom,
        ),
      ],
    );
  }

  Widget buildSize(BuildContext context, Widget child, double size,
      [bool? bold]) {
    if (child is Text) {
      return Text(
        child.data!,
        style: TextStyle(
          fontSize: size,
          color: secondaryLabelColor(context),
          fontWeight: bold == null ? null : FontWeight.bold,
        ),
      );
    } else if (child is Icon) {
      return Icon(
        child.icon,
        size: size + 2,
      );
    } else {
      return child;
    }
  }
}
