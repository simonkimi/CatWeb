import 'package:catweb/data/protocol/model/parser.dart';
import 'package:catweb/gen/protobuf/parser.pbserver.dart';
import 'package:catweb/gen/protobuf/selector.pbserver.dart';

final galleryParserModel = GalleryParserModel(GalleryParser(
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
      selector: '#gdd tr:nth-child(1) .gdt2', function: SelectorFunction.text),
  language: Selector(
      selector: '#gdd tr:nth-child(4) .gdt2', function: SelectorFunction.text),
  imgCount: Selector(
    selector: '#gdd tr:nth-child(6) .gdt2',
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
    js: r'function hook(t){for(var c=["ct2","ct3","ct4","ct5","cta","ct9","ct6","ct7","ct8","ct1"],f=["f66158","f09e19","d2d303","0fa911","2fd92c","0bbfd3","4f5ce6","9030df","f38af2","8a8a8a"],a=0;a<c.length;a++)if(-1!==t.indexOf(c[a]))return f[a];return null}',
  ),
  badgeText: Selector(
    selector: '.gt,.gtl',
    function: SelectorFunction.text,
  ),
  badgeType: Selector(
      selector: '.gt,.gtl',
      function: SelectorFunction.attr,
      param: 'id',
      regex: 'td_(.+?):'),
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
        defaultValue: '200'),
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
  prePageImg: Selector(
    selector: '#gdo',
    function: SelectorFunction.raw,
    regex: 'l">(.+?)<',
    replace: r'$1|$2',
    js: 'function hook(a){const b=a.split("|");return rows=4,-1!==b[0].indexOf("40 rows")?rows=40:-1!==b[0].indexOf("20 rows")?rows=20:-1!==b[0].indexOf("10 rows")&&(rows=10),column=10,-1!==b[1].indexOf("Large")&&(column=5),rows*column}',
  ),
  extraSelector: [ExtraSelector()],
));
