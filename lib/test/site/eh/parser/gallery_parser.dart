import 'package:catweb/gen/protobuf/parser.pbserver.dart';
import 'package:catweb/gen/protobuf/selector.pbserver.dart';
import 'package:uuid/uuid.dart';

final ehGalleryParser = GalleryParser(
  name: '画廊',
  uuid: const Uuid().v4().toString(),
  title: Selector(
    selector: '//h1[@id="gj"]/text() | //h1[@id="gn"]/text()',
    function: SelectorFunction.SELECTOR_FUNCTION_TEXT,
  ),
  failedSelector: Selector(
    selector: '//*[contains(text(), "IP address has")]',
    function: SelectorFunction.SELECTOR_FUNCTION_TEXT,
  ),
  subtitle: Selector(
    selector: '#gdn',
    function: SelectorFunction.SELECTOR_FUNCTION_TEXT,
  ),
  uploadTime: Selector(
    selector: '#gdd tr:nth-child(1)>.gdt2',
    function: SelectorFunction.SELECTOR_FUNCTION_TEXT,
  ),
  language: Selector(
    selector: '#gdd tr:nth-child(4)>.gdt2',
    function: SelectorFunction.SELECTOR_FUNCTION_TEXT,
    script:
        '{"Chinese":"中文","English":"英语","French":"法语","German":"德语","Japanese":"日语","Korean":"韩语","Russian":"俄语","Spanish":"西班牙语","Speechless":"无字","Italian":"意大利语"}',
  ),
  imgCount: Selector(
    selector: '#gdd tr:nth-child(6)>.gdt2',
    function: SelectorFunction.SELECTOR_FUNCTION_TEXT,
    regex: r'\d+',
  ),
  star: Selector(
    selector: '#rating_label',
    function: SelectorFunction.SELECTOR_FUNCTION_TEXT,
    regex: r'Average: (.+)',
  ),
  tag: Selector(
    selector: '.cs',
    function: SelectorFunction.SELECTOR_FUNCTION_TEXT,
  ),
  tagColor: Selector(
    selector: '.cs',
    function: SelectorFunction.SELECTOR_FUNCTION_ATTR,
    param: 'class',
    regex: 'ct.',
    script:
        r'{"ct1":"#8a8a8a","ct2":"#f66158","ct3":"#f09e19","ct4":"#d2d303","ct5":"#0fa911","ct6":"#4f5ce6","ct7":"#9030df","ct8":"#f38af2","ct9":"#0bbfd3","cta":"#2fd92c"}',
  ),
  badgeSelector: Selector(selector: '.gt,.gtl'),
  badgeText: Selector(
    function: SelectorFunction.SELECTOR_FUNCTION_TEXT,
  ),
  badgeCategory: Selector(
    function: SelectorFunction.SELECTOR_FUNCTION_ATTR,
    param: 'id',
    regex: 'td_(.+?):',
  ),
  description: Selector(
    selector:
        '//a[@name="ulcomment"]/ancestor::div[@class="c1"]//div[@id="comment_0"]',
    function: SelectorFunction.SELECTOR_FUNCTION_TEXT,
  ),
  commentSelector: Selector(
    selector: "//div[starts-with(@class, 'c5')]/../..",
  ),
  comment: CommentSelector(
    content: Selector(
      selector: '#cdiv .c6',
      function: SelectorFunction.SELECTOR_FUNCTION_TEXT,
    ),
    username: Selector(
      selector: '#cdiv .c3 a',
      function: SelectorFunction.SELECTOR_FUNCTION_TEXT,
    ),
    time: Selector(
      selector: '#cdiv .c3',
      function: SelectorFunction.SELECTOR_FUNCTION_TEXT,
      regex: r'on(.+)\sby',
    ),
    score: Selector(
      selector: '#cdiv .c5',
      function: SelectorFunction.SELECTOR_FUNCTION_TEXT,
      regex: r'.?\d+',
    ),
  ),
  thumbnailSelector: Selector(selector: '.gdtm, .gdtl'),
  thumbnail: ImageSelector(
    imgWidth: Selector(
      selector: 'img',
      function: SelectorFunction.SELECTOR_FUNCTION_ATTR,
      param: 'style',
      regex: r'width:(\d+)px',
      defaultValue: '200',
    ),
    imgHeight: Selector(
      selector: 'img',
      function: SelectorFunction.SELECTOR_FUNCTION_ATTR,
      param: 'style',
      regex: r'height:(\d+)px',
      defaultValue: '283',
    ),
    imgX: Selector(
      selector: 'div',
      function: SelectorFunction.SELECTOR_FUNCTION_ATTR,
      param: 'style',
      regex: r'-(\d+)px 0 no-repeat',
    ),
    imgUrl: Selector(
      selector: 'div, img',
      function: SelectorFunction.SELECTOR_FUNCTION_ATTR,
      param: 'src,style',
      regex: r'https:.+?\.jpg',
    ),
  ),
  target: Selector(
    selector: 'a',
    function: SelectorFunction.SELECTOR_FUNCTION_ATTR,
    param: 'href',
    regex: r'\/s\/(.+)',
  ),
  coverImg: ImageSelector(
    imgUrl: Selector(
      selector: '#gd1 div',
      function: SelectorFunction.SELECTOR_FUNCTION_ATTR,
      param: 'style',
      regex: r'url\((.+)\)',
    ),
    imgWidth: Selector(
      selector: '#gd1 div',
      function: SelectorFunction.SELECTOR_FUNCTION_ATTR,
      param: 'style',
      regex: r'width:(\d+)px',
    ),
    imgHeight: Selector(
      selector: '#gd1 div',
      function: SelectorFunction.SELECTOR_FUNCTION_ATTR,
      param: 'style',
      regex: r'height:(\d+)px',
    ),
  ),
  countPrePage: Selector(
    selector: '#gdo',
    function: SelectorFunction.SELECTOR_FUNCTION_RAW,
    regex: r'<div class="ths nosel">(\d+) rows.+sel">(\w)',
    replace: r'$1|$2',
    script:
        "function hook(t){var row=t.split('|')[0];var column=t.split('|')[1];return parseInt(row)*{'L':5,'N':10}[column]}",
  ),
);
