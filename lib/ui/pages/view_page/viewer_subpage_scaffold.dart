import 'package:catweb/data/models/image_with_preview.dart';
import 'package:catweb/data/models/site_render_model.dart';
import 'package:catweb/data/site_runtime/runtime_contracts.dart';
import 'package:catweb/data/site_runtime/site_definition.dart';
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
    required this.endpoint,
    required this.website,
    this.requestContext,
    this.fromParams,
  });

  final EndpointRule endpoint;
  final SiteRenderConfigModel website;
  final RequestContext? requestContext;
  final Object? fromParams;

  @override
  Widget build(BuildContext context) {
    final pageContext = requestContext ?? RequestContext();
    return MultiProvider(
      providers: [
        Provider(
          create: (_) =>
              PageConfigProvider(endpoint: endpoint, context: pageContext),
        ),
        Provider(create: (_) => ViewerConfigProvider(website: website)),
      ],
      child: _buildFragment(pageContext),
    );
  }

  Widget _buildFragment(RequestContext context) {
    return switch (endpoint.kind) {
      EndpointKind.list => const ViewerListFragment(),
      EndpointKind.gallery => ViewerGalleryFragment(
        endpoint: endpoint,
        website: website,
        requestContext: context,
      ),
      EndpointKind.reader
          when fromParams is ReaderInfo<ImageWithPreviewModel> =>
        ImageReader(
          readerInfo: fromParams as ReaderInfo<ImageWithPreviewModel>,
          endpoint: endpoint,
          website: website,
          requestContext: context,
        ),
      EndpointKind.reader => const _UnsupportedEndpoint(
        message: '阅读端点缺少图片列表上下文',
      ),
      EndpointKind.autocomplete => const _UnsupportedEndpoint(
        message: '自动补全端点不能作为页面打开',
      ),
    };
  }
}

class _UnsupportedEndpoint extends StatelessWidget {
  const _UnsupportedEndpoint({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
    navigationBar: CupertinoNavigationBar(
      leading: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () => Navigator.of(context).maybePop(),
        child: const Icon(CupertinoIcons.back),
      ),
    ),
    child: Center(child: Text(message)),
  );
}
