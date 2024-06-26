import 'package:flutter/cupertino.dart';

class FilterNotifier extends ChangeNotifier {
  /// 当前正在使用的过滤器
  late List<TemplateListFilterItem> currentFilter;

  void resetFilter() {
    for (var i = 0; i < filter.length; i++) {
      filter[i].value.value = extra.filters[i].value.value;
    }
  }

  /// 应用过滤器
  Future<void> applyFilter(List<TemplateListFilterItem> filter) async {
    currentFilter = filter;
    var filterKeys = filter.map((e) => e.key);
    localEnv.removeKeys(filterKeys);
    var result = await resolveFilter();
    localEnv.mergeMap(result);
  }
}
