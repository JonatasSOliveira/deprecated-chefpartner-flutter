import 'package:flutter/material.dart';
import 'package:chefpartner_mobile/src/controllers/payment_method_controller.dart';
import 'package:chefpartner_mobile/src/i18n/i18n.dart';
import 'package:chefpartner_mobile/src/dtos/payment_method_dto.dart';
import 'package:chefpartner_mobile/src/views/pages/payment_methods/paytment_method_form.dart';
import 'package:chefpartner_mobile/src/views/components/default_list_component.dart';

class PaymentMethods extends StatelessWidget {
  static const String _routeName = '/payment_methods';

  const PaymentMethods({super.key});

  static String getRouteName() {
    return _routeName;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultListComponent<PaymentMethodDTO>(
        title: I18n.strings.paymentMethod.pluralName,
        buttonText: I18n.strings.paymentMethod.newRegister,
        formRouteName: PaymentMethodForm.getRouteName(),
        controller: PaymentMethodController(),
        getModelDisplayValue: (paymentMethod) => paymentMethod.getName());
  }
}
