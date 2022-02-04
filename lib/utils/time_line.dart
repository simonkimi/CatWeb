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
