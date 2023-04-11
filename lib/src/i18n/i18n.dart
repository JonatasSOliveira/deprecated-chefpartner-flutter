import 'dart:ui';

import 'package:chefpartner_mobile/src/i18n/currency_patterns.dart';
import 'package:chefpartner_mobile/src/i18n/en_US/strings.dart';
import 'package:chefpartner_mobile/src/i18n/locales.dart';
import 'package:chefpartner_mobile/src/interfaces/i18n/strings_interface.dart';
import 'package:chefpartner_mobile/src/i18n/pt_BR/strings.dart';

class I18n {
  static StringsInterface _strings = EnUsStrings();
  static Locales _currentLocale = Locales.enUs;
  static CurrencyPatterns _currencyPattern = CurrencyPatterns.enUs;

  static void defineI18nAttributes() {
    Locale locale = window.locale;
    _currentLocale = Locales.fromLocaleString(
        '${locale.languageCode}_${locale.countryCode}');
    _strings = _getLanguageStrings(_currentLocale);
    _currencyPattern = CurrencyPatterns.fromLocale(_currentLocale);
  }

  static StringsInterface _getLanguageStrings(Locales currentLocale) {
    switch (currentLocale) {
      case Locales.enUs:
        return EnUsStrings();

      case Locales.ptBr:
        return PtBrStrings();
    }
  }

  static StringsInterface get strings => _strings;

  static Locales get currentLocale => _currentLocale;

  static CurrencyPatterns get currencyPattern => _currencyPattern;
}
