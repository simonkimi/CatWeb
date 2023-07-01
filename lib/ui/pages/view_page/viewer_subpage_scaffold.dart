import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/models/site_model/pages/site_page.dart';
import 'package:catweb/data/models/site_model/pages/template.dart';
import 'package:catweb/ui/pages/view_page/image/image_reader.dart';
import 'package:catweb/ui/pages/view_page/list/viewer_list.dart';
import 'package:flutter/cupertino.dart';

import 'gallery/viewer_gallery.dart';
import 'image/controller/image_load_controller.dart';

class ViewerPage extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return _buildFragment(context);
  }

  Widget _buildFragment(BuildContext context) {
    switch (target.template.type) {
      case TemplateType.imageWaterFall:
      case TemplateType.imageList:
        return ViewerListFragment(
          blueprint: target,
          hasToolBar: model != null,
        );
      case TemplateType.gallery:
        return ViewerGalleryFragment(
          target: target,
          model: model,
          env: env ?? SiteEnvStore(),
        );
      case TemplateType.imageViewer:
        return ImageReader(
          readerInfo: model as ReaderInfo,
          blueprint: target,
        );
      default:
        throw UnimplementedError(
            'ViewerPage can not handle ${target.template.type}');
    }
  }
}
