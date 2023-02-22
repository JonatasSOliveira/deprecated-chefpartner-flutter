import 'package:flutter/material.dart';

class DefaultListComponent extends StatelessWidget {
  final String buttonText;
  final String formRouteName;

  const DefaultListComponent({
    Key? key,
    required this.buttonText,
    required this.formRouteName,
  }) : super(key: key);

  void _onPressNewItem(BuildContext context) {
    Navigator.pushNamed(context, formRouteName);
  }

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
