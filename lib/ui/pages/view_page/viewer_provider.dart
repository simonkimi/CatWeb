import 'package:catweb/data/models/site/page.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/models/site_render_model.dart';

class ViewerConfig {
  ViewerConfig({required this.website});

  final SiteRenderConfigModel website;
}

class PageConfig {
  PageConfig({required this.pageRule});

  final SitePageRule pageRule;
  final SiteEnvStore env = SiteEnvStore();
}
