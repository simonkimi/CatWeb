import 'package:catweb/data/controller/site_controller.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/gen/protobuf/model.pbserver.dart';
import 'package:catweb/network/client/image_loader.dart';
import 'package:catweb/utils/handle.dart';
import 'package:catweb/utils/state_mixin.dart';
import 'package:get/get.dart';

enum ImageContainerState {
  waiting, // 等待加载
  loading, // 加载中
  finish, // 加载完成
  error, // 加载失败
}

abstract class ReaderInfo<T> {
  int? get pageCount; // 总面数

  // 第一个T是原类型, 要转换为数据
  TransmissionBufferStream<T, Map<int, String?>> get bufferStream;

  Future<void> requestLoadPage(int page);

  Future<void> requestLoadIndex(int index, [RxBool isStop]);
}

class ReaderImageLoader with LoadStateMixin {
  ReaderImageLoader({
    required this.index,
    required this.requestLoadIdCode,
    required this.localEnv,
    required this.blueprint,
    this.idCode,
  });

  final String? idCode; // 图片的id, 有可能还没有获取, 所以可空
  final int index; // 图片的index, 这个是可以确定的
  final Future<void> Function(int index) requestLoadIdCode;
  final SiteEnvModel localEnv;
  final PageBlueprintModel blueprint;
  ImageReaderRpcModel? model;

  final global = Get.find<GlobalController>();

  // 阅读器想要加载数据的时候, 调用此函数
  Future<void> requestLoadIndex(bool isAuto) async {
    if (model != null) return;
    loadStart();
    try {
      if (idCode == null) {
        // 如果idCode为空时, 应该要求加载, 传到上级进行判断
        await requestLoadIdCode(index);
        if (idCode == null) return; // 如果idCode还为空的话, 返回 TODO: 错误提示
      }

      // 加载好数据后, 开始由idCode拿数据
      final url = blueprint.url.isEmpty ? idCode! : blueprint.url.value;
      final env = localEnv.clone()..set('idCode', idCode!);

      model = await global.website.client.getReadImage(
        url: url,
        model: blueprint,
        localEnv: env,
      );
    } on Exception catch (e) {
      loadError(e);
    }
    loadComplete();
  }
}

class ImageReaderController {
  ImageReaderController({
    required this.readerInfo,
    required this.localEnv,
    required this.blueprint,
  }) {
    _updateIdCode(readerInfo.bufferStream.buffer);
    readerInfo.bufferStream.listen(_updateIdCode);
  }

  final ReaderInfo readerInfo;
  final PageBlueprintModel blueprint;

  final global = Get.find<GlobalController>();
  final SiteEnvModel localEnv;

  // 从上级菜单传过来的列表, 其中包含了idCode
  final RxMap<int, String?> imageIdCode = <int, String?>{}.obs;

  // 图片所在的html获取结果, 相同String共享一个ReaderImageLoader
  final imageContainerMap = <String, ReaderImageLoader>{};

  // 图片储存数据, 相同的url公用一个ImageLoadModel
  final imageMap = <String, ImageLoadModel>{};

  void _updateIdCode(Map<int, String?> items) {
    for (final item in items.entries) {
      if (imageIdCode[item.key] == null && item.value != null) {
        imageIdCode[item.key] = item.value;
      }
    }
  }
}
