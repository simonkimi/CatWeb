import 'package:flutter/material.dart';

const kDefaultNavBarBorderColor = Color(0x4D000000);
const kLightGrey = Color(0xfff2f3f5);
const kBottomBarHeight = 50.0;
const kCupertinoNavigatorBar = 44.0;
const kCupertinoTabBarHeight = 30.0;
const kSuggestInputHeight = 40.0;

const kDefaultNavBarBorder = Border(
  bottom: BorderSide(
    color: kDefaultNavBarBorderColor,
    width: 0.0, // 0.0 means one physical pixel
  ),
);

const kAppbarPadding = EdgeInsetsDirectional.only(start: 10, end: 10);

class Flag {
  // 忽略证书错误
  static const ignoreCertificate = 'ignoreCertificate';

  // 是否进行缓存 day不存在或者为0时为临时缓存, -1为永久缓存, 其他为时间缓存
  static final cache = RegExp(r'cache:?(?<day>-?\d*)');
}
