import 'package:catweb/data/models/site/page.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/models/site_render_model.dart';

class ViewerConfigProvider {
  ViewerConfigProvider({required this.website});

  final SiteRenderConfigModel website;

  bool get hasToolBar => website.displayPage.length > 1;
}

class PageConfigProvider {
  PageConfigProvider({required this.pageRule});

  final SitePageRule pageRule;
  final SiteEnvStore env = SiteEnvStore();
}
