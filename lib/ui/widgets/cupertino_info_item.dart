import 'package:flutter/cupertino.dart';

class CupertinoInfoItem extends StatelessWidget {
  const CupertinoInfoItem({
    super.key,
    required this.top,
    required this.middle,
    required this.bottom,
  });

  final Widget top;
  final Widget middle;
  final Widget bottom;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
          child: _buildSize(context, top, 14),
        ),
        SizedBox(
          height: 30,
          child: Center(
            child: _buildSize(context, middle, 20, true),
          ),
        ),
        SizedBox(
          height: 20,
          child: _buildSize(context, bottom, 14),
        ),
      ],
    );
  }

  Widget _buildSize(BuildContext context, Widget child, double size,
      [bool? bold]) {
    if (child is Text) {
      return Text(
        child.data!,
        style: TextStyle(
          fontSize: size,
          color: CupertinoColors.secondaryLabel.resolveFrom(context),
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
