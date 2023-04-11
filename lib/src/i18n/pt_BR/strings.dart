import 'package:chefpartner_mobile/src/interfaces/i18n/general_strings_interface.dart';
import 'package:chefpartner_mobile/src/interfaces/i18n/home_strings_interface.dart';
import 'package:chefpartner_mobile/src/interfaces/i18n/payment_method_strings_interface.dart';
import 'package:chefpartner_mobile/src/interfaces/i18n/product_strings_interface.dart';
import 'package:chefpartner_mobile/src/interfaces/i18n/strings_interface.dart';
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
