import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/data/protocol/model/selector.dart';
import 'package:catweb/gen/protobuf/parser.pbserver.dart';
import 'package:catweb/gen/protobuf/selector.pbserver.dart';
import 'package:catweb/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'interface.dart';

abstract class ParserBaseModel implements PbAble {
  ParserBaseModel({
    required this.name,
    required this.uuid,
    Iterable<ExtraSelector>? extra,
  }) : extraSelectorModel =
            lobs(extra, (ExtraSelector e) => ExtraSelectorModel(e));

  final RxString name;
  final String uuid;

  // 额外信息
  final RxList<ExtraSelectorModel> extraSelectorModel;

  String displayType(BuildContext context);

  ParserBaseModel copy();

  ParserType get type;
}

class ImageParserModel extends ParserBaseModel {
  ImageParserModel([ImageParser? pb])
      : image = ImageSelectorModel(pb?.image),
        rawImage = SelectorModel(pb?.rawImage),
        largerImage = SelectorModel(pb?.largerImage),
        rating = SelectorModel(pb?.rating),
        score = SelectorModel(pb?.score),
        source = SelectorModel(pb?.source),
        uploadTime = SelectorModel(pb?.uploadTime),
        uploaderAvatar = ImageSelectorModel(pb?.uploaderAvatar),
        id = SelectorModel(pb?.id),
        super(
          name: sobs(pb?.name),
          extra: pb?.extraSelector,
          uuid: genUuid(pb?.uuid),
        );

  final SelectorModel id;
  final ImageSelectorModel image;
  final SelectorModel largerImage;
  final SelectorModel rawImage;
  final SelectorModel rating;
  final SelectorModel score;
  final SelectorModel source;
  final SelectorModel uploadTime;
  final ImageSelectorModel uploaderAvatar;

  @override
  String displayType(BuildContext context) => '图片查看';

  @override
  ImageParser toPb() => ImageParser(
        name: name.value,
        id: id.toPb(),
        uuid: uuid,
        image: image.toPb(),
        rawImage: rawImage.toPb(),
        largerImage: largerImage.toPb(),
        rating: rating.toPb(),
        score: score.toPb(),
        source: source.toPb(),
        uploadTime: uploadTime.toPb(),
        uploaderAvatar: uploaderAvatar.toPb(),
        extraSelector: extraSelectorModel.map((e) => e.toPb()),
      );

  @override
  ImageParserModel copy() => ImageParserModel(toPb());

  @override
  ParserType get type => ParserType.PARSER_TYPE_IMAGE;
}

class GalleryParserModel extends ParserBaseModel {
  GalleryParserModel([GalleryParser? pb])
      : title = SelectorModel(pb?.title),
        subtitle = SelectorModel(pb?.subtitle),
        uploadTime = SelectorModel(pb?.uploadTime),
        star = SelectorModel(pb?.star),
        imgCount = SelectorModel(pb?.imgCount),
        pageCount = SelectorModel(pb?.pageCount),
        language = SelectorModel(pb?.language),
        coverImg = ImageSelectorModel(pb?.coverImg),
        thumbnailSelector = SelectorModel(pb?.thumbnailSelector),
        description = SelectorModel(pb?.description),
        thumbnail = ImageSelectorModel(pb?.thumbnail),
        commentSelector = SelectorModel(pb?.commentSelector),
        comments = CommentSelectorModel(pb?.comment),
        tag = SelectorModel(pb?.tag),
        tagColor = SelectorModel(pb?.tagColor),
        badgeSelector = SelectorModel(pb?.badgeSelector),
        badgeText = SelectorModel(pb?.badgeText),
        badgeCategory = SelectorModel(pb?.badgeCategory),
        chapterSelector = SelectorModel(pb?.chapterSelector),
        chapterTitle = SelectorModel(pb?.chapterTitle),
        chapterSubtitle = SelectorModel(pb?.chapterSubtitle),
        chapterCover = ImageSelectorModel(pb?.chapterCover),
        nextPage = SelectorModel(pb?.nextPage),
        countPrePage = SelectorModel(pb?.countPrePage),
        super(
          name: sobs(pb?.name),
          extra: pb?.extraSelector,
          uuid: genUuid(pb?.uuid),
        );

  final SelectorModel title;
  final SelectorModel subtitle;
  final SelectorModel uploadTime;
  final SelectorModel star;
  final SelectorModel imgCount;
  final SelectorModel pageCount;
  final SelectorModel language;
  final ImageSelectorModel coverImg;
  final SelectorModel description;

  // 缩略图
  final SelectorModel thumbnailSelector;
  final ImageSelectorModel thumbnail;

  // 评论
  final SelectorModel commentSelector;
  final CommentSelectorModel comments;

  // Tag
  final SelectorModel tag;
  final SelectorModel tagColor;

  // 徽章
  final SelectorModel badgeSelector;
  final SelectorModel badgeText;
  final SelectorModel badgeCategory;

  // 章节
  final SelectorModel chapterSelector;
  final SelectorModel chapterTitle;
  final SelectorModel chapterSubtitle;
  final ImageSelectorModel chapterCover;

  final SelectorModel nextPage;
  final SelectorModel countPrePage;

  @override
  GalleryParser toPb() => GalleryParser(
        name: name.value,
        uuid: uuid,
        title: title.toPb(),
        subtitle: subtitle.toPb(),
        uploadTime: uploadTime.toPb(),
        star: star.toPb(),
        imgCount: imgCount.toPb(),
        language: language.toPb(),
        coverImg: coverImg.toPb(),
        pageCount: pageCount.toPb(),
        description: description.toPb(),

        // 缩略图
        thumbnailSelector: thumbnailSelector.toPb(),
        thumbnail: thumbnail.toPb(),

        // 评论
        commentSelector: commentSelector.toPb(),
        comment: comments.toPb(),

        // Tag
        tag: tag.toPb(),
        tagColor: tagColor.toPb(),

        // 徽章
        badgeSelector: badgeSelector.toPb(),
        badgeText: badgeText.toPb(),
        badgeCategory: badgeCategory.toPb(),

        // 章节
        chapterSelector: chapterSelector.toPb(),
        chapterTitle: chapterTitle.toPb(),
        chapterSubtitle: chapterSubtitle.toPb(),
        chapterCover: chapterCover.toPb(),

        extraSelector: extraSelectorModel.map((e) => e.toPb()),
        countPrePage: countPrePage.toPb(),
        nextPage: nextPage.toPb(),
      );

  @override
  ParserBaseModel copy() => GalleryParserModel(toPb());

  @override
  String displayType(BuildContext context) => '画廊解析器';

  @override
  ParserType get type => ParserType.PARSER_TYPE_GALLERY;
}

class ListViewParserModel extends ParserBaseModel {
  ListViewParserModel([ListViewParser? pb])
      : itemSelector = SelectorModel(pb?.itemSelector),
        title = SelectorModel(pb?.title),
        subtitle = SelectorModel(pb?.subtitle),
        uploadTime = SelectorModel(pb?.uploadTime),
        star = SelectorModel(pb?.star),
        imgCount = SelectorModel(pb?.imgCount),
        language = SelectorModel(pb?.language),
        previewImg = ImageSelectorModel(pb?.previewImg),
        tag = SelectorModel(pb?.tag),
        tagColor = SelectorModel(pb?.tagColor),
        badgeText = SelectorModel(pb?.badgeText),
        badgeColor = SelectorModel(pb?.badgeColor),
        nextPage = SelectorModel(pb?.nextPage),
        paper = SelectorModel(pb?.paper),
        badgeSelector = SelectorModel(pb?.badgeSelector),
        idCode = SelectorModel(pb?.idCode),
        super(
          name: sobs(pb?.name),
          extra: pb?.extraSelector,
          uuid: genUuid(pb?.uuid),
        );

  // 列表选择器
  final SelectorModel itemSelector;

  // 基础信息
  final SelectorModel title;
  final SelectorModel subtitle;
  final SelectorModel uploadTime;
  final SelectorModel star;
  final SelectorModel imgCount;
  final SelectorModel language;

  // 预览图片
  final ImageSelectorModel previewImg;

  // 大Tag
  final SelectorModel tag;
  final SelectorModel tagColor;

  // 小徽章
  final SelectorModel badgeSelector;
  final SelectorModel badgeText;
  final SelectorModel badgeColor;

  final SelectorModel paper;

  // 下一页
  final SelectorModel idCode;
  final SelectorModel nextPage;

  @override
  ListViewParser toPb() => ListViewParser(
        name: name.value,
        uuid: uuid,
        itemSelector: itemSelector.toPb(),
        title: title.toPb(),
        subtitle: subtitle.toPb(),
        uploadTime: uploadTime.toPb(),
        star: star.toPb(),
        imgCount: imgCount.toPb(),
        language: language.toPb(),
        previewImg: previewImg.toPb(),
        tag: tag.toPb(),
        tagColor: tagColor.toPb(),
        badgeText: badgeText.toPb(),
        badgeColor: badgeColor.toPb(),
        extraSelector: extraSelectorModel.map((e) => e.toPb()),
        nextPage: nextPage.toPb(),
        paper: paper.toPb(),
        badgeSelector: badgeSelector.toPb(),
        idCode: idCode.toPb(),
      );

  @override
  String displayType(BuildContext context) => '列表解析器';

  @override
  ListViewParserModel copy() => ListViewParserModel(toPb());

  @override
  ParserType get type => ParserType.PARSER_TYPE_LIST_VIEW;
}

class AutoCompleteParserModel extends ParserBaseModel implements PbAble {
  AutoCompleteParserModel([AutoCompleteParser? pb])
      : split = sobs(pb?.split),
        itemSelector = SelectorModel(pb?.itemSelector),
        itemTitle = SelectorModel(pb?.itemTitle),
        itemComplete = SelectorModel(pb?.itemComplete),
        itemSubtitle = SelectorModel(pb?.itemSubtitle),
        super(
          name: sobs(pb?.name),
          extra: pb?.extraSelector,
          uuid: genUuid(pb?.uuid),
        );

  final RxString split; // 分隔符, 默认为空格

  final SelectorModel itemSelector;
  final SelectorModel itemComplete;
  final SelectorModel itemTitle;
  final SelectorModel itemSubtitle;

  @override
  AutoCompleteParser toPb() => AutoCompleteParser(
        uuid: uuid,
        name: name.value,
        extraSelector: extraSelectorModel.map((e) => e.toPb()),
        itemComplete: itemComplete.toPb(),
        itemSelector: itemSelector.toPb(),
        itemSubtitle: itemSubtitle.toPb(),
        itemTitle: itemTitle.toPb(),
        split: split.value,
      );

  @override
  AutoCompleteParserModel copy() => AutoCompleteParserModel(toPb());

  @override
  String displayType(BuildContext context) => '搜索';

  @override
  ParserType get type => throw UnimplementedError();
}
