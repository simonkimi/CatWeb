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

void trace(Object p1,
    [Object? p2,
    Object? p3,
    Object? p4,
    Object? p5,
    Object? p6,
    Object? p7,
    Object? p8,
    Object? p9,
    Object? p10]) {
  final msg = <Object?>[p1, p2, p3, p4, p5, p6, p7, p8, p9, p10]
      .whereType<Object>()
      .map((e) => e.toString())
      .join(' ');

  print('[TRACE] $msg');
}
