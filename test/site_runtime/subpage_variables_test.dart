import 'package:catweb/data/site_runtime/ehentai_debug_definition.dart';
import 'package:catweb/data/site_runtime/request_resolver.dart';
import 'package:catweb/data/site_runtime/subpage_variables.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('default favorite page omits favcat and a category sends it', () {
    final endpoint = buildEhentaiDebugDefinition(
      'site',
    ).endpoints.singleWhere((item) => item.id == 'eh-favorites');
    const resolver = RequestResolver();
    final baseUri = Uri.parse('https://e-hentai.org/');

    final all = resolver.resolve(
      baseUri: baseUri,
      endpoint: endpoint,
      variables: subpageRequestVariables(endpoint.presentation.subpages, 0),
    );
    final category = resolver.resolve(
      baseUri: baseUri,
      endpoint: endpoint,
      variables: subpageRequestVariables(endpoint.presentation.subpages, 1),
    );

    expect(all.uri.toString(), 'https://e-hentai.org/favorites.php');
    expect(category.uri.queryParameters['favcat'], '0');
  });
}
