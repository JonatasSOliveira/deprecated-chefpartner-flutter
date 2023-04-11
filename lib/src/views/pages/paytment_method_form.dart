import 'package:flutter/material.dart';

import 'package:chefpartner_mobile/src/controllers/payment_method_controller.dart';
import 'package:chefpartner_mobile/src/i18n/i18n.dart';
import 'package:chefpartner_mobile/src/dtos/payment_method_dto.dart';
import 'package:chefpartner_mobile/src/views/components/default_form_component.dart';

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
    PaymentMethodDTO? paymentMethod =
        DefaultFormArguments.getEditModel(context) as PaymentMethodDTO?;
    if (paymentMethod != null) {
      _initializeEdition(paymentMethod);
    }
  }

  void _initializeEdition(PaymentMethodDTO paymentMethod) {
    _nameController.text = paymentMethod.getName();
    setState(() {
      _id = paymentMethod.getId();
      _name = paymentMethod.getName();
    });
  }

  Future<void> _savePaymentMethod() async {
    final paymentMethod = PaymentMethodDTO(name: _name);

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
