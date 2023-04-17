import 'package:flutter/material.dart';

class OrderForm extends StatefulWidget {
  static const String _routeName = '/order_form';

  const OrderForm({super.key});

  static String getRouteName() {
    return _routeName;
  }

  @override
  State<OrderForm> createState() => _OrderFormState();
}

class _OrderFormState extends State<OrderForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Pedido'),
      ),
      body: const Center(
        child: Text('Novo Pedido'),
      ),
    );
  }
}
