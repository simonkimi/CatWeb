import 'dart:core' as core;
import 'dart:core';
import 'dart:math' as math;
import 'package:catweb/gen/protobuf/model.pbserver.dart';
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

  T? index(int index) {
    if (length > index && index >= 0) {
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

T df<T>(T? value, T defaultValue, bool Function()? has) =>
    has != null && has() ? value ?? defaultValue : defaultValue;

T? has<T>(T value, bool Function() has) => has() ? value : null;

RxString sobs(String? pb) => pb?.obs ?? ''.obs;

RxBool bobs(bool? pb) => pb?.obs ?? false.obs;

RxList<T> lobs<T, E>(core.Iterable<E>? pb, T Function(E e) func) =>
    pb?.map((E e) => func(e)).toList().obs ?? <T>[].obs;

extension RpcColor on ColorRpcModel {
  Color? get color {
    if (hasR() && hasG() && hasB()) {
      return Color.fromARGB(hasA() ? a : 0xFF, r, g, b);
    }
    return null;
  }

  String get string => '#${r.toRadixString(16).padLeft(2, '0')}'
      '${g.toRadixString(16).padLeft(2, '0')}'
      '${b.toRadixString(16).padLeft(2, '0')}';
}

extension THas<T> on T {
  T? has(bool Function()? has) => (has?.call() ?? false) ? this : null;
}

extension UnWrap on core.double {
  double get nan2zero => isNaN ? 0 : this;

  double? get nan2null => isNaN ? null : this;
}
