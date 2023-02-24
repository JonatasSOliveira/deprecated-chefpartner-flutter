import 'package:flutter/material.dart';

import 'package:chefpatner_mobile/src/components/default_list_component.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultListComponent(
        title: 'Pedidos',
        buttonText: 'Novo Pedido',
        formRouteName: '/order_form');
  }
}
