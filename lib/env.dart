import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Debug keys from the project-root `.env` asset.
abstract final class AppEnv {
  static Future<void> load() {
    return dotenv.load(fileName: '.env', isOptional: true);
  }

  static String? maybeGet(String key, {String? defaultValue}) {
    if (!dotenv.isInitialized) return null;
    final value = dotenv.maybeGet(key)?.trim();
    if (value == null || value.isEmpty) return defaultValue;
    return value;
  }
}
