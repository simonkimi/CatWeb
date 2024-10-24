import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'app.dart';

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
