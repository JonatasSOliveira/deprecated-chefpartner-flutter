import 'package:flutter/material.dart';

class DefaultFormComponent extends StatelessWidget {
  final String title;
  final VoidCallback onConfirm;
  final List<Widget> children;

  const DefaultFormComponent({
    Key? key,
    required this.title,
    required this.onConfirm,
    required this.children,
  }) : super(key: key);

  void onCancel(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(children: [
                  ...children,
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          onPressed: () => onCancel(context),
                          child: const Text('Cancelar')),
                      ElevatedButton(
                          onPressed: onConfirm, child: const Text('Confirmar')),
                    ],
                  ),
                ]))));
  }
}
