import 'dart:collection';

/// 递归校验 JSON 值并返回不可变副本。
///
/// [path] 仅用于生成可定位的校验错误信息。
Object? freezeJsonValue(Object? value, {String path = r'$'}) {
  return switch (value) {
    null || bool() || num() || String() => value,
    List<Object?> values => List<Object?>.unmodifiable([
      for (var index = 0; index < values.length; index++)
        freezeJsonValue(values[index], path: '$path[$index]'),
    ]),
    Map<Object?, Object?> values => UnmodifiableMapView<String, Object?>(
      values.map((key, item) {
        if (key is! String) {
          throw ArgumentError.value(
            key,
            path,
            'JSON object keys must be strings',
          );
        }
        return MapEntry(key, freezeJsonValue(item, path: '$path.$key'));
      }),
    ),
    _ => throw ArgumentError.value(value, path, 'Unsupported JSON value'),
  };
}

/// 校验并冻结 JSON object。
Map<String, Object?> freezeJsonMap(
  Map<String, Object?> values, {
  String path = r'$',
}) => freezeJsonValue(values, path: path)! as Map<String, Object?>;

/// 校验并冻结只允许 JSON 标量值的变量表。
///
/// 请求环境和分页变量必须使用此约束，防止把可变业务对象泄漏到规则运行时。
Map<String, Object?> freezeScalarMap(
  Map<String, Object?> values, {
  String path = r'$',
}) {
  return UnmodifiableMapView<String, Object?>(
    values.map((key, value) {
      if (value != null &&
          value is! bool &&
          value is! num &&
          value is! String) {
        throw ArgumentError.value(
          value,
          '$path.$key',
          'Request variables must be JSON scalars',
        );
      }
      return MapEntry(key, value);
    }),
  );
}
