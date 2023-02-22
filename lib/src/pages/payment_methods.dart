import 'package:flutter/material.dart';

import 'package:chefpatner_mobile/src/components/drawer_container.dart';
import 'package:chefpatner_mobile/src/components/default_list_component.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return const DrawerContainer(
        title: 'Formas de Pagamento',
        child: DefaultListComponent(
            buttonText: 'Nova Forma de Pagamento',
            formRouteName: '/payment_method_form'));
  }
}
