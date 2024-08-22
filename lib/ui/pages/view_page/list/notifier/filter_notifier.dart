import 'dart:convert';

import 'package:catweb/data/models/site/subpage.dart';
import 'package:catweb/utils/debug.dart';
import 'package:flutter/cupertino.dart';

class FilterNotifier extends ChangeNotifier {
  FilterNotifier({
    required this.initFilter,
  }) : currentFilter = initFilter.copyWith();

  final TemplateListFilter initFilter;

  /// 当前正在使用的过滤器
  TemplateListFilter currentFilter;

  void resetFilter() {
    for (var i = 0; i < currentFilter.items.length; i++) {
      currentFilter.items[i] = currentFilter.items[i].reset();
    }
  }

  /// 应用过滤器
  Future<void> applyFilter() async {
    // currentFilter = filter;
    // var filterKeys = filter.map((e) => e.key);
    // localEnv.removeKeys(filterKeys);
    // var result = await resolveFilter();
    // localEnv.mergeMap(result);
  }

  Future<Map<String, String>> resolveFilter() async {
    final map = <String, dynamic>{};
    for (final filter in currentFilter.items) {
      if (filter.key.isEmpty) continue;
      if (!filter.isChanged && filter.disabledUnchanged) continue;
      map[filter.key] = filter.value;
    }

    final json = jsonEncode(map);
    const result = '';
    if (result.startsWith('{')) {
      try {
        Map<String, dynamic> json2 = jsonDecode(result);
        return json2.map((key, value) => MapEntry(key, value.toString()));
      } catch (e) {
        logger.e('解析过滤器失败: $e');
        return {};
      }
    } else {
      return {'filter': result};
    }
  }

  bool get isFilterChanged => currentFilter.items.any((e) => e.isChanged);
}
