import 'dart:convert';

class SiteEnvStore {
  SiteEnvStore([Map<String, String>? env]) : _env = env ?? {};
  final Map<String, String> _env;

  factory SiteEnvStore.fromJson(Map<String, dynamic> json) =>
      SiteEnvStore(Map<String, String>.from(json));

  Map<String, String> toJson() => _env;

  Map<String, String> get env => _env;

  String toJsonString() => jsonEncode(toJson());

  SiteEnvStore clone() => SiteEnvStore({..._env});

  operator [](String key) => _env[key];

  operator []=(String key, String value) => _env[key] = value;

  SiteEnvStore merge(SiteEnvStore envModel) {
    _env.addAll(envModel.env);
    return this;
  }

  SiteEnvStore mergeMap(Map<String, String> map) {
    _env.addAll(map);
    return this;
  }

  void removeKeys(Iterable<String> keys) {
    _env.removeWhere((key, value) => keys.contains(key));
  }

  String apply(String input) {
    final exp =
        RegExp(r'\$\{(?<var>\w+):(?<context>[^:^$]*)(?::(?<default>[^$]+))?\}');
    final matches = exp.allMatches(input);
    for (final match in matches) {
      final varName = match.namedGroup('var')!;
      final context = match.namedGroup('context')!;
      final defaultValue = match.namedGroup('default');
      if (_env.containsKey(varName) && _env[varName]!.isNotEmpty) {
        input = input.replaceAll(match.group(0)!, context);
      } else {
        input = input.replaceAll(match.group(0)!, defaultValue ?? '');
      }
    }
    for (final entity in _env.entries) {
      input = input.replaceAll('{${entity.key}}', entity.value);
    }
    return input;
  }

  SiteEnvStore create(SiteEnvStore envModel) {
    return SiteEnvStore({..._env, ...envModel.env});
  }
}
