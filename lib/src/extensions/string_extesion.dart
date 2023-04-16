extension StringExtension on String {
  String _removeNonCurrencyChars() {
    return replaceAll(RegExp(r'[^\d.,]+'), '');
  }

  int currencyToInt() {
    return int.parse(
        _removeNonCurrencyChars().replaceAll('.', '').replaceAll(',', ''));
  }
}
