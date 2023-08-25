import 'package:catweb/data/models/site_model/parser/field.dart';
import 'package:catweb/data/models/site_model/parser/parser.dart';
import 'package:catweb/data/models/site_model/parser/selector.dart';
import 'package:uuid/uuid.dart';

final ehAutoCompleteParser = AutoCompleteParser(
  name: '自动补全',
  uuid: const Uuid().v4().toString(),
  itemSelector: Selector(selector: r'tags.*'),
  itemComplete: Selector(
    selector: '',
    script: ScriptField(
        script:
            r"""var t=JSON.parse($args),l=null!=t.mtn?t.mtn:t.tn,m=null!=t.mns?t.mns:t.ns;-1!=l.indexOf(" ")&&(l='"'+l+'$"');""",
        type: ScriptFieldType.js),
  ),
  itemTitle: Selector(
    selector: '',
    script: ScriptField(
      script: r'''var r=JSON.parse($args);r.ns+":"+r.tn''',
      type: ScriptFieldType.js,
    ),
  ),
  itemSubtitle: Selector(
    selector: '',
    script: ScriptField(
        script:
            r'''var r=JSON.parse($arg);"temp"==r.ns?"=> "+r.mns+":"+r.mtn:""''',
        type: ScriptFieldType.js),
  ),
);
