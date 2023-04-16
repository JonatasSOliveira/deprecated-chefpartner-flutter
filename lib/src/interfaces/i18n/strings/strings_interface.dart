import 'package:chefpartner_mobile/src/interfaces/i18n/strings/customer_strings_interface.dart';
import 'package:chefpartner_mobile/src/interfaces/i18n/strings/general_strings_interface.dart';
import 'package:chefpartner_mobile/src/interfaces/i18n/strings/home_strings_interface.dart';
import 'package:chefpartner_mobile/src/interfaces/i18n/strings/payment_method_strings_interface.dart';
import 'package:chefpartner_mobile/src/interfaces/i18n/strings/product_strings_interface.dart';

abstract class StringsInterface {
  GeneralStringsInterface get general;
  HomeStringsInterface get home;
  PaymentMethodStringsInterface get paymentMethod;
  ProductStringsInterface get product;
  CustomerStringsInterface get customer;
}
