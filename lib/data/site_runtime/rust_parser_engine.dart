import 'package:catweb/data/loading/cancellation.dart';
import 'package:catweb/data/models/ffi/result/base.dart' as model;
import 'package:catweb/data/models/ffi/result/result.dart' as model;
import 'package:catweb/src/rust/api/parser.dart' as native_parser;
import 'package:catweb/src/rust/errors.dart' as native_error;
import 'package:catweb/src/rust/models/result.dart' as native_result;
import 'package:catweb/src/rust/models/selector.dart' as native;

import 'runtime_contracts.dart';
import 'site_definition.dart';

typedef NativeListParser = Future<native_result.ListParserResult> Function({
  required String html,
  required native.ParserConfig config,
});

/// 将站点规则和页面结果适配到 Rust。应用启动时须先初始化 RustLib。
///
/// 当前实现 HTML 列表；条目字段诊断保留在业务结果中，页面失败和列表查询错误
/// 则抛出 ParserException，由加载器展示。取消后不返回结果或环境补丁。
final class RustParserEngine implements ParserEngine {
  const RustParserEngine({this.listParser = native_parser.parseList});

  final NativeListParser listParser;

  @override
  Future<ParsedPayload<T>> parse<T>(
    ParseJob<T> job,
    CancellationScope cancellation,
  ) async {
    cancellation.throwIfCancelled();
    if (job.endpoint.kind != job.parser.kind) {
      throw const SiteRuntimeException('Endpoint and parser kinds must match');
    }
    if (job.parser.kind != EndpointKind.list) {
      throw ParserException('尚未实现 ${job.parser.kind.name} 类型的 Rust 解析器');
    }
    if (job.endpoint.pagination case ContinuationPaginationRule(
      :final responseField,
    )) {
      if (responseField != 'continuation' &&
          responseField != ParserSelectorKey.nextPage) {
        throw SiteRuntimeException('列表解析器不支持分页字段：$responseField');
      }
    }

    final native_result.ListParserResult result;
    try {
      result = await listParser(
        html: job.response.bodyText,
        config: _config(job.parser.config),
      );
    } on native_error.ParseError catch (error) {
      cancellation.throwIfCancelled();
      throw ParserException(error.message, error);
    } catch (error) {
      cancellation.throwIfCancelled();
      if (error is CancellationException) rethrow;
      throw ParserException('Rust 列表解析失败', error);
    }
    cancellation.throwIfCancelled();

    if (result.failMessage case final message?) {
      throw ParserException(
        message.trim().isEmpty ? '页面返回失败标志' : message,
        result,
      );
    }
    if (result.isSuccess == false ||
        (_hasRule(job.parser.config.selectors[ParserSelectorKey.success]) &&
            result.isSuccess != true)) {
      throw ParserException('未检测到请求成功标志', result);
    }
    // Rust returns collection-query errors as diagnostics; they must not be
    // mistaken for an empty final page. Item-field errors remain recoverable.
    for (final error in result.errors) {
      if (error.message.startsWith('item:')) {
        throw ParserException(error.message, error);
      }
    }

    final data = _listResult(result);
    if (data is! T) {
      throw SiteRuntimeException('列表解析器返回 ListParserResult，调用方请求的是 $T');
    }
    final global = <String, Object?>{};
    final local = <String, Object?>{};
    for (final env in result.envs) {
      // A missing optional selector must not erase a previously stored token.
      if (env.id.trim().isEmpty || env.value == null) continue;
      (env.global ? global : local)[env.id] = env.value;
    }
    return ParsedPayload<T>(
      data: data as T,
      continuation: result.nextPage,
      itemCount: result.items.length,
      environment: EnvironmentPatch(global: global, local: local),
    );
  }
}

native.ParserConfig _config(ParserConfig config) => native.ParserConfig(
  selectors: config.selectors.map((key, value) => MapEntry(key, _rule(value))),
  extras: config.extras
      .map(
        (extra) => native.ExtraSelectorRule(
          id: extra.id,
          persistent: extra.persistent,
          selector: _rule(extra.selector),
        ),
      )
      .toList(growable: false),
);

native.SelectorRule _rule(SelectorRule rule) => native.SelectorRule(
  selector: rule.selector,
  queryType: switch (rule.queryType) {
    SelectorQueryType.self => native.SelectorQueryType.this_,
    SelectorQueryType.css => native.SelectorQueryType.css,
    SelectorQueryType.xpath => native.SelectorQueryType.xpath,
    SelectorQueryType.jsonPath => native.SelectorQueryType.jsonPath,
  },
  function: switch (rule.function) {
    SelectorFunctionType.text => native.SelectorFunctionType.text,
    SelectorFunctionType.attribute => native.SelectorFunctionType.attribute,
    SelectorFunctionType.raw => native.SelectorFunctionType.raw,
  },
  parameter: rule.parameter,
  regex: rule.regex,
  replace: rule.replace,
  defaultValue: rule.defaultValue,
  script: switch (rule.script) {
    OutputSelectorScript() => const native.SelectorScript.output(),
    ReplaceSelectorScript(:final values) => native.SelectorScript.replace(
      values: values,
    ),
    JavaScriptSelectorScript(:final source) => native.SelectorScript.javaScript(
      source: source,
    ),
  },
);

bool _hasRule(SelectorRule? rule) =>
    rule != null &&
    (rule.selector.trim().isNotEmpty ||
        rule.queryType == SelectorQueryType.self ||
        rule.queryType == SelectorQueryType.jsonPath ||
        rule.function != SelectorFunctionType.text ||
        rule.parameter.isNotEmpty ||
        rule.regex.isNotEmpty ||
        rule.defaultValue.isNotEmpty ||
        rule.script is! OutputSelectorScript);

model.ListParserResult _listResult(native_result.ListParserResult result) =>
    model.ListParserResult(
      items: result.items
          .map(
            (item) => model.ListParserResultItem(
              title: item.title,
              subtitle: item.subtitle,
              uploadTime: item.uploadTime,
              star: item.star,
              imageCount: item.imageCount,
              previewImage: switch (item.previewImage) {
                final image? => model.ImageResult(
                  url: image.url,
                  cacheKey: image.cacheKey,
                  width: image.width,
                  height: image.height,
                  x: image.x,
                  y: image.y,
                ),
                null => null,
              },
              badges: item.badges.map(_tag).toList(growable: false),
              tags: item.tags.map(_tag).toList(growable: false),
              language: item.language,
              idCode: item.idCode,
              paper: item.paper,
            ),
          )
          .toList(growable: false),
      nextPage: result.nextPage,
      isSuccess: result.isSuccess,
      failMessage: result.failMessage,
      envs: result.envs
          .map(
            (env) => model.EnvResult(
              id: env.id,
              global: env.global,
              value: env.value,
            ),
          )
          .toList(growable: false),
      errors: result.errors
          .map(
            (error) =>
                model.ParserError(code: error.code, message: error.message),
          )
          .toList(growable: false),
    );

model.TagResult _tag(native_result.TagResult tag) =>
    model.TagResult(text: tag.text, color: tag.color, category: tag.category);
