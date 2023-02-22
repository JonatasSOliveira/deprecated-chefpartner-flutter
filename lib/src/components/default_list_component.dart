import 'package:flutter/material.dart';

class DefaultListComponent extends StatelessWidget {
  final String buttonText;

  const DefaultListComponent({
    Key? key,
    required this.buttonText,
  }) : super(key: key);

  void _onPressNewItem(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      const Text('Nenhum item encontrado'),
      ElevatedButton(
        child: Text(buttonText),
        onPressed: () => _onPressNewItem(context),
      )
    ])));
  }
}
