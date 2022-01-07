import 'package:catweb/data/models/site_env_model.dart';
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

  @override
  String toString() => 'title: $title\n'
      'subtitle: $subtitle\n'
      'tag: $tag\n'
      'tagColor: $tagColor\n'
      'language: $language\n'
      'imageCount: $imageCount\n'
      'uploadTime: $uploadTime\n'
      'badgeList: $badgeList\n'
      'prePageImageCount: $prePageImageCount\n'
      'description: $description\n'
      'star: $star\n'
      'commentList: $commentList\n';
}

class BadgeModel implements HasEnv {
  BadgeModel({
    this.text,
    this.category,
    SiteEnvModel? env,
  }) : envModel = env ?? SiteEnvModel();

  final String? text;
  final String? category;

  @override
  final SiteEnvModel envModel;

  @override
  String toString() =>
      '<BadgeModel> ${category != null ? '$category: ' : ''} $text';
}

class CommentItemModel implements HasEnv {
  CommentItemModel({
    SiteEnvModel? env,
    this.username,
    this.comment,
    this.commentTime,
    this.score,
  }) : envModel = env ?? SiteEnvModel();

  final String? username;
  final String? comment;
  final String? commentTime;
  final int? score;

  @override
  final SiteEnvModel envModel;

  @override
  String toString() => '<Comment> $username $comment $score';
}
