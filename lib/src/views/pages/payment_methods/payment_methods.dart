import 'package:chefpartner_mobile/src/controllers/payment_method_controller.dart';
import 'package:chefpartner_mobile/src/i18n/i18n.dart';
import 'package:chefpartner_mobile/src/dtos/payment_method_dto.dart';
import 'package:flutter/material.dart';

import 'package:chefpartner_mobile/src/views/components/default_list_component.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultListComponent<PaymentMethodDTO>(
        title: I18n.strings.paymentMethod.pluralName,
        buttonText: I18n.strings.paymentMethod.newRegister,
        formRouteName: '/payment_method_form',
        controller: PaymentMethodController(),
        getModelDisplayValue: (paymentMethod) => paymentMethod.getName());
  }
}
