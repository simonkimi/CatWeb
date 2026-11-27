import 'package:catweb/data/media/image_repository.dart';
import 'package:catweb/data/models/ffi/result/base.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

import 'image_loader.dart' as loader;

/// Keeps a preview's position even when its optional image was not extracted.
class PreviewImage extends StatelessWidget {
  const PreviewImage({
    super.key,
    required this.repository,
    required this.model,
    this.imageWidgetBuilder,
    this.innerImageBuilder,
    this.enableHero = true,
  });

  final ImageRepository repository;
  final ImageResult? model;
  final loader.WidgetBuilder? imageWidgetBuilder;
  final loader.WidgetBuilder? innerImageBuilder;
  final bool enableHero;

  @override
  Widget build(BuildContext context) {
    final image = model;
    if (image == null || image.url?.trim().isNotEmpty != true) {
      return const Center(
        child: Icon(CupertinoIcons.photo, color: CupertinoColors.systemGrey),
      );
    }
    return loader.ImageLoader(
      repository: repository,
      model: image,
      imageWidgetBuilder: imageWidgetBuilder,
      innerImageBuilder: innerImageBuilder,
      enableHero: enableHero,
    );
  }
}
