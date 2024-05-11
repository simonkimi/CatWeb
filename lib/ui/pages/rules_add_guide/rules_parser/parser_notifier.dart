import 'package:catweb/data/models/site/parser.dart';
import 'package:catweb/data/models/site/selector.dart';
import 'package:flutter/cupertino.dart';

class RuleParserNotifier with ChangeNotifier {
  RuleParserNotifier(this.parser);

  ParserModel parser;

  ParserModelDetail get detail => parser as ParserModelDetail;

  ParserModelList get list => parser as ParserModelList;

  ParserModelImageReader get image => parser as ParserModelImageReader;

  ParserModelAutoComplete get autoComplete => parser as ParserModelAutoComplete;

  void addExtra(String id) {
    parser = parser.copyWith(extra: [
      ...parser.extra,
      ExtraSelectorModel(id: id),
    ]);
  }

  void updateExtra(int index, ExtraSelectorModel extra) {
    parser = parser.copyWith(
      extra: List.from(parser.extra)..[index] = extra,
    );
  }

  void updateParser(ParserModel parser) {
    if (parser == this.parser) return;
    this.parser = parser;
    notifyListeners();
  }
}
