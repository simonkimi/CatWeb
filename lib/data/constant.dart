import 'package:flutter/material.dart';

const kDefaultNavBarBorderColor = Color(0x4D000000);
const kLightGrey = Color(0xfff2f3f5);
const kToolBarHeight = 40.0;
const kTabBarHeight = 30.0;
const kBottomBarHeight = 50.0;
const kCupertinoNavigatorBar = 40.0;
const kCupertinoTabBarHeight = 30.0;

const kDefaultNavBarBorder = Border(
  bottom: BorderSide(
    color: kDefaultNavBarBorderColor,
    width: 0.0, // 0.0 means one physical pixel
  ),
);

const kAppbarPadding = EdgeInsetsDirectional.only(start: 10, end: 10);
