import 'package:catweb/data/models/site_model/fields/field.dart';
import 'package:catweb/data/models/site_model/parser/parser.dart';
import 'package:catweb/data/models/site_model/parser/selector.dart';
import 'package:uuid/uuid.dart';

final ehAutoCompleteParser = AutoCompleteParser(
  name: '自动补全',
  uuid: const Uuid().v4().toString(),
  itemSelector: const Selector(selector: r'tags.*'),
  itemComplete: const Selector(
    selector: '',
    script: ScriptField(
        script:
            r"""function hook(n){var t=JSON.parse(n),l=null!=t.mtn?t.mtn:t.tn,m=null!=t.mns?t.mns:t.ns;return-1!=l.indexOf(" ")&&(l='"'+l+'$"'),m+":"+l}""",
        type: ScriptFieldType.js),
  ),
  itemTitle: const Selector(
    selector: '',
    script: ScriptField(
      script: r'''function hook(n){var r=JSON.parse(n);return r.ns+":"+r.tn}''',
      type: ScriptFieldType.js,
    ),
  ),
  itemSubtitle: const Selector(
    selector: '',
    script: ScriptField(
        script:
            r'''function hook(n){var r=JSON.parse(n);return"temp"==r.ns?"=> "+r.mns+":"+r.mtn:""}''',
        type: ScriptFieldType.js),
  ),
);
