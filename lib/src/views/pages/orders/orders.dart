import 'package:flutter/material.dart';
import 'package:chefpartner_mobile/src/controllers/order_controller.dart';
import 'package:chefpartner_mobile/src/views/pages/orders/order_form.dart';
import 'package:chefpartner_mobile/src/views/components/default_list_component.dart';

class Orders extends StatelessWidget {
  static const String _routeName = '/orders';

  const Orders({super.key});

  static String getRouteName() {
    return _routeName;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultListComponent(
        title: 'Pedidos',
        buttonText: 'Novo Pedido',
        formRouteName: OrderForm.getRouteName(),
        controller: OrderController(),
        getModelDisplayValue: (order) => '');
  }
}
