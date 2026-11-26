@Timeout(Duration(minutes: 10))
library;

import 'dart:io';

import 'package:catweb/src/rust/api/parser.dart' as parser;
import 'package:catweb/src/rust/errors.dart' as native_errors;
import 'package:catweb/src/rust/frb_generated.dart';
import 'package:catweb/src/rust/models/selector.dart' as native;
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart'
    show ExternalLibrary;
import 'package:test/test.dart';

native.SelectorRule rule(
  String selector, {
  native.SelectorQueryType queryType = native.SelectorQueryType.css,
  native.SelectorFunctionType function = native.SelectorFunctionType.text,
  String parameter = '',
  String regex = '',
  native.SelectorScript script = const native.SelectorScript.output(),
}) => native.SelectorRule(
  selector: selector,
  queryType: queryType,
  function: function,
  parameter: parameter,
  regex: regex,
  replace: '',
  script: script,
  defaultValue: '',
);

void main() {
  setUpAll(() async {
    // Build the actual host library so this test never silently uses a mock or
    // an outdated binary. Cargo reuses incremental artifacts on later runs.
    final build = await Process.run('cargo', [
      'build',
      '--locked',
      '--manifest-path',
      'rust/Cargo.toml',
    ]);
    if (build.exitCode != 0) {
      throw StateError('Native test build failed:\n${build.stderr}');
    }
    final target = Directory(
      Platform.environment['CARGO_TARGET_DIR'] ?? 'rust/target',
    ).absolute.path;
    final name = Platform.isWindows
        ? 'rust_lib_catweb.dll'
        : Platform.isMacOS
        ? 'librust_lib_catweb.dylib'
        : 'librust_lib_catweb.so';
    await RustLib.init(
      externalLibrary: ExternalLibrary.open('$target/debug/$name'),
    );
  });

  tearDownAll(RustLib.dispose);

  test(
    'typed FRB call transfers nested lists, scripts and environment',
    () async {
      final result = await parser.parseList(
        html: '''
        <p id="token">secret</p><a href="/next">Next</a>
        <li><b>first</b><em>3.5</em><span>4294967296 pages</span>
          <img src="/fallback" data-src="/one"><i>A</i><small>Badge</small></li>
        <li><b>second</b><em>4.5</em><span>2 pages</span>
          <img src="/two"><i>B</i></li>
      ''',
        config: native.ParserConfig(
          selectors: {
            'item': rule('li'),
            'title': rule(
              'b',
              script: const native.SelectorScript.replace(
                values: {'first': '第一条', 'second': '第二条'},
              ),
            ),
            'rating': rule(
              'em',
              script: const native.SelectorScript.javaScript(
                source: 'Number(\$arg) + 0.25',
              ),
            ),
            'imageCount': rule('span', regex: r'\d+'),
            'preview.url': rule(
              'img',
              function: native.SelectorFunctionType.attribute,
              parameter: 'data-src,src',
            ),
            'tag': rule('i'),
            'badge': rule('small'),
            'nextPage': rule(
              'a',
              function: native.SelectorFunctionType.attribute,
              parameter: 'href',
            ),
          },
          extras: [
            native.ExtraSelectorRule(
              id: 'token',
              persistent: true,
              selector: rule('#token'),
            ),
          ],
        ),
      );

      expect(result.errors, isEmpty);
      expect(result.items.map((item) => item.title), ['第一条', '第二条']);
      expect(result.items.first.star, 3.75);
      expect(result.items.first.imageCount, 4294967296);
      expect(result.items.first.previewImage?.url, '/one');
      expect(result.items.last.previewImage?.url, '/two');
      expect(result.items.last.tags.single.text, 'B');
      expect(result.items.first.badges.single.text, 'Badge');
      expect(result.items.last.badges, isEmpty);
      expect(result.nextPage, '/next');
      expect(result.isSuccess, isNull);
      expect(result.envs.single.id, 'token');
      expect(result.envs.single.global, isTrue);
      expect(result.envs.single.value, 'secret');
    },
  );

  test('field diagnostics cross FRB without discarding the item', () async {
    final result = await parser.parseList(
      html: '<li><b>Keep</b><em>invalid number</em></li>',
      config: native.ParserConfig(
        selectors: {
          'item': rule('li'),
          'title': rule('b'),
          'rating': rule('em'),
        },
        extras: [],
      ),
    );
    expect(result.items.single.title, 'Keep');
    expect(result.items.single.star, isNull);
    expect(result.errors.single.code, 3);
    expect(result.errors.single.message, startsWith('items[0].rating:'));
  });

  test('fatal configuration errors cross FRB with code and message', () async {
    await expectLater(
      parser.parseList(
        html: '<li>Item</li>',
        config: const native.ParserConfig(selectors: {}, extras: []),
      ),
      throwsA(
        isA<native_errors.ParseError>()
            .having((error) => error.code, 'code', 1)
            .having((error) => error.message, 'message', startsWith('item:')),
      ),
    );
  });
}
