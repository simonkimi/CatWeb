import 'package:flutter/cupertino.dart';

class GalleryDetailModel {
  GalleryDetailModel({
    this.title,
    this.subtitle,
    this.tag,
    this.tagColor,
    this.language,
    this.imageCount,
    this.uploadTime,
    required this.badgeList,
    this.commentList,
    this.prePageImageCount,
    this.description,
    this.star,
  });

  final String? title;
  final String? subtitle;
  final String? tag;
  final Color? tagColor;
  final String? language;
  final int? imageCount;
  final String? uploadTime;
  final List<BadgeModel> badgeList;
  final int? prePageImageCount;
  final String? description;
  final double? star;

  final List<CommentItemModel>? commentList;
}

class BadgeModel {
  BadgeModel({this.text, this.category});

  final String? text;
  final String? category;
}

class CommentItemModel {
  CommentItemModel({
    this.username,
    this.comment,
    this.commentTime,
    this.score,
  });

  final String? username;
  final String? comment;
  final String? commentTime;
  final int? score;
}
