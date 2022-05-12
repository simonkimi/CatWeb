import 'dart:ui';
import 'package:catweb/ui/widgets/dialog.dart';
import 'package:catweb/ui/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewLoginIn extends StatefulWidget {
  const WebViewLoginIn({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;

  @override
  State<WebViewLoginIn> createState() => _WebViewLoginInState();
}

class _WebViewLoginInState extends State<WebViewLoginIn> {
  final GlobalKey webViewKey = GlobalKey();
  InAppWebViewController? webViewController;
  final CookieManager _cookieManager = CookieManager.instance();
  Uri? currentUri;

  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
    crossPlatform: InAppWebViewOptions(
      useShouldOverrideUrlLoading: true,
      mediaPlaybackRequiresUserGesture: false,
    ),
    android: AndroidInAppWebViewOptions(
      useHybridComposition: true,
    ),
    ios: IOSInAppWebViewOptions(
      allowsInlineMediaPlayback: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('登录'),
        trailing: CupertinoButton(
          minSize: 0,
          padding: EdgeInsets.zero,
          child: const Text('导入'),
          onPressed: _onImport,
        ),
      ),
      resizeToAvoidBottomInset: true,
      child: SafeArea(
        child: Stack(
          children: [
            InAppWebView(
              key: webViewKey,
              initialOptions: options,
              onWebViewCreated: (controller) {
                webViewController = controller;
              },
              initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
              onLoadStart: (controller, url) {
                currentUri = url;
              },
              onLoadStop: (controller, url) {
                currentUri = url;
              },
              androidOnPermissionRequest:
                  (controller, origin, resources) async {
                return PermissionRequestResponse(
                    resources: resources,
                    action: PermissionRequestResponseAction.GRANT);
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
                            child: const Icon(CupertinoIcons.checkmark),
                            onPressed: _onImport,
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
                '将导入以下Cookies: \n ${cookies.map((c) => '${c.name}: ${c.value}').join('\n')}')
        .then((value) {
      if (value == true) {
        Navigator.of(context).pop(cookies);
      }
    });
  }

  Future<List<Cookie>> _getCookies() =>
      _cookieManager.getCookies(url: currentUri ?? Uri.base);
}
