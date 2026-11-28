import 'package:catweb/data/loading/cancellation.dart';
import 'package:catweb/data/models/ffi/result/base.dart' as model;
import 'package:catweb/data/models/ffi/result/result.dart' as model;
import 'package:catweb/src/rust/api/parser.dart' as native_parser;
import 'package:catweb/src/rust/errors.dart' as native_error;
import 'package:catweb/src/rust/models/result.dart' as native_result;
import 'package:catweb/src/rust/models/selector.dart' as native;
import 'package:flutter/foundation.dart';

import 'runtime_contracts.dart';
import 'site_definition.dart';

typedef NativeListParser = Future<native_result.ListParserResult> Function({
  required String html,
  required native.ParserConfig config,
});

typedef NativeGalleryParser =
    Future<native_result.GalleryParserResult> Function({
      required String html,
      required native.ParserConfig config,
    });

/// 将 HTML 列表、画廊的站点规则和页面结果适配到 Rust。
/// 字段诊断保留在业务结果中；页面失败与主集合查询错误抛出 ParserException。
final class RustParserEngine implements ParserEngine {
  const RustParserEngine({
    this.listParser = native_parser.parseList,
    this.galleryParser = native_parser.parseGallery,
  });

  final NativeListParser listParser;
  final NativeGalleryParser galleryParser;

  @override
  Future<ParsedPayload<T>> parse<T>(
    ParseJob<T> job,
    CancellationScope cancellation,
  ) async {
    cancellation.throwIfCancelled();
    if (job.endpoint.kind != job.parser.kind) {
      throw const SiteRuntimeException('Endpoint and parser kinds must match');
    }
    if (job.parser.kind != EndpointKind.list &&
        job.parser.kind != EndpointKind.gallery) {
      throw ParserException('尚未实现 ${job.parser.kind.name} 类型的 Rust 解析器');
    }
    if (job.endpoint.pagination case ContinuationPaginationRule(
      :final responseField,
    )) {
      if (responseField != 'continuation' &&
          responseField != ParserSelectorKey.nextPage) {
        throw SiteRuntimeException('解析器不支持分页字段：$responseField');
      }
    }
    final config = _config(job.parser.config);
    if (job.parser.kind == EndpointKind.gallery) {
      final result = await _invoke(
        () => galleryParser(html: job.response.bodyText, config: config),
        cancellation,
      );
      _validateResult(
        job.parser.config,
        result.isSuccess,
        result.failMessage,
        result.errors,
        'thumbnail',
        result,
      );
      final thumbnails = _hasNodes(
        job.parser.config.selectors[ParserSelectorKey.thumbnail],
      );
      return _payload<T>(
        data: _galleryResult(result),
        envs: result.envs,
        continuation: result.nextPage,
        itemCount: result.previews.length,
        totalCount: thumbnails ? result.imageCount : null,
        isLast: thumbnails ? null : true,
      );
    }
    final result = await _invoke(
      () => listParser(html: job.response.bodyText, config: config),
      cancellation,
    );
    _validateResult(
      job.parser.config,
      result.isSuccess,
      result.failMessage,
      result.errors,
      'item',
      result,
    );
    return _payload<T>(
      data: _listResult(result),
      envs: result.envs,
      continuation: result.nextPage,
      itemCount: result.items.length,
    );
  }
}

Future<R> _invoke<R>(
  Future<R> Function() parse,
  CancellationScope cancellation,
) async {
  try {
    final result = await parse();
    cancellation.throwIfCancelled();
    return result;
  } on native_error.ParseError catch (error) {
    cancellation.throwIfCancelled();
    throw ParserException(error.message, error);
  } catch (error) {
    cancellation.throwIfCancelled();
    if (error is CancellationException) rethrow;
    debugPrint('Rust 解析失败: $error');
    throw ParserException('Rust 解析失败', error);
  }
}

void _validateResult(
  ParserConfig config,
  bool? success,
  String? failure,
  List<native_error.ParseError> errors,
  String collection,
  Object source,
) {
  if (failure != null) {
    throw ParserException(
      failure.trim().isEmpty ? '页面返回失败标志' : failure,
      source,
    );
  }
  if (success == false ||
      (_hasRule(config.selectors[ParserSelectorKey.success]) &&
          success != true)) {
    throw ParserException('未检测到请求成功标志', source);
  }
  for (final error in errors) {
    if (error.message.startsWith('$collection:')) {
      throw ParserException(error.message, error);
    }
  }
}

bool _hasNodes(SelectorRule? rule) =>
    rule != null &&
    (rule.queryType == SelectorQueryType.self ||
        rule.selector.trim().isNotEmpty);

ParsedPayload<T> _payload<T>({
  required Object data,
  required List<native_result.EnvResult> envs,
  String? continuation,
  required int itemCount,
  int? totalCount,
  bool? isLast,
}) {
  if (data is! T) {
    throw SiteRuntimeException('解析器返回 ${data.runtimeType}，调用方请求的是 $T');
  }
  final global = <String, Object?>{};
  final local = <String, Object?>{};
  for (final env in envs) {
    // Missing optional fields must not erase a previously stored token.
    if (env.id.trim().isEmpty || env.value == null) continue;
    (env.global ? global : local)[env.id] = env.value;
  }
  return ParsedPayload<T>(
    data: data as T,
    continuation: continuation,
    itemCount: itemCount,
    totalCount: totalCount,
    isLast: isLast,
    environment: EnvironmentPatch(global: global, local: local),
  );
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
              previewImage: _image(item.previewImage),
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

model.ImageResult? _image(native_result.ImageResult? image) => image == null
    ? null
    : model.ImageResult(
        url: image.url,
        cacheKey: image.cacheKey,
        width: image.width,
        height: image.height,
        x: image.x,
        y: image.y,
      );

model.DetailParserResult _galleryResult(
  native_result.GalleryParserResult result,
) => model.DetailParserResult(
  title: result.title,
  subtitle: result.subtitle,
  language: result.language,
  imageCount: result.imageCount,
  pageCount: result.pageCount,
  countPrePage: result.countPerPage,
  uploadTime: result.uploadTime,
  description: result.description,
  star: result.star,
  coverImage: _image(result.coverImage),
  previews: result.previews
      .map(
        (preview) => model.DetailPreviewItem(
          previewImage: _image(preview.previewImage),
          target: preview.target,
        ),
      )
      .toList(growable: false),
  tags: result.tags.map(_tag).toList(growable: false),
  badges: result.badges.map(_tag).toList(growable: false),
  comments: result.comments
      .map(
        (comment) => model.CommentResult(
          username: comment.username,
          content: comment.content,
          time: comment.time,
          score: comment.score,
          avatar: _image(comment.avatar),
        ),
      )
      .toList(growable: false),
  nextPage: result.nextPage,
  isSuccess: result.isSuccess,
  failMessage: result.failMessage,
  envs: result.envs
      .map(
        (env) =>
            model.EnvResult(id: env.id, global: env.global, value: env.value),
      )
      .toList(growable: false),
  errors: result.errors
      .map(
        (error) => model.ParserError(code: error.code, message: error.message),
      )
      .toList(growable: false),
);
