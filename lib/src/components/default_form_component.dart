import 'package:flutter/material.dart';

class DefaultFormComponent extends StatelessWidget {
  const DefaultFormComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Formulário'),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(onPressed: () {}, child: const Text('Cancelar')),
              ElevatedButton(onPressed: () {}, child: const Text('Confirmar')),
            ],
          )
        ]));
  }
}
