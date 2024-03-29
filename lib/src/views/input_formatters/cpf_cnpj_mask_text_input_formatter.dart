import 'package:chefpartner_mobile/src/extensions/string_extesion.dart';
import 'package:flutter/services.dart';

class CpfCnpjMaskTextInputFormatter extends TextInputFormatter {
  static const int _cpfLength = 11;

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final String text = oldValue.text.length == newValue.text.length
        ? newValue.text.substring(0, newValue.text.length - 1)
        : newValue.text;
    final String numericText = text.replaceAll(RegExp(r'[^0-9]'), '');
    final String formattedText = numericText.length > _cpfLength
        ? numericText.formatAsCnpj()
        : numericText.formatAsCpf();

    return newValue.copyWith(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
