import 'site_definition.dart';

/// 把当前子页变成请求变量。
///
/// 没填 key 的子页是默认页。同一组子页里出现过的变量都会先写成 null，
/// 这样可选 query 会被请求解析器丢掉；选中的子页再写入自己的值。
Map<String, Object?> subpageRequestVariables(
  List<EndpointSubpage> subpages,
  int index,
) {
  if (subpages.isEmpty) return const {};
  final selected = subpages[index.clamp(0, subpages.length - 1)];
  final variables = <String, Object?>{
    for (final page in subpages)
      if (page.key.isNotEmpty) page.key: null,
  };
  if (selected.key.isNotEmpty) {
    variables[selected.key] = selected.value;
  }
  return variables;
}
