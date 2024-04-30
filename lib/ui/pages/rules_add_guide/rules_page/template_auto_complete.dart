import 'package:catweb/ui/pages/rules_add_guide/rules_page/site_page_notifier.dart';
import 'package:catweb/ui/widgets/notifier_selector.dart';
import 'package:flutter/cupertino.dart';

class TemplateAutoCompleteEditor extends StatelessWidget {
  const TemplateAutoCompleteEditor({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        children: [
          NotifierTripleTextField<SitePageNotifier>(
            labelText: '分隔符',
            selector: (n) => n.templateAutoComplete.splitChar,
            save: (n) => n.updateAutoCompleteSplitChar,
          ),
          NotifierTripleNumberField<SitePageNotifier>(
            labelText: '开始搜索时间',
            selector: (n) => n.templateAutoComplete.timeout,
            save: (n) => n.updateAutoCompleteTimeout,
          )
        ],
      ),
    );
  }
}
