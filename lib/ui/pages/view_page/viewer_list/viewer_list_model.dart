import 'package:flutter/cupertino.dart';

class ViewerListModel {
  ViewerListModel({
    this.title,
    this.subtitle,
    this.tagList,
    this.star,
    this.category,
    this.categoryColor,
    this.page,
    this.uploadTime,
    this.badge,
  });

  final String? title;
  final String? subtitle;
  final List<ListTag>? tagList;
  final double? star;
  final String? category;
  final Color? categoryColor;
  final int? page;
  final String? uploadTime;
  final String? badge;
}

class ListTag {
  ListTag({
    this.color,
    required this.text,
  });

  final Color? color;
  final String text;
}
