import 'package:chefpartner_mobile/src/i18n/locales.dart';

enum CurrencyPatterns {
  ptBr('#.##0,00'),
  enUs('#,##0.00');

  final String _pattern;
  const CurrencyPatterns(this._pattern);

  String getPattern() => _pattern;

  static CurrencyPatterns fromLocale(Locales locale) {
    switch (locale) {
      case Locales.ptBr:
        return CurrencyPatterns.ptBr;

      case Locales.enUs:
        return CurrencyPatterns.enUs;
    }
  }
}
