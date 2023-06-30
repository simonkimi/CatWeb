// import 'package:catweb/data/protocol/model/page.dart';
// import 'package:catweb/gen/protobuf/parser.pbserver.dart';
// import 'package:catweb/gen/protobuf/selector.pbserver.dart';
//
// final ehImageParser = ImageReaderParser(
//   name: '画廊查看器',
//   uuid: genUuid(),
//   id: Selector(
//     selector: '#i2 .sn a:nth-child(1)',
//     function: SelectorFunction.SELECTOR_FUNCTION_ATTR,
//     param: 'href',
//     regex: r's\/(.+)',
//   ),
//   image: ImageSelector(
//     imgUrl: Selector(
//       selector: '#i3 img',
//       function: SelectorFunction.SELECTOR_FUNCTION_ATTR,
//       param: 'src',
//     ),
//     imgWidth: Selector(
//       selector: '#i3 img',
//       function: SelectorFunction.SELECTOR_FUNCTION_ATTR,
//       param: 'style',
//       regex: r'width: (\d+)px',
//     ),
//     imgHeight: Selector(
//       selector: '#i3 img',
//       function: SelectorFunction.SELECTOR_FUNCTION_ATTR,
//       param: 'style',
//       regex: r'height: (\d+)px',
//     ),
//   ),
//   rawImage: Selector(
//     selector: '#i7 a',
//     function: SelectorFunction.SELECTOR_FUNCTION_ATTR,
//     param: 'href',
//   ),
// );
