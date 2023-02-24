import 'package:flutter/material.dart';

import 'package:chefpatner_mobile/src/components/default_form_component.dart';

class PaymnetMethodForm extends StatefulWidget {
  const PaymnetMethodForm({super.key});

  @override
  State<PaymnetMethodForm> createState() => _PaymnetMethodFormState();
}

class _PaymnetMethodFormState extends State<PaymnetMethodForm> {
  String _name = '';

  void onConfirm() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultFormComponent(
      title: 'Formulário Forma de Pagamento',
      onConfirm: onConfirm,
      children: [
        Row(children: [
          Expanded(
              child: TextField(
            decoration:
                const InputDecoration(label: Text('Nome'), hintText: ''),
            onChanged: (value) => setState(() {
              _name = value;
            }),
          )),
        ])
      ],
    );
  }
}
