const String _enUsLocaleString = 'en_US';
const String _ptBrLocaleString = 'pt_BR';

enum Locales {
  ptBr(_ptBrLocaleString, 'R\$'),
  enUs(_enUsLocaleString, 'U\$');

  final String _localeString;
  final String _currencySymbol;

  const Locales(this._localeString, this._currencySymbol);

  String getLocaleString() => _localeString;

  String getCurrencySymbol() => _currencySymbol;

  static Locales fromLocaleString(String locale) {
    switch (locale) {
      case _enUsLocaleString:
        return Locales.enUs;

      case _ptBrLocaleString:
        return Locales.ptBr;

      default:
        return Locales.enUs;
    }
  }
}
