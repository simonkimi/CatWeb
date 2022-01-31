import 'package:catweb/gen/protobuf/parser.pbserver.dart';
import 'package:catweb/gen/protobuf/selector.pbserver.dart';
import 'package:uuid/uuid.dart';

final galleryUuid = const Uuid().v4().toString();

final ehGalleryParser = DetailParser(
  name: '画廊',
  uuid: galleryUuid,
  title: Selector(
    selector: '#gn',
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
  ),
  imgCount: Selector(
    selector: '#gdd tr:nth-child(6)>.gdt2',
    function: SelectorFunction.SELECTOR_FUNCTION_TEXT,
    regex: r'\d+',
  ),
  star: Selector(
      selector: '#rating_label',
      function: SelectorFunction.SELECTOR_FUNCTION_TEXT,
      regex: r'Average: (.+)'),
  tag: Selector(
    selector: '.cs',
    function: SelectorFunction.SELECTOR_FUNCTION_TEXT,
  ),
  tagColor: Selector(
    selector: '.cs',
    function: SelectorFunction.SELECTOR_FUNCTION_ATTR,
    param: 'class',
    regex: 'ct.',
    js: r"function hook(t){return{ct2:'#f66158',ct3:'#f09e19',ct4:'#d2d303',ct5:'#0fa911',cta:'#2fd92c',ct9:'#0bbfd3',ct6:'#4f5ce6',ct7:'#9030df',ct8:'#f38af2',ct1:'#8a8a8a'}[t]}",
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
          '//a[@name="ulcomment"]/ancestor::div[@class="c1"]//div[@id="comment_0"]/text()'),
  commentSelector: Selector(
    selector: "//div[@class^='c5']/../..",
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
      regex: r'-?\d+',
    ),
  ),
  thumbnail: ImageSelector(
    imgWidth: Selector(
      selector: '.gdtm img, .gdtl img',
      function: SelectorFunction.SELECTOR_FUNCTION_ATTR,
      param: 'style',
      regex: r'width:(\d+)px',
      defaultValue: '200',
    ),
    imgHeight: Selector(
      selector: '.gdtm img, .gdtl img',
      function: SelectorFunction.SELECTOR_FUNCTION_ATTR,
      param: 'style',
      regex: r'height:(\d+)px',
      defaultValue: '282',
    ),
    imgX: Selector(
        selector: '.gdtm div',
        function: SelectorFunction.SELECTOR_FUNCTION_ATTR,
        param: 'style',
        regex: r'-(\d)px 0 no-repeat'),
    imgUrl: Selector(
      selector: '.gdtm img, .gdtl img',
      function: SelectorFunction.SELECTOR_FUNCTION_ATTR,
      param: 'src',
    ),
    target: Selector(
      selector: '.gdtm a, .gdtl a',
      function: SelectorFunction.SELECTOR_FUNCTION_ATTR,
      param: 'href',
    ),
  ),
  coverImg: ImageSelector(
    imgUrl: Selector(
      selector: '#gd1 div',
      function: SelectorFunction.SELECTOR_FUNCTION_ATTR,
      param: 'style',
      regex: r'url(.+)\)',
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
    js: "function hook(t){var row=t.split('|')[0];var column=t.split('|')[1];return parseInt(row)*{'L':5,'N':10}[column]}",
  ),
  extraSelector: [ExtraSelector()],
);
