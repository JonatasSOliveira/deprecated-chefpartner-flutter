import 'package:flutter/material.dart';

import 'package:chefpartner_mobile/src/controllers/payment_method_controller.dart';
import 'package:chefpartner_mobile/src/i18n/i18n.dart';
import 'package:chefpartner_mobile/src/models/payment_method.dart';
import 'package:chefpartner_mobile/src/components/default_form_component.dart';

class PaymentMethodForm extends StatefulWidget {
  const PaymentMethodForm({super.key});

  @override
  State<PaymentMethodForm> createState() => _PaymentMethodFormState();
}

class _PaymentMethodFormState extends State<PaymentMethodForm> {
  dynamic _id;
  String _name = '';

  final TextEditingController _nameController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    PaymentMethod? paymentMethod =
        DefaultFormArguments.getEditModel(context) as PaymentMethod?;
    if (paymentMethod != null) {
      _initializeEdition(paymentMethod);
    }
  }

  void _initializeEdition(PaymentMethod paymentMethod) {
    _nameController.text = paymentMethod.getName();
    setState(() {
      _id = paymentMethod.getId();
      _name = paymentMethod.getName();
    });
  }

  Future<void> _savePaymentMethod() async {
    final paymentMethod = PaymentMethod(name: _name);

    if (_id != null) {
      await PaymentMethodController().update(_id, paymentMethod);
      return;
    }

    await PaymentMethodController().create(paymentMethod);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultFormComponent(
      title: I18n.strings.paymentMethod.formTitle,
      onConfirm: _savePaymentMethod,
      children: [
        Row(children: [
          Expanded(
              child: TextField(
            controller: _nameController,
            decoration: InputDecoration(
                label: Text(I18n.strings.general.name), hintText: ''),
            onChanged: (value) => setState(() => _name = value),
          )),
        ])
      ],
    );
  }
}
