import 'package:flutter/material.dart';

class DefaultFormComponent extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const DefaultFormComponent({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              ...children,
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: () {}, child: const Text('Cancelar')),
                  ElevatedButton(
                      onPressed: () {}, child: const Text('Confirmar')),
                ],
              ),
            ])));
  }
}
