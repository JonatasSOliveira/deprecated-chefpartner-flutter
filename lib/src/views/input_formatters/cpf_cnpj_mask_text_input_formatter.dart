import 'package:flutter/services.dart';

class CpfCnpjMaskTextInputFormatter extends TextInputFormatter {
  static const int _cpfLength = 11;

  String _formatAsCnpj(String text) {
    final StringBuffer formattedValue = StringBuffer();

    formattedValue.write('${text.substring(0, 2)}.');
    formattedValue.write('${text.substring(2, 5)}.');
    formattedValue.write('${text.substring(5, 8)}/');
    if (text.length < 13) {
      formattedValue.write(text.substring(8));
      return formattedValue.toString();
    }
    formattedValue.write('${text.substring(8, 12)}-');
    formattedValue.write(text.substring(12));
    return formattedValue.toString();
  }

  String _formatAsCpf(String text) {
    final StringBuffer formattedValue = StringBuffer();

    if (text.length < 4) {
      formattedValue.write(text);
      return formattedValue.toString();
    }

    formattedValue.write('${text.substring(0, 3)}.');
    if (text.length < 7) {
      formattedValue.write(text.substring(3));
      return formattedValue.toString();
    }

    formattedValue.write('${text.substring(3, 6)}.');
    if (text.length < 10) {
      formattedValue.write(text.substring(6));
      return formattedValue.toString();
    }

    formattedValue.write('${text.substring(6, 9)}-');
    formattedValue.write(text.substring(9));

    return formattedValue.toString();
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final String text = oldValue.text.length == newValue.text.length
        ? newValue.text.substring(0, newValue.text.length - 1)
        : newValue.text;
    final String numericText = text.replaceAll(RegExp(r'[^0-9]'), '');
    final String formattedText = numericText.length > _cpfLength
        ? _formatAsCnpj(numericText)
        : _formatAsCpf(numericText);

    return newValue.copyWith(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
