abstract class EnvMargeAble {
  Map<String, String> get env;
}

class SiteEnvModel implements EnvMargeAble {
  SiteEnvModel(Map<String, String> env) : _env = env;
  final Map<String, String> _env;

  @override
  Map<String, String> get env => _env;

  SiteEnvModel merge(EnvMargeAble envModel) {
    _env.addAll(envModel.env);
    return this;
  }

  SiteEnvModel create(EnvMargeAble envModel) {
    return SiteEnvModel({..._env, ...envModel.env});
  }

  String? resolve(String? input) {
    if (input == null) return null;
    for (final entity in _env.entries) {
      input = input!.replaceAll('\${${entity.key}', entity.value);
    }
    return input;
  }

  void clear() => _env.clear();
}
