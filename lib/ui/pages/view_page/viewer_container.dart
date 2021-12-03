import 'package:flutter/cupertino.dart';

abstract class SubViewer {}

class ViewContainer extends StatelessWidget {
  const ViewContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: true,
      navigationBar: CupertinoNavigationBar(
        middle: const Text('CatWeb'),
        leading: CupertinoButton(
          onPressed: () {},
          child: const Icon(CupertinoIcons.layers_alt),
          padding: EdgeInsets.zero,
          minSize: 0,
        ),
      ),
      child: const SafeArea(
        // TODO 子页面
        child: SizedBox(),
      ),
    );
  }
}
