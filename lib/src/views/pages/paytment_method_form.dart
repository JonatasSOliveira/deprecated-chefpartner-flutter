import 'package:chefpartner_mobile/src/views/components/default_form_component/default_form_arguments.dart';
import 'package:flutter/material.dart';

import 'package:chefpartner_mobile/src/controllers/payment_method_controller.dart';
import 'package:chefpartner_mobile/src/i18n/i18n.dart';
import 'package:chefpartner_mobile/src/dtos/payment_method_dto.dart';
import 'package:chefpartner_mobile/src/views/components/default_form_component/default_form_component.dart';

class PaymentMethodForm extends StatefulWidget {
  const PaymentMethodForm({super.key});

  @override
  State<PaymentMethodForm> createState() => _PaymentMethodFormState();
}

class _PaymentMethodFormState extends State<PaymentMethodForm> {
  String _name = '';

  final TextEditingController _nameController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    PaymentMethodDTO? paymentMethod =
        DefaultFormArguments.getEditDTO(context) as PaymentMethodDTO?;
    if (paymentMethod != null) {
      _initializeEdition(paymentMethod);
    }
  }

  void _initializeEdition(PaymentMethodDTO paymentMethod) {
    _nameController.text = paymentMethod.getName();
    setState(() {
      _name = paymentMethod.getName();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultFormComponent(
      title: I18n.strings.paymentMethod.formTitle,
      controller: PaymentMethodController(),
      getDTOWithValues: () => PaymentMethodDTO(name: _name),
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
