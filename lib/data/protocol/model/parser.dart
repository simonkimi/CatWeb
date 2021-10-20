import 'package:cat_web/data/protocol/model/selector.dart';
import 'package:cat_web/gen/protobuf/parser.pbserver.dart';
import 'package:cat_web/gen/protobuf/selector.pbserver.dart';
import 'package:get/get.dart';

abstract class ParserBaseModel {
  ParserBaseModel(Iterable<ExtraSelector>? pb)
      : extraSelectorModel =
            pb?.map((e) => ExtraSelectorModel(e)).toList().obs ??
                <ExtraSelectorModel>[].obs;

  // 额外信息
  final RxList<ExtraSelectorModel> extraSelectorModel;
}

class ListViewParserModel extends ParserBaseModel {
  ListViewParserModel([ListViewParser? pb])
      : name = pb?.name.obs ?? ''.obs,
        itemSelector = pb?.itemSelector.obs ?? ''.obs,
        title = SelectorModel(pb?.title),
        subtitle = SelectorModel(pb?.subtitle),
        uploadTIme = SelectorModel(pb?.uploadTIme),
        star = SelectorModel(pb?.star),
        imgCount = SelectorModel(pb?.imgCount),
        previewImg = ImageSelectorModel(pb?.previewImg),
        tag = SelectorModel(pb?.imgCount),
        tagColor = SelectorModel(pb?.imgCount),
        badgeSelector = pb?.badgeSelector.obs ?? ''.obs,
        badgeText = SelectorModel(pb?.badgeText),
        badgeColor = SelectorModel(pb?.badgeColor),
  super(pb?.extraSelector);

  final RxString name;

  // 列表选择器
  final RxString itemSelector;

  // 基础信息
  final SelectorModel title;
  final SelectorModel subtitle;
  final SelectorModel uploadTIme;
  final SelectorModel star;
  final SelectorModel imgCount;

  // 预览图片
  final ImageSelectorModel previewImg;

  // 大Tag
  final SelectorModel tag;
  final SelectorModel tagColor;

  // 小徽章
  final RxString badgeSelector;
  final SelectorModel badgeText;
  final SelectorModel badgeColor;

  ListViewParser toPb() => ListViewParser(
        name: name.value,
        itemSelector: itemSelector.value,
        title: title.toPb(),
        subtitle: subtitle.toPb(),
        uploadTIme: uploadTIme.toPb(),
        star: star.toPb(),
        imgCount: imgCount.toPb(),
        previewImg: previewImg.toPb(),
        tag: tag.toPb(),
        tagColor: tagColor.toPb(),
        badgeSelector: badgeSelector.value,
        badgeText: badgeText.toPb(),
        badgeColor: badgeColor.toPb(),
        extraSelector: extraSelectorModel.map((e) => e.toPb()),
      );
}
