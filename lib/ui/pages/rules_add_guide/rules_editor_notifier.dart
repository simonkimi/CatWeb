import 'package:catweb/data/models/site/field.dart';
import 'package:catweb/data/models/site/page.dart';
import 'package:catweb/data/models/site/parser.dart';
import 'package:catweb/data/models/site/site_blueprint.dart';

import 'package:flutter/cupertino.dart';

class RulesEditorNotifier extends ChangeNotifier {
  RulesEditorNotifier(this.blueprint);

  SiteBlueprint blueprint;

  void setName(String name) {
    blueprint = blueprint.copyWith(name: name);
    notifyListeners();
  }

  void setBaseUrl(String baseUrl) {
    blueprint = blueprint.copyWith(baseUrl: baseUrl);
    notifyListeners();
  }

  void setFlag(String flag) {
    blueprint = blueprint.copyWith(flag: flag);
    notifyListeners();
  }

  void setLoginUrl(String loginUrl) {
    blueprint = blueprint.copyWith(loginUrl: loginUrl);
    notifyListeners();
  }

  void setLoginCookieReg(String loginCookieReg) {
    blueprint = blueprint.copyWith(loginCookieReg: loginCookieReg);
    notifyListeners();
  }

  void setLoginCookieDescription(String loginCookieDescription) {
    blueprint = blueprint.copyWith(
      loginCookieDescription: loginCookieDescription,
    );
    notifyListeners();
  }

  void removeHeader(int index) {
    blueprint = blueprint.copyWith(
      headers: List.from(blueprint.headers)..removeAt(index),
    );
    notifyListeners();
  }

  void updateHeader(int index, RegField regField) {
    blueprint = blueprint.copyWith(
      headers: List.from(blueprint.headers)..[index] = regField,
    );
    notifyListeners();
  }

  void addHeader(RegField regField) {
    blueprint = blueprint.copyWith(
      headers: List.from(blueprint.headers)..add(regField),
    );
    notifyListeners();
  }

  void removeCookie(int index) {
    blueprint = blueprint.copyWith(
      cookies: List.from(blueprint.cookies)..removeAt(index),
    );
    notifyListeners();
  }

  void updateCookie(int index, RegField regField) {
    blueprint = blueprint.copyWith(
      cookies: List.from(blueprint.cookies)..[index] = regField,
    );
    notifyListeners();
  }

  void addCookie(RegField regField) {
    blueprint = blueprint.copyWith(
      cookies: List.from(blueprint.cookies)..add(regField),
    );
    notifyListeners();
  }

  void removePage(SitePageRule model) {
    blueprint = blueprint.copyWith(
      pageList: List.from(blueprint.pageList)..remove(model),
    );
    notifyListeners();
  }

  void removeParser(String uuid) {
    blueprint = blueprint.copyWith(
      parserList: List.from(blueprint.parserList)
        ..removeWhere((e) => e.uuid == uuid),
    );
    notifyListeners();
  }

  void editParser(ParserModel model) {
    final newParserList = List<ParserModel>.from(blueprint.parserList);
    if (newParserList.any((e) => e.uuid == model.uuid)) {
      newParserList[newParserList.indexWhere((e) => e.uuid == model.uuid)] =
          model;
    } else {
      newParserList.add(model);
    }
    blueprint = blueprint.copyWith(
      parserList: newParserList,
    );
    notifyListeners();
  }

  Future<void> save() async {
    // if (db == null) {
    //   await dbService.webDao.insert(WebTableCompanion.insert(
    //     blueprint: jsonEncode(blueprint.toJson()),
    //     env: '{}',
    //   ));
    // } else {
    //   final newDb = db!.copyWith(blueprint: jsonEncode(blueprint.toJson()));
    //   await dbService.webDao.replace(newDb);
    //   // 检测是否为当前配置
    //   if (siteService.currentSite?.id == db!.id) {
    //     siteService.setNewSite(newDb);
    //   }
    // }
  }
}
