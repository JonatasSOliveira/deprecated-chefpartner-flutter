import 'package:chefpartner_mobile/src/i18n/interfaces/general_strings_interface.dart';
import 'package:chefpartner_mobile/src/i18n/interfaces/home_strings_interface.dart';
import 'package:chefpartner_mobile/src/i18n/interfaces/payment_method_strings_interface.dart';
import 'package:chefpartner_mobile/src/i18n/interfaces/product_strings_interface.dart';

abstract class StringsInterface {
  GeneralStringsInterface get general;
  HomeStringsInterface get home;
  PaymentMethodStringsInterface get paymentMethod;
  ProductStringsInterface get product;
}
