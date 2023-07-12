import 'package:catweb/data/models/site_model/parser/parser.dart';
import 'package:catweb/data/models/site_model/parser/selector.dart';
import 'package:uuid/uuid.dart';

final ehImageParser = ImageReaderParser(
  name: '画廊查看器',
  uuid: const Uuid().v4().toString(),
  id: const Selector(
    selector: '#i2 .sn a:nth-child(1)',
    function: SelectorFunctionType.attr,
    param: 'href',
    regex: r's\/(.+)',
  ),
  image: const ImageSelector(
    imgUrl: Selector(
      selector: '#i3 img',
      function: SelectorFunctionType.attr,
      param: 'src',
    ),
    imgWidth: Selector(
      selector: '#i3 img',
      function: SelectorFunctionType.attr,
      param: 'style',
      regex: r'width: (\d+)px',
    ),
    imgHeight: Selector(
      selector: '#i3 img',
      function: SelectorFunctionType.attr,
      param: 'style',
      regex: r'height: (\d+)px',
    ),
  ),
  rawImage: const Selector(
    selector: '#i7 a',
    function: SelectorFunctionType.attr,
    param: 'href',
  ),
);
