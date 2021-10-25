import 'dart:core' as core;
import 'dart:core';
import 'dart:math' as math;
import 'dart:ui';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

extension IterableUtils<T> on Iterable<T> {
  T? get(bool Function(T e) test) {
    for (final e in this) {
      if (test(e)) return e;
    }
    return null;
  }
}

extension ListHelper<T> on List<T> {
  T random() {
    return this[math.Random().nextInt(length)];
  }

  T? index(int index) {
    if (length < index && index >= 0) {
      return this[index]!;
    }
    return null;
  }

  List<T> addIfNotExist(Iterable<T> other) {
    addAll(other.where((e) => !contains(e)));
    return this;
  }

  T lastAt(int index) {
    return this[length - index];
  }
}

extension ColorHelper on Color {
  MaterialColor get swatch => Colors.primaries.firstWhere(
        (Color c) => c.value == value,
        orElse: () => _swatch,
      );

  MaterialColor get _swatch => MaterialColor(value, getMaterialColorValues);

  Map<int, Color> get getMaterialColorValues => <int, Color>{
        50: _swatchShade(50),
        100: _swatchShade(100),
        200: _swatchShade(200),
        300: _swatchShade(300),
        400: _swatchShade(400),
        500: _swatchShade(500),
        600: _swatchShade(600),
        700: _swatchShade(700),
        800: _swatchShade(800),
        900: _swatchShade(900),
      };

  bool isDark() => red * 0.299 + green * 0.578 + blue * 0.114 <= 192;

  Color _swatchShade(int swatchValue) => HSLColor.fromColor(this)
      .withLightness(1 - (swatchValue / 1000))
      .toColor();
}

extension AnimationControllerHelper on AnimationController {
  void byValue(bool display) {
    if (display && atEnd) reverse();
    if (!display && atStart) forward();
  }

  void play(bool isForward) {
    if (isForward) {
      forward();
    } else {
      reverse();
    }
  }

  bool get atStart => value == 0.0;

  bool get atEnd => value == 1.0;
}

RxString sobs(String? str) => str?.obs ?? ''.obs;

RxList<T> lobs<T, E>(core.Iterable<E>? pb, T Function(E e) func) =>
    pb?.map((E e) => func(e)).toList().obs ?? <T>[].obs;
