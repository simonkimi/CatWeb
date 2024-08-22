import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class TimeLine {
  final _timerMap = <String, int>{'_': DateTime.now().millisecondsSinceEpoch};

  void startTimer([String? tag]) =>
      _timerMap[tag ?? '_'] = DateTime.now().millisecondsSinceEpoch;

  void getRunTime({String tag = '_', String msg = '计时'}) {
    final nowTime = DateTime.now().millisecondsSinceEpoch;
    print('$msg 耗时: ${nowTime - (_timerMap[tag] ?? nowTime)} ms');
    _timerMap[tag] = nowTime;
  }
}

class LoggerHelper {
  final _logger = Logger(
    printer: PrettyPrinter(
      colors: true,
      methodCount: 0,
      noBoxingByDefault: false,
      printEmojis: true,
      stackTraceBeginIndex: 1,
    ),
  );

  void d(Object? p1,
      [Object? p2,
      Object? p3,
      Object? p4,
      Object? p5,
      Object? p6,
      Object? p7,
      Object? p8,
      Object? p9,
      Object? p10]) {
    if (!kDebugMode) return;
    _logger.d(_genMessage(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10));
  }

  void i(Object? p1,
      [Object? p2,
      Object? p3,
      Object? p4,
      Object? p5,
      Object? p6,
      Object? p7,
      Object? p8,
      Object? p9,
      Object? p10]) {
    _logger.i(_genMessage(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10));
  }

  void e(Object? p1,
      [Object? p2,
      Object? p3,
      Object? p4,
      Object? p5,
      Object? p6,
      Object? p7,
      Object? p8,
      Object? p9,
      Object? p10]) {
    _logger.e(_genMessage(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10));
  }

  void w(Object? p1,
      [Object? p2,
      Object? p3,
      Object? p4,
      Object? p5,
      Object? p6,
      Object? p7,
      Object? p8,
      Object? p9,
      Object? p10]) {
    _logger.w(_genMessage(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10));
  }

  void f(Object? p1,
      [Object? p2,
      Object? p3,
      Object? p4,
      Object? p5,
      Object? p6,
      Object? p7,
      Object? p8,
      Object? p9,
      Object? p10]) {
    _logger.f(_genMessage(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10));
  }

  String _genMessage(Object? p1,
      [Object? p2,
      Object? p3,
      Object? p4,
      Object? p5,
      Object? p6,
      Object? p7,
      Object? p8,
      Object? p9,
      Object? p10]) {
    return <Object?>[p1 ?? 'null', p2, p3, p4, p5, p6, p7, p8, p9, p10]
        .whereType<Object>()
        .map((e) => e.toString())
        .join(' ');
  }
}

final logger = LoggerHelper();
