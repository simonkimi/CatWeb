import 'package:catweb/data/models/site_model/parser/parser.dart';

class FfiRequest {
  final String context;
  final String parserType;
  final IParserBase parser;

  FfiRequest({
    required this.context,
    required this.parserType,
    required this.parser,
  });

  factory FfiRequest.listParser(ListViewParser parser, String context) {
    return FfiRequest(
      context: context,
      parserType: 'ListParser',
      parser: parser,
    );
  }

  factory FfiRequest.detailParser(DetailParser parser, String context) {
    return FfiRequest(
      context: context,
      parserType: 'DetailParser',
      parser: parser,
    );
  }

  factory FfiRequest.imageParser(ImageReaderParser parser, String context) {
    return FfiRequest(
      context: context,
      parserType: 'ImageReaderParser',
      parser: parser,
    );
  }

  factory FfiRequest.videoParser(AutoCompleteParser parser, String context) {
    return FfiRequest(
      context: context,
      parserType: 'AutoCompleteParser',
      parser: parser,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'context': context,
      'parserType': parserType,
      'parser': parser.toJson(),
    };
  }
}
