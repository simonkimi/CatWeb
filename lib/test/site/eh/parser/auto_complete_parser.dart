import 'package:catweb/data/models/site/field.dart';
import 'package:catweb/data/models/site/parser.dart';
import 'package:catweb/data/models/site/selector.dart';
import 'package:uuid/uuid.dart';

final ehAutoCompleteParser = ParserModelAutoComplete(
  name: '自动补全',
  uuid: const Uuid().v4().toString(),
  itemSelector: const SelectorModel(selector: r'tags.*'),
  itemComplete: const SelectorModel(
    selector: '',
    script: ScriptField.js(
      script:
          r"""var t=JSON.parse($args),l=null!=t.mtn?t.mtn:t.tn,m=null!=t.mns?t.mns:t.ns;-1!=l.indexOf(" ")&&(l='"'+l+'$"');""",
    ),
  ),
  itemTitle: const SelectorModel(
    selector: '',
    script: ScriptField.js(
      script: r'''var r=JSON.parse($args);r.ns+":"+r.tn''',
    ),
  ),
  itemSubtitle: const SelectorModel(
    selector: '',
    script: ScriptField.js(
      script:
          r'''var r=JSON.parse($arg);"temp"==r.ns?"=> "+r.mns+":"+r.mtn:""''',
    ),
  ),
);
