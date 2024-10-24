import 'dart:convert';

import 'package:catweb/data/controller/db.dart';
import 'package:catweb/data/controller/site.dart';
import 'package:catweb/data/database/database.dart';
import 'package:catweb/data/models/site/field.dart';
import 'package:catweb/data/models/site/page.dart';
import 'package:catweb/data/models/site/parser.dart';
import 'package:catweb/data/models/site/site_blueprint.dart';
import 'package:catweb/app.dart';

import 'package:flutter/cupertino.dart';

class RulesEditorNotifier extends ValueNotifier<SiteBlueprint> {
  RulesEditorNotifier(super.blueprint);

  SiteBlueprint get blueprint => value;

  void setName(String name) {
    value = blueprint.copyWith(name: name);
  }

  void setBaseUrl(String baseUrl) {
    value = blueprint.copyWith(baseUrl: baseUrl);
  }

  void setFlag(String flag) {
    value = blueprint.copyWith(flag: flag);
  }

  void setLoginUrl(String loginUrl) {
    value = blueprint.copyWith(loginUrl: loginUrl);
  }

  void setLoginCookieReg(String loginCookieReg) {
    value = blueprint.copyWith(loginCookieReg: loginCookieReg);
  }

  void setLoginCookieDescription(String loginCookieDescription) {
    value = blueprint.copyWith(
      loginCookieDescription: loginCookieDescription,
    );
  }

  void removeHeader(int index) {
    value = blueprint.copyWith(
      headers: List.from(blueprint.headers)..removeAt(index),
    );
  }

  void updateHeader(int index, RegField regField) {
    value = blueprint.copyWith(
      headers: List.from(blueprint.headers)..[index] = regField,
    );
  }

  void addHeader(RegField regField) {
    value = blueprint.copyWith(
      headers: List.from(blueprint.headers)..add(regField),
    );
  }

  void removeCookie(int index) {
    value = blueprint.copyWith(
      cookies: List.from(blueprint.cookies)..removeAt(index),
    );
  }

  void updateCookie(int index, RegField regField) {
    value = blueprint.copyWith(
      cookies: List.from(blueprint.cookies)..[index] = regField,
    );
  }

  void addCookie(RegField regField) {
    value = blueprint.copyWith(
      cookies: List.from(blueprint.cookies)..add(regField),
    );
  }

  void removePage(SitePageRule model) {
    value = blueprint.copyWith(
      pageList: List.from(blueprint.pageList)..remove(model),
    );
  }

  void removeParser(String uuid) {
    value = blueprint.copyWith(
      parserList: List.from(blueprint.parserList)
        ..removeWhere((e) => e.uuid == uuid),
    );
  }

  void editParser(ParserModel model) {
    final newParserList = List<ParserModel>.from(blueprint.parserList);
    if (newParserList.any((e) => e.uuid == model.uuid)) {
      newParserList[newParserList.indexWhere((e) => e.uuid == model.uuid)] =
          model;
    } else {
      newParserList.add(model);
    }
    value = blueprint.copyWith(
      parserList: newParserList,
    );
    notifyListeners();
  }

  Future<void> save(WebTableData? oldConfig) async {
    DbService dbService = getIt.get();
    SiteService siteService = getIt.get();

    if (oldConfig == null) {
      await dbService.webDao.insert(WebTableCompanion.insert(
        blueprint: jsonEncode(blueprint.toJson()),
        env: '{}',
      ));
      return;
    }

    final newConfig =
        oldConfig.copyWith(blueprint: jsonEncode(blueprint.toJson()));
    await dbService.webDao.replace(newConfig);
    if (siteService.currentSite?.id == oldConfig.id) {
      siteService.setNewSite(newConfig);
    }
  }
}
