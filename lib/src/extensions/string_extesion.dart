extension StringExtension on String {
  String _removeNonCurrencyChars() {
    return replaceAll(RegExp(r'[^\d.,]+'), '');
  }

  int currencyToInt() {
    return int.parse(
      _removeNonCurrencyChars().replaceAll('.', '').replaceAll(',', '')
    );
  }

  String formatAsCnpj() {
    final StringBuffer formattedValue = StringBuffer();

    if (length < 3) {
      formattedValue.write(this);
      return formattedValue.toString();
    }

    formattedValue.write('${substring(0, 2)}.');

    if (length < 6) {
      formattedValue.write(substring(2));
      return formattedValue.toString();
    }

    formattedValue.write('${substring(2, 5)}.');

    if (length < 9) {
      formattedValue.write(substring(5));
      return formattedValue.toString();
    }

    formattedValue.write('${substring(5, 8)}/');

    if (length < 13) {
      formattedValue.write(substring(8));
      return formattedValue.toString();
    }

    formattedValue.write('${substring(8, 12)}-');
    formattedValue.write(substring(12));
    return formattedValue.toString();
  }

  String formatAsCpf() {
    final StringBuffer formattedValue = StringBuffer();

    if (length < 4) {
      formattedValue.write(this);
      return formattedValue.toString();
    }

    formattedValue.write('${substring(0, 3)}.');
    if (length < 7) {
      formattedValue.write(substring(3));
      return formattedValue.toString();
    }

    formattedValue.write('${substring(3, 6)}.');
    if (length < 10) {
      formattedValue.write(substring(6));
      return formattedValue.toString();
    }

    formattedValue.write('${substring(6, 9)}-');
    formattedValue.write(substring(9));

    return formattedValue.toString();
  }
}
