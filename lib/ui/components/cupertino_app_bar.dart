import 'dart:ui';

import 'package:catweb/ui/components/tab_bar.dart';
import 'package:catweb/ui/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'grey_tab_indicator.dart';

const kCupertinoNavigatorBar = 40.0;
const kCupertinoTabBarHeight = 30.0;

class CupertinoAppBar extends StatefulWidget {
  const CupertinoAppBar({
    Key? key,
    required this.title,
    required this.child,
    this.leading,
    this.actions,
    this.backgroundColor,
    this.tabs,
    this.tabController,
  }) : super(key: key);

  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final List<CupertinoTab>? tabs;
  final Widget child;
  final TabController? tabController;

  @override
  _CupertinoAppBarState createState() => _CupertinoAppBarState();
}

class _CupertinoAppBarState extends State<CupertinoAppBar>
    with TickerProviderStateMixin {
  late final _translateController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 800),
  );

  late final _translateAnimation = CurvedAnimation(
    parent: _translateController,
    curve: Curves.linear,
  );

  double _lastPixel = 0.0;

  void _setTranslateCurve(Curve curve) {
    _translateAnimation.curve = curve;
  }

  void _fastReverse() {
    _setTranslateCurve(Curves.easeInOutCubic);
    _translateController.duration = const Duration(milliseconds: 200);
    _translateController.reverse();
    _translateController.duration = const Duration(seconds: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildChild(context),
        SlideTransition(
          position: Tween(
            begin: Offset.zero,
            end: const Offset(0.0, -1.0),
          ).animate(_translateAnimation),
          child: _buildNavigationBar(context),
        ),
      ],
    );
  }

  Widget _buildChild(BuildContext context) {
    return NotificationListener(
      onNotification: (AppBarScrollNotification notification) {
        final pixel = notification.metrics.pixels;
        final didReleasePointer = pixel == _lastPixel;

        if (didReleasePointer) {
          _setTranslateCurve(Curves.easeInOutCubic);
          final hide = pixel > 0.0 && _translateController.value > 0.5;
          hide
              ? _translateController.forward()
              : _translateController.reverse();
        } else {
          _setTranslateCurve(Curves.linear);
          final delta = pixel - _lastPixel;
          _translateController.value += delta /
              (kCupertinoNavigatorBar +
                  kCupertinoTabBarHeight +
                  MediaQuery.of(context).padding.top);
          _lastPixel = pixel;
        }

        _lastPixel = pixel;
        return false;
      },
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is AppBarScrollNotification) return true;
          _fastReverse();
          return false;
        },
        child: widget.child,
      ),
    );
  }

  Widget _buildNavigationBar(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 5.0,
          sigmaY: 5.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            border: const Border(
              bottom: BorderSide(
                color: CupertinoColors.lightBackgroundGray,
                width: 0.0,
              ),
            ),
            color: widget.backgroundColor ??
                FixColor.navigationBarBackground.resolveFrom(context),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top),
              SizedBox(
                height: kCupertinoNavigatorBar,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [if (widget.leading != null) widget.leading!],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            widget.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: widget.actions ?? <Widget>[],
                      ),
                    ),
                  ],
                ),
              ),
              if (widget.tabs != null && widget.tabs!.length > 1)
                SizedBox(
                  height: kCupertinoTabBarHeight,
                  child: Material(
                    color: const Color(0x00000000),
                    child: TabBar(
                      isScrollable: true,
                      controller: widget.tabController,
                      indicator: const GreyUnderlineTabIndicator(),
                      tabs: widget.tabs!,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppBarScrollNotification extends ScrollNotification {
  AppBarScrollNotification({
    required BuildContext context,
    required ScrollMetrics metrics,
  }) : super(context: context, metrics: metrics);
}
