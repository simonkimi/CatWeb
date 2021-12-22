import 'package:flutter/cupertino.dart';

class ExceptionSliver extends StatelessWidget {
  const ExceptionSliver({
    Key? key,
    this.errMsg,
    this.onRetry,
  }) : super(key: key);

  final String? errMsg;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: GestureDetector(
        onTap: onRetry,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Icon(CupertinoIcons.cloud_snow, size: 40),
            ),
            if (errMsg != null) Text(errMsg!),
          ],
        ),
      ),
    );
  }
}

class LoadingSliver extends StatelessWidget {
  const LoadingSliver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverFillRemaining(
      child: Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}
