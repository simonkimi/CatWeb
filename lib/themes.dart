import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:catweb/i18n.dart';

bool isDarkMode([BuildContext? context]) =>
    MediaQuery.of(context ?? I.context).platformBrightness == Brightness.dark;

Color labelColor(BuildContext context) => isDarkMode(context)
    ? CupertinoColors.label.darkColor
    : CupertinoColors.label.color;

Color secondaryLabelColor(BuildContext context) => isDarkMode(context)
    ? CupertinoColors.secondaryLabel.darkColor
    : CupertinoColors.secondaryLabel.color;

Color systemGrey6(BuildContext context) => isDarkMode(context)
    ? CupertinoColors.systemGrey6.darkColor
    : CupertinoColors.systemGrey6.color;

Color systemBackground(BuildContext context) => isDarkMode(context)
    ? CupertinoColors.systemBackground.darkColor
    : CupertinoColors.systemBackground.color;