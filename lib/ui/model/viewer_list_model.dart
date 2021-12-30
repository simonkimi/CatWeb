import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/network/client/image_loader.dart';
import 'package:flutter/cupertino.dart';

class ViewerListModel implements HasEnv {
  ViewerListModel({
    required this.envModel,
    this.title,
    this.subtitle,
    this.paper,
    this.star,
    this.tag,
    this.tagColor,
    this.page,
    this.uploadTime,
    this.badgeList,
    this.previewImage,
    this.idCode,
  });

  final String? title;
  final String? subtitle;
  final List<BadgeList>? badgeList;
  final double? star;
  final String? tag;
  final Color? tagColor;
  final int? page;
  final String? uploadTime;
  final String? paper;
  final ImageModel? previewImage;
  final String? idCode;

  @override
  final SiteEnvModel envModel;

  @override
  String toString() => 'idCode: $idCode\n'
      'title: $title,\n'
      'subtitle: $subtitle,\n'
      'badgeList: $badgeList,\n'
      'star: $star,\n'
      'tag: $tag,\n'
      'tagColor: $tagColor,\n'
      'page: $page,\n'
      'uploadTime: $uploadTime,\n'
      'paper: $paper\n'
      'img: $previewImage';
}

class BadgeList {
  BadgeList({
    this.text,
    this.color,
  });

  final Color? color;
  final String? text;

  @override
  String toString() => '<${color ?? ''}$text>';
}
