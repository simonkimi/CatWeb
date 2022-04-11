import 'package:catweb/ui/components/dialog.dart';
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
      ));

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('登录'),
        trailing: CupertinoButton(
          minSize: 0,
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.checkmark),
          onPressed: () async {
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
          },
        ),
      ),
      child: InAppWebView(
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
        androidOnPermissionRequest: (controller, origin, resources) async {
          return PermissionRequestResponse(
              resources: resources,
              action: PermissionRequestResponseAction.GRANT);
        },
      ),
    );
  }

  Future<List<Cookie>> _getCookies() =>
      _cookieManager.getCookies(url: currentUri ?? Uri.base);
}
