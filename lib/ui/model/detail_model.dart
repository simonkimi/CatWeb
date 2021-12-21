import 'package:flutter/cupertino.dart';

class GalleryDetailModel {
  GalleryDetailModel({
    this.title,
    this.subtitle,
    this.category,
    this.categoryColor,
    this.language,
    this.imageCount,
    this.size,
    this.favoriteCount,
    this.uploadTime,
    this.tagList,
    this.commentList,
    this.prePageImageCount,
    this.description,
    this.star,
  });

  final String? title;
  final String? subtitle;
  final String? category;
  final Color? categoryColor;
  final String? language;
  final int? imageCount;
  final String? size;
  final int? favoriteCount;
  final String? uploadTime;
  final List<TagModel>? tagList;
  final int? prePageImageCount;
  final String? description;
  final double? star;

  final List<CommentItemModel>? commentList;
}

class TagModel {
  TagModel({required this.text, this.category});

  final String text;
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
