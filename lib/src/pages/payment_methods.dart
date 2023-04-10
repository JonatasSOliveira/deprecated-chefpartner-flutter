import 'package:chefpartner_mobile/src/controllers/payment_method_controller.dart';
import 'package:chefpartner_mobile/src/i18n/i18n.dart';
import 'package:chefpartner_mobile/src/models/payment_method.dart';
import 'package:flutter/material.dart';

import 'package:chefpartner_mobile/src/components/default_list_component.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultListComponent<PaymentMethod>(
        title: I18n.strings.paymentMethod.pluralName,
        buttonText: I18n.strings.paymentMethod.newPaymentMethod,
        formRouteName: '/payment_method_form',
        controller: PaymentMethodController(),
        getModelDisplayValue: (paymentMethod) => paymentMethod.getName());
  }
}
