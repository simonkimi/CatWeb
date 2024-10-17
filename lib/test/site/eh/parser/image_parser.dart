import 'package:catweb/data/models/site/parser.dart';
import 'package:catweb/data/models/site/selector.dart';
import 'package:uuid/uuid.dart';

final ehImageParser = ParserModelImageReader(
  name: '画廊查看器',
  uuid: const Uuid().v4().toString(),
  id: const SelectorModel(
    selector: '#i2 .sn a:nth-child(1)',
    function: SelectorFunction.attr(),
    param: 'href',
    regex: r's\/(.+)',
  ),
  image: const ImageSelectorModel(
    url: SelectorModel(
      selector: '#i3 img',
      function: SelectorFunction.attr(),
      param: 'src',
    ),
    width: SelectorModel(
      selector: '#i3 img',
      function: SelectorFunction.attr(),
      param: 'style',
      regex: r'width: (\d+)px',
    ),
    height: SelectorModel(
      selector: '#i3 img',
      function: SelectorFunction.attr(),
      param: 'style',
      regex: r'height: (\d+)px',
    ),
  ),
  rawImage: const SelectorModel(
    selector: '#i7 a',
    function: SelectorFunction.attr(),
    param: 'href',
  ),
);
