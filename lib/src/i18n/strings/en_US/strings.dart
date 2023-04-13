import 'package:chefpartner_mobile/src/i18n/strings/en_US/general.dart';
import 'package:chefpartner_mobile/src/i18n/strings/en_US/home_strings.dart';
import 'package:chefpartner_mobile/src/i18n/strings/en_US/payment_method_strings.dart';
import 'package:chefpartner_mobile/src/i18n/strings/en_US/product_strings.dart';
import 'package:chefpartner_mobile/src/interfaces/i18n/strings/general_strings_interface.dart';
import 'package:chefpartner_mobile/src/interfaces/i18n/strings/home_strings_interface.dart';
import 'package:chefpartner_mobile/src/interfaces/i18n/strings/payment_method_strings_interface.dart';
import 'package:chefpartner_mobile/src/interfaces/i18n/strings/product_strings_interface.dart';
import 'package:chefpartner_mobile/src/interfaces/i18n/strings/strings_interface.dart';

class EnUsStrings implements StringsInterface {
  @override
  GeneralStringsInterface get general => EnUsGeneralStrings();
  @override
  HomeStringsInterface get home => EnUsHomeStrings();
  @override
  PaymentMethodStringsInterface get paymentMethod => EnUsPaymentMethodStrings();
  @override
  ProductStringsInterface get product => EnUsProductStrings();
}
