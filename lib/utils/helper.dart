import 'dart:core' as core;
import 'dart:core';
import 'dart:math' as math;
import 'package:catweb/data/controller/site_service.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

extension IterableUtils<T> on Iterable<T> {
  T? get(bool Function(T e) test) {
    for (final e in this) {
      if (test(e)) return e;
    }
    return null;
  }

  Iterable<T> replace(int index, T newValue) sync* {
    final iter = iterator;
    var i = 0;
    while (iter.moveNext()) {
      if (i == index) {
        yield newValue;
      } else {
        yield iter.current;
      }
      i++;
    }
  }
}

extension DoubleUtils on num {
  T nearList<T extends num>(List<T> nums) {
    return nums.reduce((value, element) =>
        (this - value).abs() < (this - element).abs() ? value : element);
  }
}

extension ListUtils<T> on List<T> {
  T random() {
    return this[math.Random().nextInt(length)];
  }

  bool has(int index) => length > index && index >= 0;

  T? index(int index) {
    return has(index) ? this[index] : null;
  }

  List<T> addIfNotExist(Iterable<T> other) {
    addAll(other.where((e) => !contains(e)));
    return this;
  }

  T lastAt(int index) {
    return this[length - index];
  }

  Iterable<T> getSuccessive(int Function(T e) getKey) sync* {
    if (isNotEmpty) {
      final minIndex = getKey(this[0]);
      for (var i = 0; i < length; i++) {
        if (getKey(this[i]) == i + minIndex) {
          yield this[i];
        } else {
          break;
        }
      }
    }
  }

  List<T> replaceAt(int index, T newValue) {
    return replace(index, newValue).toList();
  }

  List<T> exceptAt(int index) {
    return [...this]..removeAt(index);
  }
}

extension AnimationControllerUtils on AnimationController {
  void byValue(bool display) {
    if (display && isEnd) reverse();
    if (!display && isStart) forward();
  }

  void play(bool isForward) {
    if (isForward) {
      forward();
    } else {
      reverse();
    }
  }

  bool get isStart => value == 0.0;

  bool get isEnd => value == 1.0;
}

extension THas<T> on T {
  T? has(bool Function()? has) => (has?.call() ?? false) ? this : null;
}

extension UnWrap on core.double {
  double get nan2zero => isNaN ? 0 : this;

  double? get nan2null => isNaN ? null : this;
}

T? iterableMax<T extends num>(Iterable<T> iter) {
  if (iter.isEmpty) return null;
  return iter.reduce(math.max);
}

T? iterableMin<T extends num>(Iterable<T> iter) {
  if (iter.isEmpty) return null;
  return iter.reduce(math.min);
}

extension EnvString on String {
  String env(SiteEnvStore env) => env.apply(this);

  String globalEnv() =>
      Get.find<SiteService>().website.globalEnv.apply(this);
}