import 'dart:ui';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/widgets/dialog.dart';
import 'package:catweb/ui/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewLoginIn extends StatefulWidget {
  const WebViewLoginIn({
    super.key,
    required this.url,
  });

  final String url;

  @override
  State<WebViewLoginIn> createState() => _WebViewLoginInState();
}

class _WebViewLoginInState extends State<WebViewLoginIn> {
  final GlobalKey webViewKey = GlobalKey();
  InAppWebViewController? webViewController;
  final CookieManager _cookieManager = CookieManager.instance();
  Uri? currentUri;

  InAppWebViewSettings settings = InAppWebViewSettings(
    allowsInlineMediaPlayback: true,
    useHybridComposition: true,
    useShouldOverrideUrlLoading: true,
    mediaPlaybackRequiresUserGesture: false,
  );

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(I.of(context).login),
        trailing: CupertinoButton(
          minSize: 0,
          padding: EdgeInsets.zero,
          onPressed: _onImport,
          child: Text(I.of(context).import),
        ),
      ),
      resizeToAvoidBottomInset: true,
      child: SafeArea(
        child: Stack(
          children: [
            InAppWebView(
              key: webViewKey,
              initialSettings: settings,
              onWebViewCreated: (controller) {
                webViewController = controller;
              },
              initialUrlRequest:
                  URLRequest(url: WebUri.uri(Uri.parse(widget.url))),
              onLoadStart: (controller, url) {
                currentUri = url;
              },
              onLoadStop: (controller, url) {
                currentUri = url;
              },
              onPermissionRequest: (controller, permissionRequest) async {
                return PermissionResponse(
                  action: PermissionResponseAction.GRANT,
                  resources: permissionRequest.resources,
                );
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    height: 40,
                    color:
                        FixColor.navigationBarBackground.resolveFrom(context),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CupertinoButton(
                            minSize: 0,
                            padding: EdgeInsets.zero,
                            child: const Icon(CupertinoIcons.left_chevron),
                            onPressed: () => webViewController?.goBack(),
                          ),
                          CupertinoButton(
                            minSize: 0,
                            padding: EdgeInsets.zero,
                            child: const Icon(CupertinoIcons.right_chevron),
                            onPressed: () => webViewController?.goForward(),
                          ),
                          CupertinoButton(
                            minSize: 0,
                            padding: EdgeInsets.zero,
                            child: const Icon(CupertinoIcons.refresh),
                            onPressed: () => webViewController?.reload(),
                          ),
                          CupertinoButton(
                            minSize: 0,
                            padding: EdgeInsets.zero,
                            onPressed: _onImport,
                            child: const Icon(CupertinoIcons.checkmark),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onImport() async {
    final cookies = await _getCookies();
    showCupertinoConfirmDialog(
            context: context,
            title: 'cookie',
            content:
                '${I.of(context).import_cookie}\n${cookies.map((c) => '${c.name}: ${c.value}').join('\n')}')
        .then((value) {
      if (value == true) {
        Navigator.of(context).pop(cookies);
      }
    });
  }

  Future<List<Cookie>> _getCookies() => _cookieManager.getCookies(url: WebUri.uri(currentUri ?? Uri.base));
}
