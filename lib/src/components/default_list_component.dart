import 'package:chefpartner_mobile/src/components/drawer_container.dart';
import 'package:flutter/material.dart';

class DefaultListComponent extends StatelessWidget {
  final String title;
  final String buttonText;
  final String formRouteName;

  const DefaultListComponent({
    Key? key,
    required this.title,
    required this.buttonText,
    required this.formRouteName,
  }) : super(key: key);

  void _onPressNewItem(BuildContext context) {
    Navigator.pushNamed(context, formRouteName);
  }

  @override
  Widget build(BuildContext context) {
    return DrawerContainer(
        title: title,
        child: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          const Text('Nenhum item encontrado'),
          ElevatedButton(
            child: Text(buttonText),
            onPressed: () => _onPressNewItem(context),
          )
        ])));
  }
}
