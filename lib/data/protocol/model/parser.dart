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

abstract class ParserBaseModel implements PbAble, CombineSelector {
  ParserBaseModel({required this.name, Iterable<ExtraSelector>? extra})
      : extraSelectorModel =
            lobs(extra, (ExtraSelector e) => ExtraSelectorModel(e));

  final RxString name;

  // 额外信息
  final RxList<ExtraSelectorModel> extraSelectorModel;

  String displayType(BuildContext context);

  ParserBaseModel copy();

  ParserType get type;
}

class ImageParserModel extends ParserBaseModel {
  ImageParserModel([ImageParser? pb])
      : image = ImageSelectorModel(pb?.image),
        rawImage = sobs(pb?.rawImage),
        super(
          name: sobs(pb?.name),
          extra: pb?.extraSelector,
        );

  final ImageSelectorModel image;
  final RxString rawImage;

  @override
  String displayType(BuildContext context) => '图片查看';

  @override
  Map<String, SelectorModel> get combine => {};

  @override
  ImageParser toPb() => ImageParser(
        name: name.value,
        image: image.toPb(),
        rawImage: rawImage.value,
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
        subTitle = SelectorModel(pb?.subtitle),
        uploadTime = SelectorModel(pb?.uploadTime),
        star = SelectorModel(pb?.star, true),
        imgCount = SelectorModel(pb?.imgCount, true),
        prePageImg = SelectorModel(pb?.prePageImg, true),
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
        super(
          name: sobs(pb?.name),
          extra: pb?.extraSelector,
        );

  final SelectorModel title;
  final SelectorModel subTitle;
  final SelectorModel uploadTime;
  final SelectorModel star;
  final SelectorModel imgCount;
  final SelectorModel prePageImg;
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

  @override
  GalleryParser toPb() => GalleryParser(
        name: name.value,
        title: title.toPb(),
        subtitle: subTitle.toPb(),
        uploadTime: uploadTime.toPb(),
        star: star.toPb(),
        imgCount: imgCount.toPb(),
        prePageImg: prePageImg.toPb(),
        language: language.toPb(),
        coverImg: coverImg.toPb(),
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
        nextPage: nextPage.toPb(),
      );

  @override
  Map<String, SelectorModel> get combine => {
        'title': title,
        'subtitle': subTitle,
        'uploadTime': uploadTime,
        'star': star,
        'imgCount': imgCount,
        'prePageImg': prePageImg,
        'language': language,
        ...coverImg.combine(prefix: 'cover'),
        'description': description,
        'thumbnailSelector': thumbnailSelector,
        ...thumbnail.combine(prefix: 'thumbnail'),
        'thumbnailUrl': thumbnailUrl,
        'commentSelector': commentSelector,
        ...comments.combine,
        'tag': tag,
        'tagColor': tagColor,
        'badgeSelector': badgeSelector,
        'badgeText': badgeText,
        'badgeType': badgeType,
        'nextPage': nextPage,
      };

  @override
  ParserBaseModel copy() => GalleryParserModel(toPb());

  @override
  String displayType(BuildContext context) => '画廊解析器';

  @override
  ParserType get type => ParserType.galleryParser;
}

class ListViewParserModel extends ParserBaseModel {
  ListViewParserModel([ListViewParser? pb])
      : itemSelector = sobs(pb?.itemSelector),
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
        super(
          name: sobs(pb?.name),
          extra: pb?.extraSelector,
        );

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

  @override
  Map<String, SelectorModel> get combine => {};

  @override
  String displayType(BuildContext context) => '列表解析器';

  @override
  ListViewParserModel copy() => ListViewParserModel(toPb());

  @override
  ParserType get type => ParserType.listParser;
}
