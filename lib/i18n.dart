import 'package:material_ui/material_ui.dart';

import 'l10n/app_localizations.dart';

class I {
  static const List<Locale> supportedLocales = AppLocalizations.supportedLocales;

  static AppLocalizations of(BuildContext context) {
    return AppLocalizations.of(context)!;
  }

  static LocalizationsDelegate<AppLocalizations> get delegate =>
      AppLocalizations.delegate;

  /// material_ui / cupertino_ui delegates, plus this app's strings.
  /// `flutter gen-l10n` still emits the deprecated SDK delegates.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        AppLocalizations.delegate,
        ...GlobalMaterialLocalizations.delegates,
      ];
}
