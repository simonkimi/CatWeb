final _pageReg = RegExp(r'\{page:(?<start>\d+):?(?<step>\d*)\}');

String pageReplace(String raw, int page) {
  final match = _pageReg.firstMatch(raw);
  if (match != null) {
    final start = int.tryParse(match.namedGroup('start') ?? '') ?? 0;
    final step = int.tryParse(match.namedGroup('step') ?? '') ?? 1;
    raw = raw.replaceAll(match.group(0)!, '${start + page * step}');
  }
  return raw;
}

bool hasPageExpression(String input) {
  return _pageReg.hasMatch(input);
}
