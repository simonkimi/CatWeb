import 'package:catweb/data/protocol/model/selector.dart';
import 'package:catweb/gen/protobuf/parser.pbserver.dart';
import 'package:catweb/gen/protobuf/selector.pbserver.dart';
import 'package:catweb/utils/utils.dart';
import 'package:get/get.dart';

import 'interface.dart';

enum ParserType {
  list,
  gallery,
}

abstract class ParserBaseModel implements PbAble {
  ParserBaseModel(Iterable<ExtraSelector>? pb)
      : extraSelectorModel =
            lobs(pb, (ExtraSelector e) => ExtraSelectorModel(e));

  // 额外信息
  final RxList<ExtraSelectorModel> extraSelectorModel;
}

class GalleryParserModel extends ParserBaseModel {
  GalleryParserModel([GalleryParser? pb])
      : name = sobs(pb?.name),
        title = SelectorModel(pb?.title),
        subTitle = SelectorModel(pb?.subtitle),
        uploadTime = SelectorModel(pb?.uploadTime),
        star = SelectorModel(pb?.star, true),
        imgCount = SelectorModel(pb?.imgCount, true),
        prePageImg = SelectorModel(pb?.prePageImg, true),
        favoriteCount = SelectorModel(pb?.favoriteCount),
        language = SelectorModel(pb?.language),
        coverImg = ImageSelectorModel(pb?.coverImg),
        description = SelectorModel(pb?.description),
        thumbnail = ImageSelectorModel(pb?.thumbnail),
        thumbnailUrl = SelectorModel(pb?.thumbnailUrl),
        comments = CommentSelectorModel(pb?.comments),
        tag = SelectorModel(pb?.tag),
        tagColor = SelectorModel(pb?.tagColor),
        badgeText = SelectorModel(pb?.badgeText),
        badgeColor = SelectorModel(pb?.badgeColor),
        badgeType = SelectorModel(pb?.badgeType),
        nextPage = SelectorModel(pb?.nextPage),
        super(pb?.extraSelector);

  final RxString name;

  final SelectorModel title;
  final SelectorModel subTitle;
  final SelectorModel uploadTime;
  final SelectorModel star;
  final SelectorModel imgCount;
  final SelectorModel prePageImg;
  final SelectorModel favoriteCount;
  final SelectorModel language;
  final ImageSelectorModel coverImg;
  final SelectorModel description;

  final ImageSelectorModel thumbnail;
  final SelectorModel thumbnailUrl;

  final CommentSelectorModel comments;

  final SelectorModel tag;
  final SelectorModel tagColor;

  final SelectorModel badgeText;
  final SelectorModel badgeColor;
  final SelectorModel badgeType;

  final SelectorModel nextPage;

  @override
  GalleryParser toPb() => GalleryParser(
        name: name.value,
        title: title.toPb(),
        subtitle: subTitle.toPb(),
        uploadTime: uploadTime.toPb(),
        star: star.toPb(),
        imgCount: imgCount.toPb(),
        prePageImg: prePageImg.toPb(),
        favoriteCount: favoriteCount.toPb(),
        language: language.toPb(),
        coverImg: coverImg.toPb(),
        description: description.toPb(),
        thumbnail: thumbnail.toPb(),
        thumbnailUrl: thumbnailUrl.toPb(),
        comments: comments.toPb(),
        tag: tag.toPb(),
        tagColor: tagColor.toPb(),
        badgeText: badgeText.toPb(),
        badgeColor: badgeColor.toPb(),
        badgeType: badgeType.toPb(),
        extraSelector: extraSelectorModel.map((e) => e.toPb()),
        nextPage: nextPage.toPb(),
      );
}

class ListViewParserModel extends ParserBaseModel {
  ListViewParserModel([ListViewParser? pb])
      : name = sobs(pb?.name),
        itemSelector = sobs(pb?.itemSelector),
        title = SelectorModel(pb?.title),
        subtitle = SelectorModel(pb?.subtitle),
        uploadTime = SelectorModel(pb?.uploadTime),
        star = SelectorModel(pb?.star, true),
        imgCount = SelectorModel(pb?.imgCount, true),
        previewImg = ImageSelectorModel(pb?.previewImg),
        tag = SelectorModel(pb?.imgCount),
        tagColor = SelectorModel(pb?.imgCount),
        badgeText = SelectorModel(pb?.badgeText),
        badgeColor = SelectorModel(pb?.badgeColor),
        nextPage = SelectorModel(pb?.nextPage),
        super(pb?.extraSelector);

  final RxString name;

  // 列表选择器
  final RxString itemSelector;

  // 基础信息
  final SelectorModel title;
  final SelectorModel subtitle;
  final SelectorModel uploadTime;
  final SelectorModel star;
  final SelectorModel imgCount;

  // 预览图片
  final ImageSelectorModel previewImg;

  // 大Tag
  final SelectorModel tag;
  final SelectorModel tagColor;

  // 小徽章
  final SelectorModel badgeText;
  final SelectorModel badgeColor;

  // 下一页
  final SelectorModel nextPage;

  @override
  ListViewParser toPb() => ListViewParser(
        name: name.value,
        itemSelector: itemSelector.value,
        title: title.toPb(),
        subtitle: subtitle.toPb(),
        uploadTime: uploadTime.toPb(),
        star: star.toPb(),
        imgCount: imgCount.toPb(),
        previewImg: previewImg.toPb(),
        tag: tag.toPb(),
        tagColor: tagColor.toPb(),
        badgeText: badgeText.toPb(),
        badgeColor: badgeColor.toPb(),
        extraSelector: extraSelectorModel.map((e) => e.toPb()),
        nextPage: nextPage.toPb(),
      );
}
