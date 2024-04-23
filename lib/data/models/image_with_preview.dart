import 'package:catweb/data/controller/site.dart';
import 'package:catweb/data/models/ffi/result/base.dart';
import 'package:catweb/data/models/ffi/result/result.dart';
import 'package:catweb/data/models/site/page.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/get.dart';
import 'package:catweb/ui/pages/view_page/viewer_subpage/image/image_provider.dart';
import 'package:flutter/widgets.dart';

import 'package:catweb/data/loaders/load_more_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 一个图片, 只包含预览图, 大图需要额外加载
abstract class ImageWithPreviewModel<T>
    extends AsyncNotifier<ImageReaderResult?> implements LoadMoreItem<T> {
  ImageWithPreviewModel();

  ImageResult? get previewImage;

  /// 从初始
  String? get idCode;

  /// 大图的数据
  ValueNotifier<ImageReaderResult?> imageModel =
      ValueNotifier<ImageReaderResult?>(null);
  ValueNotifier<DioImageProvider?> imageProvider =
      ValueNotifier<DioImageProvider?>(null);

  Future<void> load({
    required SitePage blueprint,
    required SiteEnvStore localEnv,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final url = blueprint.url.isEmpty ? idCode! : blueprint.url;
      final site = inject(siteProvider);
      return site!.client.getReadImage(
        url: url,
        model: blueprint,
        localEnv: localEnv,
      );
    });
  }
}
