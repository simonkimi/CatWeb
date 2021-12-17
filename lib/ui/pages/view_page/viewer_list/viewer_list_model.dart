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
}

class BadgeList {
  BadgeList({
    required this.text,
    this.color,
  });

  final Color? color;
  final String text;
}
