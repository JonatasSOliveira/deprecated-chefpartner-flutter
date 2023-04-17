import 'package:chefpartner_mobile/src/i18n/i18n.dart';
import 'package:chefpartner_mobile/src/views/pages/customers/cutomers.dart';
import 'package:chefpartner_mobile/src/views/pages/home/home.dart';
import 'package:chefpartner_mobile/src/views/pages/orders/orders.dart';
import 'package:chefpartner_mobile/src/views/pages/payment_methods/payment_methods.dart';
import 'package:chefpartner_mobile/src/views/pages/products/products.dart';
import 'package:flutter/material.dart';

class DrawerContainer extends StatelessWidget {
  final Widget child;
  final String title;

  const DrawerContainer({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  void _navigateTo(BuildContext context, String routeName) =>
      Navigator.pushReplacementNamed(context, routeName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.zero, children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            child: null,
          ),
          ListTile(
            title: Text(I18n.strings.home.singularName),
            onTap: () => _navigateTo(context, Home.getRouteName()),
          ),
          ListTile(
            title: Text(I18n.strings.customer.pluralName),
            onTap: () => _navigateTo(context, Customers.getRouteName()),
          ),
          ListTile(
            title: const Text('Pedidos'),
            onTap: () => _navigateTo(context, Orders.getRouteName()),
          ),
          ListTile(
            title: Text(I18n.strings.product.pluralName),
            onTap: () => _navigateTo(context, Products.getRouteName()),
          ),
          ListTile(
            title: Text(I18n.strings.paymentMethod.pluralName),
            onTap: () => _navigateTo(context, PaymentMethods.getRouteName()),
          )
        ]),
      ),
      body: child,
    );
  }
}
