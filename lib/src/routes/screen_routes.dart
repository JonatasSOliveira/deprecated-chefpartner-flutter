import 'package:chefpartner_mobile/src/views/pages/customers/customer_form.dart';
import 'package:chefpartner_mobile/src/views/pages/customers/cutomers.dart';
import 'package:chefpartner_mobile/src/views/pages/home/home.dart';
import 'package:chefpartner_mobile/src/views/pages/orders/order_form.dart';
import 'package:chefpartner_mobile/src/views/pages/orders/orders.dart';
import 'package:chefpartner_mobile/src/views/pages/payment_methods/payment_methods.dart';
import 'package:chefpartner_mobile/src/views/pages/payment_methods/paytment_method_form.dart';
import 'package:chefpartner_mobile/src/views/pages/products/product_form.dart';
import 'package:chefpartner_mobile/src/views/pages/products/products.dart';
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
