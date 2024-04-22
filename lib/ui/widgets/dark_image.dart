import 'package:catweb/data/controller/settings.dart';
import 'package:catweb/utils/context_helper.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DarkImage extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final setting = ref.watch(settingsProvider);
    return setting.imageMaskInDarkMode && context.isDarkMode
        ? ColorFiltered(
            colorFilter: const ColorFilter.mode(
              Colors.black26,
              BlendMode.dstOut,
            ),
            child: Image(
              image: image,
              fit: fit,
              loadingBuilder: loadingBuilder,
            ),
          )
        : Image(
            image: image,
            fit: fit,
            loadingBuilder: loadingBuilder,
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
    return context.isDarkMode
        ? ColorFiltered(
            colorFilter: const ColorFilter.mode(
              Colors.black26,
              BlendMode.dstOut,
            ),
            child: child,
          )
        : child;
  }
}
