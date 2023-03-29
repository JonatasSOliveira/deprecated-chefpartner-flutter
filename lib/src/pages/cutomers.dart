import 'package:flutter/material.dart';

import 'package:chefpartner_mobile/src/components/default_list_component.dart';

class Customers extends StatelessWidget {
  const Customers({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultListComponent(
        title: 'Clientes',
        buttonText: 'Novo Cliente',
        formRouteName: '/customer_form');
  }
}
