import 'package:catweb/data/models/site/field.dart';
import 'package:catweb/data/models/site/parser.dart';
import 'package:catweb/data/models/site/selector.dart';
import 'package:uuid/uuid.dart';

final ehListParser = ParserModelList(
  name: '通用列表',
  uuid: const Uuid().v5(Uuid.NAMESPACE_URL, 'commonListUuid').toString(),
  itemSelector: const SelectorModel(
    selector: "//div[@class='gl1t'] | //*[starts-with(@class, 'gl2')]/..",
    type: SelectorQuery.xpath(),
  ),
  failedSelector: const SelectorModel(
    selector: '//*[contains(text(), "IP address has")]',
    function: SelectorFunction.text(),
    type: SelectorQuery.xpath(),
  ),
  idCode: const SelectorModel(
    selector: '.glname a, .gl1e a, .gl3t a',
    function: SelectorFunction.attr(),
    param: 'href',
    regex: r'g\/(\d+\/\w+)',
  ),
  title: const SelectorModel(
    selector: '.glink',
    function: SelectorFunction.text(),
  ),
  subtitle: const SelectorModel(
    selector: '.gl5m a, .gl4c a, .gl3e a',
    function: SelectorFunction.text(),
  ),
  language: const SelectorModel(
    selector: '.gt[title^=language]',
    function: SelectorFunction.text(),
    script: ScriptField.js(
      script:
          r'a={chinese:"中文",english:"英语",french:"法语",german:"德语",japanese:"日语",korean:"韩语",russian:"俄语",spanish:"西班牙语",speechless:"无字",italian:"意大利语"};a[$arg.toLowerCase()]',
    ),
  ),
  imageCount: const SelectorModel(
    selector:
        "//div[@class='glthumb']/*[2]/*[2]|//div[@class='gl3e']/*[5]|//div[@class='gl5t']/*[2]/*[2]",
    type: SelectorQuery.xpath(),
    function: SelectorFunction.text(),
    regex: r'\d+',
  ),
  badgeSelector: const SelectorModel(
    selector: '.gt, .gtl',
  ),
  badgeItem: const TagSelectorModel(
    text: SelectorModel(
      function: SelectorFunction.attr(),
      param: 'title',
      regex: r'(\w).+?:(.*)',
      replace: r'$1:$2',
    ),
    color: SelectorModel(
      function: SelectorFunction.attr(),
      param: 'style',
      regex: r'(#[0-9a-fA-F]{6})\)',
    ),
  ),
  tag: const SelectorModel(
    selector: '.cn, .cs',
    function: SelectorFunction.text(),
  ),
  tagItem: const TagSelectorModel(
    color: SelectorModel(
      function: SelectorFunction.attr(),
      param: 'class',
      regex: 'ct.',
      script: ScriptField.js(
        script:
            r'a={ct2:"#f66158",ct3:"#f09e19",ct4:"#d2d303",ct5:"#0fa911",cta:"#2fd92c",ct9:"#0bbfd3",ct6:"#4f5ce6",ct7:"#9030df",ct8:"#f38af2",ct1:"#8a8a8a"},a[$arg];',
      ),
    ),
  ),
  star: const SelectorModel(
    selector: '.ir',
    function: SelectorFunction.attr(),
    param: 'style',
    regex: r'background-position:-?(\d+)px -?(\d+)px',
    replace: r'5-$1/16-($2-1)/40',
    script: ScriptField.js(
      script: r'eval($arg)',
    ),
  ),
  uploadTime: const SelectorModel(
    selector: '.gl2c>div:nth-child(3),.glnew,.gl3e>div:nth-child(2)',
    function: SelectorFunction.text(),
  ),
  previewImage: const ImageSelectorModel(
    url: SelectorModel(
      selector: '.gl2c img,.glthumb img,.gl1e img,.gl3t img',
      function: SelectorFunction.attr(),
      param: 'data-src,src',
      regex: r'https:\/\/\w+?\.\w+\/(.+)',
      replace: r'https://ehgt.org/$1',
    ),
    width: SelectorModel(
      selector: '.gl2c img,.glthumb img,.gl1e img,.gl3t img',
      function: SelectorFunction.attr(),
      param: 'style',
      regex: r'width:(\d+)',
    ),
    height: SelectorModel(
      selector: '.gl2c img,.glthumb img,.gl1e img,.gl3t img',
      function: SelectorFunction.attr(),
      param: 'style',
      regex: r'height:(\d+)',
    ),
  ),
  nextPage: const SelectorModel(
    selector: '#unext',
    function: SelectorFunction.attr(),
    param: 'href',
  ),
  extra: [
    const ExtraSelectorModel(
      persistence: true,
      id: 'fav0Tag',
      selector: SelectorModel(
        selector: '.fp:nth-child(1) div:nth-child(3)',
        function: SelectorFunction.text(),
      ),
    ),
    const ExtraSelectorModel(
      persistence: true,
      id: 'fav1Tag',
      selector: SelectorModel(
        selector: '.fp:nth-child(2) div:nth-child(3)',
        function: SelectorFunction.text(),
      ),
    ),
    const ExtraSelectorModel(
      persistence: true,
      id: 'fav2Tag',
      selector: SelectorModel(
        selector: '.fp:nth-child(3) div:nth-child(3)',
        function: SelectorFunction.text(),
      ),
    ),
    const ExtraSelectorModel(
      persistence: true,
      id: 'fav3Tag',
      selector: SelectorModel(
        selector: '.fp:nth-child(4) div:nth-child(3)',
        function: SelectorFunction.text(),
      ),
    ),
    const ExtraSelectorModel(
      persistence: true,
      id: 'fav4Tag',
      selector: SelectorModel(
        selector: '.fp:nth-child(5) div:nth-child(3)',
        function: SelectorFunction.text(),
      ),
    ),
    const ExtraSelectorModel(
      persistence: true,
      id: 'fav5Tag',
      selector: SelectorModel(
        selector: '.fp:nth-child(6) div:nth-child(3)',
        function: SelectorFunction.text(),
      ),
    ),
    const ExtraSelectorModel(
      persistence: true,
      id: 'fav6Tag',
      selector: SelectorModel(
        selector: '.fp:nth-child(7) div:nth-child(3)',
        function: SelectorFunction.text(),
      ),
    ),
    const ExtraSelectorModel(
      persistence: true,
      id: 'fav7Tag',
      selector: SelectorModel(
        selector: '.fp:nth-child(8) div:nth-child(3)',
        function: SelectorFunction.text(),
      ),
    ),
    const ExtraSelectorModel(
      persistence: true,
      id: 'fav8Tag',
      selector: SelectorModel(
        selector: '.fp:nth-child(9) div:nth-child(3)',
        function: SelectorFunction.text(),
      ),
    ),
    const ExtraSelectorModel(
      persistence: true,
      id: 'fav9Tag',
      selector: SelectorModel(
        selector: '.fp:nth-child(10) div:nth-child(3)',
        function: SelectorFunction.text(),
      ),
    ),
    const ExtraSelectorModel(
      id: '#dialog',
      selector: SelectorModel(
        selector: '#eventpane',
        function: SelectorFunction.text(),
      ),
    ),
    const ExtraSelectorModel(
      id: 'from',
      selector: SelectorModel(
        selector: '#unext',
        function: SelectorFunction.text(),
        param: 'href',
      ),
    ),
  ],
);
