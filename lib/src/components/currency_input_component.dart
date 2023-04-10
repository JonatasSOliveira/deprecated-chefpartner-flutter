import 'package:chefpartner_mobile/src/i18n/i18n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyInputComponent extends StatefulWidget {
  final TextEditingController? controller;
  final TextStyle? textStyle;
  final void Function(String)? onChanged;
  final InputDecoration? decoration;

  const CurrencyInputComponent(
      {Key? key,
      this.controller,
      this.textStyle,
      this.decoration,
      this.onChanged})
      : super(key: key);

  @override
  State<CurrencyInputComponent> createState() => _CurrencyInputComponentState();
}

class _CurrencyInputComponentState extends State<CurrencyInputComponent> {
  final NumberFormat _currencyFormat =
      NumberFormat(I18n.currencyPattern, I18n.currentLocale);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        TextInputFormatter.withFunction((oldValue, newValue) {
          final value = double.parse(newValue.text);
          final newText = _currencyFormat.format(value / 100);
          return TextEditingValue(
            text: newText,
            selection: TextSelection.collapsed(offset: newText.length),
          );
        }),
      ],
      decoration: widget.decoration,
      style: widget.textStyle,
    );
  }
}
