import 'package:flutter/widgets.dart';

import 'app.dart';
import 'l10n/app_localizations.dart';

class I {
  static List<Locale> supportedLocales = AppLocalizations.supportedLocales;

  static AppLocalizations get g =>
      Localizations.of(App().context, AppLocalizations)!;

  static AppLocalizations of(BuildContext context) {
    return AppLocalizations.of(context)!;
  }

  static BuildContext get context => App().context;

  static LocalizationsDelegate<AppLocalizations> get delegate =>
      AppLocalizations.delegate;
}
