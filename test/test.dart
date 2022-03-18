import 'dart:math';

import 'package:catweb/utils/utils.dart';
import 'package:get/get.dart';

final data = <int, String>{}.obs;

final data2 = <String>[].obs;

void main() async {
  data.listen(update);

  data.value = {
    10: 'ten',
  };

  data.value = {
    0: 'zero',
    1: 'one',
  };

  print(data2);
}

void update(Map<int, String> items) {
  for (var i = 0; i < items.realLength; i++) {
    if (data2.length <= i) {
      data2.add(items.containsKey(i) ? items[i]! : 'nil');
    } else if (data2[i] == 'nil' && items.containsKey(i)) {
      data2[i] = items[i]!;
    }
  }
}
