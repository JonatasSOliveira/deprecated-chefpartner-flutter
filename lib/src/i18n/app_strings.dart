import 'dart:ui';

import 'package:chefpartner_mobile/src/i18n/en_US/strings.dart';
import 'package:chefpartner_mobile/src/i18n/interfaces/strings_interface.dart';
import 'package:chefpartner_mobile/src/i18n/pt_BR/strings.dart';

class AppStrings {
  static StringsInterface _strings = EnUsStrings();

  static void defineStrings() {
    Locale currentLocale = window.locale;
    final String languageCountryCode =
        '${currentLocale.languageCode}_${currentLocale.countryCode}';

    _strings = _getStringsByLanguageCode(languageCountryCode);
  }

  static StringsInterface _getStringsByLanguageCode(
      String languageCountryCode) {
    switch (languageCountryCode) {
      case 'en_US':
        return EnUsStrings();

      case 'pt_BR':
        return PtBrStrings();

      default:
        return EnUsStrings();
    }
  }

  static StringsInterface get strings => _strings;
}
