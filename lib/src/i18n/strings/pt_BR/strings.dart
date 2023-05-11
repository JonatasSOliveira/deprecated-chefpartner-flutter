import 'package:chefpartner_mobile/src/i18n/strings/pt_BR/customer_strings.dart';import 'package:chefpartner_mobile/src/interfaces/i18n/strings/enterprise_strings_interface.dart';
import 'package:chefpartner_mobile/src/i18n/strings/pt_BR/enterprise_strings.dart';
import 'package:chefpartner_mobile/src/interfaces/i18n/strings/customer_strings_interface.dart';
import 'package:chefpartner_mobile/src/interfaces/i18n/strings/general_strings_interface.dart';
import 'package:chefpartner_mobile/src/interfaces/i18n/strings/home_strings_interface.dart';
import 'package:chefpartner_mobile/src/interfaces/i18n/strings/payment_method_strings_interface.dart';
import 'package:chefpartner_mobile/src/interfaces/i18n/strings/product_strings_interface.dart';
import 'package:chefpartner_mobile/src/interfaces/i18n/strings/strings_interface.dart';
import 'package:chefpartner_mobile/src/i18n/strings/pt_BR/general.dart';
import 'package:chefpartner_mobile/src/i18n/strings/pt_BR/home_strings.dart';
import 'package:chefpartner_mobile/src/i18n/strings/pt_BR/payment_method_strings.dart';
import 'package:chefpartner_mobile/src/i18n/strings/pt_BR/product_strings.dart';

class PtBrStrings implements StringsInterface {
  @override
  GeneralStringsInterface get general => PtBrGeneralStrings();
  @override
  HomeStringsInterface get home => PtBrHomeStrings();
  @override
  PaymentMethodStringsInterface get paymentMethod => PtBrPaymentMethodStrings();
  @override
  ProductStringsInterface get product => PtBrProductStrings();
  @override
  CustomerStringsInterface get customer => PtBrCustomerStrings();
	@override
	EnterpriseStringsInterface get enterprise => PtBrEnterpriseStrings();
}
