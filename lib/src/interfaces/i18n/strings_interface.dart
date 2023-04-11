import 'package:chefpartner_mobile/src/interfaces/i18n/general_strings_interface.dart';
import 'package:chefpartner_mobile/src/interfaces/i18n/home_strings_interface.dart';
import 'package:chefpartner_mobile/src/interfaces/i18n/payment_method_strings_interface.dart';
import 'package:chefpartner_mobile/src/interfaces/i18n/product_strings_interface.dart';

abstract class StringsInterface {
  GeneralStringsInterface get general;
  HomeStringsInterface get home;
  PaymentMethodStringsInterface get paymentMethod;
  ProductStringsInterface get product;
}
