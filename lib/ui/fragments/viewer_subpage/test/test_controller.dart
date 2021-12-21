import 'package:catweb/data/models/load_more_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestController extends LoadMoreModel<Color> {

  @override
  Future<void> onInit() async {
    super.onInit();
    await onRefresh();
  }

  @override
  bool isItemExist(item) => false;

  @override
  Future<List<Color>> loadPage(int page) async {
    await 3.seconds.delay();
    if (items.length > 50) throw Exception('没联网？');
    return Colors.primaries;
  }
}
