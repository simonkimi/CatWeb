import 'package:catweb/data/models/site/page.dart';
import 'package:catweb/data/models/site/template.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/ui/pages/view_page/image/image_reader.dart';
import 'package:catweb/ui/pages/view_page/list/viewer_list.dart';
import 'package:catweb/ui/pages/view_page/viewer_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'gallery/viewer_gallery.dart';
import 'image/controller/image_load_controller.dart';

class ViewerPage extends StatelessWidget {
  const ViewerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildFragment(context);
  }

  Widget _buildFragment(BuildContext context) {
    final pageConfig = context.read<PageConfig>();
    switch (pageConfig.pageRule.template) {
      case PageTemplateList():
        return ViewerListFragment();
      case PageTemplateGallery():
        return ViewerGalleryFragment();
      case PageTemplateImageViewer():
        return ImageReader();
      default:
        throw UnimplementedError(
            'ViewerPage can not handle ${pageConfig.pageRule.template}');
    }
  }
}
