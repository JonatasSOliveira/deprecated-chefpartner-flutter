import 'dart:ui';

import 'package:chefpartner_mobile/src/i18n/pt_BR/strings.dart';
import 'package:chefpartner_mobile/src/i18n/en_US/strings.dart';

class AppStrings {
  static const Map<String, Map<String, Map<String, String>>> _localizedValues =
      {...ptBrStrings, ...enUsStrings};

  static String getString(String path, String label) {
    Locale currentLocale = window.locale;
    final String languageCountryCode =
        '${currentLocale.languageCode}_${currentLocale.countryCode}';

    return '${_localizedValues[languageCountryCode]?[path]?[label]}';
  }
}
