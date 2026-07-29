import 'package:catweb/data/models/site_render_model.dart';
import 'package:catweb/data/site_runtime/runtime_contracts.dart';
import 'package:catweb/data/site_runtime/site_definition.dart';

class ViewerConfigProvider {
  ViewerConfigProvider({required this.website});

  final SiteRenderConfigModel website;

  bool get hasToolBar => website.displayPage.length > 1;
}

class PageConfigProvider {
  PageConfigProvider({required this.endpoint, RequestContext? context})
    : context = context ?? RequestContext();

  final EndpointRule endpoint;
  final RequestContext context;
}
