import 'dart:typed_data';

import 'package:catweb/gen/protobuf/store.pbserver.dart';

abstract class EnvMargeAble {
  Map<String, String> get env;
}

class SiteEnvModel implements EnvMargeAble {
  SiteEnvModel(Map<String, String>? env) : _env = env ?? {};
  final Map<String, String> _env;

  factory SiteEnvModel.fromBuffer(List<int> buffer) =>
      SiteEnvModel(EnvStore.fromBuffer(buffer).env);

  Uint8List writeToBuffer() => EnvStore(env: _env).writeToBuffer();

  @override
  Map<String, String> get env => _env;

  SiteEnvModel copy() => SiteEnvModel({..._env});

  SiteEnvModel merge(EnvMargeAble envModel) {
    _env.addAll(envModel.env);
    return this;
  }

  SiteEnvModel mergeMap(Map<String, String> map) {
    _env.addAll(map);
    return this;
  }

  SiteEnvModel create(EnvMargeAble envModel) {
    return SiteEnvModel({..._env, ...envModel.env});
  }

  String? resolve(String? input) {
    if (input == null) return null;
    return replace(input);
  }

  String replace(String input) {
    for (final entity in _env.entries) {
      input = input.replaceAll('{${entity.key}}', entity.value);
    }
    final exp = RegExp(r'\$\{(?<var>\w+):(?<context>[^:]*):?(?<default>.*)\}');
    final matches = exp.allMatches(input);
    for (final match in matches) {
      final varName = match.namedGroup('var')!;
      final context = match.namedGroup('context')!;
      final defaultValue = match.namedGroup('default');
      if (_env.containsKey(varName)) {
        input = input.replaceAll(match.group(0)!, context);
      } else {
        if (defaultValue != null) {
          input = input.replaceAll(match.group(0)!, '');
        } else {
          input = input.replaceAll(match.group(0)!, defaultValue!);
        }
      }
    }
    return input;
  }

  void set(String key, String value) => _env[key] = value;

  void clear() => _env.clear();

  @override
  String toString() => '<Env> $_env';
}
