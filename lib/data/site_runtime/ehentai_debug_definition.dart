import 'site_definition.dart';

/// 新建规则时使用的 E-Hentai 调试模板。
///
/// 该定义直接使用当前运行时模型，不承担旧 schema 的转换职责。
SiteDefinition buildEhentaiDebugDefinition(String id) => SiteDefinition(
  schemaVersion: SiteDefinition.currentSchemaVersion,
  id: id,
  name: 'E-Hentai',
  baseUrl: 'https://e-hentai.org/',
  options: SiteOptions(
    flags: 'ignoreCertificate',
    loginUrl: 'https://e-hentai.org/bounce_login.php',
    loginCookiePattern: 'e-hentai.org',
    loginCookieDescription: '因为登录无法直连，登录域名与站点域名不同',
    headers: const [],
    cookies: [
      DomainValueRule(
        mode: DomainMatchMode.suffix,
        pattern: 'e-hentai.org',
        value: 'nw=1',
      ),
    ],
  ),
  parsers: const [
    ParserRule(
      id: 'eh-list-parser',
      name: '通用列表',
      kind: EndpointKind.list,
      config: ParserConfig(
        selectors: {
          ParserSelectorKey.item: SelectorRule(
            selector:
                "//div[@class='gl1t'] | //*[starts-with(@class, 'gl2')]/..",
            queryType: SelectorQueryType.xpath,
          ),
          ParserSelectorKey.idCode: SelectorRule(
            selector: '.glname a, .gl1e a, .gl3t a',
            function: SelectorFunctionType.attribute,
            parameter: 'href',
            regex: r'g\/(\d+\/\w+)',
          ),
          ParserSelectorKey.title: SelectorRule(selector: '.glink'),
          ParserSelectorKey.subtitle: SelectorRule(
            selector: '.gl5m a, .gl4c a, .gl3e a',
          ),
          ParserSelectorKey.language: SelectorRule(
            selector: '.gt[title^=language]',
          ),
          ParserSelectorKey.imageCount: SelectorRule(
            selector: ".//div[@class='glthumb']/*[2]/*[2]|.//div[@class='gl3e']/*[5]|.//div[@class='gl5t']/*[2]/*[2]",
            queryType: SelectorQueryType.xpath,
            regex: r'\d+',
          ),
          ParserSelectorKey.badge: SelectorRule(selector: '.gt, .gtl'),
          ParserSelectorKey.tag: SelectorRule(selector: '.cn, .cs'),
          ParserSelectorKey.rating: SelectorRule(
            selector: '.ir',
            function: SelectorFunctionType.attribute,
            parameter: 'style',
            regex: r'background-position:-?(\d+)px -?(\d+)px',
            replace: r'5-$1/16-($2-1)/40',
            script: SelectorScript.javaScript(source: r'eval($arg)'),
          ),
          ParserSelectorKey.uploadTime: SelectorRule(
            selector: '.gl2c>div:nth-child(3),.glnew,.gl3e>div:nth-child(2)',
          ),
          ParserSelectorKey.previewUrl: SelectorRule(
            selector: '.gl2c img,.glthumb img,.gl1e img,.gl3t img',
            function: SelectorFunctionType.attribute,
            parameter: 'data-src,src',
          ),
          ParserSelectorKey.nextPage: SelectorRule(
            selector: '#unext',
            function: SelectorFunctionType.attribute,
            parameter: 'href',
          ),
          ParserSelectorKey.failure: SelectorRule(
            selector: '//*[contains(text(), "IP address has")]',
            queryType: SelectorQueryType.xpath,
          ),
        },
      ),
    ),
    ParserRule(
      id: 'eh-gallery-parser',
      name: '画廊',
      kind: EndpointKind.gallery,
      config: ParserConfig(
        selectors: {
          ParserSelectorKey.title: SelectorRule(
            selector: '//h1[@id="gj"]/text() | //h1[@id="gn"]/text()',
            queryType: SelectorQueryType.xpath,
          ),
          ParserSelectorKey.subtitle: SelectorRule(selector: '#gdn a'),
          ParserSelectorKey.uploadTime: SelectorRule(
            selector: '#gdd tr:nth-child(1)>.gdt2',
          ),
          ParserSelectorKey.language: SelectorRule(
            selector: '#gdd tr:nth-child(4)>.gdt2',
            regex: r'\S+',
          ),
          ParserSelectorKey.imageCount: SelectorRule(
            selector: '#gdd tr:nth-child(6)>.gdt2',
            regex: r'\d+',
          ),
          ParserSelectorKey.rating: SelectorRule(
            selector: "//script[contains(.,'average_rating')]",
            queryType: SelectorQueryType.xpath,
            regex: r'average_rating\s*=\s*([0-9]+(?:\.[0-9]+)?)',
          ),
          ParserSelectorKey.tag: SelectorRule(selector: '#gdc .cs'),
          ParserSelectorKey.badge: SelectorRule(
            selector: '#taglist .gt, #taglist .gtl',
          ),
          ParserSelectorKey.badgeText: SelectorRule(
            queryType: SelectorQueryType.self,
            script: SelectorScript.javaScript(source: r'$arg.trim()'),
          ),
          ParserSelectorKey.badgeCategory: SelectorRule(
            selector: "ancestor::tr[1]/td[contains(@class,'tc')][1]",
            queryType: SelectorQueryType.xpath,
            script: SelectorScript.javaScript(
              source: r'$arg.replace(/:\s*$/, "")',
            ),
          ),
          ParserSelectorKey.description: SelectorRule(
            selector: '//a[@name="ulcomment"]/ancestor::div[@class="c1"]//div[@id="comment_0"]',
            queryType: SelectorQueryType.xpath,
          ),
          ParserSelectorKey.comment: SelectorRule(selector: '#cdiv .c1'),
          ParserSelectorKey.commentContent: SelectorRule(selector: '.c6'),
          ParserSelectorKey.commentUsername: SelectorRule(selector: '.c3 a'),
          ParserSelectorKey.commentTime: SelectorRule(
            selector: '.c3',
            regex: r'Posted on (.+?) by:',
          ),
          ParserSelectorKey.commentScore: SelectorRule(selector: '.c5 span'),
          ParserSelectorKey.commentAvatarUrl: SelectorRule(
            selector: '.c3 img, img.avatar',
            function: SelectorFunctionType.attribute,
            parameter: 'data-src,src',
          ),
          ParserSelectorKey.thumbnail: SelectorRule(
            selector: '#gdt > a, #gdt .gdtm, #gdt .gdtl',
          ),
          ParserSelectorKey.thumbnailTarget: SelectorRule(
            selector: './@href | .//a/@href',
            queryType: SelectorQueryType.xpath,
            regex: r'/s/(.+)',
          ),
          ParserSelectorKey.thumbnailUrl: SelectorRule(
            selector: '(.//img/@data-src | .//img[not(@data-src)]/@src | .//div[contains(@style,"url(")]/@style)[1]',
            queryType: SelectorQueryType.xpath,
            script: SelectorScript.javaScript(
              source: r'''const m=$arg.match(/url\(\s*['\"]?([^'\")]+)['\"]?\s*\)/);m?m[1]:$arg''',
            ),
          ),
          ParserSelectorKey.thumbnailWidth: SelectorRule(
            selector: '(.//img/@width | .//img/@style | .//div[contains(@style,"url(")]/@style)[1]',
            queryType: SelectorQueryType.xpath,
            script: SelectorScript.javaScript(
              source: r'const m=$arg.match(/width:\s*(\d+(?:\.\d+)?)px/);m?m[1]:$arg',
            ),
          ),
          ParserSelectorKey.thumbnailHeight: SelectorRule(
            selector: '(.//img/@height | .//img/@style | .//div[contains(@style,"url(")]/@style)[1]',
            queryType: SelectorQueryType.xpath,
            script: SelectorScript.javaScript(
              source: r'const m=$arg.match(/height:\s*(\d+(?:\.\d+)?)px/);m?m[1]:$arg',
            ),
          ),
          ParserSelectorKey.thumbnailX: SelectorRule(
            selector: './/div[contains(@style,"url(")]/@style',
            queryType: SelectorQueryType.xpath,
            defaultValue: '0',
            script: SelectorScript.javaScript(
              source: r'const m=$arg.match(/(?:\)|background-position:)\s*(-?\d+(?:\.\d+)?)px\s+(-?\d+(?:\.\d+)?)(?:px)?/);m?String(-Number(m[1])):"0"',
            ),
          ),
          ParserSelectorKey.thumbnailY: SelectorRule(
            selector: './/div[contains(@style,"url(")]/@style',
            queryType: SelectorQueryType.xpath,
            defaultValue: '0',
            script: SelectorScript.javaScript(
              source: r'const m=$arg.match(/(?:\)|background-position:)\s*(-?\d+(?:\.\d+)?)px\s+(-?\d+(?:\.\d+)?)(?:px)?/);m?String(-Number(m[2])):"0"',
            ),
          ),
          ParserSelectorKey.coverUrl: SelectorRule(
            selector: '#gd1 div',
            function: SelectorFunctionType.attribute,
            parameter: 'style',
            regex: r'''url\(\s*['"]?([^'")]+)['"]?\s*\)''',
          ),
          ParserSelectorKey.pageCount: SelectorRule(
            selector: "(//table[contains(@class,'ptt')])[1]//a[normalize-space(.)!='' and number(normalize-space(.))=number(normalize-space(.))][last()]",
            queryType: SelectorQueryType.xpath,
          ),
          ParserSelectorKey.nextPage: SelectorRule(
            selector:
                "(//table[contains(@class,'ptt')])[1]//td[last()]/a/@href",
            queryType: SelectorQueryType.xpath,
          ),
          ParserSelectorKey.failure: SelectorRule(
            selector: '//*[contains(text(), "IP address has")]',
            queryType: SelectorQueryType.xpath,
          ),
        },
      ),
    ),
    ParserRule(
      id: 'eh-reader-parser',
      name: '画廊查看器',
      kind: EndpointKind.reader,
      config: ParserConfig(
        selectors: {
          ParserSelectorKey.id: SelectorRule(
            selector: '#i2 .sn a:nth-child(1)',
            function: SelectorFunctionType.attribute,
            parameter: 'href',
            regex: r's\/(.+)',
          ),
          ParserSelectorKey.imageUrl: SelectorRule(
            selector: '#i3 img',
            function: SelectorFunctionType.attribute,
            parameter: 'src',
          ),
          ParserSelectorKey.rawImage: SelectorRule(
            selector: '#i7 a',
            function: SelectorFunctionType.attribute,
            parameter: 'href',
          ),
        },
      ),
    ),
    ParserRule(
      id: 'eh-autocomplete-parser',
      name: '自动补全',
      kind: EndpointKind.autocomplete,
      config: ParserConfig(
        selectors: {
          ParserSelectorKey.item: SelectorRule(
            selector: r'tags.*',
            queryType: SelectorQueryType.jsonPath,
          ),
          ParserSelectorKey.title: SelectorRule(
            script: SelectorScript.javaScript(
              source: r'var r=JSON.parse($arg);r.ns+":"+r.tn',
            ),
          ),
          ParserSelectorKey.subtitle: SelectorRule(
            script: SelectorScript.javaScript(
              source: r'var r=JSON.parse($arg);r.mns+":"+r.mtn',
            ),
          ),
        },
      ),
    ),
  ],
  endpoints: const [
    EndpointRule(
      id: 'eh-autocomplete',
      kind: EndpointKind.autocomplete,
      name: '搜索补全',
      visible: false,
      request: RequestRule(
        method: RequestMethod.post,
        url: 'https://api.e-hentai.org/api.php',
        body: RequestBodyRule.json({
          'method': 'tagsuggest',
          'text': '{{search}}',
        }),
      ),
      parserId: 'eh-autocomplete-parser',
      pagination: PaginationRule.none(),
      presentation: EndpointPresentation(
        autocompleteSplitChar: ' ',
        autocompleteTimeout: 2000,
      ),
    ),
    EndpointRule(
      id: 'eh-reader',
      kind: EndpointKind.reader,
      name: '图片显示器',
      visible: false,
      request: RequestRule(method: RequestMethod.get, url: '/s/{{idCode}}'),
      parserId: 'eh-reader-parser',
      pagination: PaginationRule.none(),
    ),
    EndpointRule(
      id: 'eh-gallery',
      kind: EndpointKind.gallery,
      name: '画廊',
      visible: false,
      request: RequestRule(
        method: RequestMethod.get,
        url: '/g/{{idCode}}/',
        query: {'p': '{{page}}'},
      ),
      parserId: 'eh-gallery-parser',
      pagination: PaginationRule.pageNumber(
        variable: 'page',
        initial: 0,
        step: 1,
        pageSize: 40,
        endCondition: PageEndCondition.emptyItems,
      ),
      links: EndpointLinks(reader: 'eh-reader'),
    ),
    EndpointRule(
      id: 'eh-home',
      kind: EndpointKind.list,
      name: '主页',
      icon: 'home',
      request: RequestRule(
        method: RequestMethod.get,
        url: '/',
        query: {'f_search': '{{search}}'},
      ),
      parserId: 'eh-list-parser',
      pagination: _ehNextPage,
      links: EndpointLinks(item: 'eh-gallery', autocomplete: 'eh-autocomplete'),
      presentation: EndpointPresentation(
        filters: _ehHomeFilters,
        filterScript: SelectorScript.javaScript(
          source: r'var a=JSON.parse($arg),r=0,i=0,o=["misc","doujinshi","manga","artistcg","gamecg","imageset","cosplay","asianporn","nonh","western"];for(var s in o)r+=a["b_"+o[s]]?0:1<<i,i+=1;var e=["advsearch=1"];for(var s in 0!=r&&e.push("f_cats="+r),a)-1!=s.indexOf("f")&&a[s]&&e.push(s+"=on");e.join("&")',
        ),
      ),
    ),
    EndpointRule(
      id: 'eh-popular',
      kind: EndpointKind.list,
      name: '热门',
      icon: 'flame',
      request: RequestRule(method: RequestMethod.get, url: '/popular'),
      parserId: 'eh-list-parser',
      pagination: _ehNextPage,
      links: EndpointLinks(item: 'eh-gallery'),
    ),
    EndpointRule(
      id: 'eh-watched',
      kind: EndpointKind.list,
      name: '关注',
      icon: 'eye',
      request: RequestRule(method: RequestMethod.get, url: '/watched'),
      parserId: 'eh-list-parser',
      pagination: _ehNextPage,
      links: EndpointLinks(item: 'eh-gallery'),
    ),
    EndpointRule(
      id: 'eh-favorites',
      kind: EndpointKind.list,
      name: '收藏',
      icon: 'heart',
      request: RequestRule(
        method: RequestMethod.get,
        url: '/favorites.php',
        query: {'favcat': '{{favcat}}'},
      ),
      parserId: 'eh-list-parser',
      pagination: _ehNextPage,
      links: EndpointLinks(item: 'eh-gallery'),
      presentation: EndpointPresentation(subpages: _ehFavoriteSubpages),
    ),
  ],
);

const _ehNextPage = PaginationRule.continuation(
  target: ContinuationTarget.url,
  responseField: ParserSelectorKey.nextPage,
);

const _ehHomeFilters = [
  EndpointFilter(
    name: '同人志',
    key: 'b_doujinshi',
    type: EndpointFilterType.boolean,
    defaultValue: 'true',
  ),
  EndpointFilter(
    name: '漫画',
    key: 'b_manga',
    type: EndpointFilterType.boolean,
    defaultValue: 'true',
  ),
  EndpointFilter(
    name: '游戏CG',
    key: 'b_gamecg',
    type: EndpointFilterType.boolean,
    defaultValue: 'true',
  ),
  EndpointFilter(
    name: '图片集',
    key: 'b_imageset',
    type: EndpointFilterType.boolean,
    defaultValue: 'true',
  ),
  EndpointFilter(
    name: '画师CG',
    key: 'b_artistcg',
    type: EndpointFilterType.boolean,
    defaultValue: 'true',
  ),
  EndpointFilter(
    name: 'Cosplay',
    key: 'b_cosplay',
    type: EndpointFilterType.boolean,
    defaultValue: 'true',
  ),
  EndpointFilter(
    name: '西方',
    key: 'b_western',
    type: EndpointFilterType.boolean,
    defaultValue: 'true',
  ),
  EndpointFilter(
    name: '无H',
    key: 'b_nonh',
    type: EndpointFilterType.boolean,
    defaultValue: 'true',
  ),
  EndpointFilter(
    name: '杂项',
    key: 'b_misc',
    type: EndpointFilterType.boolean,
    defaultValue: 'true',
  ),
  EndpointFilter(
    name: '搜索画廊名称',
    key: 'f_sname',
    type: EndpointFilterType.boolean,
    defaultValue: 'true',
  ),
  EndpointFilter(
    name: '搜索画廊标签',
    key: 'f_stags',
    type: EndpointFilterType.boolean,
    defaultValue: 'true',
  ),
  EndpointFilter(
    name: '搜索画廊种子',
    key: 'f_storr',
    type: EndpointFilterType.boolean,
    defaultValue: 'false',
  ),
  EndpointFilter(
    name: '搜索低愿力标签',
    key: 'f_sdt1',
    type: EndpointFilterType.boolean,
    defaultValue: 'false',
  ),
  EndpointFilter(
    name: '搜索画廊描述',
    key: 'f_sdesc',
    type: EndpointFilterType.boolean,
    defaultValue: 'false',
  ),
  EndpointFilter(
    name: '显示删除的画廊',
    key: 'f_sh',
    type: EndpointFilterType.boolean,
    defaultValue: 'false',
  ),
];

const _ehFavoriteSubpages = [
  EndpointSubpage(name: '全部'),
  EndpointSubpage(name: 'Favourite 0', key: 'favcat', value: '0'),
  EndpointSubpage(name: 'Favourite 1', key: 'favcat', value: '1'),
  EndpointSubpage(name: 'Favourite 2', key: 'favcat', value: '2'),
  EndpointSubpage(name: 'Favourite 3', key: 'favcat', value: '3'),
  EndpointSubpage(name: 'Favourite 4', key: 'favcat', value: '4'),
  EndpointSubpage(name: 'Favourite 5', key: 'favcat', value: '5'),
  EndpointSubpage(name: 'Favourite 6', key: 'favcat', value: '6'),
  EndpointSubpage(name: 'Favourite 7', key: 'favcat', value: '7'),
  EndpointSubpage(name: 'Favourite 8', key: 'favcat', value: '8'),
  EndpointSubpage(name: 'Favourite 9', key: 'favcat', value: '9'),
];
