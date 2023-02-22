import 'package:flutter/material.dart';

import 'package:chefpatner_mobile/src/pages/home.dart';
import 'package:chefpatner_mobile/src/pages/cutomers.dart';
import 'package:chefpatner_mobile/src/pages/orders.dart';
import 'package:chefpatner_mobile/src/pages/payment_methods.dart';
import 'package:chefpatner_mobile/src/pages/products.dart';
import 'package:chefpatner_mobile/src/pages/paytment_method_form.dart';
import 'package:chefpatner_mobile/src/pages/order_form.dart';
import 'package:chefpatner_mobile/src/pages/product_form.dart';
import 'package:chefpatner_mobile/src/pages/customer_form.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      routes: {
        '/': (context) => const Home(),
        '/customers': (context) => const Customers(),
        '/customer_form': (context) => const CustomerForm(),
        '/orders': (context) => const Orders(),
        '/order_form': (context) => const OrderForm(),
        '/products': (context) => const Products(),
        '/product_form': (context) => const ProductForm(),
        '/payment_methods': (context) => const PaymentMethods(),
        '/payment_method_form': (context) => const PaymnetMethodForm(),
      },
    );
  }
}
