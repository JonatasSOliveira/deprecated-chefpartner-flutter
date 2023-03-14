import 'package:chefpatner_mobile/src/controllers/payment_method_controller.dart';
import 'package:flutter/material.dart';

import 'package:chefpatner_mobile/src/models/payment_method.dart';
import 'package:chefpatner_mobile/src/components/default_form_component.dart';

class PaymnetMethodForm extends StatefulWidget {
  const PaymnetMethodForm({super.key});

  @override
  State<PaymnetMethodForm> createState() => _PaymnetMethodFormState();
}

class _PaymnetMethodFormState extends State<PaymnetMethodForm> {
  String _name = '';

  void onConfirm() async {
    final paymentMethod = PaymentMethod(name: _name);
    await PaymentMethodController().create(paymentMethod);
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
