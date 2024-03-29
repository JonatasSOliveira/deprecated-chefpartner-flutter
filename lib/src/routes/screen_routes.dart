import 'package:flutter/material.dart';
import 'package:chefpartner_mobile/src/views/pages/customers/customer_addresses/customer_addresses_form.dart';
import 'package:chefpartner_mobile/src/views/pages/customers/customer_form.dart';
import 'package:chefpartner_mobile/src/views/pages/customers/cutomers.dart';
import 'package:chefpartner_mobile/src/views/pages/enterprise/enterprise_form.dart';
import 'package:chefpartner_mobile/src/views/pages/home/home.dart';
import 'package:chefpartner_mobile/src/views/pages/orders/order_form.dart';
import 'package:chefpartner_mobile/src/views/pages/orders/orders.dart';
import 'package:chefpartner_mobile/src/views/pages/payment_methods/payment_methods.dart';
import 'package:chefpartner_mobile/src/views/pages/payment_methods/paytment_method_form.dart';
import 'package:chefpartner_mobile/src/views/pages/products/product_form.dart';
import 'package:chefpartner_mobile/src/views/pages/products/products.dart';

Map<String, Widget Function(BuildContext)> screenRoutes = {
  Home.getRouteName(): (context) => const Home(),
  Customers.getRouteName(): (context) => const Customers(),
  CustomerForm.getRouteName(): (context) => const CustomerForm(),
  CustomerAddressesForm.getRouteName(): (context) =>
      const CustomerAddressesForm(),
  Orders.getRouteName(): (context) => const Orders(),
  OrderForm.getRouteName(): (context) => const OrderForm(),
  Products.getRouteName(): (context) => const Products(),
  ProductForm.getRouteName(): (context) => const ProductForm(),
  PaymentMethods.getRouteName(): (context) => const PaymentMethods(),
  PaymentMethodForm.getRouteName(): (context) => const PaymentMethodForm(),
  EnterpriseForm.getRouteName(): (context) => const EnterpriseForm(),
};
