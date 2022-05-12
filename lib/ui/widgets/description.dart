import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_linkify/flutter_linkify.dart';

import '../theme/colors.dart';

class DescriptionWidget extends HookWidget {
  const DescriptionWidget({Key? key, required String text})
      : _text = text,
        super(key: key);

  final String _text;

  @override
  Widget build(BuildContext context) {
    final isExtended = useState<bool>(false);

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
            Row(
              children: [
                Expanded(
                  child: Linkify(
                    text: _text,
                    overflow: TextOverflow.ellipsis,
                    maxLines: isExtended.value ? 100 : 3,
                    options: const LinkifyOptions(
                      looseUrl: true,
                    ),
                    style: TextStyle(
                      height: 1.1,
                      fontSize: 14,
                      color: FixColor.title.resolveFrom(context),
                    ),
                  ),
                ),
              ],
            ),
            if (overflow && !isExtended.value)
              Positioned(
                right: 0,
                bottom: 0,
                child: _buildMore(context, isExtended),
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildMore(BuildContext context, ValueNotifier<bool> isExtended) {
    return GestureDetector(
      onTap: () {
        isExtended.value = true;
      },
      child: Stack(
        children: [
          ShaderMask(
            blendMode: BlendMode.src,
            shaderCallback: (bounds) {
              return LinearGradient(colors: [
                CupertinoTheme.of(context)
                    .scaffoldBackgroundColor
                    .withOpacity(0),
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
      ),
    );
  }
}
