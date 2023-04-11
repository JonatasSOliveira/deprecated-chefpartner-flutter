import 'package:chefpartner_mobile/src/views/pages/customer_form.dart';
import 'package:chefpartner_mobile/src/views/pages/cutomers.dart';
import 'package:chefpartner_mobile/src/views/pages/home.dart';
import 'package:chefpartner_mobile/src/views/pages/order_form.dart';
import 'package:chefpartner_mobile/src/views/pages/orders.dart';
import 'package:chefpartner_mobile/src/views/pages/payment_methods.dart';
import 'package:chefpartner_mobile/src/views/pages/paytment_method_form.dart';
import 'package:chefpartner_mobile/src/views/pages/product_form.dart';
import 'package:chefpartner_mobile/src/views/pages/products.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> screenRoutes = {
  '/': (context) => const Home(),
  '/customers': (context) => const Customers(),
  '/customer_form': (context) => const CustomerForm(),
  '/orders': (context) => const Orders(),
  '/order_form': (context) => const OrderForm(),
  '/products': (context) => const Products(),
  '/product_form': (context) => const ProductForm(),
  '/payment_methods': (context) => const PaymentMethods(),
  '/payment_method_form': (context) => const PaymentMethodForm(),
};
