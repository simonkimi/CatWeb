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
    function: SelectorFunctionType.text,
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
      script:
          'a={chinese:"中文",english:"英语",french:"法语",german:"德语",japanese:"日语",korean:"韩语",russian:"俄语",spanish:"西班牙语",speechless:"无字",italian:"意大利语"};a[\$arg.toLowerCase()]',
      type: ScriptFieldType.js,
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
            r'a={ct2:"#f66158",ct3:"#f09e19",ct4:"#d2d303",ct5:"#0fa911",cta:"#2fd92c",ct9:"#0bbfd3",ct6:"#4f5ce6",ct7:"#9030df",ct8:"#f38af2",ct1:"#8a8a8a"},a[$arg];',
        type: ScriptFieldType.js,
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
    width: Selector(
      selector: 'img',
      function: SelectorFunctionType.attr,
      param: 'style',
      regex: r'width:(\d+)px',
      defaultValue: '200',
    ),
    height: Selector(
      selector: 'img',
      function: SelectorFunctionType.attr,
      param: 'style',
      regex: r'height:(\d+)px',
      defaultValue: '283',
    ),
    x: Selector(
      selector: 'div',
      function: SelectorFunctionType.attr,
      param: 'style',
      regex: r'-(\d+)px 0 no-repeat',
    ),
    url: Selector(
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
    url: Selector(
      selector: '#gd1 div',
      function: SelectorFunctionType.attr,
      param: 'style',
      regex: r'url\((.+)\)',
    ),
    width: Selector(
      selector: '#gd1 div',
      function: SelectorFunctionType.attr,
      param: 'style',
      regex: r'width:(\d+)px',
    ),
    height: Selector(
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
