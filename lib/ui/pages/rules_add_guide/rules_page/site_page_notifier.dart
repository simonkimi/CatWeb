import 'package:catweb/data/models/site/page.dart';
import 'package:catweb/data/models/site/template.dart';
import 'package:catweb/ui/widgets/notifier_selector.dart';
import 'package:flutter/cupertino.dart';

class SitePageNotifier extends ChangeNotifier {
  SitePageNotifier(this.rule);

  SitePageRule rule;

  PageTemplateAutoComplete get templateAutoComplete => rule.template as PageTemplateAutoComplete;


  void updateTemplate(PageTemplate template) {
    rule = rule.copyWith(template: template);
    notifyListeners();
  }
}

typedef SitePageTextField = SelectorTextField<SitePageNotifier>;