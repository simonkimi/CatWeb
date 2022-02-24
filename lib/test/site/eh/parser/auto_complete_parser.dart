import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/gen/protobuf/parser.pbserver.dart';
import 'package:catweb/gen/protobuf/selector.pbserver.dart';

final ehAutoCompleteParser = AutoCompleteParser(
  name: '自动补全',
  uuid: genUuid(),
  itemSelector: Selector(
    selector: r'tags.*',
  ),
  itemComplete: Selector(
      selector: '',
      script:
          r"""function hook(n){var t=JSON.parse(n),l=null!=t.mtn?t.mtn:t.tn,m=null!=t.mns?t.mns:t.ns;return-1!=l.indexOf(" ")&&(l='"'+l+'$"'),m+":"+l}"""),
  itemTitle: Selector(
    selector: '',
    script: r'''function hook(n){var r=JSON.parse(n);return r.ns+":"+r.tn}''',
  ),
  itemSubtitle: Selector(
    selector: '',
    script:
        r'''function hook(n){var r=JSON.parse(n);return"temp"==r.ns?"=> "+r.mns+":"+r.mtn:""}''',
  ),
);
