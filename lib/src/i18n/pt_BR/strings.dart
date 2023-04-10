import 'package:chefpartner_mobile/src/i18n/interfaces/general_strings_interface.dart';
import 'package:chefpartner_mobile/src/i18n/interfaces/home_strings_interface.dart';
import 'package:chefpartner_mobile/src/i18n/interfaces/payment_method_strings_interface.dart';
import 'package:chefpartner_mobile/src/i18n/interfaces/product_strings_interface.dart';
import 'package:chefpartner_mobile/src/i18n/interfaces/strings_interface.dart';
import 'package:chefpartner_mobile/src/i18n/pt_BR/general.dart';
import 'package:chefpartner_mobile/src/i18n/pt_BR/home_strings.dart';
import 'package:chefpartner_mobile/src/i18n/pt_BR/payment_method_strings.dart';
import 'package:chefpartner_mobile/src/i18n/pt_BR/product_strings.dart';

class PtBrStrings implements StringsInterface {
  @override
  GeneralStringsInterface get general => PtBrGeneralStrings();
  @override
  HomeStringsInterface get home => PtBrHomeStrings();
  @override
  PaymentMethodStringsInterface get paymentMethod => PtBrPaymentMethodStrings();
  @override
  ProductStringsInterface get product => PtBrProductStrings();
}
