import 'package:catweb/data/controller/settings.dart';
import 'package:catweb/app.dart';

import 'package:catweb/utils/context_helper.dart';
import 'package:flutter/material.dart';

class DarkImage extends StatelessWidget {
  const DarkImage({
    super.key,
    required this.image,
    this.fit,
    this.loadingBuilder,
  });

  final ImageProvider image;
  final BoxFit? fit;
  final ImageLoadingBuilder? loadingBuilder;

  @override
  Widget build(BuildContext context) {
    SettingService setting = getIt.get();
    return ValueListenableBuilder(
      valueListenable: setting.imageMaskInDarkModeNotifier,
      builder: (context, value, _) {
        if (value && context.isDarkMode) {
          return ColorFiltered(
            colorFilter: const ColorFilter.mode(
              Colors.black26,
              BlendMode.dstOut,
            ),
            child: Image(
              image: image,
              fit: fit,
              loadingBuilder: loadingBuilder,
            ),
          );
        }
        return Image(
          image: image,
          fit: fit,
          loadingBuilder: loadingBuilder,
        );
      },
    );
  }
}

class DarkWidget extends StatelessWidget {
  const DarkWidget({
    super.key,
    required this.child,
    this.width,
    this.height,
  });

  final Widget child;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    if (!context.isDarkMode) {
      return child;
    }
    return ColorFiltered(
      colorFilter: const ColorFilter.mode(
        Colors.black26,
        BlendMode.dstOut,
      ),
      child: child,
    );
  }
}
