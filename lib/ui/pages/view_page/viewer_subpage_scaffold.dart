import 'package:catweb/data/models/site/page.dart';
import 'package:catweb/data/models/site/template.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/ui/pages/view_page/image/controller/reader_load_notifier.dart';
import 'package:catweb/ui/pages/view_page/image/image_reader.dart';
import 'package:catweb/ui/pages/view_page/list/viewer_list.dart';
import 'package:catweb/ui/pages/view_page/viewer_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'gallery/viewer_gallery.dart';

class ViewerPage extends StatelessWidget {
  const ViewerPage({
    super.key,
    required this.sitePageRule,
    this.fromParams,
  });

  final SitePageRule sitePageRule;
  final Object? fromParams;

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PageConfigProvider(pageRule: sitePageRule),
      child: _buildFragment(context),
    );
  }

  Widget _buildFragment(BuildContext context) {
    switch (sitePageRule.template) {
      case PageTemplateList():
        return const ViewerListFragment();
      case PageTemplateGallery():
        return ViewerGalleryFragment(
          sitePageRule: sitePageRule,
          env: SiteEnvStore(),
        );
      case PageTemplateImageViewer() when fromParams is ReaderInfo:
        // TODO 获取
        return ImageReader(
          readerInfo: fromParams as ReaderInfo,
          sitePageRule: sitePageRule,
        );
      default:
        throw UnimplementedError(
            'ViewerPage can not handle ${sitePageRule.template}');
    }
  }
}
