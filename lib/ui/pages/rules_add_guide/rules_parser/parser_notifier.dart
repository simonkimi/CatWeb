import 'package:catweb/data/models/site/parser.dart';
import 'package:flutter/cupertino.dart';

class RuleParserNotifier extends ChangeNotifier {
  RuleParserNotifier(this.parser);

  ParserModel parser;

  ParserModelDetail get detail => parser as ParserModelDetail;

  ParserModelList get list => parser as ParserModelList;

  ParserModelImageReader get image => parser as ParserModelImageReader;

  ParserModelAutoComplete get autoComplete => parser as ParserModelAutoComplete;
}
