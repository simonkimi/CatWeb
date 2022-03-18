import 'package:flutter/cupertino.dart';

import 'image_controller.dart';

class ImageViewer extends StatefulWidget {
  const ImageViewer({
    Key? key,
    required this.model,
  }) : super(key: key);

  final ReaderImageLoader model;

  @override
  _ImageViewerState createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
