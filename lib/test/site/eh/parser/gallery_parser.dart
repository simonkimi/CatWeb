import 'package:catweb/data/models/site_model/parser/field.dart';
import 'package:catweb/data/models/site_model/parser/parser.dart';
import 'package:catweb/data/models/site_model/parser/selector.dart';
import 'package:uuid/uuid.dart';

final ehGalleryParser = DetailParser(
  name: '画廊',
  uuid: const Uuid().v4().toString(),
  title: Selector(
    selector: '//h1[@id="gj"]/text() | //h1[@id="gn"]/text()',
    type: SelectorType.xpath,
    function: SelectorFunctionType.attr,
  ),
  failedSelector: Selector(
      selector: '//*[contains(text(), "IP address has")]',
      type: SelectorType.xpath,
      function: SelectorFunctionType.text),
  subtitle: Selector(
    selector: '#gdn',
    function: SelectorFunctionType.text,
  ),
  uploadTime: Selector(
    selector: '#gdd tr:nth-child(1)>.gdt2',
    function: SelectorFunctionType.text,
  ),
  language: Selector(
    selector: '#gdd tr:nth-child(4)>.gdt2',
    function: SelectorFunctionType.text,
    script: ScriptField(
      script: '{"Chinese":"中文","English":"英语","French":"法语","German":"德语",'
          '"Japanese":"日语","Korean":"韩语","Russian":"俄语","Spanish":"西班牙语",'
          '"Speechless":"无字","Italian":"意大利语"}',
      type: ScriptFieldType.replace,
    ),
  ),
  imageCount: Selector(
    selector: '#gdd tr:nth-child(6)>.gdt2',
    function: SelectorFunctionType.text,
    regex: r'\d+',
  ),
  star: Selector(
    selector: '#rating_label',
    function: SelectorFunctionType.text,
    regex: r'Average: (.+)',
  ),
  tagSelector: Selector(
    selector: '.cs',
    function: SelectorFunctionType.text,
  ),
  tagItem: TagSelector(
    text: Selector(
      function: SelectorFunctionType.text,
    ),
    color: Selector(
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
  ),
  badgeSelector: Selector(selector: '.gt,.gtl'),
  badgeItem: TagSelector(
    text: Selector(
      function: SelectorFunctionType.text,
    ),
    category: Selector(
      function: SelectorFunctionType.attr,
      param: 'id',
      regex: 'td_(.+?):',
    ),
  ),
  description: Selector(
    selector:
        '//a[@name="ulcomment"]/ancestor::div[@class="c1"]//div[@id="comment_0"]',
    type: SelectorType.xpath,
    function: SelectorFunctionType.text,
  ),
  commentSelector: Selector(
    selector: "//div[starts-with(@class, 'c5')]/../..",
    type: SelectorType.xpath,
  ),
  comments: CommentSelector(
    content: Selector(
      selector: '#cdiv .c6',
      function: SelectorFunctionType.text,
    ),
    username: Selector(
      selector: '#cdiv .c3 a',
      function: SelectorFunctionType.text,
    ),
    time: Selector(
      selector: '#cdiv .c3',
      function: SelectorFunctionType.text,
      regex: r'on(.+)\sby',
    ),
    score: Selector(
      selector: '#cdiv .c5',
      function: SelectorFunctionType.text,
      regex: r'.?\d+',
    ),
  ),
  thumbnailSelector: Selector(selector: '.gdtm, .gdtl'),
  thumbnail: ImageSelector(
    imgWidth: Selector(
      selector: 'img',
      function: SelectorFunctionType.attr,
      param: 'style',
      regex: r'width:(\d+)px',
      defaultValue: '200',
    ),
    imgHeight: Selector(
      selector: 'img',
      function: SelectorFunctionType.attr,
      param: 'style',
      regex: r'height:(\d+)px',
      defaultValue: '283',
    ),
    imgX: Selector(
      selector: 'div',
      function: SelectorFunctionType.attr,
      param: 'style',
      regex: r'-(\d+)px 0 no-repeat',
    ),
    imgUrl: Selector(
      selector: 'div, img',
      function: SelectorFunctionType.attr,
      param: 'src,style',
      regex: r'https:.+?\.jpg',
    ),
  ),
  target: Selector(
    selector: 'a',
    function: SelectorFunctionType.attr,
    param: 'href',
    regex: r'\/s\/(.+)',
  ),
  coverImage: ImageSelector(
    imgUrl: Selector(
      selector: '#gd1 div',
      function: SelectorFunctionType.attr,
      param: 'style',
      regex: r'url\((.+)\)',
    ),
    imgWidth: Selector(
      selector: '#gd1 div',
      function: SelectorFunctionType.attr,
      param: 'style',
      regex: r'width:(\d+)px',
    ),
    imgHeight: Selector(
      selector: '#gd1 div',
      function: SelectorFunctionType.attr,
      param: 'style',
      regex: r'height:(\d+)px',
    ),
  ),
  countPrePage: Selector(
    selector: '#gdo',
    function: SelectorFunctionType.raw,
    regex: r'<div class="ths nosel">(\d+) rows.+sel">(\w)',
    replace: r'$1|$2',
    script: ScriptField(
      script: r"let[r,c]=$arg.split('|');parseInt(r)*{'L':5,'N':10}[c];",
      type: ScriptFieldType.js,
    ),
  ),
);
