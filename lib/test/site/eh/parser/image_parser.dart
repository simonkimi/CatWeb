import 'package:catweb/data/models/site_model/parser/parser.dart';
import 'package:catweb/data/models/site_model/parser/selector.dart';
import 'package:uuid/uuid.dart';

final ehImageParser = ImageReaderParser(
  name: '画廊查看器',
  uuid: const Uuid().v4().toString(),
  id: Selector(
    selector: '#i2 .sn a:nth-child(1)',
    function: SelectorFunctionType.attr,
    param: 'href',
    regex: r's\/(.+)',
  ),
  image: ImageSelector(
    url: Selector(
      selector: '#i3 img',
      function: SelectorFunctionType.attr,
      param: 'src',
    ),
    width: Selector(
      selector: '#i3 img',
      function: SelectorFunctionType.attr,
      param: 'style',
      regex: r'width: (\d+)px',
    ),
    height: Selector(
      selector: '#i3 img',
      function: SelectorFunctionType.attr,
      param: 'style',
      regex: r'height: (\d+)px',
    ),
  ),
  rawImage: Selector(
    selector: '#i7 a',
    function: SelectorFunctionType.attr,
    param: 'href',
  ),
);
