import 'package:catweb/data/protocol/model/parser.dart';
import 'package:catweb/gen/protobuf/parser.pbserver.dart';
import 'package:catweb/gen/protobuf/selector.pbserver.dart';

final galleryParserModel = GalleryParserModel(GalleryParser(
  name: '画廊',
  title: Selector(
    selector: '#gn',
    function: SelectorFunction.TEXT,
  ),
  subtitle: Selector(
    selector: '#gdn',
    function: SelectorFunction.TEXT,
  ),
  uploadTime: Selector(
    selector: '#gdd tr:nth-child(1) .gdt2',
    function: SelectorFunction.TEXT
  ),
  language: Selector(
    selector: '#gdd tr:nth-child(4) .gdt2',
    function: SelectorFunction.TEXT
  ),
  imgCount: Selector(
    selector: '#gdd tr:nth-child(6) .gdt2',
    function: SelectorFunction.TEXT,
    regex: r'\d+'
  ),
  favoriteCount: Selector(
    selector: '#gdd tr:nth-child(7) .gdt2',
    function: SelectorFunction.TEXT,
    regex: r'\d+'
  ),
  star: Selector(
    selector: '#rating_label',
    function: SelectorFunction.TEXT,
    regex: r'Average: (.+)'
  ),
  tag: Selector(
    selector: '.cs',
    function: SelectorFunction.TEXT,
  ),
  tagColor: Selector(
    selector: '.cs',
    function: SelectorFunction.ATTR,
    param: 'class',
    js: r'function hook(t){for(var c=["ct2","ct3","ct4","ct5","cta","ct9","ct6","ct7","ct8","ct1"],f=["f66158","f09e19","d2d303","0fa911","2fd92c","0bbfd3","4f5ce6","9030df","f38af2","8a8a8a"],a=0;a<c.length;a++)if(-1!==t.indexOf(c[a]))return f[a];return null}',
  ),
  badgeSelector: '.gt,.gtl',
  badgeText: Selector(
    function: SelectorFunction.TEXT,
  ),
  badgeType: Selector(
    function: SelectorFunction.ATTR,
    param: 'id',
    regex: 'td_(.+?):'
  ),
  commentSelector: '#cdiv',
  comments: CommentSelector(
    content: Selector(
      selector: '.c6',
      function: SelectorFunction.TEXT,
    ),
    username: Selector(
      selector: '.c3 a',
      function: SelectorFunction.TEXT,
    ),
    postTime: Selector(
      selector: '.c3',
      function: SelectorFunction.TEXT,
      regex: r'on(.+)\sby',
    ),
    vote: Selector(
      selector: '.c5',
      function: SelectorFunction.TEXT,
      regex: r'-?\d+',
    ),
  ),
  thumbnailSelector: '.gdtm, .gdtl',
  thumbnailUrl: Selector(
    selector: '.a',
    function: SelectorFunction.ATTR,
    param: 'href',
  ),
  thumbnail: ImageSelector(
    imgWidth: Selector(
      selector: 'img',
      function: SelectorFunction.STYLE,
      regex: r'width:(\d+)px',
      defaultValue: '200'
    ),
    imgHeight: Selector(
      selector: 'img',
      function: SelectorFunction.STYLE,
      regex: r'height:(\d+)px',
      defaultValue: '282',
    ),
    imgX: Selector(
      selector: 'div',
      function: SelectorFunction.STYLE,
      regex: r'-(\d)px 0 no-repeat'
    ),
    imgUrl: Selector(
      selector: 'img',
      function: SelectorFunction.ATTR,
      param: 'src',
    ),
  ),
  coverImg: ImageSelector(
    imgUrl: Selector(
      selector: '#gd1 div',
      function: SelectorFunction.STYLE,
      regex: r'url(.+)\)'
    ),
    imgWidth: Selector(
      selector: '#gd1 div',
      function: SelectorFunction.STYLE,
      regex: r'width:(\d+)px'
    ),
    imgHeight: Selector(
      selector: '#gd1 div',
      function: SelectorFunction.STYLE,
      regex: r'height:(\d+)px'
    ),
  ),
  prePageImg: Selector(
    selector: '#gdo',
    function: SelectorFunction.HTML,
    regex: 'l">(.+?)<',
    replace: r'$1|$2',
    js: 'function hook(a){const b=a.split("|");return rows=4,-1!==b[0].indexOf("40 rows")?rows=40:-1!==b[0].indexOf("20 rows")?rows=20:-1!==b[0].indexOf("10 rows")&&(rows=10),column=10,-1!==b[1].indexOf("Large")&&(column=5),rows*column}'
  ),
));
