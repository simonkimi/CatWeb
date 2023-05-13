import 'package:catweb/data/models/site_model/fields/field.dart';
import 'package:catweb/data/models/site_model/parser/parser.dart';
import 'package:catweb/data/models/site_model/parser/selector.dart';

import 'utils.dart';

final galleryParser = GalleryParser(
  name: '画廊',
  uuid: genUuid(),
  title: const Selector(
    selector: r'//h1[@id="gj"]/text() | //h1[@id="gn"]/text()',
    function: SelectorFunctionType.text,
  ),
  failedSelector: const Selector(
    selector: r'//*[contains(text(), "IP address has")]',
    function: SelectorFunctionType.text,
  ),
  subtitle: const Selector(
    selector: '#gdn',
    function: SelectorFunctionType.text,
  ),
  uploadTime: const Selector(
    selector: '#gdd tr:nth-child(1)>.gdt2',
    function: SelectorFunctionType.text,
  ),
  language: const Selector(
    selector: '#gdd tr:nth-child(4)>.gdt2',
    function: SelectorFunctionType.text,
    script: ScriptField(
      script:
          '{"Chinese":"中文","English":"英语","French":"法语","German":"德语","Japanese":"日语","Korean":"韩语","Russian":"俄语","Spanish":"西班牙语","Speechless":"无字","Italian":"意大利语"}',
      type: ScriptFieldType.replace,
    ),
  ),
  imgCount: const Selector(
    selector: '#gdd tr:nth-child(6)>.gdt2',
    function: SelectorFunctionType.text,
    regex: r'\d+',
  ),
  star: const Selector(
    selector: '#rating_label',
    function: SelectorFunctionType.text,
    regex: r'Average: (.+)',
  ),
  tag: const Selector(
    selector: '.cs',
    function: SelectorFunctionType.text,
  ),
  tagColor: const Selector(
    selector: '.cs',
    function: SelectorFunctionType.attr,
    param: 'class',
    regex: 'ct.',
    script: ScriptField(
      script:
          r'{"ct1":"#8a8a8a","ct2":"#f66158","ct3":"#f09e19","ct4":"#d2d303","ct5":"#0fa911","ct6":"#4f5ce6","ct7":"#9030df","ct8":"#f38af2","ct9":"#0bbfd3","cta":"#2fd92c"}',
      type: ScriptFieldType.replace,
    ),
  ),
  badgeSelector: const Selector(selector: '.gt,.gtl'),
  badgeText: const Selector(
    function: SelectorFunctionType.text,
  ),
  badgeCategory: const Selector(
    function: SelectorFunctionType.attr,
    param: 'id',
    regex: 'td_(.+?):',
  ),
  description: const Selector(
    selector: '//a[@name="ulcomment"]/ancestor::div[@class="c1"]//div[@id="comment_0"]',
    type: SelectorType.xpath,
    function: SelectorFunctionType.text,
  ),
);
