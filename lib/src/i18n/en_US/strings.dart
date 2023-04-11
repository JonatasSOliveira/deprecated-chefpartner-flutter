import 'package:chefpartner_mobile/src/i18n/en_US/general.dart';
import 'package:chefpartner_mobile/src/i18n/en_US/home_strings.dart';
import 'package:chefpartner_mobile/src/i18n/en_US/payment_method_strings.dart';
import 'package:chefpartner_mobile/src/i18n/en_US/product_strings.dart';
import 'package:chefpartner_mobile/src/interfaces/i18n/general_strings_interface.dart';
import 'package:chefpartner_mobile/src/interfaces/i18n/home_strings_interface.dart';
import 'package:chefpartner_mobile/src/interfaces/i18n/payment_method_strings_interface.dart';
import 'package:chefpartner_mobile/src/interfaces/i18n/product_strings_interface.dart';
import 'package:chefpartner_mobile/src/interfaces/i18n/strings_interface.dart';

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
