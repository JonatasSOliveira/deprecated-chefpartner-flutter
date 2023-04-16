import 'package:chefpartner_mobile/src/interfaces/i18n/strings/customer_strings_interface.dart';

class EnUsCustomerStrings implements CustomerStringsInterface {
  @override
  String get pluralName => 'Customers';
  @override
  String get singularName => 'Customer';
  @override
  String get newRegister => 'New Customer';
  @override
  String get formTitle => 'Customer Form';
}
