import 'package:catweb/gen/protobuf/parser.pbserver.dart';
import 'package:catweb/gen/protobuf/selector.pbserver.dart';

final ehListParser = ListViewParser(
    name: 'commonList',
    itemSelector: Selector(
      selector:
          "//table[starts-with(@class,'itg')]/tbody/tr[position()>1]|//div[@class='gl1t']",
    ),
    title: Selector(
      selector: '.glink',
      function: SelectorFunction.text,
    ),
    subtitle: Selector(
      selector: '.gl5m a, .gl4c a, .gl3e a',
      function: SelectorFunction.text,
    ),
    imgCount: Selector(
      selector:
          "//div[@class='glthumb']/*[2]/*[2]|//div[@class='gl3e']/*[5]|//div[@class='gl5t']/*[2]/*[2]",
      function: SelectorFunction.text,
      regex: r'\d+',
    ),
    badgeSelector: Selector(
      selector: '.gt',
    ),
    badgeText: Selector(
      function: SelectorFunction.text,
    ),
    badgeColor: Selector(
      function: SelectorFunction.attr,
      param: 'style',
      regex: r'#[0-9a-fA-F]{6}',
    ),
    tag: Selector(
      selector: '.cn, .cs',
      function: SelectorFunction.text,
    ),
    tagColor: Selector(
      selector: '.cn, .cs',
      function: SelectorFunction.attr,
      param: 'class',
      regex: 'ct.',
      js: r"function hook(t){return{ct2:'#f66158',ct3:'#f09e19',ct4:'#d2d303',ct5:'#0fa911',cta:'#2fd92c',ct9:'#0bbfd3',ct6:'#4f5ce6',ct7:'#9030df',ct8:'#f38af2',ct1:'#8a8a8a'}[t]}",
    ),
    star: Selector(
      selector: '.ir',
      function: SelectorFunction.attr,
      param: 'style',
      regex: r'background-position:-?(\d+)px -?(\d+)px',
      replace: r'5-$1/16-($2-1)/40',
    ),
    uploadTime: Selector(
      selector: '.glnew,.glfc',
      function: SelectorFunction.text,
    ),
    previewImg: ImageSelector(
      imgUrl: Selector(
          selector: '.gl2c img,.glthumb img,.gl1e img,.gl3t img',
          function: SelectorFunction.attr,
          param: 'data-src,src',
          regex: r'https:\/\/\w+?\.\w+\/(.+)',
          replace: r'https://ehgt.org/$1'),
      imgWidth: Selector(
        selector: '.gl2c img,.glthumb img,.gl1e img,.gl3t img',
        function: SelectorFunction.attr,
        param: 'style',
        regex: r'width:(\d+)',
      ),
      imgHeight: Selector(
        selector: '.gl2c img,.glthumb img,.gl1e img,.gl3t img',
        function: SelectorFunction.attr,
        param: 'style',
        regex: r'height:(\d+)',
      ),
    ),
    extraSelector: [
      ExtraSelector(
        global: true,
        id: 'fav0Tag',
        selector: Selector(
          selector: '/body/div[@class="ido"]/div[@class="nosel"]/div[1]/div[3]/text()',
        ),
      ),
      ExtraSelector(
        global: true,
        id: 'fav1Tag',
        selector: Selector(
          selector: '/body/div[@class="ido"]/div[@class="nosel"]/div[2]/div[3]/text()',
        ),
      ),
      ExtraSelector(
        global: true,
        id: 'fav2Tag',
        selector: Selector(
          selector: '/body/div[@class="ido"]/div[@class="nosel"]/div[3]/div[3]/text()',
        ),
      ),
      ExtraSelector(
        global: true,
        id: 'fav3Tag',
        selector: Selector(
          selector: '/body/div[@class="ido"]/div[@class="nosel"]/div[4]/div[3]/text()',
        ),
      ),
      ExtraSelector(
        global: true,
        id: 'fav4Tag',
        selector: Selector(
          selector: '/body/div[@class="ido"]/div[@class="nosel"]/div[5]/div[3]/text()',
        ),
      ),
      ExtraSelector(
        global: true,
        id: 'fav5Tag',
        selector: Selector(
          selector: '/body/div[@class="ido"]/div[@class="nosel"]/div[6]/div[3]/text()',
        ),
      ),
      ExtraSelector(
        global: true,
        id: 'fav6Tag',
        selector: Selector(
          selector: '/body/div[@class="ido"]/div[@class="nosel"]/div[7]/div[3]/text()',
        ),
      ),
      ExtraSelector(
        global: true,
        id: 'fav7Tag',
        selector: Selector(
          selector: '/body/div[@class="ido"]/div[@class="nosel"]/div[8]/div[3]/text()',
        ),
      ),
      ExtraSelector(
        global: true,
        id: 'fav8Tag',
        selector: Selector(
          selector: '/body/div[@class="ido"]/div[@class="nosel"]/div[9]/div[3]/text()',
        ),
      ),
      ExtraSelector(
        global: true,
        id: 'fav9Tag',
        selector: Selector(
          selector: '/body/div[@class="ido"]/div[@class="nosel"]/div[10]/div[3]/text()',
        ),
      ),
    ]);
