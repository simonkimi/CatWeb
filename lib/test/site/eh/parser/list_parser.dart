import 'package:catweb/data/models/site_model/parser/field.dart';
import 'package:catweb/data/models/site_model/parser/parser.dart';
import 'package:catweb/data/models/site_model/parser/selector.dart';
import 'package:uuid/uuid.dart';

final ehListParser = ListViewParser(
  name: '通用列表',
  uuid: const Uuid().v5(Uuid.NAMESPACE_URL, 'commonListUuid').toString(),
  itemSelector: Selector(
    selector: "//div[@class='gl1t'] | //*[starts-with(@class, 'gl2')]/..",
    type: SelectorType.xpath,
  ),
  failedSelector: Selector(
    selector: '//*[contains(text(), "IP address has")]',
    function: SelectorFunctionType.text,
    type: SelectorType.xpath,
  ),
  idCode: Selector(
    selector: '.glname a, .gl1e a, .gl3t a',
    function: SelectorFunctionType.attr,
    param: 'href',
    regex: r'g\/(\d+\/\w+)',
  ),
  title: Selector(
    selector: '.glink',
    function: SelectorFunctionType.text,
  ),
  subtitle: Selector(
    selector: '.gl5m a, .gl4c a, .gl3e a',
    function: SelectorFunctionType.text,
  ),
  language: Selector(
    selector: '.gt[title^=language]',
    function: SelectorFunctionType.text,
    script: ScriptField(
      script:
          r'a={chinese:"中文",english:"英语",french:"法语",german:"德语",japanese:"日语",korean:"韩语",russian:"俄语",spanish:"西班牙语",speechless:"无字",italian:"意大利语"};a[$arg.toLowerCase()]',
      type: ScriptFieldType.js,
    ),
  ),
  imageCount: Selector(
    selector:
        "//div[@class='glthumb']/*[2]/*[2]|//div[@class='gl3e']/*[5]|//div[@class='gl5t']/*[2]/*[2]",
    type: SelectorType.xpath,
    function: SelectorFunctionType.text,
    regex: r'\d+',
  ),
  badgeSelector: Selector(
    selector: '.gt, .gtl',
  ),
  badgeItem: TagSelector(
    text: Selector(
      function: SelectorFunctionType.attr,
      param: 'title',
      regex: r'(\w).+?:(.*)',
      replace: r'$1:$2',
    ),
    color: Selector(
      function: SelectorFunctionType.attr,
      param: 'style',
      regex: r'(#[0-9a-fA-F]{6})\)',
    ),
  ),
  tag: Selector(
    selector: '.cn, .cs',
    function: SelectorFunctionType.text,
  ),
  tagItem: TagSelector(
    color: Selector(
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
  star: Selector(
    selector: '.ir',
    function: SelectorFunctionType.attr,
    param: 'style',
    regex: r'background-position:-?(\d+)px -?(\d+)px',
    replace: r'5-$1/16-($2-1)/40',
    script: ScriptField(
      script: r'eval($arg)',
      type: ScriptFieldType.js,
    ),
  ),
  uploadTime: Selector(
    selector: '.gl2c>div:nth-child(3),.glnew,.gl3e>div:nth-child(2)',
    function: SelectorFunctionType.text,
  ),
  previewImage: ImageSelector(
    url: Selector(
      selector: '.gl2c img,.glthumb img,.gl1e img,.gl3t img',
      function: SelectorFunctionType.attr,
      param: 'data-src,src',
      regex: r'https:\/\/\w+?\.\w+\/(.+)',
      replace: r'https://ehgt.org/$1',
    ),
    width: Selector(
      selector: '.gl2c img,.glthumb img,.gl1e img,.gl3t img',
      function: SelectorFunctionType.attr,
      param: 'style',
      regex: r'width:(\d+)',
    ),
    height: Selector(
      selector: '.gl2c img,.glthumb img,.gl1e img,.gl3t img',
      function: SelectorFunctionType.attr,
      param: 'style',
      regex: r'height:(\d+)',
    ),
  ),
  nextPage: Selector(
    selector: '#unext',
    function: SelectorFunctionType.attr,
    param: 'href',
  ),
  extra: [
    ExtraSelector(
      globalService: true,
      id: 'fav0Tag',
      selector: Selector(
        selector: '.fp:nth-child(1) div:nth-child(3)',
        function: SelectorFunctionType.text,
      ),
    ),
    ExtraSelector(
      globalService: true,
      id: 'fav1Tag',
      selector: Selector(
        selector: '.fp:nth-child(2) div:nth-child(3)',
        function: SelectorFunctionType.text,
      ),
    ),
    ExtraSelector(
      globalService: true,
      id: 'fav2Tag',
      selector: Selector(
        selector: '.fp:nth-child(3) div:nth-child(3)',
        function: SelectorFunctionType.text,
      ),
    ),
    ExtraSelector(
      globalService: true,
      id: 'fav3Tag',
      selector: Selector(
        selector: '.fp:nth-child(4) div:nth-child(3)',
        function: SelectorFunctionType.text,
      ),
    ),
    ExtraSelector(
      globalService: true,
      id: 'fav4Tag',
      selector: Selector(
        selector: '.fp:nth-child(5) div:nth-child(3)',
        function: SelectorFunctionType.text,
      ),
    ),
    ExtraSelector(
      globalService: true,
      id: 'fav5Tag',
      selector: Selector(
        selector: '.fp:nth-child(6) div:nth-child(3)',
        function: SelectorFunctionType.text,
      ),
    ),
    ExtraSelector(
      globalService: true,
      id: 'fav6Tag',
      selector: Selector(
        selector: '.fp:nth-child(7) div:nth-child(3)',
        function: SelectorFunctionType.text,
      ),
    ),
    ExtraSelector(
      globalService: true,
      id: 'fav7Tag',
      selector: Selector(
        selector: '.fp:nth-child(8) div:nth-child(3)',
        function: SelectorFunctionType.text,
      ),
    ),
    ExtraSelector(
      globalService: true,
      id: 'fav8Tag',
      selector: Selector(
        selector: '.fp:nth-child(9) div:nth-child(3)',
        function: SelectorFunctionType.text,
      ),
    ),
    ExtraSelector(
      globalService: true,
      id: 'fav9Tag',
      selector: Selector(
        selector: '.fp:nth-child(10) div:nth-child(3)',
        function: SelectorFunctionType.text,
      ),
    ),
    ExtraSelector(
      id: '#dialog',
      selector: Selector(
        selector: '#eventpane',
        function: SelectorFunctionType.text,
      ),
    ),
    ExtraSelector(
      id: 'from',
      selector: Selector(
        selector: '#unext',
        function: SelectorFunctionType.text,
        param: 'href',
      ),
    ),
  ],
);
