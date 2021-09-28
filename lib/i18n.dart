import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'navigator.dart';

class I {
  static List<Locale> supportedLocales = AppLocalizations.supportedLocales;

  static AppLocalizations get g =>
      Localizations.of(AppNavigator().context, AppLocalizations)!;

  static AppLocalizations of(BuildContext context) {
    return AppLocalizations.of(context)!;
  }

  static BuildContext get context => AppNavigator().context;

  static LocalizationsDelegate<AppLocalizations> get delegate =>
      AppLocalizations.delegate;
}
