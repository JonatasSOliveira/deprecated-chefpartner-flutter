import 'package:chefpartner_mobile/src/controllers/customer_controller.dart';
import 'package:chefpartner_mobile/src/models/customer.dart';
import 'package:flutter/material.dart';

import 'package:chefpartner_mobile/src/components/default_list_component.dart';

class Customers extends StatelessWidget {
  const Customers({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultListComponent<Customer>(
      title: 'Clientes',
      buttonText: 'Novo Cliente',
      formRouteName: '/customer_form',
      controller: CustomerController(),
      getModelDisplayValue: (customer) => customer.getName(),
    );
  }
}
