import 'package:flutter/services.dart';

import 'package:chefpartner_mobile/src/extensions/string_extesion.dart';

class CnpjMaskTextInputFormatter extends TextInputFormatter {
  
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final String text = oldValue.text.length == newValue.text.length
        ? newValue.text.substring(0, newValue.text.length - 1)
        : newValue.text;
    final String numericText = text.replaceAll(RegExp(r'[^0-9]'), '');
    final String formattedText = numericText.formatAsCnpj();

    return newValue.copyWith(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}