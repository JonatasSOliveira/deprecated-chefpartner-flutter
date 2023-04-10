import 'dart:ui';

import 'package:chefpartner_mobile/src/i18n/en_US/strings.dart';
import 'package:chefpartner_mobile/src/i18n/interfaces/strings_interface.dart';
import 'package:chefpartner_mobile/src/i18n/pt_BR/strings.dart';

class I18n {
  static StringsInterface _strings = EnUsStrings();
  static String _currentLocale = 'en_US';
  static String _currencyPattern = '#,##0.00';

  static void defineStrings() {
    Locale locale = window.locale;
    _currentLocale = '${locale.languageCode}_${locale.countryCode}';
    _strings = _getStringsByLanguageCode(_currentLocale);
  }

  static StringsInterface _getStringsByLanguageCode(String currentLocale) {
    switch (currentLocale) {
      case 'en_US':
        return EnUsStrings();

      case 'pt_BR':
        return PtBrStrings();

      default:
        return EnUsStrings();
    }
  }

  static String _getCurrencyPattern(String currentLocale) {
    switch (currentLocale) {
      case 'en_US':
        return '#,##0.00';

      case 'pt_BR':
        return '#.##0,00';

      default:
        return '#,##0.00';
    }
  }

  static StringsInterface get strings => _strings;

  static String get currentLocale => _currentLocale;

  static String get currencyPattern => _currencyPattern;
}
