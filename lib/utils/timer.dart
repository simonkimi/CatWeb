class TimeLine {
  var _lastTime = DateTime.now().millisecondsSinceEpoch;

  void startTimer() => _lastTime = DateTime.now().millisecondsSinceEpoch;

  void getRunTime(String tag) {
    final nowTime = DateTime.now().millisecondsSinceEpoch;
    print('计时: $tag 耗时: ${nowTime - _lastTime} ms');
    _lastTime = nowTime;
  }
}