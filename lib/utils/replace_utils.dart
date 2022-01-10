String pageReplace(String raw, int page) {
  final pageReg = RegExp(r'\{page:(?<start>\d+):?(?<step>\d*)\}');
  final match = pageReg.firstMatch(raw);
  if (match != null) {
    final start = int.tryParse(match.namedGroup('start') ?? '') ?? 0;
    final step = int.tryParse(match.namedGroup('step') ?? '') ?? 1;
    raw = raw.replaceAll(match.group(0)!, '${start + (page - 1) * step}');
  }
  return raw;
}
