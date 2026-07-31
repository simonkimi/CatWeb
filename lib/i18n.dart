import 'package:flutter/widgets.dart';

import 'l10n/app_localizations.dart';

class I {
  static List<Locale> supportedLocales = AppLocalizations.supportedLocales;

  static AppLocalizations of(BuildContext context) {
    return AppLocalizations.of(context)!;
  }

  static LocalizationsDelegate<AppLocalizations> get delegate =>
      AppLocalizations.delegate;
}
