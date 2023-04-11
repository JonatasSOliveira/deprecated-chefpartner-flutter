const String _enUsLocaleString = 'en_US';
const String _ptBrLocaleString = 'pt_BR';

enum Locales {
  ptBr(_enUsLocaleString),
  enUs(_ptBrLocaleString);

  final String _localeString;

  const Locales(this._localeString);

  String getLocaleString() => _localeString;

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
