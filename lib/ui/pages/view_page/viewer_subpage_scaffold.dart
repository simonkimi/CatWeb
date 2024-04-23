import 'package:catweb/data/models/site/page.dart';
import 'package:catweb/data/models/site/template.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/ui/pages/view_page/image/image_reader.dart';
import 'package:catweb/ui/pages/view_page/list/viewer_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'gallery/viewer_gallery.dart';
import 'image/controller/image_load_controller.dart';

class ViewerPage extends ConsumerWidget {
  const ViewerPage({
    super.key,
    required this.target,
    this.model,
    this.env,
  });

  final SitePage target;
  final SiteEnvStore? env;
  final Object? model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _buildFragment(context);
  }

  Widget _buildFragment(BuildContext context) {
    switch (target.template) {
      case PageTemplateList():
        return ViewerListFragment(
          blueprint: target,
          hasToolBar: model != null,
        );
      case PageTemplateGallery():
        return ViewerGalleryFragment(
          target: target,
          model: model,
          env: env ?? SiteEnvStore(),
        );
      case PageTemplateImageViewer():
        return ImageReader(
          readerInfo: model as ReaderInfo,
          blueprint: target,
        );
      default:
        throw UnimplementedError(
            'ViewerPage can not handle ${target.template}');
    }
  }
}
