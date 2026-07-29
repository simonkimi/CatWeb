import 'package:catweb/data/loading/resource_loader.dart';
import 'package:catweb/data/media/image_repository.dart';
import 'package:catweb/data/models/ffi/result/base.dart';
import 'package:catweb/ui/pages/view_page/image/controller/reader_load_notifier.dart';
import 'package:catweb/ui/widgets/cupertino_progress_bar.dart';
import 'package:catweb/ui/widgets/image_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

typedef ChildWidgetBuilder =
    Widget Function(BuildContext context, Widget child);

Widget _defaultChildBuilder(BuildContext context, Widget child) => child;

class ImageViewer extends StatelessWidget {
  const ImageViewer({
    super.key,
    required this.index,
    ChildWidgetBuilder? imageWrapBuilder,
  }) : imageWrapBuilder = imageWrapBuilder ?? _defaultChildBuilder;

  final int index;
  final ChildWidgetBuilder imageWrapBuilder;

  @override
  Widget build(BuildContext context) {
    final loader = context.read<ReaderLoaderNotifier>();
    final state = context.select(
      (ReaderLoaderNotifier notifier) => notifier.stateAt(index),
    );
    return switch (state) {
      ResourceIdle<ImageResult>() ||
      ResourceLoading<ImageResult>() => _buildLoading(),
      ResourceFailure<ImageResult>(:final failure) => _buildError(
        failure.error,
        () => loader.retry(index),
      ),
      ResourceSuccess<ImageResult>(:final value) => ImageLoader(
        repository: loader.readerInfo.previewRepository,
        model: value,
        variant: ImageResourceVariant.reader,
        enableHero: false,
        innerImageBuilder: imageWrapBuilder,
        loadingBuilder: (_, progress) => _buildLoading(progress),
        errorBuilder: (_, error, retry) => _buildError(error, retry),
      ),
    };
  }

  Widget _buildError(Object? error, VoidCallback retry) {
    return GestureDetector(
      onTap: retry,
      child: _buildCenterColumn([
        _buildIndexText(),
        const SizedBox(height: 50),
        Text(
          '貌似出了点问题: ${error.toString()}',
          maxLines: 10,
          style: const TextStyle(color: CupertinoColors.white),
        ),
      ]),
    );
  }

  Widget _buildLoading([double? progress]) {
    return _buildCenterColumn([
      _buildIndexText(),
      const SizedBox(height: 50),
      if (progress == null)
        const CupertinoInfProgress()
      else
        CupertinoProgress(progress: progress),
    ]);
  }

  Widget _buildIndexText() {
    return Text(
      '${index + 1}',
      style: const TextStyle(
        color: CupertinoColors.white,
        fontSize: 60,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildCenterColumn(List<Widget> children) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }
}
