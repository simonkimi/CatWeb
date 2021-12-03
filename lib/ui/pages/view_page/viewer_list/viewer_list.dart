import 'package:catweb/data/controller/site_controller.dart';
import 'package:catweb/data/protocol/model/page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../viewer_container.dart';

class ViewerList extends GetView<SiteController> implements SubViewer {
  const ViewerList({
    Key? key,
    required this.model,
  }) : super(key: key);

  final SitePageModel model;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
