import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:chefpartner_mobile/src/i18n/i18n.dart';

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
  final NumberFormat _currencyFormat = NumberFormat.currency(
      locale: I18n.currentLocale.getLocaleString(),
      symbol: I18n.currentLocale.getCurrencySymbol());

  String _formatText(String text) {
    if (text.isEmpty) {
      return text;
    }

    final value = double.parse(text);
    return _currencyFormat.format(value / 100);
  }

  @override
  void initState() {
    super.initState();
    if (widget.controller != null && widget.controller?.text != '') {
      widget.controller!.text = _formatText(widget.controller?.text ?? '');
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        TextInputFormatter.withFunction((oldValue, newValue) {
          final newText = _formatText(newValue.text);
          return TextEditingValue(
            text: newText,
            selection: TextSelection.collapsed(offset: newText.length),
          );
        }),
      ],
      decoration: widget.decoration,
      style: widget.textStyle,
      onChanged: widget.onChanged,
    );
  }
}
