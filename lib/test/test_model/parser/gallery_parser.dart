import 'package:catweb/gen/protobuf/parser.pbserver.dart';
import 'package:catweb/gen/protobuf/selector.pbserver.dart';

final ehGalleryParser = GalleryParser(
  name: '画廊',
  title: Selector(
    selector: '#gn',
    function: SelectorFunction.text,
  ),
  subtitle: Selector(
    selector: '#gdn',
    function: SelectorFunction.text,
  ),
  uploadTime: Selector(
    selector: '#gdd tr:nth-child(1)>.gdt2',
    function: SelectorFunction.text,
  ),
  language: Selector(
    selector: '#gdd tr:nth-child(4)>.gdt2',
    function: SelectorFunction.text,
  ),
  imgCount: Selector(
    selector: '#gdd tr:nth-child(6)>.gdt2',
    function: SelectorFunction.text,
    regex: r'\d+',
  ),
  star: Selector(
      selector: '#rating_label',
      function: SelectorFunction.text,
      regex: r'Average: (.+)'),
  tag: Selector(
    selector: '.cs',
    function: SelectorFunction.text,
  ),
  tagColor: Selector(
    selector: '.cs',
    function: SelectorFunction.attr,
    param: 'class',
    regex: 'ct.',
    js: r"function hook(t){return{ct2:'#f66158',ct3:'#f09e19',ct4:'#d2d303',ct5:'#0fa911',cta:'#2fd92c',ct9:'#0bbfd3',ct6:'#4f5ce6',ct7:'#9030df',ct8:'#f38af2',ct1:'#8a8a8a'}[t]}",
  ),
  badgeSelector: Selector(selector: '.gt,.gtl'),
  badgeText: Selector(
    function: SelectorFunction.text,
  ),
  badgeType: Selector(
    function: SelectorFunction.attr,
    param: 'id',
    regex: 'td_(.+?):',
  ),
  description: Selector(
      selector:
          '//a[@name="ulcomment"]/ancestor::div[@class="c1"]//div[@id="comment_0"]/text()'),
  commentSelector: Selector(
    selector: "//div[@class^='c5']/../..",
  ),
  comments: CommentSelector(
    content: Selector(
      selector: '#cdiv .c6',
      function: SelectorFunction.text,
    ),
    username: Selector(
      selector: '#cdiv .c3 a',
      function: SelectorFunction.text,
    ),
    postTime: Selector(
      selector: '#cdiv .c3',
      function: SelectorFunction.text,
      regex: r'on(.+)\sby',
    ),
    vote: Selector(
      selector: '#cdiv .c5',
      function: SelectorFunction.text,
      regex: r'-?\d+',
    ),
  ),
  thumbnailUrl: Selector(
    selector: '.gdtm a, .gdtl a',
    function: SelectorFunction.attr,
    param: 'href',
  ),
  thumbnail: ImageSelector(
    imgWidth: Selector(
      selector: '.gdtm img, .gdtl img',
      function: SelectorFunction.attr,
      param: 'style',
      regex: r'width:(\d+)px',
      defaultValue: '200',
    ),
    imgHeight: Selector(
      selector: '.gdtm img, .gdtl img',
      function: SelectorFunction.attr,
      param: 'style',
      regex: r'height:(\d+)px',
      defaultValue: '282',
    ),
    imgX: Selector(
        selector: '.gdtm div',
        function: SelectorFunction.attr,
        param: 'style',
        regex: r'-(\d)px 0 no-repeat'),
    imgUrl: Selector(
      selector: '.gdtm img, .gdtl img',
      function: SelectorFunction.attr,
      param: 'src',
    ),
  ),
  coverImg: ImageSelector(
    imgUrl: Selector(
      selector: '#gd1 div',
      function: SelectorFunction.attr,
      param: 'style',
      regex: r'url(.+)\)',
    ),
    imgWidth: Selector(
      selector: '#gd1 div',
      function: SelectorFunction.attr,
      param: 'style',
      regex: r'width:(\d+)px',
    ),
    imgHeight: Selector(
      selector: '#gd1 div',
      function: SelectorFunction.attr,
      param: 'style',
      regex: r'height:(\d+)px',
    ),
  ),
  prePageImageCount: Selector(
    selector: '#gdo',
    function: SelectorFunction.raw,
    regex: r'<div class="ths nosel">(\d+) rows.+sel">(\w)',
    replace: r'$1|$2',
    js: "function hook(t){var row=t.split('|')[0];var column=t.split('|')[1];return parseInt(row)*{'L':5,'N':10}[column]}",
  ),
  extraSelector: [ExtraSelector()],
);
