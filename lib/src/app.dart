import 'package:flutter/material.dart';

import 'package:chefpatner_mobile/src/pages/home.dart';
import 'package:chefpatner_mobile/src/pages/cutomers.dart';
import 'package:chefpatner_mobile/src/pages/orders.dart';
import 'package:chefpatner_mobile/src/pages/payment_forms.dart';
import 'package:chefpatner_mobile/src/pages/products.dart';

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
        '/orders': (context) => const Orders(),
        '/products': (context) => const Products(),
        '/payment_forms': (context) => const PaymentForms(),
      },
    );
  }
}
