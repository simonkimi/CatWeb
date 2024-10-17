import 'package:catweb/data/models/site/field.dart';
import 'package:catweb/data/models/site/parser.dart';
import 'package:catweb/data/models/site/selector.dart';
import 'package:uuid/uuid.dart';

final ehGalleryParser = ParserModelDetail(
  name: '画廊',
  uuid: const Uuid().v4().toString(),
  title: const SelectorModel(
    selector: '//h1[@id="gj"]/text() | //h1[@id="gn"]/text()',
    type: SelectorQuery.xpath(),
    function: SelectorFunction.text(),
  ),
  failedSelector: const SelectorModel(
      selector: '//*[contains(text(), "IP address has")]',
      type: SelectorQuery.xpath(),
      function: SelectorFunction.text()),
  subtitle: const SelectorModel(
    selector: '#gdn',
    function: SelectorFunction.text(),
  ),
  uploadTime: const SelectorModel(
    selector: '#gdd tr:nth-child(1)>.gdt2',
    function: SelectorFunction.text(),
  ),
  language: const SelectorModel(
    selector: '#gdd tr:nth-child(4)>.gdt2',
    function: SelectorFunction.text(),
    script: ScriptField.js(
      script:
          'a={chinese:"中文",english:"英语",french:"法语",german:"德语",japanese:"日语",korean:"韩语",russian:"俄语",spanish:"西班牙语",speechless:"无字",italian:"意大利语"};a[\$arg.toLowerCase()]',
    ),
  ),
  imageCount: const SelectorModel(
    selector: '#gdd tr:nth-child(6)>.gdt2',
    function: SelectorFunction.text(),
    regex: r'\d+',
  ),
  star: const SelectorModel(
    selector: '#rating_label',
    function: SelectorFunction.text(),
    regex: r'Average: (.+)',
  ),
  tagSelector: const SelectorModel(
    selector: '.cs',
    function: SelectorFunction.text(),
  ),
  tagItem: const TagSelectorModel(
    text: SelectorModel(
      function: SelectorFunction.text(),
    ),
    color: SelectorModel(
      selector: '.cs',
      function: SelectorFunction.attr(),
      param: 'class',
      regex: 'ct.',
      script: ScriptField.js(
        script:
            r'a={ct2:"#f66158",ct3:"#f09e19",ct4:"#d2d303",ct5:"#0fa911",cta:"#2fd92c",ct9:"#0bbfd3",ct6:"#4f5ce6",ct7:"#9030df",ct8:"#f38af2",ct1:"#8a8a8a"},a[$arg];',
      ),
    ),
  ),
  badgeSelector: const SelectorModel(selector: '.gt,.gtl'),
  badgeItem: const TagSelectorModel(
    text: SelectorModel(
      function: SelectorFunction.text(),
    ),
    category: SelectorModel(
      function: SelectorFunction.attr(),
      param: 'id',
      regex: 'td_(.+?):',
    ),
  ),
  description: const SelectorModel(
    selector:
        '//a[@name="ulcomment"]/ancestor::div[@class="c1"]//div[@id="comment_0"]',
    type: SelectorQuery.xpath(),
    function: SelectorFunction.text(),
  ),
  commentSelector: const SelectorModel(
    selector: "//div[starts-with(@class, 'c5')]/../..",
    type: SelectorQuery.xpath(),
  ),
  comments: const CommentSelectorModel(
    content: SelectorModel(
      selector: '#cdiv .c6',
      function: SelectorFunction.text(),
    ),
    username: SelectorModel(
      selector: '#cdiv .c3 a',
      function: SelectorFunction.text(),
    ),
    time: SelectorModel(
      selector: '#cdiv .c3',
      function: SelectorFunction.text(),
      regex: r'on(.+)\sby',
    ),
  ),
  thumbnailSelector: const SelectorModel(selector: '.gdtm, .gdtl'),
  thumbnail: const ImageSelectorModel(
    width: SelectorModel(
      selector: 'img',
      function: SelectorFunction.attr(),
      param: 'style',
      regex: r'width:(\d+)px',
      defaultValue: '200',
    ),
    height: SelectorModel(
      selector: 'img',
      function: SelectorFunction.attr(),
      param: 'style',
      regex: r'height:(\d+)px',
      defaultValue: '283',
    ),
    x: SelectorModel(
      selector: 'div',
      function: SelectorFunction.attr(),
      param: 'style',
      regex: r'-(\d+)px 0 no-repeat',
    ),
    url: SelectorModel(
      selector: 'div, img',
      function: SelectorFunction.attr(),
      param: 'src,style',
      regex: r'https:.+?\.jpg',
    ),
  ),
  target: const SelectorModel(
    selector: 'a',
    function: SelectorFunction.attr(),
    param: 'href',
    regex: r'\/s\/(.+)',
  ),
  coverImage: const ImageSelectorModel(
    url: SelectorModel(
      selector: '#gd1 div',
      function: SelectorFunction.attr(),
      param: 'style',
      regex: r'url\((.+)\)',
    ),
    width: SelectorModel(
      selector: '#gd1 div',
      function: SelectorFunction.attr(),
      param: 'style',
      regex: r'width:(\d+)px',
    ),
    height: SelectorModel(
      selector: '#gd1 div',
      function: SelectorFunction.attr(),
      param: 'style',
      regex: r'height:(\d+)px',
    ),
  ),
  countPrePage: const SelectorModel(
    selector: '#gdo',
    function: SelectorFunction.raw(),
    regex: r'<div class="ths nosel">(\d+) rows.+sel">(\w)',
    replace: r'$1|$2',
    script: ScriptField.js(
      script: r"let[r,c]=$arg.split('|');parseInt(r)*{'L':5,'N':10}[c];",
    ),
  ),
);
