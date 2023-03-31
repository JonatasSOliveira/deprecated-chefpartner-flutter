import 'package:chefpartner_mobile/src/controllers/payment_method_controller.dart';
import 'package:flutter/material.dart';

import 'package:chefpartner_mobile/src/components/default_list_component.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultListComponent(
        title: 'Formas de Pagamento',
        buttonText: 'Nova Forma de Pagamento',
        formRouteName: '/payment_method_form',
        controller: PaymentMethodController());
  }
}
