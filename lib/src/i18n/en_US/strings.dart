import 'package:chefpartner_mobile/src/i18n/en_US/general.dart';
import 'package:chefpartner_mobile/src/i18n/en_US/home_strings.dart';
import 'package:chefpartner_mobile/src/i18n/en_US/payment_method_strings.dart';
import 'package:chefpartner_mobile/src/i18n/interfaces/general_strings_interface.dart';
import 'package:chefpartner_mobile/src/i18n/interfaces/home_strings_interface.dart';
import 'package:chefpartner_mobile/src/i18n/interfaces/payment_method_strings_interface.dart';
import 'package:chefpartner_mobile/src/i18n/interfaces/strings_interface.dart';

class EnUsStrings implements StringsInterface {
  @override
  GeneralStringsInterface get general => EnUsGeneralStrings();
  @override
  HomeStringsInterface get home => EnUsHomeStrings();
  @override
  PaymentMethodStringsInterface get paymentMethod => EnUsPaymentMethodStrings();
}
