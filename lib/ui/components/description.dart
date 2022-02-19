import 'package:flutter/cupertino.dart';
import 'package:flutter_linkify/flutter_linkify.dart';

import '../theme/colors.dart';

class DescriptionWidget extends StatelessWidget {
  DescriptionWidget({Key? key, required String text})
      : _text = text.replaceAll(RegExp(r'\n{2,}'), '\n'),
        super(key: key);

  final String _text;

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: 14,
      color: FixColor.text.resolveFrom(context),
    );

    final overflow = (TextPainter(
      maxLines: 3,
      textDirection: TextDirection.ltr,
      text: TextSpan(
        text: _text,
        style: textStyle,
      ),
    )..layout(maxWidth: MediaQuery.of(context).size.width - 20))
        .didExceedMaxLines;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            _buildLinkText(context),
            if (overflow)
              Positioned(
                right: 0,
                bottom: 0,
                child: _buildMore(context),
              ),
          ],
        ),
      ],
    );
  }

  Linkify _buildLinkText(BuildContext context) {
    return Linkify(
      text: _text,
      overflow: TextOverflow.ellipsis,
      maxLines: 3,
      options: const LinkifyOptions(
        looseUrl: true,
      ),
      style: TextStyle(
        height: 1.1,
        fontSize: 14,
        color: FixColor.title.resolveFrom(context),
      ),
    );
  }

  Widget _buildMore(BuildContext context) {
    return Stack(
      children: [
        ShaderMask(
          blendMode: BlendMode.src,
          shaderCallback: (bounds) {
            return LinearGradient(colors: [
              CupertinoTheme.of(context).scaffoldBackgroundColor.withOpacity(0),
              CupertinoTheme.of(context).scaffoldBackgroundColor,
              CupertinoTheme.of(context).scaffoldBackgroundColor,
            ], stops: const [
              0,
              0.65,
              1
            ]).createShader(bounds);
          },
          child: Container(
            width: 100,
            height: 15,
            color: CupertinoTheme.of(context).scaffoldBackgroundColor,
          ),
        ),
        const Positioned(
          right: 0,
          bottom: 0,
          child: Text(
            '更多',
            style: TextStyle(
              height: 1,
              color: CupertinoColors.activeBlue,
              fontSize: 14,
            ),
          ),
        )
      ],
    );
  }
}
