import 'package:flutter/cupertino.dart';

class ViewerListModel {
  ViewerListModel({
    this.title,
    this.subtitle,
    this.paper,
    this.star,
    this.tag,
    this.tagColor,
    this.page,
    this.uploadTime,
    this.badgeList,
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

  @override
  String toString() => 'title: $title,\n'
      'subtitle: $subtitle,\n'
      'badgeList: $badgeList,\n'
      'star: $star,\n'
      'tag: $tag,\n'
      'tagColor: $tagColor,\n'
      'page: $page,\n'
      'uploadTime: $uploadTime,\n'
      'paper: $paper';
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
