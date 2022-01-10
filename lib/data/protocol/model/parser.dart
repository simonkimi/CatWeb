import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/data/protocol/model/selector.dart';
import 'package:catweb/gen/protobuf/parser.pbserver.dart';
import 'package:catweb/gen/protobuf/selector.pbserver.dart';
import 'package:catweb/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'interface.dart';

enum ParserType {
  listParser,
  galleryParser,
  imageParser,
}

abstract class ParserBaseModel implements PbAble {
  ParserBaseModel(
      {required this.name, required this.uuid, Iterable<ExtraSelector>? extra})
      : extraSelectorModel =
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
  ParserType get type => ParserType.imageParser;
}

class GalleryParserModel extends ParserBaseModel {
  GalleryParserModel([GalleryParser? pb])
      : title = SelectorModel(pb?.title),
        subtitle = SelectorModel(pb?.subtitle),
        uploadTime = SelectorModel(pb?.uploadTime),
        star = SelectorModel(pb?.star, true),
        imgCount = SelectorModel(pb?.imgCount, true),
        pageCount = SelectorModel(pb?.pageCount, true),
        language = SelectorModel(pb?.language),
        coverImg = ImageSelectorModel(pb?.coverImg),
        thumbnailSelector = SelectorModel(pb?.thumbnailSelector),
        description = SelectorModel(pb?.description),
        thumbnail = ImageSelectorModel(pb?.thumbnail),
        thumbnailUrl = SelectorModel(pb?.thumbnailUrl),
        commentSelector = SelectorModel(pb?.commentSelector),
        comments = CommentSelectorModel(pb?.comments),
        tag = SelectorModel(pb?.tag),
        tagColor = SelectorModel(pb?.tagColor),
        badgeSelector = SelectorModel(pb?.badgeSelector),
        badgeText = SelectorModel(pb?.badgeText),
        badgeColor = SelectorModel(pb?.badgeColor),
        badgeType = SelectorModel(pb?.badgeType),
        chapterSelector = SelectorModel(pb?.chapterSelector),
        chapterTitle = SelectorModel(pb?.chapterTitle),
        chapterSubtitle = SelectorModel(pb?.chapterSubtitle),
        chapterCover = ImageSelectorModel(pb?.chapterCover),
        nextPage = SelectorModel(pb?.nextPage),
        prePageImageCount = SelectorModel(pb?.prePageImageCount),
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
  final SelectorModel thumbnailUrl;

  // 评论
  final SelectorModel commentSelector;
  final CommentSelectorModel comments;

  // Tag
  final SelectorModel tag;
  final SelectorModel tagColor;

  // 徽章
  final SelectorModel badgeSelector;
  final SelectorModel badgeText;
  final SelectorModel badgeColor;
  final SelectorModel badgeType;

  // 章节
  final SelectorModel chapterSelector;
  final SelectorModel chapterTitle;
  final SelectorModel chapterSubtitle;
  final ImageSelectorModel chapterCover;

  final SelectorModel nextPage;
  final SelectorModel prePageImageCount;

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
        thumbnailUrl: thumbnailUrl.toPb(),

        // 评论
        commentSelector: commentSelector.toPb(),
        comments: comments.toPb(),

        // Tag
        tag: tag.toPb(),
        tagColor: tagColor.toPb(),

        // 徽章
        badgeSelector: badgeSelector.toPb(),
        badgeText: badgeText.toPb(),
        badgeColor: badgeColor.toPb(),
        badgeType: badgeType.toPb(),

        // 章节
        chapterSelector: chapterSelector.toPb(),
        chapterTitle: chapterTitle.toPb(),
        chapterSubtitle: chapterSubtitle.toPb(),
        chapterCover: chapterCover.toPb(),

        extraSelector: extraSelectorModel.map((e) => e.toPb()),
        prePageImageCount: prePageImageCount.toPb(),
        nextPage: nextPage.toPb(),
      );

  @override
  ParserBaseModel copy() => GalleryParserModel(toPb());

  @override
  String displayType(BuildContext context) => '画廊解析器';

  @override
  ParserType get type => ParserType.galleryParser;
}

class ListViewParserModel extends ParserBaseModel {
  ListViewParserModel([ListViewParser? pb])
      : itemSelector = SelectorModel(pb?.itemSelector),
        title = SelectorModel(pb?.title),
        subtitle = SelectorModel(pb?.subtitle),
        uploadTime = SelectorModel(pb?.uploadTime),
        star = SelectorModel(pb?.star, true),
        imgCount = SelectorModel(pb?.imgCount, true),
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
  ParserType get type => ParserType.listParser;
}
