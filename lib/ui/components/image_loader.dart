import 'dart:typed_data';

import 'package:catweb/network/client/image_loader.dart';
import 'package:flutter/cupertino.dart';

typedef ImageWidgetBuilder = Widget Function(
  BuildContext context,
  Uint8List imgData,
);

typedef LoadingWidgetBuilder = Widget Function(
  BuildContext context,
  double progress,
);

typedef ErrorBuilder = Widget Function(
  BuildContext context,
  Object? err,
  Function reload,
);

class ImageLoader extends StatefulWidget {
  const ImageLoader({
    Key? key,
    required this.concurrency,
    required this.model,
  }) : super(key: key);

  final ImageConcurrency concurrency;
  final ImageModel model;

  @override
  _ImageLoaderState createState() => _ImageLoaderState();
}

class _ImageLoaderState extends State<ImageLoader> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
